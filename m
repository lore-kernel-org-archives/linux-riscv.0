Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9293AC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suVFN3/v4UJGTCm90SiHi89euZ5mjIM2N0cqjLYIUXM=; b=DAOLGIcnquA0Tq
	l5lpm5SsxYiCfZsJX78+Jds9epLC3mzX+QCFqRIyZlFZY8wabx0iz/ZXBYegG9t+RrewcI4t7D97Z
	UTPZc8lq1CG5nPCCsaXfc8R8Cb6aiee9WM11EW1N0xEqhky/wz1kAPhZmYBLNW07iSLYAvGlS5Pmj
	i2xrWJSI4+AV0NTrro3lOwymDVfuMbgFbmItPgR3k8iTY4lNp8IUAMzrBqlZUoEKGEGBOArNVesz5
	cktAVOM8TYWu8JvLdjc2T57osDaGw4cRutkCFHyoagMOQrG9dlW+qj8lc6TOivzbI+M/m2aYwSN5F
	ri3+ixSjyeNEDuuRWY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56GU-007BIg-0j;
	Fri, 02 Jun 2023 15:00:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56GQ-007BGm-33
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 15:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FAC2650F9;
	Fri,  2 Jun 2023 15:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71A95C433A1;
	Fri,  2 Jun 2023 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685718025;
	bh=pa+sw7piReDEjInKXKqjGINHz86IV7DvHVj4nDWYvdg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bi1ioK3XvJ+q3Rle2fRqVnvW64r4HT8l9zsDWx2N6bHMb5QqsnpQCIOMcyY9Hw848
	 Xqg2oqOYe6wkErfYpqyvP8jlZPPlmo0Wumcgle7dFw27lEz/gaQbCj2gaKCdGVzaFf
	 uvJ0LWXz2QpSe9R+7XtwbPIRUxs5EI23BhpgxxrDiAAjqpaGhhGknFjehuO/54fMUE
	 sd7S43jlfkmhLMf+L7AjrFZT70ek2YzNkN/kEZnOIsOyREwA0veeqVsD1k256/LjFB
	 RUi29jySWu1mxRgDYpEgjof6CwLCXLIWY+mywg/AOpAjR1ItHueuzhqH8nbkHuvZFL
	 65Hw2cciOpK4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 421D5C395E5;
	Fri,  2 Jun 2023 15:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V6 00/21] Add basic ACPI support for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168571802526.11683.10109882495660507850.git-patchwork-notify@kernel.org>
Date: Fri, 02 Jun 2023 15:00:25 +0000
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 llvm@lists.linux.dev, qianweili@huawei.com, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org, trix@redhat.com, rafael@kernel.org,
 maz@kernel.org, corbet@lwn.net, ndesaulniers@google.com,
 markgross@kernel.org, hdegoede@redhat.com, wangzhou1@hisilicon.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, herbert@gondor.apana.org.au,
 tglx@linutronix.de, luzmaximilian@gmail.com, davem@davemloft.net,
 nathan@kernel.org, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_080027_087206_139F93B3 
X-CRM114-Status: GOOD (  14.75  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 15 May 2023 11:19:07 +0530 you wrote:
> This patch series enables the basic ACPI infrastructure for RISC-V.
> Supporting external interrupt controllers is in progress and hence it is
> tested using poll based HVC SBI console and RAM disk.
> 
> The first patch in this series is one of the patch from Jisheng's
> series [1] which is not merged yet. This patch is required to support
> ACPI since efi_init() which gets called before sbi_init() can enable
> static branches and hits a panic.
> 
> [...]

Here is the summary with links:
  - [V6,01/21] riscv: move sbi_init() earlier before jump_label_init()
    https://git.kernel.org/riscv/c/24fc18087f42
  - [V6,02/21] platform/surface: Disable for RISC-V
    https://git.kernel.org/riscv/c/7f2e20459b28
  - [V6,03/21] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
    https://git.kernel.org/riscv/c/fbb995a7b27c
  - [V6,04/21] ACPI: tables: Print RINTC information when MADT is parsed
    https://git.kernel.org/riscv/c/4d02d88d2b92
  - [V6,05/21] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
    https://git.kernel.org/riscv/c/214c236223b8
  - [V6,06/21] RISC-V: Add support to build the ACPI core
    https://git.kernel.org/riscv/c/a91a9ffbd3a5
  - [V6,07/21] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
    https://git.kernel.org/riscv/c/8b7809e28952
  - [V6,08/21] RISC-V: Add ACPI initialization in setup_arch()
    https://git.kernel.org/riscv/c/724f4c0df766
  - [V6,09/21] RISC-V: ACPI: Cache and retrieve the RINTC structure
    https://git.kernel.org/riscv/c/f99561199470
  - [V6,10/21] drivers/acpi: RISC-V: Add RHCT related code
    https://git.kernel.org/riscv/c/e6b9d8eddb17
  - [V6,11/21] RISC-V: smpboot: Create wrapper setup_smp()
    https://git.kernel.org/riscv/c/61946127ab49
  - [V6,12/21] RISC-V: smpboot: Add ACPI support in setup_smp()
    https://git.kernel.org/riscv/c/ce92546cd637
  - [V6,13/21] RISC-V: only iterate over possible CPUs in ISA string parser
    https://git.kernel.org/riscv/c/914d6f44fc50
  - [V6,14/21] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
    https://git.kernel.org/riscv/c/396c018332a1
  - [V6,15/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
    https://git.kernel.org/riscv/c/0b144c818989
  - [V6,16/21] irqchip/riscv-intc: Add ACPI support
    https://git.kernel.org/riscv/c/7023b9d83f03
  - [V6,17/21] clocksource/timer-riscv: Refactor riscv_timer_init_dt()
    https://git.kernel.org/riscv/c/cd12d206685a
  - [V6,18/21] clocksource/timer-riscv: Add ACPI support
    https://git.kernel.org/riscv/c/21f4f92410dc
  - [V6,19/21] RISC-V: time.c: Add ACPI support for time_init()
    https://git.kernel.org/riscv/c/714aa1d1c8ca
  - [V6,20/21] RISC-V: Enable ACPI in defconfig
    https://git.kernel.org/riscv/c/0b8e15ca0082
  - [V6,21/21] MAINTAINERS: Add entry for drivers/acpi/riscv
    https://git.kernel.org/riscv/c/cc9e654a7e81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
