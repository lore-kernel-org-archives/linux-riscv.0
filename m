Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1269C55ABE
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIQ662o4068DcJb+zA465IDg5zDWK0rWDoF+kyp6vNg=; b=LBC0i82NmJC+AV
	8MUvd/VkiUEYYXVWqVxfTE70NLtfhdP8DMrGpng09tHM7zaZJSK4p5D1DaunmlNu3NYl7prw7FXsW
	V6lN8XlpKRHFUuDTx4Ry69i5MBzefofgOkW9+Q9W4uTag9qgXhv+Y0jpqUEntxSLl9iE9pBaw9DlW
	8IVNJPtbIFWLCOhLq7bEXzKe7YGW5vUVCeLhVaLkrantLM46hUfcbXP2czLiO6UNT9Jn2OPS2DbY6
	a6T+K7/jrz6EccH390u5VS7Ak4ZivR0XN/MKruMouSKbSDA1UIfVwDwp+hR6eAEtev+EuQBoRL0Ag
	p0o1ivwegWQFe947K/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPiA-0000000EUGf-0cvQ;
	Fri, 20 Feb 2026 12:34:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPi6-0000000EUFf-3Yyy;
	Fri, 20 Feb 2026 12:34:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65805339;
	Fri, 20 Feb 2026 04:34:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B0F3F62B;
	Fri, 20 Feb 2026 04:34:16 -0800 (PST)
Date: Fri, 20 Feb 2026 12:34:14 +0000
From: Leo Yan <leo.yan@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
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
Message-ID: <20260220123414.GF136967@e132581.arm.com>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220090922.1506-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_043418_930086_DEACF7B8 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Jisheng,

On Fri, Feb 20, 2026 at 05:09:22PM +0800, Jisheng Zhang wrote:
> Currently, on arm64 platforms, the handle_arch_irq is a pointer which
> is set during booting, and every irq processing needs to access it,
> so it sits in hot code path. We can use the runtime constant mechanism
> which was introduced by Linus to speed up its accessing.
> 
> Tested on Quad CA55 platform, the perf sched benchmark is improved
> by ~6.5%

6.5% is a quite high margin, especially for only one pointer's change.
Maybe it is good to share more info for which compiler you are using,
how you tested and the detailed results.

I played a bit on my juno board on CA73 cores with the command:

  perf bench sched all

Run 3 iterations, and measures three metrics (messaging/pipe/seccomp)
and results in seconds. Less is better.

  +---------------------+--------+--------+--------+--------+
  |Without change       |   run1 |   run2 |   run3 |    avg |
  +---------------------+--------+--------+--------+--------+
  |messaging (sec)      |  4.546 |  4.508 |  4.591 |  4.548 |
  |pipe (sec)           | 24.258 | 24.224 | 24.017 | 24.166 |
  |seccomp-notify (sec) | 48.393 | 48.457 | 48.232 | 48.361 |
  +---------------------+--------+--------+--------+--------+

  +---------------------+--------+--------+--------+--------+--------+
  |With change          |   run1 |   run2 |   run3 |    avg |   diff |
  +---------------------+--------+--------+--------+--------+--------+
  |messaging (sec)      |  4.493 |  4.523 |  4.556 |  4.524 | +0.52% |
  |pipe (sec)           | 23.159 | 23.702 | 28.649 | 25.170 | -4.15% |
  |seccomp-notify (sec) | 46.848 | 46.938 | 46.973 | 46.920 | +2.98% |
  +---------------------+--------+--------+--------+--------+--------+

With this patch, the messaging test shows a minor improvement (0.52%).

The pipe test performs worse (-4.15%) after applying the patch. However,
one positive signal is that the minimum latency is 23.159, which is
lower than without the change (24.017).

For seccomp, the results indicate a benefit (2.98%) from the change.

Hope this is helpful for maintainers to judge the change.

I'd leave maintainers to review the code.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
