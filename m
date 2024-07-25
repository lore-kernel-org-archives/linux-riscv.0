Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05CEC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2b6hIl5PORolByPHVxSFZE3ZfrEtQkGhSfeompsQFc=; b=HO29tWq8sc4q8I
	2Kncht2fuR5Y6cJOOnqcnNz2PCqbhnCDkBGy5Urv/nr9aj4t8spqdmi4/0q3I0RLWwm2wvCYd9dko
	WaRc4WZxZtNyogS4P/vTm3B4qZAobzR920buPgiudall1YcudDe0kwtc7MYvVv273/wN+gfdXKyV7
	OiqIjOc/hrUBmXWfg2hPfEvjSofh6MxM9HlGxEo3sbazh2KUYJZIrhcWLO4xjtzj/zZXKULPZtyNH
	wx9OzoYA27/WP5dV0maCZHfKAZJm2wPSyTyHqj6vzV6/jbAjq/E9XGN99zHYsmWMZTbOiVJKF/pYQ
	HIdrmcs/H93A/uX6CdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyPE-00000001399-0WpM;
	Thu, 25 Jul 2024 13:21:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOh-000000012kB-1UfL
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E202CE1384;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 510C1C4AF11;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=uLoleUQwNiKBJ39xNzNzucuRi48WbYIMOUXXJTn3Jgs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lHQI4lMqLlyl/3Zl7ur5lOeFPS9fyezqHl6fE1eOvnwtJf5VYh52JcXkuBraQhlqu
	 tjBwMjcMAORgVRTSry8JxBmyB6e5bKjXBDb2uiX0TxD/6e4K+Tq/wb/EaIvEp+xc0y
	 SRb0rDwecTl86ne7s6z2hEfL7whG3SOnIJD+Gmmbs9abRMO4iCzsSOnnHX6uCYtRcj
	 tvDr7NUrbKg9upYjXXm3tFJXEgbDwvIuhsqat/yEVPBWHV6SquGoOkF3CbZ+Dbl+A9
	 ZpOxIsHkXLpVqHiE+dkxPoK8gJm/fN3ibFPxFpaw9rCTmDN3zU5i2xODOU8oSDMlZQ
	 2TK74GgxakObg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 489C8C4333D;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/1] Enable SPCR table for console output on RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363929.6240.827816040310708972.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240502073751.102093-1-jeeheng.sia@starfivetech.com>
In-Reply-To: <20240502073751.102093-1-jeeheng.sia@starfivetech.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, rafael.j.wysocki@intel.com,
 conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062043_641197_4A8AE52E 
X-CRM114-Status: GOOD (  10.56  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  2 May 2024 00:37:50 -0700 you wrote:
> The ACPI SPCR code has been used to enable console output for ARM64 and
> X86. The same code can be reused for RISC-V. Furthermore, SPCR table is
> mandated for headless system as outlined in the RISC-V BRS
> Specification, chapter 6.
> 
> Changes in v2:
> - Added code to handle early_init_dt_scan_chosen_stdout().
> 
> [...]

Here is the summary with links:
  - [v2,1/1] RISC-V: ACPI: Enable SPCR table for console output on RISC-V
    https://git.kernel.org/riscv/c/38738947db38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
