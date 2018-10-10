From: thierry.reding@gmail.com (Thierry Reding)
Date: Wed, 10 Oct 2018 15:49:26 +0200
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
In-Reply-To: <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
Message-ID: <20181010134926.GD21134@ulmo>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
> 
> DT documentation for PWM controller added with updated compatible
> string.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> new file mode 100644
> index 00000000..532b10fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -0,0 +1,32 @@
> +SiFive PWM controller
> +
> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> +supports one period for all channels in the PWM. This is set globally in DTS.
> +The period also has significant restrictions on the values it can achieve,
> +which the driver rounds to the nearest achievable frequency.

What restrictions are these? If "nearest achievable" is too far off the
target period it might be preferable to error out.

> +Required properties:
> +- compatible: should be one of
> +	"sifive,fu540-c000-pwm0","sifive,pwm0".

What's the '0' in here? A version number?

> +	PWM controller is HiFive Unleashed specific chip which warrants a
> +	specific compatible string. The second string is kept for backward
> +	compatibility until a firmware update with latest compatible string.
> +- reg: physical base address and length of the controller's registers
> +- clocks: The frequency the controller runs at
> +- #pwm-cells: Should be 2.
> +  The first cell is the PWM channel number
> +  The second cell is the PWM polarity
> +- sifive,approx-period: the driver will get as close to this period as it can

Given the above comment, maybe "sifive,period"?

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181010/302e1d35/attachment.sig>
