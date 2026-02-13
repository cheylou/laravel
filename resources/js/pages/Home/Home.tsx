import { Head } from "@inertiajs/react";

export default function Home() {
    return (
        <>
            <Head title="Home" />

            <div
                style={{
                    backgroundColor: "blue",
                    height: "100vh",
                    display: "flex",
                    justifyContent: "center",
                    alignItems: "center",
                }}
            >
                <h1 style={{ color: "white", fontSize: "40px" }}>
                    CHERRYLOU SALIGUMABA
                </h1>
            </div>
        </>
    );
}
