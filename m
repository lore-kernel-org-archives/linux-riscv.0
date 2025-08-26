Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD93CA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKHlaCdQfM1NKqdKC34JnK9yINCBbKJhMJsQ6ChW6bY=; b=hF8BX+6D9CLhMI
	6v9jcWu8kxzN2zJe6eiXgwKONjmD20Q5eVaAPLQK43z9KwyiFmFsVTfli2tJm1GBcAMwcpd7OjGKU
	Wx2pq4zlVvrfSF2ifBIFKq/fT4hUMZHlHPyycRwtP333lqAmroryLHoVOhmHe0KudJmB16Ig5HdHj
	wCK2qTj6YoG11hfxBT42lWOKpY4buUcKh8aFIXP2+WzzVpVDZGT5jmocli3KpBdH8rqfdhAPm4H1l
	MbcDbIgCYakzJIaAAFfnlgXPkURQz0KbrlUs7xVSUkjEOWkzsUAJSErEXTA5Y8bYzN7aU9y4Fe8iQ
	KRU6QU42oFy6ltMnEIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtgD-0000000C5h0-1YiK;
	Tue, 26 Aug 2025 13:25:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPF-0000000C2bD-237g;
	Tue, 26 Aug 2025 13:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1anwaqC6FtBZhv/AdRsioHe6z7ff2/NtObpshRSmtXo=; b=tTA/3PiAJQSpvqwn9JBse0zv8x
	XpRRlvytBaU8d04FPgmaRAhvvZSqAROIZ/4ezjLoE6WsNdrr9/VlG41rEHCWsnk6JH8UsrGv5T5LT
	zWsAXDZBYt6RN2vrodVyAq1DmmcYAol3ljF/QPWtrzgIrZdA+eDohdH+O3MOT2cIfR3SAL6oZFxxT
	a0buqH4Cjn32e+/T6hw9u+ioPisD3zaMrQKEyQ6W0w6+Ct9SXam4tKJBvFWH9AMfHquCJRKF+Zp4I
	PdyzFVdx3HFHpHhkOPtwcc+TPPHK59R640Wqk+YmnwDvNpXZJgmWLR1JQJ9jnUMah3B3H6sSqGhBU
	hjKnAxuQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPC-00000002GIP-3rVi;
	Tue, 26 Aug 2025 13:08:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DB2A63002C5; Tue, 26 Aug 2025 15:08:06 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:08:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
Message-ID: <20250826130806.GY4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
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

On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
> Sampling is inherently a feature for CPU PMUs, given that the thing
> to be sampled is a CPU context. These days, we have many more
> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
> assume sampling support by default and force the ever-growing majority
> of drivers to opt out of it (or erroneously fail to). Instead, let's
> introduce a positive opt-in capability that's more obvious and easier to
> maintain.
> 

> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 4d439c24c901..bf2cfbeabba2 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -294,7 +294,7 @@ struct perf_event_pmu_context;
>  /**
>   * pmu::capabilities flags
>   */
> -#define PERF_PMU_CAP_NO_INTERRUPT	0x0001
> +#define PERF_PMU_CAP_SAMPLING		0x0001
>  #define PERF_PMU_CAP_NO_NMI		0x0002
>  #define PERF_PMU_CAP_AUX_NO_SG		0x0004
>  #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>  #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
>  #define PERF_PMU_CAP_AUX_PAUSE		0x0200
>  #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
> +#define PERF_PMU_CAP_NO_INTERRUPT	0x0800

So NO_INTERRUPT was supposed to be the negative of your new SAMPLING
(and I agree with your reasoning).

What I'm confused/curious about is why we retain NO_INTERRUPT?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
