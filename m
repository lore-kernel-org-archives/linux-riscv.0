Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2C3C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 23:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/UDqPoC+hcp2Zd83xrEIYHW1RTyLjqfVvjsv0lGlsU=; b=yVNolQCKgR63b1
	4dm4LZCqy+gOi5wEcETamwcb26JZVjdi2Stog4ruX0P4rgYPTCk8f2dcg/IB3mLeqKRgMOHpf7n4h
	RypHUNM4ykDelsx5kKpKpwqN1hvZFwATJialZfLNC7ySXwABZGBOAnstcogUIvitsTT4G1XwZOwi7
	ewdcGo0X8Pamp4a+rK/83VqUSZ9EGLHaJi5i5DSQjz4ggH1edjzbUmQ9hkAAAbtPCA3ZbASqUiygo
	/C+0pXXo7b68p3C5EaIDF48MeKSJluzz7mR6hqw2sZl63nf0Y3Kh+wuXVrspaMm3gy3HPRJOoi0lM
	Hw+x5S423xgG0GtZ462w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMxAU-0000000EMMZ-2Ina;
	Wed, 04 Jun 2025 23:05:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMx6z-0000000EM5R-2qDF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 23:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AEA75C66BA;
	Wed,  4 Jun 2025 22:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C89C4CEE4;
	Wed,  4 Jun 2025 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749078092;
	bh=+fSMmduX2kJsgH1ngkDSXnk2QMMNes2I6KBi7bEtLjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WaQ6qvmH5ojYoIvtWNLC9bJK1w5sdN9M62gfDUTHx9/galg3N9ycakJCbhxd6SwLC
	 6YbYOyfk3ck3hkJ3RYcg0tQc4ngUc4aWtajlj4IhItRSjvkDV7tpXvSQYsNsuRhzxh
	 Gk0f6eeMqjpZXeG1a83qy7ytfPIRxm11nhMz5ZBg=
Date: Wed, 4 Jun 2025 16:01:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 1/3] lib/math/gcd: Use static key to select
 implementation at runtime
Message-Id: <20250604160131.d00e8a3a2230a00f3818a3a1@linux-foundation.org>
In-Reply-To: <20250524155519.1142570-2-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
	<20250524155519.1142570-2-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_160133_759641_03A501B9 
X-CRM114-Status: GOOD (  12.81  )
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

On Sat, 24 May 2025 23:55:17 +0800 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On platforms like RISC-V, the compiler may generate hardware FFS
> instructions even if the underlying CPU does not actually support them.
> Currently, the GCD implementation is chosen at compile time based on
> CONFIG_CPU_NO_EFFICIENT_FFS, which can result in suboptimal behavior on
> such systems.
> 
> Introduce a static key, efficient_ffs_key, to enable runtime selection
> between the binary GCD (using ffs) and the odd-even GCD implementation.
> This allows the kernel to default to the faster binary GCD when FFS is
> efficient, while retaining the ability to fall back when needed.
> 
> ...
>
> @@ -54,6 +58,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
>  	if (!a || !b)
>  		return r;

Both binary_gcd() and gcd() perform the above.  Seems unnecessary?


I can merge this series if the riscv team are OK with it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
