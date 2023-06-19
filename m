Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00BFEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK+seUPaaZtmHuCzw6+f1nLDGAacSO34JyG5WpIbbxQ=; b=CkytXgqkhhEYL2dYKSGGq+1pyo
	MSrBqwA7P5+YYKl4W+N0/axfR5d6pBva8Jn6bjbqo8Hsia2hv6Pdqm2s1YEs2I3ibR6lFoa54B154
	e0qSEkjoql1h0uyiyPvPa8wUWboLPU7HL7nwAWJfLajAoAPjR+Zf2fDQjfClhYxmRoXe6uF5UTHWv
	JN6N0BXIZXl8FZThHMz5Uhh08rs0lE13r1nmar6WhgZZE+maL2te+fRRH0rx1bjVpaVdYjGTEz6aE
	iVea9Spw6qjvcyVMAApYmlJzCb1WcYctDW9ka6QqxFv8ktsvcaVhBTxUsbYKf8ZHZYOzDB0lp1P1A
	055XOkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDxf-008TXN-1z;
	Mon, 19 Jun 2023 12:26:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDxc-008TWk-0C
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687177579; x=1718713579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dMPAEYH75en74GBwY9FUzB00jeJTw7JbQjAFqm65cI=;
  b=WgXxVyDQ6/TqOmm/OSuH8aH8Wtkw7eRzBqoYcrVpzFqbFtGP1OnkubTt
   G+0+eTgsIeB+FMv9xPax6JPIbOlEIuFUfC6Ne7O0dvLmKESmVoFkFWrTC
   u25ZTVbiB/SsTbxFzDmDp4fx8l5u3WSilLIpTY6tNEwqvYpMkmd9ABS/B
   FRpoZ7hZVgYebH/Muj7etrl2Ye4bm5xjN8V/4Urrt7F6WfAHKSG+/5+EK
   DmWSTxD1Rbhbai8+U/ZVKKxp2QfFzF5T2uAB1JrbrtIbsb/CC/G1DyfzF
   TxowpJ/J4lY+5zW+PWrYwWFfU3UdsrvtLZBcJE8bO2ZW45GVZ7hTNk9TH
   g==;
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="asc'?scan'208";a="218611642"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2023 05:26:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 19 Jun 2023 05:26:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 19 Jun 2023 05:26:11 -0700
Date: Mon, 19 Jun 2023 13:25:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <20230619-kerchief-unmixed-cfdbeb1cf242@wendy>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230619094705.51337-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_052620_179037_DF148D2C 
X-CRM114-Status: GOOD (  57.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2002557890350988083=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2002557890350988083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JACaknZClFQ0c+Zo"
Content-Disposition: inline

--JACaknZClFQ0c+Zo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

Thanks for working on this :) I've got a mix of suggestions and
questions below. Hopefully it is not too disjoint, since I didn't write
them in order.

On Mon, Jun 19, 2023 at 11:47:04AM +0200, Alexandre Ghiti wrote:
> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.
>=20
> Szigned-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/riscv/boot-image-header.rst |   3 -
>  Documentation/riscv/boot.rst              | 181 ++++++++++++++++++++++
>  Documentation/riscv/index.rst             |   1 +
>  3 files changed, 182 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/riscv/boot.rst
>=20
> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/ri=
scv/boot-image-header.rst
> index d7752533865f..a4a45310c4c4 100644
> --- a/Documentation/riscv/boot-image-header.rst
> +++ b/Documentation/riscv/boot-image-header.rst
> @@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
> =20
>  This document only describes the boot image header details for RISC-V Li=
nux.
> =20
> -TODO:
> -  Write a complete booting guide.
> -
>  The following 64-byte header is present in decompressed Linux kernel ima=
ge::
> =20
>  	u32 code0;		  /* Executable code */
> diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rst
> new file mode 100644
> index 000000000000..b02230818b79
> --- /dev/null
> +++ b/Documentation/riscv/boot.rst
> @@ -0,0 +1,181 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Early boot requirements/constraints on RISC-V
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Please use "title case", here and elsewhere in the doc.
I'd also be inclined to drop the "Early" from here, as it permits more
natural section headings. Perhaps "RISC-V Kernel Boot Requirements and
Constraints"?

> +
> +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> +:Date: 23 May 2023
> +
> +This document describes what the RISC-V kernel expects from the previous=
 stages

"the previous stages" is a bit vague IMO. You mean bootloader stages I
assume, but I think it should be explicit. Perhaps:
"...what a RISC-V kernel expects from bootloaders and firmware, and the
constraints..."

> +and the firmware, but also the constraints that any developer must have =
in mind
> +when touching the early boot process, e.g. before the final virtual mapp=
ing is
> +setup.

s/setup./set up./

Do you mean to have "For example" here? Or is "before the final virtual
mapping is set up" the definition or "early boot"? If the latter, I
would reword this as something like:
"...when modifying the early boot process. For the purposes of this
document, the 'early boot process' refers to any code that runs before
the final virtual mapping is set up."

> +Pre-kernel boot (Expectations from firmware)

Firmware or bootloaders? TBH, I would just drop the section in () and
do something like:
	Pre-kernel Requirements and Constraints
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09
	The RISC-V kernel expects the following of bootloaders and platform
	firmware:

> +
> +Registers state

s/Registers state/Register State/

> +---------------
> +
> +The RISC-V kernel expects:
> +
> +  * `$a0` to contain the hartid of the current core.
> +  * `$a1` to contain the address of the device tree in memory.
> +
> +CSR state
> +---------
> +
> +The RISC-V kernel expects:
> +
> +  * `$satp =3D 0`: the MMU must be disabled.

"the MMU, if present, must be disabled." ;)

> +
> +Reserved memory for resident firmware
> +-------------------------------------
> +
> +The RISC-V kernel expects the firmware to mark any resident memory with =
the

Should this be
"...resident memory, or memory it has protected with PMPs, with..."
?

> +`no-map` flag, thus the kernel won't map those regions in the direct map=
ping

"no-map" is a DT specific term, should this section be moved down under
DT, as a sub-section of that?

> +(avoiding issues with hibernation, speculative accesses and probably oth=
er
> +subsystems).

I'm not sure that this () section is beneficial. To be honest, recent
issues aside, this section here seems like a statement of the obvious...

> +
> +Kernel location
> +---------------
> +
> +The RISC-V kernel expects to be placed at a PMD boundary (2MB for rv64 a=
nd 4MB

Would that be better worded as "(2 MB aligned for rv64 and 4 MB aligned
for rv32)"? It might be overly explicit, but I figure there's no harm...

> +for rv32). Note though that the EFI stub will physically relocate the ke=
rnel if

s/though//

> +that's not the case.
> +
> +Device-tree

s/Device-tree/Devicetree/ and...

> +-----------
> +
> +The RISC-V kernel always expects a device tree, it is:

=2E..s/device tree/devicetree/ to match elsewhere in the kernel docs.
Same applies to the other instances of "device tree" in this patch,
please.

> +
> +- either passed directly to the kernel from the previous stage using the=
 `$a1`
> +  register,
> +- or when booting with UEFI, the device tree will be retrieved by the EF=
I stub
> +  using the EFI configuration table or it will be created.

Can I suggest changing this around a little, pulling the "either" &
dropping some boilerplate so that it reads (to me!) a little more
naturally:
	The RISC-V kernel always expects a devicetree, it is either:
=09
	- passed directly to the kernel from the previous stage using the `$a1`
	  register,
	- retrieved by the EFI stub when booting with UEFI, using the EFI
	  configuration table or it will be created by ____.

Also, please elaborate on what it will be created by.

> +
> +Bootflow

"Boot Flow", no?
I am not sure that this is the "correct" heading for the content it
describes, but I have nothing better to offer :/

> +--------
> +
> +There exist 2 methods to enter the kernel:
> +
> +- `RISCV_BOOT_SPINWAIT`: the firmware releases all harts in the kernel, =
one hart
> +  wins a lottery and executes the early boot code while the other harts =
are
> +  parked waiting for the initialization to finish. This method is now

nit: s/now//

What do you mean by deprecated? There's no requirement to implement the
HSM extension, right?

> +  **deprecated**.
> +- Ordered booting: the firmware releases only one hart that will execute=
 the
> +  initialization phase and then will start all other harts using the SBI=
 HSM
> +  extension.
> +
> +UEFI
> +----
> +
> +UEFI memory map
> +~~~~~~~~~~~~~~~
> +
> +When booting with UEFI, the RISC-V kernel will use only the EFI memory m=
ap to
> +populate the system memory.
> +
> +The UEFI firmware must parse the subnodes of the `/reserved-memory` devi=
ce tree
> +node and abide by the device tree specification to convert the attribute=
s of
> +those subnodes (`no-map` and `reusable`) into their correct EFI equivale=
nt
> +(refer to section "3.5.4 /reserved-memory and UEFI" of the device tree
> +specification).
> +
> +RISCV_EFI_BOOT_PROTOCOL
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When booting with UEFI, the EFI stub requires the boot hartid in order t=
o pass
> +it to the RISC-V kernel in `$a1`. The EFI stub retrieves the boot hartid=
 using
> +one of the following methods:
> +
> +- `RISCV_EFI_BOOT_PROTOCOL` (**preferred**).
> +- `boot-hartid` device tree subnode (**deprecated**).
> +
> +Any new firmware must implement `RISCV_EFI_BOOT_PROTOCOL` as the device =
tree
> +based approach is deprecated now.
> +
> +During kernel boot: (Kernel internals)

With the other section titles changed, this could be:
	Early Boot Requirements and Constraints
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09
	The RISC-V kernel's early boot process operates under the
	following constraints:

Thoughts?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +EFI stub and device tree

Same comments about "device tree" here etc.

> +------------------------
> +
> +When booting with UEFI, the device tree is supplemented by the EFI stub =
with the
> +following parameters (largely shared with arm64 in Documentation/arm/uef=
i.rst):
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Name                        Size     Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +linux,uefi-system-table     64-bit   Physical address of the UEFI System=
 Table.

nit: Hmm, I think for all of these sizes s/-bit/ bits/.

> +
> +linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory=
 map,
> +                                     populated by the UEFI GetMemoryMap(=
) call.
> +
> +linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
> +                                     pointed to in previous entry.
> +
> +linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the =
UEFI
> +                                     memory map.
> +
> +linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor form=
at.
> +
> +kaslr-seed                  64-bit   Entropy used to randomize the kerne=
l image
> +                                     base address location.
> +
> +bootargs                             Kernel command line
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Virtual mapping setup

nit: s/setup/Installation/

> +---------------------
> +
> +The installation of the virtual mapping is done in 2 steps in the RISC-V=
 kernel:
> +
> +1. :c:func:`setup_vm` installs a temporary kernel mapping in
> +   :c:var:`early_pg_dir` which allows to discover the system memory: onl=
y the

s/to discover/discovery of/
s/: only/. Only/

> +   kernel text/data are mapped at this point. When establishing this map=
ping,
> +   no allocation can be done (since the system memory is not known yet),=
 so
> +   :c:var:`early_pg_dir` page table is statically allocated (using only =
one
> +   table for each level).
> +
> +2. :c:func:`setup_vm_final` creates the final kernel mapping in
> +   :c:var:`swapper_pg_dir` and takes advantage of the discovered system =
memory
> +   to create the linear mapping. When establishing this mapping, the ker=
nel
> +   can allocate memory but cannot access it directly (since the direct m=
apping
> +   is not present yet), so it uses temporary mappings in the fixmap regi=
on to
> +   be able to access the newly allocated page table levels.
> +
> +For :c:func:`virt_to_phys` and :c:func:`phys_to_virt` to be able to corr=
ectly
> +convert direct mapping addresses to physical addresses, it needs to know=
 the

nit: s/it/they/

> +start of the DRAM: this happens after 1, right before 2 installs the dir=
ect

s/:/./
Also how about s/1/step 1/ & s/2/step 2/?

> +mapping (see :c:func:`setup_bootmem` function in arch/riscv/mm/init.c). =
So

s/So//

> +any usage of those macros before the final virtual mapping is installed =
must be
> +carefully examined.
> +
> +Device-tree mapping via fixmap
> +------------------------------
> +
> +The RISC-V kernel uses the fixmap region to map the device tree because =
the
> +device tree virtual mapping must remain the same between :c:func:`setup_=
vm` and
> +:c:func:`setup_vm_final` calls since :c:var:`reserved_mem` array is init=
ialized

Missing a "the" before reserved_mem.

> +with virtual addresses established by :c:func:`setup_vm` and used with t=
he
> +mapping established by :c:func:`setup_vm_final`.
> +
> +Pre-MMU execution
> +-----------------
> +
> +Any code that executes before even the first virtual mapping is establis=
hed
> +must be very carefully compiled as:

Could you point out what the non-obvious examples of this code are?

> +- `-fno-pie`: This is needed for relocatable kernels which use `-fPIE`, =
since

Is there a reason why the capitalisation is different for the two
compiler flags?

> +  otherwise, any access to a global symbol would go through the GOT whic=
h is
> +  only relocated virtually.
> +- `-mcmodel=3Dmedany`: Any access to a global symbol must be PC-relative=
 to avoid
> +  any relocations to happen before the MMU is setup.
> +- Also note that *all* instrumentation must also be disabled (that inclu=
des

nit: s/Also note that//

> +  KASAN, ftrace and others).
> +
> +As using a symbol from a different compilation unit requires this unit t=
o be
> +compiled with those flags, we advise, as much as possible, not to use ex=
ternal
> +symbols.

If the use of early alternatives grows, are we going to have to split
the vendors early alternatives into a different compilation unit from
their regular alternatives?

Cheers,
Conor.

--JACaknZClFQ0c+Zo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJBJSQAKCRB4tDGHoIJi
0oYDAQDGw2eP2kvR360enKpa4T0n4O3yeOMhIwpzOvH1jiZSkQD/T7rN9x2isuCG
HO1sBS2rDZtQ0sf35qDBBUWb3h0fNQo=
=pfM6
-----END PGP SIGNATURE-----

--JACaknZClFQ0c+Zo--


--===============2002557890350988083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2002557890350988083==--

