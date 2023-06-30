import "../library-view.css";
import React, { useContext } from "react";
import ChartUpload from "../chart-upload";
import Modal from "react-bootstrap/Modal";
import { Button } from "react-bootstrap";
import { VizContext } from "../visualizations";
import Draggable from "react-draggable";

export const chartContext = React.createContext();

const Actions = (props) => {
  const [element, setElement] = useContext(VizContext);

  return (
    <>
      {element === undefined ? (
        " "
      ) : (
        <Draggable>
        <Modal
          show={props.show}
          backdrop="static"
          keyboard={true}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          dialogClassName="modal-style"
          scrollable
          centered
        >
          <Modal.Header>
            <Modal.Title>{element.title}</Modal.Title>
          </Modal.Header>
          <Modal.Body>
              <table className="table table-dark">
                <tbody>
                  <tr>
                    <td>Name</td>
                    <td>
                      <input
                        type="text"
                        placeholder="Visualization Title"
                        onChange={(e) =>
                          setElement({ ...element, title: e.target.value })
                        }
                        name="title"
                        value={element.title}
                        required
                      />
                    </td>
                    <td rowSpan="4">
                      Chart
                      <ChartUpload />
                    </td>
                  </tr>
                  <tr>
                    <td>Description</td>
                    <td>
                      <textarea
                        type="text"
                        placeholder="Description..."
                        value={element.description}
                        onChange={(e) =>
                          setElement({
                            ...element,
                            description: e.target.value,
                          })
                        }
                        name="description"
                        required
                      />
                    </td>
                  </tr>
                  <tr>
                    <td>Class</td>
                    <td>
                      <select
                        className="formselect"
                        value={element.class}
                        onChange={(e) =>
                          {setElement({ ...element, class: e.target.value });}
                        }
                        name="class"
                        required
                      >
                        <option value="Distribution">Distribution</option>
                        <option value="Correlation">Correlation</option>
                        <option value="Ranking">Ranking</option>
                        <option value="Part of a Whole">Part of a Whole</option>
                        <option value="Evolution">Evolution</option>
                        <option value="Map">Map</option>
                        <option value="Flow">Flow</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>
                      <input
                        className="btn btn-primary"
                        value="Submit"
                        type="submit"
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
          </Modal.Body>
          <Modal.Footer>
            <Button
              type="button"
              size="sm"
              variant="secondary"
              onClick={props.onClose}
            >
              Cancel
            </Button>
            <Button
              type="submit"
              size="sm"
              variant="secondary"
              onClick={props.onSave}
            >
              Save
            </Button>
          </Modal.Footer>
        </Modal>
        </Draggable>
      )}
    </>
  );
};
export default Actions;
