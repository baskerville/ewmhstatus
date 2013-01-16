#ifndef _EWMHSTATUS_H
#define _EWMHSTATUS_H

void setup(void);
void register_events(void);
void handle_signal(int);
void handle_event(xcb_generic_event_t *);
void update_window_title(void);
void update_desktop_name(void);
void update_cur_desktop(void);
void update_num_desktops(void);
void output_infos(void);
double text_width(char *);
void truncate_text(char *, double, unsigned int, unsigned int);
void copy_prop(char *, char *, int, int, int);

#endif
