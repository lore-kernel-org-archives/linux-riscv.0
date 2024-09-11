Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3FCEE57C1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjE2A0Cr9gJch50aDWBzAOuKIRuq0lDK2HhrwRHrqME=; b=ZDUKQR0Fk2HyD2
	tYIH47h5B+NE0vVEYXRLqrhgiBF1tHTjJ941GMYqt065LXkgD+wPjxD2pEJ3CxSco+tURuB2x7ID7
	i70mM6cgbNuQY4PT2DO65T+0OfjcTP4C4EkKQX+PU1YufkNgIMTCZsIM1g76gLGZ2cWAW83/aTHES
	/SM2QJjRZlQ7isOYsxbrUTSK+kVmYfJKxrvRJTp0G2VRCSSogoFnK3Hu9TitUJi4vq6kSPfJDNQ+d
	LUSza1bUHqIx9flVVX733KSyicVdLIrfJqSMXzsu9Vgj33GP1CEZUTMgR+h6Wf47/i7sxDrbK96Bw
	qd2qSzFmUBPgnJQ+v57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPgV-0000000AFhA-36q1;
	Wed, 11 Sep 2024 15:55:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPIf-0000000AAEN-11nZ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 15:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCDDCA435D9;
	Wed, 11 Sep 2024 15:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B30C4CEC5;
	Wed, 11 Sep 2024 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726068632;
	bh=llJeNL3z/ffIqfsiZcfsjZ/5cwKD3WmlJM+NkLUF0+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJGTyi3XQGxWYpZWUPXIzDp3FPB6YDXxvbNdL6tzNzuZbNNPFabctqvBlGYbWNvrK
	 WyTTFSxs/3QJMrEzuhUfjaprlUYCJLctBEMlIlI0tYwFOmO+gmyRh18Mu9A6aqjuAX
	 lTwaBVdSIwDCQg3R1LA7NDjxFFOnOt/TFyMtwpp6TpBpy1wuwJ09iyZn1e4quNozmk
	 2qjy3vByOjb2K1MujG0vAbtYl9HpRtxey1EG3w6PobG7ifn+t2bTYyd0GDDmRtHFL7
	 biW3G9Uq/6tk/2VMbnVv8VU+gglnKXfMEv4wIguzrUFLrcYInyHck+6lG7Vv11mvxm
	 0505TL1Tj03Vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C093806656;
	Wed, 11 Sep 2024 15:30:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Disable preemption while handling
 PR_RISCV_CTX_SW_FENCEI_OFF
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172606863325.959689.12181957139773137657.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 15:30:33 +0000
References: <20240903-fix_fencei_optimization-v2-1-8025f20171fc@rivosinc.com>
In-Reply-To: <20240903-fix_fencei_optimization-v2-1-8025f20171fc@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 atishp@rivosinc.com, samuel.holland@sifive.com, parri.andrea@gmail.com,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_083033_365787_7A937F5B 
X-CRM114-Status: GOOD (  13.76  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 03 Sep 2024 15:52:34 -0700 you wrote:
> The icache will be flushed in switch_to() if force_icache_flush is true,
> or in flush_icache_deferred() if icache_stale_mask is set. Between
> setting force_icache_flush to false and calculating the new
> icache_stale_mask, preemption needs to be disabled. There are two
> reasons for this:
> 
> 1. If CPU migration happens between force_icache_flush = false, and the
>    icache_stale_mask is set, an icache flush will not be emitted.
> 2. smp_processor_id() is used in set_icache_stale_mask() to mark the
>    current CPU as not needing another flush since a flush will have
>    happened either by userspace or by the kernel when performing the
>    migration. smp_processor_id() is currently called twice with preemption
>    enabled which causes a race condition. It allows
>    icache_stale_mask to be populated with inconsistent CPU ids.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF
    https://git.kernel.org/riscv/c/7c1e5b9690b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
