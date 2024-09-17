Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6546C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ75xn33n33MZaBRPsLghXCaEfHF8TrA1u6yseL9QcU=; b=2Nud1cMRhrDL7i
	lk9WGI4RV+H+DHoRQGJltFQ/7wJleCgPOkSO9fFAbkNrk0hkc+Ke1rh/7UboPyG1g7jHTKszQlq5z
	5e12B3rvCB8vnAz9KPqCRup1PP+QFbojFGpeZoxLytsj5nYAcs3IuNDXwKDOd5J8Pi47eQAu/hRpd
	DKX24h7aFHchP9AtoFyhXtEYWs29BYgaEMmVQUJpNLNYC0st46b+UZzUyXD1e0lfUyFVvLGSYadZd
	i8SHi7b00XqCuO95qUFxq8CLMeDnG2g+u97qNSdweq1AfZjCL9LQ/njWqY5dGBsszsMTq9f7RvHKc
	r8OgvTLVKzLBTsUxWpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp8-00000006B0B-0YPg;
	Tue, 17 Sep 2024 13:00:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp3-00000006Avw-11AT
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8649AA41475;
	Tue, 17 Sep 2024 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1288DC4CECE;
	Tue, 17 Sep 2024 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578048;
	bh=13+lBwvxPVO2YzZgD8MFY652lnuH8q/bLmJzRCKZ9O8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XQHiXsXtGWTaeXInAeOBHbvavc1cGKZL8PxRsDiJXoyOcQ4BAPz3aUYJkY7DdkJcB
	 sVyqrHuZ1mGoL9MY9+NkQHyCiGW2h5YvyB4ujx9/Uqr/9RrWsq35i285z1OOc7t1MI
	 hrVYNsOGGulFvYqKPhcGaFAWitTtS9qJkwG1HJYqHAgDLzikOR6OXVDTujuKV90rgX
	 +EgvXqcuB4K6MS7ihtbyOp/rkL4eaoGRLFaR3bZAXOku4PPMyftACJKHhEkFdt0oCa
	 a/3VnVZk8xhYLtE74unnmsBrVegXOfaFQyi+qCqNXMyytnCgmr6sRoVgtjWypWX6Dm
	 KW5/gizybVdaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD083809A80;
	Tue, 17 Sep 2024 13:00:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove unused _TIF_WORK_MASK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804950.126252.10342609864354079162.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:49 +0000
References: <20240711111508.1373322-1-ruanjinjie@huawei.com>
In-Reply-To: <20240711111508.1373322-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samitolvanen@google.com,
 debug@rivosinc.com, andy.chiu@sifive.com, guoren@kernel.org,
 songshuaishuai@tinylab.org, bjorn@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060049_367457_A5E7BDB7 
X-CRM114-Status: UNSURE (   8.22  )
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

On Thu, 11 Jul 2024 19:15:08 +0800 you wrote:
> Since commit f0bddf50586d ("riscv: entry: Convert to generic entry"),
> _TIF_WORK_MASK is no longer used, so remove it.
> 
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/include/asm/thread_info.h | 4 ----
>  1 file changed, 4 deletions(-)

Here is the summary with links:
  - riscv: Remove unused _TIF_WORK_MASK
    https://git.kernel.org/riscv/c/cea9d27705d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
