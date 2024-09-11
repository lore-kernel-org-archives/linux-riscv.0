Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530E4EE49BC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1r59VpLLGEgAVf0bHoEkQvLYUBV2YtcdaixTT23QVY=; b=FO0gm+h8ONXzbF
	olsH4NAqD2b5bhOqR++KeXcFX2Sz3bRnJcjA9oi+mfAnguNZ6MJIOckmRkJven9DpClKIQG2477Rd
	frvMiAhIqSWPJzkNXBiq+4i5qqAlWDL6VmeQz75QvHmryGRFzEp1o4TVUE94uhIWnKdR3d+YQ+ll9
	0+cUaQS3iqJRo/71wlu3vudxXauYuBYf8DKzXk47mngIbwD6IgFBjU6ZCaCqWZthYqQ5/7HEQUmd/
	jfIJkSH/3HjCn8UL4PpAdB0JOX2gNntBujhKFp2ckaQ4lFbWwfxaHSXYdOL5YlqrB4YueBzi79+X6
	go9RHh7t4hcgPoEqQY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPgU-0000000AFgj-2lRQ;
	Wed, 11 Sep 2024 15:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPIe-0000000AADV-1soy
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 15:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF9715C04AF;
	Wed, 11 Sep 2024 15:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9F1C4CEC0;
	Wed, 11 Sep 2024 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726068631;
	bh=ttP3w3JurC1S7zqICMQrZiemEwxVlGcX4Z9wPYi6/Zw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JUsM7+SELIMCFdrnxwKS1xdZEHeDcOnOvoPXIdF/hAdT/Ah1TqrFjE7falGp2RtxZ
	 hIptkfamIXKzIMcXk5pipxMSFnOMXOqS1adV7Yz/Jbue33/i6/KrtqG1KsLTCBHgwy
	 5SAQ14eVEjgm16hE/6BZqtdc9fo0KUm5FNunaDAjzou716i41/KRcMGefD4VvSkYDx
	 qeSHUZXWk7IYB7fnU1xqS5v2+cwtBh8ZMxAOraX3wjdxB7VvNggoAk2mx6S0VE17NM
	 /CR6TRldIa7HCTfHv36Qmuso9Ia0APgCKy7kLZ8WRYiZTZfCxQKdtnt0PFjzWF1Q0X
	 E6tlD0R7eHgwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340083806656;
	Wed, 11 Sep 2024 15:30:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Fix race conditions in
 PR_RISCV_SET_ICACHE_FLUSH_CTX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172606863202.959689.8576514936896750298.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 15:30:32 +0000
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
In-Reply-To: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 atishp@rivosinc.com, samuel.holland@sifive.com, parri.andrea@gmail.com,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_083032_580501_D87AFE91 
X-CRM114-Status: GOOD (  10.79  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 13 Aug 2024 16:02:16 -0700 you wrote:
> There are two race conditions possible with
> PR_RISCV_SET_ICACHE_FLUSH_CTX. The first one can be seen by enabling
> DEBUG_PREEMPT and using this prctl which will warn with BUG: using
> smp_processor_id() in preemptible. This can be fixed by disabling
> preemption during this prctl handling. Another race condition is present
> when the mm->context.icache_stale_mask is changed by a thread while a
> different thread in the same mm context is between switch_mm() and
> switch_to() during a context switch.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF
    https://git.kernel.org/riscv/c/7c1e5b9690b0
  - [2/2] riscv: Eagerly flush in flush_icache_deferred()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
