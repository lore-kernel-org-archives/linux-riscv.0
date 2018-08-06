From: alistair23@gmail.com (Alistair Francis)
Date: Mon, 6 Aug 2018 16:34:24 -0700
Subject: [PATCH 1/4] pcie-microsemi: Add support for the Vera-board root
 complex
In-Reply-To: <20180806231305.GG2377@latitude>
References: <20180806221009.12466-1-alistair.francis@wdc.com>
 <20180806231305.GG2377@latitude>
Message-ID: <CAKmqyKPMWbeat9ajucYmQ2RYPVoy+7=3espPetMCsz=0W7zXfQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 6, 2018 at 4:13 PM, Jonathan Neusch?fer
<j.neuschaefer@gmx.net> wrote:
> Hi,
>
> On Mon, Aug 06, 2018 at 03:10:06PM -0700, Alistair Francis wrote:
>> From: "Wesley W. Terpstra" <wesley@sifive.com>
>>
>> [Changes by AF:
>>  - Rebase on 4.18 kernel
>>  - Squash previous commits
>> ]
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
> [...]
>> +static const struct of_device_id microsemi_pcie_of_match[] = {
>> +        { .compatible = "ms-pf,axi-pcie-host", },
>> +        {}
>> +};
>
> Two comments here:
>
> - I don't see ms-pf in Documentation/devicetree/bindings/vendor-prefixes.txt
>   For Microsemi, only mscc is listed.
> - Are the devicetree bindings for this device documented somewhere? It
>   might be a good idea to get them into Documentation/devicetree/bindings,
>   or add a link to them either to the commit message or the code itself.

Thanks for the comments. My goal with this patch was just to get the
MicroSemi PCIe drivers into the main riscv-all tree. This patch is
just copied from an old branch from the RISC-V fork GitHub.

I'm happy to help get this into mainline though if that's ok with
SiFive and MicroSemi guys.

Alistair

>
>
> Thanks,
> Jonathan Neusch?fer
