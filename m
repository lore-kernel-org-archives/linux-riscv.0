Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D8C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5WNIW3p+knIXhSxFr0+r7UZnZbsLGoa81FTWKIte/s=; b=UBkYYrY85RO6V1
	MQMx9ajrvl5Jn8FbNGuX1KxlZCUAcJOjggJpF3Iqve1AiursEPTVTIYPlrk3IjV2dTD9GbUZ/htLi
	uXCCVBipQBJnTIKh4UguJvuz/8ZHU1hSuG5CpcJo+AC5yd8mipSLb3LVtHAkTWty2RHNglb+wemJn
	3C81BcnRtj6mkJpK8BEk4xCXo89xudt1oIX7BHQl9RB5pum/+5nF9GtXnx9X27now90+f5VNXSvZI
	UD9XBjfaikd7mbxi424WWu4lsJzZdbjXl7uH0/2ECQwZK9MKaLKDS474MRdqA9xG5b6O8Ro0MQKIG
	bIe/vSAXfnYB9qqfyXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOM-000KLu-2N;
	Thu, 11 Jan 2024 14:50:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGV-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A17E61AC3;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5CB9C43399;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=58hPWif0bJT32T7OOV+cmALx5lR57XsGkAKosD2LuBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X8FJEJ5zF7veCXE4XnBK1whwUqZP5C/IZiSSrnK655xRtahkst6w7nYiYAsaJyB+H
	 WLTEv1H/dIsWhK/2aJs8DyZcEvzRrENAgBm41md9knLwCrb9Af9wNtwE3SBLEzP37t
	 oVHcfx7Ksk1VRReYHuCtccZ4zKzzmLidZkkuX1KppeGbV9G7rrYJbqTyOUtDiRHMFD
	 3IhI6y90LVFQrWgLvmqamlEgmS8CrdHblulG3yXkNNGddH787+S0U5EkxX+Jy+UKLd
	 +hCadxTPUCCSWr0SG/2T0jNG6OgnRt9iNmuH3HseVHnNdL93+Qgnu6SxlbcvajV/ZJ
	 hruxMK2YXrwAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0F63D8C974;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v4 0/2] riscv: errata: thead: use
 riscv_nonstd_cache_ops for CMO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463765.20080.13600497512635410658.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231114143338.2406-1-jszhang@kernel.org>
In-Reply-To: <20231114143338.2406-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_905718_5BD429E2 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, 14 Nov 2023 22:33:36 +0800 you wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
> 
> [...]

Here is the summary with links:
  - [RESEND,v4,1/2] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
    https://git.kernel.org/riscv/c/a4ff64edf9ed
  - [RESEND,v4,2/2] riscv: errata: thead: use pa based instructions for CMO
    https://git.kernel.org/riscv/c/3690492612ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
