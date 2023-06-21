Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F8EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy5MsdXLLGSQB1YmI+WNh7BDic4KV/stR+OMav+lomU=; b=rPMkp+qKGD0ogx
	sM3otBOUq2TUPcE9QW6A4R1SOjeuk0NwQtjQOjy4uo/bYIR5xm2LIqe59Doe6g4sA69Mwp+sTStO3
	524ixkkwUuTX5sHysQGIGNt8FXU7TLOJIfyY3l6k8KE+DfVUx0LXhcFh0+REC7jwpSiDOmf//1vJV
	7i/pUTdzDXniyLewemYM2Ie+5pcK2HSqmAvaE0ZuRgxSZmVtsvZrha2ftgj+OyLAx6/qtly24zHcI
	I1JyI18hhXLTD2MQ2C1NMH6hNWTLwx56lHapOtl/fQoH8G+LsjpP7zXPWMPGO5ZiSPMmNxdgSd5uu
	2ysrsUZO7tT3BpODQMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwoX-00EWDE-2s;
	Wed, 21 Jun 2023 12:19:57 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwoV-00EWBr-0z
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 12:19:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-518b69d5b5dso7965644a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687349992; x=1689941992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5W5LDwMI4yeRuSo5i8rWYOa2ALM9dIobhV8MGUpltQ=;
        b=JXGjFARoK/u83e0P1OzfLI2DgYTHHWe9izVzHi5fjJLlXKy/BDLEx50QdS0dwYOrWq
         19hWqYYXYyZp5H8wm5tKDYPY9nb0JrteBibwKBtMR3kDrhnCz03cp7gptpw4OBTtP1w2
         3S4ad2bs77/6cmOWJ4FypxAEK+S3UfMKBVhfxF6B01PFW73BwAKnlvE0NoolDL4H1FzW
         g2r7iLx/xkBnx4IlQArZjvNTw/GZpNMf5JcQFd0OfB31mY8hXXz92dbKfJxwPEtX1Gjf
         FyF9Olodl4B/fSzw+BFxHY+TtnDdWpCOJxhF4UsDk+5tFkhBuJAMXejC9ptg+l+Huqnm
         JorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687349992; x=1689941992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5W5LDwMI4yeRuSo5i8rWYOa2ALM9dIobhV8MGUpltQ=;
        b=EhMYIvcyM2hEsoDoLYRTxusz9OgggJ7XOsA+ztkIvpiO3SRentlEJj4pM9SAKKip9C
         JcPYzxiLX1YFbvdCXgzEDjx8MWUwvcs35dzN5rEQ/AOug1fuB2qgpn1gWHbNQC9My9iO
         pgesTsKWynz8BKbSGXrZSKad23Jo7EjUQPX3ZDkyQKkbpprfT6+NTAcM7tvE0KgEwXBv
         u/AZh/AxdeYireoLjs0YxkwgDjGc6uSueRyh+mzq0rqvjshMUmlf1RK1fw0X8qPldqW8
         41v2lnaZEw4CjNFsO1ip9U77+FQ2HCCZh1rSCdqm1cFJ9SQZggywojT/XpzYwerqaqpd
         jmjQ==
X-Gm-Message-State: AC+VfDxHmvqYDB0bogqc9ZF3XUWyxzkWYYBhUb7nUC86/Vm+rJ7FDQrK
	DujtvvSQD9Fv1S8y9tgqMolreg==
X-Google-Smtp-Source: ACHHUZ6XdrEmXuRjSpKrrQU4/wmyKqi9NThfsGx+JgPiL1CVNgNIQUzQl48WpvLWam3wOXcsxNgzAQ==
X-Received: by 2002:aa7:d585:0:b0:51a:3b59:20f with SMTP id r5-20020aa7d585000000b0051a3b59020fmr10338692edq.36.1687349992300;
        Wed, 21 Jun 2023 05:19:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7cd87000000b0051830f22825sm2597336edv.90.2023.06.21.05.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:19:51 -0700 (PDT)
Date: Wed, 21 Jun 2023 14:19:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230621-d6da578719f8af903d6746ef@orel>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621072234.9900-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_051955_349871_C4772B84 
X-CRM114-Status: GOOD (  49.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.
> =

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  Documentation/riscv/boot-image-header.rst |   3 -
>  Documentation/riscv/boot.rst              | 170 ++++++++++++++++++++++
>  Documentation/riscv/index.rst             |   1 +
>  3 files changed, 171 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/riscv/boot.rst
> =

> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/ri=
scv/boot-image-header.rst
> index d7752533865f..a4a45310c4c4 100644
> --- a/Documentation/riscv/boot-image-header.rst
> +++ b/Documentation/riscv/boot-image-header.rst
> @@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
>  =

>  This document only describes the boot image header details for RISC-V Li=
nux.
>  =

> -TODO:
> -  Write a complete booting guide.
> -
>  The following 64-byte header is present in decompressed Linux kernel ima=
ge::
>  =

>  	u32 code0;		  /* Executable code */
> diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rst
> new file mode 100644
> index 000000000000..019ee818686d
> --- /dev/null
> +++ b/Documentation/riscv/boot.rst
> @@ -0,0 +1,170 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +RISC-V Kernel Boot Requirements and Constraints
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> +:Date: 23 May 2023
> +
> +This document describes what the RISC-V kernel expects from bootloaders =
and
> +firmware, but also the constraints that any developer must have in mind =
when
> +touching the early boot process. For the purposes of this document, the
> +'early boot process' refers to any code that runs before the final virtu=
al
> +mapping is set up.
> +
> +Pre-kernel Requirements and Constraints
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The RISC-V kernel expects the following of bootloaders and platform firm=
ware:
> +
> +Register state
> +--------------
> +
> +The RISC-V kernel expects:
> +
> +  * `$a0` to contain the hartid of the current core.
> +  * `$a1` to contain the address of the devicetree in memory.
> +
> +CSR state
> +---------
> +
> +The RISC-V kernel expects:
> +
> +  * `$satp =3D 0`: the MMU, if present, must be disabled.
> +
> +Reserved memory for resident firmware
> +-------------------------------------
> +
> +The RISC-V kernel must not map any resident memory, or memory protected =
with
> +PMPs, in the direct mapping, so the firmware must correctly mark those r=
egions
> +as per the devicetree=A0specification and/or the UEFI specification.
> +
> +Kernel location
> +---------------
> +
> +The RISC-V kernel expects to be placed at a PMD boundary (2MB aligned fo=
r rv64
> +and 4MB aligned for rv32). Note that the EFI stub will physically reloca=
te the
> +kernel if that's not the case.
> +
> +Hardware description
> +--------------------
> +
> +The firmware can pass either a devicetree or ACPI tables to the RISC-V k=
ernel.
> +
> +The devicetree is either passed directly to the kernel from the previous=
 stage
> +using the `$a1` register, or when booting with UEFI, it can be passed us=
ing the
> +EFI configuration table.
> +
> +The ACPI tables are passed to the kernel using the EFI configuration tab=
le. In
> +this case, a tiny devicetree is still created by the EFI stub. Please re=
fer to
> +"EFI stub and devicetree" tree section below for details about this devi=
cetree.
                             ^ redundant 'tree' here

> +
> +Kernel entrance
> +---------------
> +
> +On SMP systems, there are 2 methods to enter the kernel:
> +
> +- `RISCV_BOOT_SPINWAIT`: the firmware releases all harts in the kernel, =
one hart
> +  wins a lottery and executes the early boot code while the other harts =
are
> +  parked waiting for the initialization to finish. This method is mostly=
 used to
> +  support older firmwares without SBI HSM extension and M-mode RISC-V ke=
rnel.
> +- `Ordered booting`: the firmware releases only one hart that will execu=
te the
> +  initialization phase and then will start all other harts using the SBI=
 HSM
> +  extension. The ordered booting method is the preferred booting method =
for
> +  booting the RISC-V kernel because it can support cpu hotplug and kexec.
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
cetree
> +node and abide by the devicetree specification to convert the attributes=
 of
> +those subnodes (`no-map` and `reusable`) into their correct EFI equivale=
nt
> +(refer to section "3.5.4 /reserved-memory and UEFI" of the devicetree
> +specification v0.4-rc1).
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
> +- `boot-hartid` devicetree subnode (**deprecated**).
> +
> +Any new firmware must implement `RISCV_EFI_BOOT_PROTOCOL` as the devicet=
ree
> +based approach is deprecated now.
> +
> +Early Boot Requirements and Constraints
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The RISC-V kernel's early boot process operates under the following cons=
traints:
> +
> +EFI stub and devicetree
> +-----------------------
> +
> +When booting with UEFI, the devicetree is supplemented (or created) by t=
he EFI
> +stub with the same parameters as arm64 which are described at the paragr=
aph
> +"UEFI kernel support on ARM" in Documentation/arm/uefi.rst.
> +
> +Virtual mapping installation
> +----------------------------
> +
> +The installation of the virtual mapping is done in 2 steps in the RISC-V=
 kernel:
> +
> +1. :c:func:`setup_vm` installs a temporary kernel mapping in
> +   :c:var:`early_pg_dir` which allows discovery of the system memory. On=
ly the
> +   kernel text/data are mapped at this point. When establishing this map=
ping, no
> +   allocation can be done (since the system memory is not known yet), so
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
> +convert direct mapping addresses to physical addresses, they need to kno=
w the
> +start of the DRAM. This happens after step 1, right before step 2 instal=
ls the
> +direct mapping (see :c:func:`setup_bootmem` function in arch/riscv/mm/in=
it.c).
> +Any usage of those macros before the final virtual mapping is installed =
must
> +be carefully examined.
> +
> +Device-tree mapping via fixmap
> +------------------------------
> +
> +The RISC-V kernel uses the fixmap region to map the devicetree because t=
he
> +devicetree virtual mapping must remain the same between :c:func:`setup_v=
m` and
> +:c:func:`setup_vm_final` calls since the :c:var:`reserved_mem` array is
> +initialized with virtual addresses established by :c:func:`setup_vm` and=
 used
> +with the mapping established by :c:func:`setup_vm_final`.
> +
> +Pre-MMU execution
> +-----------------
> +
> +A few pieces of code need to run before even the first virtual mapping is
> +established. These are the installation of the first virtual mapping its=
elf,
> +patching of early alternatives and the early parsing of the kernel comma=
nd line.
> +That code must be very carefully compiled as:
> +
> +- `-fno-pie`: This is needed for relocatable kernels which use `-fPIE`, =
since
> +  otherwise, any access to a global symbol would go through the GOT whic=
h is
> +  only relocated virtually.
> +- `-mcmodel=3Dmedany`: Any access to a global symbol must be PC-relative=
 to avoid
> +  any relocations to happen before the MMU is setup.
> +- *all* instrumentation must also be disabled (that includes KASAN, ftra=
ce and
> +  others).
> +
> +As using a symbol from a different compilation unit requires this unit t=
o be
> +compiled with those flags, we advise, as much as possible, not to use ex=
ternal
> +symbols.
> diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
> index 175a91db0200..1f66062def6d 100644
> --- a/Documentation/riscv/index.rst
> +++ b/Documentation/riscv/index.rst
> @@ -5,6 +5,7 @@ RISC-V architecture
>  .. toctree::
>      :maxdepth: 1
>  =

> +    boot
>      boot-image-header
>      vm-layout
>      hwprobe
> -- =

> 2.39.2
>

Otherwise looks good to me.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
