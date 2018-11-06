From: sboyd@kernel.org (Stephen Boyd)
Date: Tue, 06 Nov 2018 09:33:32 -0800
Subject: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
In-Reply-To: <20181020135024.28573-3-paul.walmsley@sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
Message-ID: <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Quoting Paul Walmsley (2018-10-20 06:50:23)
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> new file mode 100644
> index 000000000000..d7c1e83fa5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> @@ -0,0 +1,43 @@
> +SiFive FU540 PRCI bindings
> +
> +On the FU540 family of SoCs, most system-wide clock and reset integration
> +is via the PRCI IP block.
> +
> +Required properties:
> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> +              file was written, only one value is supported:

I don't think we need the "As of the time" sentence. It will become out
of date almost immediately so why not just say "The list of supported
values is:"?

> +             "sifive,fu540-c000-prci0"
> +- reg: Should describe the PRCI's register target physical address region
> +- clocks: Should point to the hfclk device tree node and the rtcclk
> +          device tree node.  The RTC clock here is not a time-of-day clock,
> +         but is instead a high-stability clock source for system timers
> +         and cycle counters.
> +- #clock-cells: Should be <1>
