import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Loader {
	id: newEventForm
	active: false
	visible: active

	sourceComponent: Component {

		ColumnLayout {
			spacing: 0

			RowLayout {
				spacing: 4 * units.devicePixelRatio

				Rectangle {
					Layout.preferredWidth: appletConfig.eventIndicatorWidth
					Layout.fillHeight: true
					color: newEventCalendarId.selectedCalendar.backgroundColor || theme.textColor
				}

				ColumnLayout {
					spacing: appletConfig.agendaRowSpacing

					Component.onCompleted: {
						newEventText.forceActiveFocus()
						newEventFormOpened(model, newEventCalendarId)
					}
					PlasmaComponents.ComboBox {
						id: newEventCalendarId
						Layout.fillWidth: true
						model: [i18n("[No Calendars]")]

						readonly property var selectedCalendar: currentIndex >= 0 ? model[currentIndex] : {}
					}

					RowLayout {
						PlasmaComponents.TextField {
							id: newEventText
							Layout.fillWidth: true
							placeholderText: i18n("Eg: 9am-5pm Work")
							onAccepted: {
								var calendarEntry = newEventCalendarId.model[newEventCalendarId.currentIndex]
								// calendarId = calendarId.calendarId ? calendarId.calendarId : calendarId
								var calendarId = calendarEntry.calendarId
								if (calendarId && date && text) {
									submitNewEventForm(calendarId, date, text)
									text = ''
								}
							}
							Keys.onEscapePressed: newEventForm.active = false
						}
					}
				}

			}


			Item {
				Layout.fillWidth: true
				height: appletConfig.agendaRowSpacing // Effectively twice the padding below the form.
			}
		}
	}
}
