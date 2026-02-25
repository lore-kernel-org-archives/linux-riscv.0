Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0CAFD3760
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uu+TIf+pxMTqJE8rSMJvOi5fbawLEcEIhr9+BNKBEG8=; b=yKCDLiOUExw9aH
	if012GYupiLKfPkkyAFUHIbBiYpQ09Z84jiLkWsnN11OOlmPNLG3NR/j2cxjeocsHsW5kTkx1Ef6G
	TGIy2AD6opZNLgviekHWtPjrpuB3L+qTCL6Mzc9k6adFCQev6mdsXoJzx9UfyVF30k8XWWkRTHLQN
	AwgoUjX8dhnm5B2VVMJtL495dHjjmEn08kT7kPpq/9b1d2nNYxBZiQsLE0JNUypaKjY+OIsiyqsID
	wPIKtCwM0RSohmOMpJ0lu5EKQH3OgnbPoYDPN/ibHawIyz4NkGOjjk4wGMrvbIeGYs0lamKwCdUu7
	gpcCWUgn37CpLYsrv/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGLZ-00000004EdQ-09Um;
	Wed, 25 Feb 2026 14:58:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGLW-00000004EcF-00rr;
	Wed, 25 Feb 2026 14:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E9A540126;
	Wed, 25 Feb 2026 14:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910B6C116D0;
	Wed, 25 Feb 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031516;
	bh=DKswOemgE0o8dLAbtbgTdWvG4rdX6n55NSS0972JIdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mdh6iujjSWp6SFz+JwLy4nalaRpHoytaT2mXrTErJdY8ripQ/GKKYsH1b4yAf+HN4
	 bt2suB/55pPPBWFpqHeD5Wf39lqMh8j/eCfpQ/7ZSOTdklaPGnXI+6N/ciFXt5w7l6
	 K+AkIiooofhvA2kywZtHdb++EyS59f+F8KnRSR+E2QCR71eqiPfOz0zxuodScZsQkH
	 wYrCJuQhJlMi/x81lK+QlxaMf2EwoNJ8O50o9wHLMBYStJitsqpCEgdFsRfVcbwA/O
	 5uR2Pq84gRkLCyKcI0lNk99ypfPbGi9rQ6KJc5K/xZf00J+9lmkqkfdjqbP46f6P3S
	 IsjdrQZRFnTNA==
Date: Wed, 25 Feb 2026 22:40:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZ8JwB2vJ98uab2V@xhacker>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
 <20260220123414.GF136967@e132581.arm.com>
 <aZheqINXslxlrmTt@xhacker>
 <aZhi1p0NJH5ug8CA@xhacker>
 <20260220164738.GH136967@e132581.arm.com>
 <aZj42cyIHADECszW@xhacker>
 <20260223091547.GJ136967@e132581.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223091547.GJ136967@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_065838_077054_FEFA8369 
X-CRM114-Status: GOOD (  23.26  )
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

On Mon, Feb 23, 2026 at 09:15:47AM +0000, Leo Yan wrote:
> On Sat, Feb 21, 2026 at 08:14:17AM +0800, Jisheng Zhang wrote:
> 
> [...]
> 
> > On Fri, Feb 20, 2026 at 04:47:38PM +0000, Leo Yan wrote:
> > > On Fri, Feb 20, 2026 at 09:34:14PM +0800, Jisheng Zhang wrote:
> > > 
> > > [...]
> > > 
> > > > > > Run 3 iterations, and measures three metrics (messaging/pipe/seccomp)
> > > > > > and results in seconds. Less is better.
> > > > > > 
> > > > > >   +---------------------+--------+--------+--------+--------+
> > > > > >   |Without change       |   run1 |   run2 |   run3 |    avg |
> > > > > >   +---------------------+--------+--------+--------+--------+
> > > > > >   |messaging (sec)      |  4.546 |  4.508 |  4.591 |  4.548 |
> > > > > >   |pipe (sec)           | 24.258 | 24.224 | 24.017 | 24.166 |
> > > > > >   |seccomp-notify (sec) | 48.393 | 48.457 | 48.232 | 48.361 |
> > > > > >   +---------------------+--------+--------+--------+--------+
> > > > > > 
> > > > > >   +---------------------+--------+--------+--------+--------+--------+
> > > > > >   |With change          |   run1 |   run2 |   run3 |    avg |   diff |
> > > > > >   +---------------------+--------+--------+--------+--------+--------+
> > > > > >   |messaging (sec)      |  4.493 |  4.523 |  4.556 |  4.524 | +0.52% |
> > > > > >   |pipe (sec)           | 23.159 | 23.702 | 28.649 | 25.170 | -4.15% |
> > > > > 
> > > > > If you check the result, this result variance is abnormal, it means
> > > > > your OS is noiser.
> > > > 
> > > > BTW: if you remove the abnormal run3 result, you'll find that the
> > > > benchmark is improved by ~3.5% on CA73:
> > > > (23.159 + 23.702) / 2 = 23.43
> > > > (24.258 + 24.224) / 2 = 24.24
> > > > (24.24 - 23.43)*100 / 23.43 = ~3.5
> > > 
> > > TBH, I don't think we should subjectively select data.  But I agree a
> > 
> > The precondition of this is testing the benchmark properly. And I just
> > tried perf bench sched in noisy OS, I didn't get the similar abnormal
> > variance as you got, so I think your run3 result was CA53's result.
> > This isn't an apple-to-apple comparison.
> 
> Not true.  As said, I tested on CA73.  I should say explicitly that I
> have hotplugged off CA53 CPUs and run test only on CA73 CPUs.

I tested on quad CA73 platform, I can reproduce the abnormal variance
as you got. This means the series may not alway improve performance
as I expected for *all* CPUs. So I'd like to drop it now.

> 
> > If possible, could you plz test after forcing CA53 offline or test on
> > non big.little platform. Anyway, I will test CA73 next week too.
> > 
> > > clean test env is important to avoid noise, and I also agree that the
> > > current results already show positive signals.
> > > 
> > > Thanks,
> > > Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
