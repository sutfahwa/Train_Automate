*** Variables ***

### AppTodo ###
${AddProjectBtn}                  id=add-project-button
${modalTitle}                     //*[@class="ant-modal-content"]//*[@class="content-modal-title"]
${projectNameField}               id=project-name-input
${descriptionField}               //*[@class="description-input rich-text-editor rdw-editor-main"]
${addStageField}                  //*[@id="project-state-order-container"]//*[@class="ant-input"]
${addStageBtn}                    //*[@id="project-state-order-container"]//*[@class="add-item-list-ordered"]
${AddBtnInProjectModal}           id=create-project-calendar-btn
${projectList}                    id=project-menu-container
${addTaskBtn}                     id=add-task-inline-button
${taskNameField}                  //*[@class="input-task-name-container"]//*[@class="ant-input-affix-wrapper"]//*[@class="ant-input"]
${addTaskInLineBtn}               //*[@class="input-task-name-container"]//*[@class="ant-input-affix-wrapper"]//*[@class="add-action-label-button"]
${closeModalBtn}                  id=close-content-modal-btn
${listTask}                       //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]
${taskNameInModal}                id=update-task-task-name-input
${editTaskBtn}                    id=edit-task
${editTaskNameField}              id=update-task-task-name-input
${updateTaskbtn}                  id=update-task-btn
${prioritySelector}               id=priority-input-select
${highPriority}                   id=priority-input-high-btn
${mediumPriority}                 id=priority-input-medium-btn
${lowPriority}                    id=priority-input-low-btn
${deleteTaskInline}               //*[@class="ant-dropdown-menu ant-dropdown-menu-light ant-dropdown-menu-root ant-dropdown-menu-vertical"]//*[@class="ant-dropdown-menu-item"]
${confirmModal}                   id=rcDialogTitle1
${confirmDeleteBtn}               id=confirm-delete-task
${noTask}                         //*[@class="no-user-text-label"]