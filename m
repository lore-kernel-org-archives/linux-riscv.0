Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB23EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1neubjH+3qKvstZP74hgf8kLTiPoPIW5V1JjXBuJlc=; b=HgER6lmOqvtqhX
	cuTO1ysOyL4rxqDo1DpVICsp3xzgy8twYs5YlQmJ7fr7XcASP/TtasqN6QCs0m48GTOrDIZkQs7T0
	PCCZp7AIcuwLSrMz6HE/Lc2abCfEIGHv36QiipG1rVwTUS36npZnsdAmQUzE8UHJhviiNhnLG3f9n
	yyIS/OhEGvno/BcUo/WDFN8K7DFZn8VdKaV2tvInrpOII+rSW7ZtUIr0Eo5p+/dGXevpOErOTbWF8
	qqM4bQQS2syvltwAuSIgsK8TGUYmBxhBs/gD8nH699bmj2H3goyHDCRQNv9U89nzrbf5TCvv/wztQ
	QdTUU+HI3Wn3KM8nGp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCd1w-00319o-1g;
	Fri, 23 Jun 2023 09:24:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCd1s-00319A-31
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 09:24:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-988883b0d8fso47343366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687512270; x=1690104270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/79PxINtD0wV3qp6JPg1zdLUAhMiA4hYTLnel+qvzo=;
        b=HDSkV6AFN6VgtymEGXR3oh9xtCkJi+1qRjpGrlleMLiKSIfzRh5M3R11ZAK+1INdDP
         x3MZS+KrMO1t6db0/CZIzcMuc+7w7KLR6K/Mipok/9fZeKCZELLmr6KaGo3MSiZh0b8i
         e9dAV0fmk99AOaOTXJ/06w+UVCRWDE/l/Hy1j8tz0ELgHPgT3WLi2LjP8BfDVAESFD8p
         cvKXtyM2A742Cqa1lQ7/Cnqk/F1Au7aEVOQe6ALXNKSaQ/OIHBisnsxdGGW5RMgmCLX7
         zrrMyS0xaazFile/bTDhLsrqcuttw3lzwU0nr7mGzYjNDWgkpb48VPVZO323I9YB9Y+x
         87GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687512270; x=1690104270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/79PxINtD0wV3qp6JPg1zdLUAhMiA4hYTLnel+qvzo=;
        b=hRdSbncztmYQZ9bMyAPiufvUxUuNTOBkrWXmTqAlo7asTkf3LmRTZd99JfXYFm/SJV
         lADrev21QBsDtk5fRXHE5guy+XQEcanGqrV2J4CoisbHkEPAP4iETT0Cr6ylFakW/JJI
         kC6Wa7Vl3BHJtgOZfJVarHTyIa4XA2KSgAuKC7KJSgY1a98MChg4ZLRIDCJOLXmeNfMN
         Da9lgVE6heiOp6ytadl8qp4n9D3JuM501S/PRMbpz95e3GYf2cPeLFr3FYqSAznT+phv
         qDqa603zl+0WXD83S5gqxWDsvBaTc/GCkx6NMlgahZN+R8DgsrfwT/YeA95w12ti9iFl
         Vrkw==
X-Gm-Message-State: AC+VfDxLnw00f/Cw9ybDWl2d++TXgGYikzoa02UDMEBlxcW6pMfR21wN
	3UwMuqvbCgLMO7gNi4t+B+aJFQ==
X-Google-Smtp-Source: ACHHUZ6LikdDrqUXcXdWSZ/wu38LvuAxOYWRtRJtE65+sUtqXESKaebswi54N8F6fJx1b+g0ukdLEg==
X-Received: by 2002:a17:907:16a6:b0:978:66bd:d771 with SMTP id hc38-20020a17090716a600b0097866bdd771mr21574125ejc.55.1687512269728;
        Fri, 23 Jun 2023 02:24:29 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w20-20020a056402071400b0051a5ea200d4sm4944437edx.65.2023.06.23.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:24:29 -0700 (PDT)
Date: Fri, 23 Jun 2023 11:24:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230623-1020c71aa0496e2ced2cb3ed@orel>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel>
 <02ee9366-436a-4be6-5a79-05874f999b88@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ee9366-436a-4be6-5a79-05874f999b88@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_022433_008399_159A9AF3 
X-CRM114-Status: GOOD (  56.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 23, 2023 at 10:48:55AM +0200, Alexandre Ghiti wrote:
> =

> On 21/06/2023 14:19, Andrew Jones wrote:
> > On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> > > This document describes the constraints and requirements of the early
> > > boot process in a RISC-V kernel.
> > > =

> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> > > ---
> > >   Documentation/riscv/boot-image-header.rst |   3 -
> > >   Documentation/riscv/boot.rst              | 170 +++++++++++++++++++=
+++
> > >   Documentation/riscv/index.rst             |   1 +
> > >   3 files changed, 171 insertions(+), 3 deletions(-)
> > >   create mode 100644 Documentation/riscv/boot.rst
> > > =

> > > diff --git a/Documentation/riscv/boot-image-header.rst b/Documentatio=
n/riscv/boot-image-header.rst
> > > index d7752533865f..a4a45310c4c4 100644
> > > --- a/Documentation/riscv/boot-image-header.rst
> > > +++ b/Documentation/riscv/boot-image-header.rst
> > > @@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
> > >   This document only describes the boot image header details for RISC=
-V Linux.
> > > -TODO:
> > > -  Write a complete booting guide.
> > > -
> > >   The following 64-byte header is present in decompressed Linux kerne=
l image::
> > >   	u32 code0;		  /* Executable code */
> > > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.=
rst
> > > new file mode 100644
> > > index 000000000000..019ee818686d
> > > --- /dev/null
> > > +++ b/Documentation/riscv/boot.rst
> > > @@ -0,0 +1,170 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +RISC-V Kernel Boot Requirements and Constraints
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > +:Date: 23 May 2023
> > > +
> > > +This document describes what the RISC-V kernel expects from bootload=
ers and
> > > +firmware, but also the constraints that any developer must have in m=
ind when
> > > +touching the early boot process. For the purposes of this document, =
the
> > > +'early boot process' refers to any code that runs before the final v=
irtual
> > > +mapping is set up.
> > > +
> > > +Pre-kernel Requirements and Constraints
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The RISC-V kernel expects the following of bootloaders and platform =
firmware:
> > > +
> > > +Register state
> > > +--------------
> > > +
> > > +The RISC-V kernel expects:
> > > +
> > > +  * `$a0` to contain the hartid of the current core.
> > > +  * `$a1` to contain the address of the devicetree in memory.
> > > +
> > > +CSR state
> > > +---------
> > > +
> > > +The RISC-V kernel expects:
> > > +
> > > +  * `$satp =3D 0`: the MMU, if present, must be disabled.
> > > +
> > > +Reserved memory for resident firmware
> > > +-------------------------------------
> > > +
> > > +The RISC-V kernel must not map any resident memory, or memory protec=
ted with
> > > +PMPs, in the direct mapping, so the firmware must correctly mark tho=
se regions
> > > +as per the devicetree=A0specification and/or the UEFI specification.
> > > +
> > > +Kernel location
> > > +---------------
> > > +
> > > +The RISC-V kernel expects to be placed at a PMD boundary (2MB aligne=
d for rv64
> > > +and 4MB aligned for rv32). Note that the EFI stub will physically re=
locate the
> > > +kernel if that's not the case.
> > > +
> > > +Hardware description
> > > +--------------------
> > > +
> > > +The firmware can pass either a devicetree or ACPI tables to the RISC=
-V kernel.
> > > +
> > > +The devicetree is either passed directly to the kernel from the prev=
ious stage
> > > +using the `$a1` register, or when booting with UEFI, it can be passe=
d using the
> > > +EFI configuration table.
> > > +
> > > +The ACPI tables are passed to the kernel using the EFI configuration=
 table. In
> > > +this case, a tiny devicetree is still created by the EFI stub. Pleas=
e refer to
> > > +"EFI stub and devicetree" tree section below for details about this =
devicetree.
> >                               ^ redundant 'tree' here
> > =

> > > +
> > > +Kernel entrance
> > > +---------------
> > > +
> > > +On SMP systems, there are 2 methods to enter the kernel:
> > > +
> > > +- `RISCV_BOOT_SPINWAIT`: the firmware releases all harts in the kern=
el, one hart
> > > +  wins a lottery and executes the early boot code while the other ha=
rts are
> > > +  parked waiting for the initialization to finish. This method is mo=
stly used to
> > > +  support older firmwares without SBI HSM extension and M-mode RISC-=
V kernel.
> > > +- `Ordered booting`: the firmware releases only one hart that will e=
xecute the
> > > +  initialization phase and then will start all other harts using the=
 SBI HSM
> > > +  extension. The ordered booting method is the preferred booting met=
hod for
> > > +  booting the RISC-V kernel because it can support cpu hotplug and k=
exec.
> > > +
> > > +UEFI
> > > +----
> > > +
> > > +UEFI memory map
> > > +~~~~~~~~~~~~~~~
> > > +
> > > +When booting with UEFI, the RISC-V kernel will use only the EFI memo=
ry map to
> > > +populate the system memory.
> > > +
> > > +The UEFI firmware must parse the subnodes of the `/reserved-memory` =
devicetree
> > > +node and abide by the devicetree specification to convert the attrib=
utes of
> > > +those subnodes (`no-map` and `reusable`) into their correct EFI equi=
valent
> > > +(refer to section "3.5.4 /reserved-memory and UEFI" of the devicetree
> > > +specification v0.4-rc1).
> > > +
> > > +RISCV_EFI_BOOT_PROTOCOL
> > > +~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +When booting with UEFI, the EFI stub requires the boot hartid in ord=
er to pass
> > > +it to the RISC-V kernel in `$a1`. The EFI stub retrieves the boot ha=
rtid using
> > > +one of the following methods:
> > > +
> > > +- `RISCV_EFI_BOOT_PROTOCOL` (**preferred**).
> > > +- `boot-hartid` devicetree subnode (**deprecated**).
> > > +
> > > +Any new firmware must implement `RISCV_EFI_BOOT_PROTOCOL` as the dev=
icetree
> > > +based approach is deprecated now.
> > > +
> > > +Early Boot Requirements and Constraints
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The RISC-V kernel's early boot process operates under the following =
constraints:
> > > +
> > > +EFI stub and devicetree
> > > +-----------------------
> > > +
> > > +When booting with UEFI, the devicetree is supplemented (or created) =
by the EFI
> > > +stub with the same parameters as arm64 which are described at the pa=
ragraph
> > > +"UEFI kernel support on ARM" in Documentation/arm/uefi.rst.
> > > +
> > > +Virtual mapping installation
> > > +----------------------------
> > > +
> > > +The installation of the virtual mapping is done in 2 steps in the RI=
SC-V kernel:
> > > +
> > > +1. :c:func:`setup_vm` installs a temporary kernel mapping in
> > > +   :c:var:`early_pg_dir` which allows discovery of the system memory=
. Only the
> > > +   kernel text/data are mapped at this point. When establishing this=
 mapping, no
> > > +   allocation can be done (since the system memory is not known yet)=
, so
> > > +   :c:var:`early_pg_dir` page table is statically allocated (using o=
nly one
> > > +   table for each level).
> > > +
> > > +2. :c:func:`setup_vm_final` creates the final kernel mapping in
> > > +   :c:var:`swapper_pg_dir` and takes advantage of the discovered sys=
tem memory
> > > +   to create the linear mapping. When establishing this mapping, the=
 kernel
> > > +   can allocate memory but cannot access it directly (since the dire=
ct mapping
> > > +   is not present yet), so it uses temporary mappings in the fixmap =
region to
> > > +   be able to access the newly allocated page table levels.
> > > +
> > > +For :c:func:`virt_to_phys` and :c:func:`phys_to_virt` to be able to =
correctly
> > > +convert direct mapping addresses to physical addresses, they need to=
 know the
> > > +start of the DRAM. This happens after step 1, right before step 2 in=
stalls the
> > > +direct mapping (see :c:func:`setup_bootmem` function in arch/riscv/m=
m/init.c).
> > > +Any usage of those macros before the final virtual mapping is instal=
led must
> > > +be carefully examined.
> > > +
> > > +Device-tree mapping via fixmap
> > > +------------------------------
> > > +
> > > +The RISC-V kernel uses the fixmap region to map the devicetree becau=
se the
> > > +devicetree virtual mapping must remain the same between :c:func:`set=
up_vm` and
> > > +:c:func:`setup_vm_final` calls since the :c:var:`reserved_mem` array=
 is
> > > +initialized with virtual addresses established by :c:func:`setup_vm`=
 and used
> > > +with the mapping established by :c:func:`setup_vm_final`.
> > > +
> > > +Pre-MMU execution
> > > +-----------------
> > > +
> > > +A few pieces of code need to run before even the first virtual mappi=
ng is
> > > +established. These are the installation of the first virtual mapping=
 itself,
> > > +patching of early alternatives and the early parsing of the kernel c=
ommand line.
> > > +That code must be very carefully compiled as:
> > > +
> > > +- `-fno-pie`: This is needed for relocatable kernels which use `-fPI=
E`, since
> > > +  otherwise, any access to a global symbol would go through the GOT =
which is
> > > +  only relocated virtually.
> > > +- `-mcmodel=3Dmedany`: Any access to a global symbol must be PC-rela=
tive to avoid
> > > +  any relocations to happen before the MMU is setup.
> > > +- *all* instrumentation must also be disabled (that includes KASAN, =
ftrace and
> > > +  others).
> > > +
> > > +As using a symbol from a different compilation unit requires this un=
it to be
> > > +compiled with those flags, we advise, as much as possible, not to us=
e external
> > > +symbols.
> > > diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/inde=
x.rst
> > > index 175a91db0200..1f66062def6d 100644
> > > --- a/Documentation/riscv/index.rst
> > > +++ b/Documentation/riscv/index.rst
> > > @@ -5,6 +5,7 @@ RISC-V architecture
> > >   .. toctree::
> > >       :maxdepth: 1
> > > +    boot
> > >       boot-image-header
> > >       vm-layout
> > >       hwprobe
> > > -- =

> > > 2.39.2
> > > =

> > Otherwise looks good to me.
> =

> =

> I assume I can add your RB here, don't waste time answering if I'm right =
:)

Yup, when I read it the first time I wasn't sure I was familiar enough
with everything to give it an r-b, but I just read it again and grepped
a few things that I wasn't already familiar with, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
