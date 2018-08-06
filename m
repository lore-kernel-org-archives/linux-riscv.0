From: j.neuschaefer@gmx.net (Jonathan =?utf-8?Q?Neusch=C3=A4fer?=)
Date: Tue, 7 Aug 2018 01:13:05 +0200
Subject: [PATCH 1/4] pcie-microsemi: Add support for the Vera-board root
 complex
In-Reply-To: <20180806221009.12466-1-alistair.francis@wdc.com>
References: <20180806221009.12466-1-alistair.francis@wdc.com>
Message-ID: <20180806231305.GG2377@latitude>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

On Mon, Aug 06, 2018 at 03:10:06PM -0700, Alistair Francis wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
> 
> [Changes by AF:
>  - Rebase on 4.18 kernel
>  - Squash previous commits
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
[...]
> +static const struct of_device_id microsemi_pcie_of_match[] = {
> +        { .compatible = "ms-pf,axi-pcie-host", },
> +        {}
> +};

Two comments here:

- I don't see ms-pf in Documentation/devicetree/bindings/vendor-prefixes.txt
  For Microsemi, only mscc is listed.
- Are the devicetree bindings for this device documented somewhere? It
  might be a good idea to get them into Documentation/devicetree/bindings,
  or add a link to them either to the commit message or the code itself.


Thanks,
Jonathan Neusch?fer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180807/79692e77/attachment.sig>
