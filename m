Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF5E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n111i4sv429ZzeOsJ+UO+IMozjyVZ+7tbsoMaF/o/BM=; b=Dv/8G2pTSqsmp3
	h9J71vKW5t6BUQ79NsilYOiTvOoAChUDe1Cq93fYbyhG8XwIaB23VKsYpsA4VHggfvvp7k9fRNrwf
	/2dbschxX9nUtx87vzIeeFIGeXS0nJf7fty7n+h6nhY3mVddHLaPNLG3PzdlZ6ihc3aaVagqYFSpZ
	BiSybMWehJuT1huVmLfByARgBCaUwwlgsJ1pAz6QBxwUDYEW/YflanjvNHWt4lrco07ePTD+aQu/r
	pqYAW4/oYHOGFus3sssO1PnmZQhQDnwfvWrQTd7XGya3mN4gxEirmhSoBACdzWRs4+c91KbMBvPqP
	HfyFj+4TttTre1mKKlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVRR-0000000GODr-38pa;
	Wed, 11 Dec 2024 22:44:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGX-0000000GKzi-2AOj
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D770A41B16;
	Wed, 11 Dec 2024 22:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66660C4CED2;
	Wed, 11 Dec 2024 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956388;
	bh=mVgKdv1VYB3F4YDKiICqJP62JryObnh1WV8uO4vtcEE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KdkpMxZlloN6e++uDsfgbjZ4497egu+EYtsR31yrXLHEpg63wzm1PmT2Zx9g/cjaV
	 hcbOrAG1WNXX7pcdUqsoCGZ0IpgKaPUM7hMu9Eb0WaQC/r16JmBQvUX6/pFlSGcQrk
	 IwjigmMmXHn/5+GIC0UBKp3tVe+c563y93qnIqK7cVjx1rblGwdnBcrv2Vc8MmaSAF
	 DBy/Mduxe8v2GRtFayqEjbY3WLGaHaAM9kGddYpeN6BCsgQfsB63ZbUe8m2GnzhcCk
	 YF5LoSnoh+3jrqKuyt4kIbY9E2KI4zWg2uMxl29fcwaiocNdyM7HC/5Wso2tQ7EXeW
	 TzMVywECB/LaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBA0380A965;
	Wed, 11 Dec 2024 22:33:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH] riscv: Fixup boot failure when
 CONFIG_DEBUG_RT_MUTEXES=y
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395640424.1729195.252270245008728818.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:24 +0000
References: <20241130153310.3349484-1-guoren@kernel.org>
In-Reply-To: <20241130153310.3349484-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de,
 alexghiti@rivosinc.com, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143309_635455_4868589E 
X-CRM114-Status: UNSURE (   6.65  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 30 Nov 2024 10:33:10 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When CONFIG_DEBUG_RT_MUTEXES=y, mutex_lock->rt_mutex_try_acquire
> would change from rt_mutex_cmpxchg_acquire to
> rt_mutex_slowtrylock():
> 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
> 	ret = __rt_mutex_slowtrylock(lock);
> 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
> 
> [...]

Here is the summary with links:
  - [RESEND] riscv: Fixup boot failure when CONFIG_DEBUG_RT_MUTEXES=y
    https://git.kernel.org/riscv/c/b3134b8c1a1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
