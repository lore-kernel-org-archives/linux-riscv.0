Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4FC47DA7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYOb9AtLGd3zi3ER7+8H42kHv99YjaBFecT2g3Lg1+o=; b=xzQICnVz5Qfgkf
	d740tbKjGw7VMT7tlyAzQeauPKwl8an68CMO3OCbLVfeCYZVR7HtZhOgY/BWcJ2Gd0e/OOhyD47oL
	bUo6N5CLimkmrWUaiXRbZMtRJ5aGdytupFWUlCTDQ7oTWCKrYv5/KjViIsTUEOzUu6mvd9swuIM1P
	Y58zyaX3xz0osaZi1ge2u4i7Squ4AoYqDoRv2wJVLFUQkPTTmF0O5I99mrvIdo3ahzcFOLYJb9Uo1
	8l9J3sgtp8Vxe15SCYHNPOKK+MQRNBS+9E+OxO0py1GVZ8OZQOFiWpenqzZWSoqGExGAimyG1O745
	gfNQsnMYaFPDOm6f/FgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwON-000KLy-16;
	Thu, 11 Jan 2024 14:50:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGe-2W
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 49DD9B81F21;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D729C433C7;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=AtLLG9iuFF/YsW7a9LA3LSnCPMEynDqRU82EBgjJWk8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F56gm2Tz0dXYHd5WEeGfS8sSNumqf2vswGmNfk/qyqIGbq2RCXXQ5tEnUiyBMulSt
	 i0/KosSI4XpL/2frezymN2B2SA6CUk9VxISSnmFHIh+4fdcvWlwjJcBa7mUAGDRbSC
	 0D+UQQNpfWOXLwS1q3g1VPcmTeBZM7UvwhfKl2LKudQ4g84dFrzscVI7XTk+n8mp69
	 7bdtribc/nOVlim9DCyg8RidV28zlyWP8VYQPAdor8R3vxlHi1aH6b1ZQF8oq7JVDD
	 mutSJlP2I4j/M3FUtrADAaLUNZNn7oXykal425icUlFc8HaYwlymMQy8FOek4jZjif
	 a89jeKHxe+kIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83DADD8C96D;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH][riscv] use linux/export.h rather than asm-generic/export.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463753.20080.3233162931960587209.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231214191922.GQ1674809@ZenIV>
In-Reply-To: <20231214191922.GQ1674809@ZenIV>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_957657_035631C6 
X-CRM114-Status: UNSURE (   6.51  )
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

On Thu, 14 Dec 2023 19:19:22 +0000 you wrote:
> asm-generic/export.h is a wrapper for linux/export.h, with explicit request
> to use linux/export.h directly.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---

Here is the summary with links:
  - [riscv] use linux/export.h rather than asm-generic/export.h
    https://git.kernel.org/riscv/c/62694797f56b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
