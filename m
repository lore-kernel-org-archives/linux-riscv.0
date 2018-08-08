From: robh+dt@kernel.org (Rob Herring)
Date: Wed, 8 Aug 2018 08:43:02 -0600
Subject: [PATCH 02/11] dt-bindings: Add an enable method to RISC-V
In-Reply-To: <20180802115008.4031-3-hch@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-3-hch@lst.de>
Message-ID: <CAL_JsqKZXo7JKszrvAwCzAgysKrwdwb1oZX9K8+FxO4ZitNh_A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 2, 2018 at 5:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> RISC-V doesn't currently specify a mechanism for enabling or disabling
> CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
> someone wants to save power we instead put a CPU to sleep via a WFI
> loop.  Future systems may have an explicit mechanism for putting a CPU
> to sleep, so we're standardizing the device tree entry for when that
> happens.
>
> We're not defining a spin-table based interface to the firmware, as the
> plan is to handle this entirely within the kernel instead.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> index b0b038d6c406..6aa9cd075a5b 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> @@ -82,6 +82,15 @@ described below.
>                  Value type: <string>
>                  Definition: Contains the RISC-V ISA string of this hart.  These
>                              ISA strings are defined by the RISC-V ISA manual.
> +        - cpu-enable-method:

Something wrong with "enable-method" as defined in the DT spec[1]?

> +                Usage: optional
> +                Value type: <stringlist>
> +                Definition: When absent, default is either "always-disabled"
> +                            "always-enabled", depending on the current state
> +                            of the CPU.
> +                            Must be one of:
> +                                * "always-disabled": This CPU cannot be enabled.
> +                                * "always-enabled": This CPU cannot be disabled.

To follow the spec, 'enable-method' should simply not be present in
the always-enabled case. I think the always disabled case should be
handled with:

status = "disabled";
enable-method = "none";

With "none" needing to be added to the spec.

[1] https://github.com/devicetree-org/devicetree-specification/blob/master/source/devicenodes.rst#general-properties-of-cpuscpu-nodes
