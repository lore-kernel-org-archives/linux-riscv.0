Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D4C00A5A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woYeXpvn1wlIjNoCDppIvV5cTCEF2Mx5iF6/kRODvA0=; b=T+bZg/Hz0/Cb+8
	FOCkY2oYRpdfuEN+Ysm/PeTHmAZBnuxTm1Yj5TgR5WqgIiaI8YofowX9xR5P4fifd3FWXsWuoAWwu
	xz09j7gRz4u6Z/rjIsSQ80xwIFHWGMVc8NQ42uOL1Zd2thMCz3iOZ4IAnBZ4SrIle9k4M7t1Pe9IT
	byX3JmvfStTzJb0YJlTsNKxj/52pszzBkQ0sqn3Q6odGWVXDk2gDhUxXkLh/bPhRphcddmv0z3ELv
	xR2V5y11InE2CUQC0L8IdfKD6w0sUQQwkJpZ1wLLe11NxmAGYQcav7id0LcrMAikQYyYXUDX3mbwZ
	pwYGjF04NN3k4up/ww2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015j-00GvgQ-0V;
	Mon, 06 Nov 2023 15:00:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015c-00Gvbw-1J
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5870060FBA;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 287D5C433D9;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282830;
	bh=fsH0EcJFPJldadwX9edPxnf9TI0xu3QSOxwn6f0XkpU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TkqsSIj2ElDEAeFUuPjTIskNX4GnW42wgemrPBhq7LpMuyUPMC1At+isID90JzUBY
	 J5yEE6nRBUbk2QHeshVAsKsh3R2oKUe0tMpoh63bKflSJnNqTSTxxZLCV3cmf6FGK+
	 tPziAYD12gRWMd5HwZoB88H+Ktu2q+1u7HbRlYs4mCbrmpARjqOSvrHlhVEw9ZOLPt
	 IOLfyXpy3yi0MZrPCZNIH9aDQl5u5Jx6xwoxR9DXQwCvXKkb2YzgkeROfRxg7cifej
	 ml3g9rJBI4/JCItaFWO8EDcsvr+uolcMdvNTac/M/2sVt1jXQRftTgN5lw2uLrObgl
	 zyzXivdFeoaZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1345EE00089;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: defconfig : add CONFIG_MMC_DW for starfive
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282907.16503.712664664958063675.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230912133128.5247-1-tangjinyu@tinylab.org>
In-Reply-To: <20230912133128.5247-1-tangjinyu@tinylab.org>
To: Jinyu Tang <tangjinyu@tinylab.org>
Cc: linux-riscv@lists.infradead.org, william.qiu@starfivetech.com,
 hal.feng@starfivetech.com, conor.dooley@microchip.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, ttjjyystupid@163.com, falcon@tinylab.org,
 wangjiexun@tinylab.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070032_516018_0A7DF261 
X-CRM114-Status: UNSURE (   8.59  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Sep 2023 21:31:28 +0800 you wrote:
> If these config not set, mmc can't run for jh7110, rootfs can't
> be found when using SD card. So set CONFIG_MMC_DW=y like arm64
> defconfig, and set CONFIG_MMC_DW_STARFIVE=y for starfive. Then
> starfive vf2 board can start SD card rootfs with mainline defconfig
> and dtb.
> 
> Signed-off-by: Jinyu Tang <tangjinyu@tinylab.org>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: defconfig : add CONFIG_MMC_DW for starfive
    https://git.kernel.org/riscv/c/07863871dfb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
