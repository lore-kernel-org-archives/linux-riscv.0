Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901ADC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4iIAq3xF5eNTD6byV0e5hguGojtGB5isECDwnSzcyo=; b=0LU4h026I0K6jm
	bZmPnL4KtQAAVjjQAvBFivWak2bagPXdaAlU8J4oSsTy76qW2wE3K5T5XFDA4xbISRH0I2+MZWHF3
	VDumJeYAc+ugHjqBtOdDad1PBWcsYo2FwIE9xHVGPfuSBrj3un3ps6xN7TUWLexVBrdUvYCiaRFI6
	Vk1iDXhW6Qy195EL/FQqeuqAGbisXIkNKmeiG0x3dE0qrsztqNZzXBzBKB08n7sOpTesSb+LaVon7
	RaROL1XWnnSsPm6kyfn+R4sHxMdxHhxm3wEA08i/6kPR0Cy0LVsiRz96R4UUD5x78zfEsIYagsOBF
	+OvB5U2Xe4/p4tIeQ4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Qfn-000tAh-IL; Wed, 30 Nov 2022 17:15:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Qff-000t3f-D4
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 17:14:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6C9C61CE2;
	Wed, 30 Nov 2022 17:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B374C433D6;
	Wed, 30 Nov 2022 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828494;
	bh=cJR2YmImnir4Uud+GCJobmzFXvuwDvPCWvb6LoYmbHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGDrz1lzkRymQaGkTHCNRaiqujsyxRHu5kptKe9PaBLFpy3UJVYHF6LaPtt9jI9Y8
	 HE7kr8LMjNmPFHKTEnCZg31tuMJmhHPr6DUuVXKkbJNuYOU1J0ogLOs/c6khFW9FRk
	 alk2n7RhVKRo00QMhnzm6uQZ3NbFSTehffW9f2cFFdsXnpuNcmigJiDdLcxwOUTakE
	 fCQD5+vjPcZkTZ7hC4sab11F8sXqFh9tWj0e2XERO9Qhe85t1/FDk4FT+clidbrA8w
	 MVOiot5bN8ftb6U65J13MTlG1mhwof2syrNR8u/w+PmA5QWbb2pm4SlIMWkmApPSsH
	 7YtrK8reEcU/Q==
Date: Wed, 30 Nov 2022 17:14:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 13/13] RISC-V: add zbb support to string functions
Message-ID: <Y4ePiTIwJJfx9qS4@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-14-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-14-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_091455_575024_B0A9ADE2 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, Nov 28, 2022 at 11:26:32AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add handling for ZBB extension and add support for using it as a
> variant for optimized string functions.
> 
> Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> +config TOOLCHAIN_HAS_ZBB
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +
> +config RISCV_ISA_ZBB
> +	bool "Zbb extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBB
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZBB
> +	   extension (basic bit manipulation) and enable its usage.
> +
> +	   The Zbb extension provides instructions to accelerate a number
> +	   of bit-specific operations (count bit population, sign extending,
> +	   bitrotation, etc).
> +
> +	   If you don't know what to do here, say Y.

/stuff/linux/arch/riscv/lib/strncmp_zbb.S:23:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
.option arch,+zbb
        ^
/stuff/linux/arch/riscv/lib/strncmp_zbb.S:56:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions)
 orc.b t3, t0
 ^
/stuff/linux/arch/riscv/lib/strncmp_zbb.S:67:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
 rev8 t0, t0
 ^
/stuff/linux/arch/riscv/lib/strncmp_zbb.S:68:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
 rev8 t1, t1
 ^
make[4]: *** [/stuff/linux/scripts/Makefile.build:382: arch/riscv/lib/strncmp_zbb.o] Error 1

So there's something wrong in 13/13 somewhere, but the failure itself is
a bit odd? At least, at odds with your support stuff here.

CONFIG_CC_VERSION_TEXT="ClangBuiltLinux clang version 15.0.4 (5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=150004
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=150004
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=150004

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
