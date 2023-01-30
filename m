Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C27C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rtmc4RA/3ifwjM5s6zrPxTTlrDQeAVo17328wxxkisY=; b=R49WVmuHaMeWZE
	D/fzU3/UrMygooWSZLVRvacoQiZZom5w25LPnut7EjAGotbGjZDTgJvczfd8/AOL9OhYPEJ8F3Kog
	gxRX0M9UGQwjlYYkyfoSNLGlUTDjvJBNXhMdkC9EdWEAG0rz3+Hd/W5GXj8SmUZfL3UyubNmxw5f8
	QWS3YtKonYis5e5xdtPU51KO+MJoT8CS3aIBSSkADKEiqfRDqiTd//GSKOTPDBdSQljFeao3fZo9r
	XcyNFOmYoF2QTJkOkJSnaouM/gj6dUdzvbCQ1XvDNb2thkQzeOCRIQBP1/Bc+fMFrjx7o7ZG4N58U
	IygWLl8ogVU9qzxNwDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZZJ-005ABc-Ie; Mon, 30 Jan 2023 19:11:53 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZZF-005AB3-Ve
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 19:11:51 +0000
Received: by mail-ej1-f47.google.com with SMTP id p26so23567164ejx.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 11:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU65rRYM52Gc5N9gkV6nZZxQJLE3/bOxD/7FlWwA6u4=;
        b=JLRp/IlSW5e0HguOBnuh2/403ZOh/fopT+IQfqAejnIutd7eH6yjFZvJw76XdoBPgT
         ENYBlcMoHWZ/6xIVNxnlvOygCpeCUCQ0buqyZw3JByGT7mg7C2J37/Ij1LAe37f/7Shp
         FSxLaQYC+cg4c9dOanL1GAMd38/tGEA0iRxQ7bSGWIc7uTOn+NrVpiW8b4+NIHACttFw
         51DSPxNP5Z3qoDMQf5b0zxFK5E3gTLpSYmrk6jnLCsUnnhMAAIvWKdZqaiyLdmbAt9dm
         5KJ/asTkPT4pFeUBdC0OBzJ9YbDvLIQ7NTzVESZ1sL6DsGaBdnPTw8yiMpNck6UQlflH
         D5Fg==
X-Gm-Message-State: AO0yUKVHQghCBmV4Xgz73yQWztOO66/+wEpPRV3P22B7cgwaHrKFXuax
	U/6zJoh71eI1sbDsn+2HxTzHjFRmNWrSdVuc5+b9/ls2
X-Google-Smtp-Source: AK7set+Xu6B/4xzytt/Jz5draCvC7NhSMfDYO18XJfe49e1baxtM0KT9xIySxJqmB0gOmJA1MuBhQ/KrwoQqqYxa/7A=
X-Received: by 2002:a17:906:1dcd:b0:87f:575a:9b67 with SMTP id
 v13-20020a1709061dcd00b0087f575a9b67mr2806864ejh.274.1675105906763; Mon, 30
 Jan 2023 11:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 30 Jan 2023 20:11:35 +0100
Message-ID: <CAJZ5v0g218rmTM+ra-vP6qcj7OFzDSBwd4ei9H2fPjhuFsXXrA@mail.gmail.com>
Subject: Re: [PATCH 00/24] Add basic ACPI support for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_111150_034099_606DAF6F 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 30, 2023 at 7:22 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> This patch series enables the basic ACPI infrastructure for RISC-V.
> Supporting external interrupt controllers is in progress and hence it is
> tested using polling based HVC SBI console and RAM disk.
>
> The series depends on Anup's IPI improvement series.
> https://github.com/avpatel/linux/commits/riscv_ipi_imp_v17
>
> These changes are available at
> https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17
>
> Testing:
> 1) Build Qemu with ACPI support using below branch
> https://github.com/vlsunil/qemu/tree/acpi_b1_us_review
>
> 2) Build EDK2 as per instructions in
> https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support
>
> 3) Build Linux after enabling SBI HVC and SBI earlycon
> CONFIG_RISCV_SBI_V01=y
> CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> CONFIG_HVC_RISCV_SBI=y
>
> 4) Build buildroot.
>
> Run with below command.
> qemu-system-riscv64   -nographic \
> -drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
> -machine virt,acpi=on -smp 16 -m 2G \
> -kernel arch/riscv/boot/Image \
> -initrd buildroot/output/images/rootfs.cpio \
> -append "root=/dev/ram ro console=hvc0 earlycon=sbi"
>
> Jisheng Zhang (1):
>   riscv: move sbi_init() earlier before jump_label_init()
>
> Sunil V L (23):
>   ACPICA: MADT: Add RISC-V INTC interrupt controller
>   ACPICA: Add structure definitions for RISC-V RHCT
>   RISC-V: ACPI: Add empty headers to enable ACPI core
>   RISC-V: ACPI: Add basic functions to build ACPI core
>   RISC-V: ACPI: Add PCI functions to build ACPI core
>   RISC-V: ACPI: Enable ACPI build infrastructure
>   ACPI: Enable ACPI_PROCESSOR for RISC-V
>   ACPI: OSL: Make should_use_kmap() 0 for RISC-V.
>   ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
>   RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
>   RISC-V: ACPI: smpboot: Create wrapper smp_setup()
>   RISC-V: ACPI: smpboot: Add ACPI support in smp_setup()
>   RISC-V: ACPI: smpboot: Add function to retrieve the hartid
>   clocksource/timer-riscv: Refactor riscv_timer_init_dt()
>   RISC-V: ACPI: clocksource/timer-riscv: Add ACPI support
>   ACPI: RISC-V: drivers/acpi: Add RHCT related code
>   RISC-V: ACPI: time.c: Add ACPI support for time_init()
>   RISC-V: ACPI: cpufeature: Add ACPI support in riscv_fill_hwcap()
>   RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
>   RISC-V: ACPI: Add ACPI initialization in setup_arch()
>   RISC-V: ACPI: Enable ACPI in defconfig
>   MAINTAINERS: Add entry for drivers/acpi/riscv
>   Documentation/kernel-parameters.txt: Add RISC-V for ACPI parameter

The series looks fine to me from the ACPI perspective, so please feel
free to add

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to it and route it via RISC-V.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
