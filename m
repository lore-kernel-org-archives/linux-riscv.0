Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51146CD11DD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibjz/EZ361wA1eLdniAJNEtFUkmO469QMzBzMsVhKTQ=; b=H2URdEEDGpTcdv
	uPcu0JVQ9bn3Uu2gmVcMIPMmMtVUN4xRhEnv/s1aJ4EGtUbdwvvtSj93AiirzaOYBVZoFIEIkJjr1
	TvwlRtCy9YBaw1zyMhkvJZbW1vANij4Lsk0jcbqe8vUVuBo7VsErA2jiAXOVDl3NWpHIAzXkpomVH
	cVH0gc5marf1MV7YQfBj+5xwYGQIMO19/0G2uQ9uE/a1wSAOMWT9ejinslAZBqnumm4t2U9+0GDJI
	ULmoL+OKhUlZT5vLWWe19YLjPEQvMXL5QMvjh7dlqGIGjDMzpve3vLQWV+SnI8w+9bKx4U3DU1Bfn
	VPMHZyEuVqCfYpo0/60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2th-00000000vyR-0scL;
	Wed, 20 Mar 2024 20:50:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tV-00000000vpg-1Kxp
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F03E96111F;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43F56C433A6;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=+PifagGk+gURTA9vY7TNHlo06xkwkczqhge93C7brus=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RaUNpUnFQt9VpK/coGA3iciZ+/yHKVYvwi2+1siV7cdtSYp7NIa0QzYszfRlMGj85
	 ylwm/+3+VQcacNO3DQ9ST89McinYvkSYW5L+QFzbaJRO/exncukegYe89JYmnWi8Gx
	 v6xnM4ebhoB+F6UzxWBTmbQ+k5bMNzl6LtAkWJuFt0h2PGFtuhy0IvRrE7O1ElL1dj
	 mGvxj3njoHwuTqX9ChaFupTJMGZQrmoiEvIRDHpuc4Llk21rKw0iKjxVqSS/6hqnTO
	 1MrvVE81ve9GAA4c1zyrATV3LE9FNoCUkcS41kCesYeUcJnguivuaxPjyubCihLRkF
	 65HAx8WEs9E6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 366D6D98302;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783922.6804.3192320298991985852.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 aou@eecs.berkeley.edu, rafael@kernel.org, anup@brainfault.org,
 daniel.lezcano@linaro.org, atishp@rivosinc.com, conor.dooley@microchip.com,
 palmer@dabbelt.com, pavel@ucw.cz, paul.walmsley@sifive.com,
 ajones@ventanamicro.com, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135041_610981_E6EC0D8A 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

On Thu, 18 Jan 2024 11:59:27 +0530 you wrote:
> This series adds support for Low Power Idle (LPI) on ACPI based
> platforms.
> 
> LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this is available at [2].
> 
> [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#lpi-low-power-idle-states
> [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v/riscv-ffh.pdf
> 
> [...]

Here is the summary with links:
  - [v3,-next,1/3] cpuidle: RISC-V: Move few functions to arch/riscv
    https://git.kernel.org/riscv/c/6649182a383c
  - [v3,-next,2/3] ACPI: RISC-V: Add LPI driver
    https://git.kernel.org/riscv/c/4877fc92142f
  - [v3,-next,3/3] ACPI: Enable ACPI_PROCESSOR for RISC-V
    https://git.kernel.org/riscv/c/359df7c5be4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
