From: marc.zyngier@arm.com (Marc Zyngier)
Date: Mon, 2 Jul 2018 09:22:15 +0100
Subject: [RFC PATCH 1/2] dt-binding: RISC-V local timer docs.
In-Reply-To: <1530295283-191270-2-git-send-email-atish.patra@wdc.com>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-2-git-send-email-atish.patra@wdc.com>
Message-ID: <735f61fd-24e1-1d4c-3858-0e55628cd3cc@arm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 29/06/18 19:01, Atish Patra wrote:
> This patch adds documentation for the RISC-V local timer node which
> defines per-hart based timer interrupts. This is specified by RISC-V
> supervisor manual.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/timer.txt | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/riscv/timer.txt b/Documentation/devicetree/bindings/riscv/timer.txt
> new file mode 100644
> index 0000000..8dcc930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/timer.txt
> @@ -0,0 +1,35 @@
> +* RISC-V local timer
> +
> +RISC-V supervisor manual specifies that timer interrupt is connected to
> +individual harts directly to minimize the interrupt latency. These per
> +hart timer is connected via Hart Level Interrupt Controller (HLIC). The
> +HLIC will also act as the interrupt parent for timer interrupt.
> +
> +Required properties:
> +
> +- compatible : "riscv,local-timer"
> +- interrupts : Should be Timer interrupt number. Current supervisor manual
> +	       defines it be 5.
> +- interrupt-parent : Should point to local interrupt-controller phandle.
> +
> +Example:
> +	cpus {
> +    		#address-cells = <0x00000001>;
> +    		..
> +		..
> +		cpu at 0 {
> +      		..
> +		..
> +		timer {
> +        		interrupts = <0x00000005>;
> +        		interrupt-parent = <0x00000004>;
> +        		compatible = "riscv,local-timer";
> +      		}
> +      		interrupt-controller {
> +			..
> +			..
> +			compatible = "riscv,cpu-intc";
> +			linux,phandle = <0x00000004>;
> +			phandle = <0x00000004>;

This looks like the output of a decompiling of a dtb. Please document
the binding in the way a human being would write it, not how it is
compiled by dtc.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
