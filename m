Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C02C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=INKWn6clAyq3oZD7s9zAcivjgDwSZooRJsTAdbZ40U4=; b=bCsSLitGVGOYz/pxOF/bevYdYH
	rgu5q+uCsExiKOzVoLdggcllCffwt9TzxMkMkU+LUiqIQtjy05BPmJtg8HaOOqPR/1VeOEXDeVSrH
	7gUztmzsJY0up9M1YrX98Qq7jqV5RnIao2qTdUHyNrOOi6TgN5TpCrlShL9f11QxAtFOUD+4VmVQs
	pDsG0ziovIHUV9g0SYpDRMs59dHKpNpI4/BIxMGsUg0tzt85miM/H5SwgVLX11zdMx4oJhF65z7Gr
	wlAiioVZHsvacV1yBzU95LtXQ0acEV1vYfAxQa9YO63sxeeNLuPqDjSVaM7C0MDFAwcQjd++Meh3s
	Iu2Wm52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdKU-0000000FfvC-0lM5;
	Wed, 24 Jul 2024 14:50:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdKR-0000000Fftx-1X0M
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 14:50:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-710437d0affso1320732a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721832653; x=1722437453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8JCIP5Ds15R5oJZff49alOWJJz0wPxAxfdpUe0KBfo=;
        b=yfyJqDXOdj4DYARYFYxom4bmwryMwibG0VMSGIvVLUPXszAgW9cZkReZqxeZhmObx1
         hxTFA9wlaTalDqEzwQbSJGBhwpkyr6gik2y1bnB0xXyheQh1U+nbWRbrG61MrxK8Z0uQ
         HpRjgRN8oJapXV1b2tO91Qh9sWaIkiV0rBg6O8QEahkjK0bNendT0a1I8sQ59Py1VCRP
         AwJf6Bv9Xpp9Pp1UxYZC9/dZ9VcawxR5rjd6aQD98+gLBelCsbqYM8PA/ZAN6TgbLxwR
         fuCP6lKY0fuc/lWCvxGUrctsy36aaqH6wawwpET+hkW0iVng1r6ASoMyunoZO0+V1az5
         1WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721832653; x=1722437453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8JCIP5Ds15R5oJZff49alOWJJz0wPxAxfdpUe0KBfo=;
        b=n8OJWEqB04GRXwHEFk9HW8x7H+agM2cV4H7u1pf/wcMUygiW7bske1vNoNmLIwd+Qa
         5fRDUXCZrZnTsDQcqcTMDvJg8QGiEoujFWN3vZR0bnIsi2nv6VXgRfPZtiKiJJLahL+1
         EZR+PbpwyCNbKgQ0daSywxVPTT+zD4641IAND2A1Cc5TH20A8x1+y+OkUfHw7fPDrEl7
         t96erl5+gkNtMYKU2jYH4xwT/cC94pPz0K8u7QAFmW+2eP7zzvUDR4UnyCJpezLPAFzL
         xtl6Us0TOaiD1cE82T6fK6eS1n9lhc3YEEF4uGgPDpqr8QrND4C98JzeugVvRxIKGBIB
         TkPg==
X-Forwarded-Encrypted: i=1; AJvYcCUZPWfWy0X/WzxTog9NGF5LX+1fivZzqSQPxuKUeTU9Rmkw/wGSnMz0uFcNehSW7mQ/eT9tUvmmmuiwwKoWuaI2SzyxDTD3agi8QMOd24Zw
X-Gm-Message-State: AOJu0YzL9GYxZLqIyq8IhN+1nGfOxSkAHfoGSNjM4cwrH5SPcLNUOWE0
	MXHCzqv0F8yzfX9zhCxmbq32GoX//YNR9cbzhrIVOSN5xnPRXo3RsLzX0lf/VgU=
X-Google-Smtp-Source: AGHT+IECfRajUobkWhWFCa7iklKl/PXLaOhcJT32SDfViQUfkilyIhh463XW/PHn5oHsbvSSmbgDdw==
X-Received: by 2002:a05:6a20:7494:b0:1c0:bf35:ef4c with SMTP id adf61e73a8af0-1c4727aad83mr145198637.11.1721832653262;
        Wed, 24 Jul 2024 07:50:53 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0ad73cc4sm8099359a12.29.2024.07.24.07.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:50:52 -0700 (PDT)
Date: Wed, 24 Jul 2024 07:50:52 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 07:39:10 PDT (-0700)
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: haibo1.xu@intel.com
Message-ID: <mhng-e0773c11-559a-4f64-a1ad-4a234993ccfc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_075055_433467_131A3163 
X-CRM114-Status: GOOD (  24.48  )
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
Cc: alison.schofield@intel.com, jszhang@kernel.org, rafael@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, zong.li@sifive.com, kernel@xen0n.name, Will Deacon <will@kernel.org>, tglx@linutronix.de, dave.jiang@intel.com, haibo1.xu@intel.com, bhe@redhat.com, Marc Zyngier <maz@kernel.org>, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, rrichter@amd.com, linux-acpi@vger.kernel.org, samitolvanen@google.com, dan.j.williams@intel.com, lenb@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, Charlie Jenkins <charlie@rivosinc.com>, chenjiahao16@huawei.com, ytcoode@gmail.com, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, cleger@rivosinc.com, xiaobo55x@gmail.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, Greg KH <gregkh@linuxfoundation.org>, rmk+kernel@armlinux.org.uk, samuel.holland@sifive.com, Evan Green <evan@rivosinc.com>, james.morse@arm.com, andy.chiu@sifive.com, akpm@linux-foundation.org, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Jun 2024 01:54:32 PDT (-0700), haibo1.xu@intel.com wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
>
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.
>
> Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next

No big deal, but that's not actually my repo.  Looks like it's just 
mirroring something, I use the kernel.org git stuff these days.  I 
dropped it from the cover letter for the merge, it's not super useful 
anyway because it's a branch so nobody will know what it means later.

Aside from that things look good, I've got this queued up for the 
tester.

>
> [1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing
>
> Testing:
> Since the ACPI AIA/PLIC support patch set is still under upstream review,
> hence it is tested using the poll based HVC SBI console and RAM disk.
> 1) Build latest Qemu with the following patch backported
>    https://github.com/vlsunil/qemu/commit/42bd4eeefd5d4410a68f02d54fee406d8a1269b0
>
> 2) Build latest EDK-II
>    https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md
>
> 3) Build Linux with the following configs enabled
>    CONFIG_RISCV_SBI_V01=y
>    CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>    CONFIG_NONPORTABLE=y
>    CONFIG_HVC_RISCV_SBI=y
>    CONFIG_NUMA=y
>    CONFIG_ACPI_NUMA=y
>
> 4) Build buildroot rootfs.cpio
>
> 5) Launch the Qemu machine
>    qemu-system-riscv64 -nographic \
>    -machine virt,pflash0=pflash0,pflash1=pflash1 -smp 4 -m 8G \
>    -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
>    -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
>    -object memory-backend-ram,size=4G,id=m0 \
>    -object memory-backend-ram,size=4G,id=m1 \
>    -numa node,memdev=m0,cpus=0-1,nodeid=0 \
>    -numa node,memdev=m1,cpus=2-3,nodeid=1 \
>    -numa dist,src=0,dst=1,val=30 \
>    -kernel linux/arch/riscv/boot/Image \
>    -initrd buildroot/output/images/rootfs.cpio \
>    -append "root=/dev/ram ro console=hvc0 earlycon=sbi"
>
> [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000-0x17fffffff]
> [    0.000000] ACPI: SRAT: Node 1 PXM 1 [mem 0x180000000-0x27fffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x17fe3bc40-0x17fe3cfff]
> [    0.000000] NUMA: NODE_DATA [mem 0x27fff4c40-0x27fff5fff]
> ...
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x0 -> Node 0
> [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x1 -> Node 0
> [    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x2 -> Node 1
> [    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x3 -> Node 1
>
> ---
> Changes since v3
>   - Rebase to linux-riscv/for-next(Linux 6.10-rc1)
>   - Remove original patch 1/6 since it had been merged through
>     ACPICA pull(commit fe1c408d50604f)
>   - Remove original patch 4/6 since the related changes was
>     introduced in commit 3a785e19f43267
>
> Haibo Xu (4):
>   ACPI: RISCV: Add NUMA support based on SRAT and SLIT
>   ACPI: NUMA: Add handler for SRAT RINTC affinity structure
>   ACPI: NUMA: change the ACPI_NUMA to a hidden option
>   ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init
>
>  arch/arm64/Kconfig            |   1 -
>  arch/loongarch/Kconfig        |   1 -
>  arch/riscv/include/asm/acpi.h |  15 +++-
>  arch/riscv/kernel/Makefile    |   1 +
>  arch/riscv/kernel/acpi.c      |   5 --
>  arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |   4 +-
>  arch/riscv/kernel/smpboot.c   |   2 -
>  drivers/acpi/numa/Kconfig     |   5 +-
>  drivers/acpi/numa/srat.c      |  32 ++++++++-
>  drivers/base/arch_numa.c      |   2 +-
>  include/linux/acpi.h          |   6 ++
>  12 files changed, 187 insertions(+), 18 deletions(-)
>  create mode 100644 arch/riscv/kernel/acpi_numa.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
