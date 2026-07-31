Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498C1C54F54
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d2pM6KHREh8OIgVLQgegdQXthAvcFOvxnO+FyXLTGg=; b=ilL046WJWN4+xY
	oj2N2+NNOVl9tkBg8Otwe7Nu5R6OFpXYOjFSKXqTLonO0KHmrjUdpFNql40Leco9wEX3BjuhQ+4wl
	NYURXhct+FzZCrTj/CPixeoZr2hrrXzp73mlh5VXLGu/l2HxSbymQZSWX1jUxtjQDK7IGPShJo+IY
	X7CMHhT7gmJy1cn9VgEZI5lEXtzYC/5vAGW4JV92gz8GRYdsDaIlZZ7jsgrwIy8bKQ7uUIeTAKrn3
	HXLbHwsPrbaptRvjXjzuTxjllqj9k01NP8Oi62X8rmJcxfItx7xcdHDc5Qhowye5SfKuDxsFyGv3w
	ZDrVqRedq0G7yTXeRjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqCh-0000000D9Nm-2r8v;
	Fri, 31 Jul 2026 16:35:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqCh-0000000D9NH-0oJM
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 16:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DA0C42B31;
	Fri, 31 Jul 2026 16:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC961F00AC4;
	Fri, 31 Jul 2026 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515722;
	bh=NkJZ/CLZCqrrJVmZ4sECvr3Rls1mh0jRbdD02aNgAP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A75PPhhwpQaQO1MR4bQFB86B67cl9Du8EZ1Xs2WEtHdMutTxU+0Lc50ZJPBJqzw8J
	 1UNF48HNreF5AtlLk/4BY0KIAPGB4Q0zm5g2iHoqX0QrFZQqzHTN8m7CL6MQTKpw+h
	 G2/16erPLT5/yeSSFD+aDiheTZvg2gZIrAifgi8pM231HlNWC+QenXEzwKWTGAfiCM
	 NGIjdrRlK1NbnBcdgcSJKzUr49awU4W5kMfP9O49zRTq8HwZKhgvYwzb7WfHD95w9h
	 15ExuDiPNnl+iHo31rYuk7pd188fMU9OmC+Iix0kisOzgVKAMbQ0GGU1ApyghRH/S4
	 //0iVOsWCP1nw==
Date: Fri, 31 Jul 2026 17:35:16 +0100
From: Will Deacon <will@kernel.org>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] drivers/perf: riscv: handle legacy fallback in event
 check
Message-ID: <amzOxPgM2v6O9XqD@google.com>
References: <20260710100837.1362558-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710100837.1362558-1-geomatsi@gmail.com>
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

On Fri, Jul 10, 2026 at 01:08:35PM +0300, Sergey Matyukevich wrote:
> Common events PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS
> can fall back to the legacy counters. So do not mark them as invalid
> if OpenSBI reports that they are not mapped to sampling counters
> in PMU DT node.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dfc886dee5ad..8f7aa71dc96f 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -335,7 +335,8 @@ static int pmu_sbi_check_event_info(void)
>  		goto free_mem;
>  	}
>  
> -	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +	/* skip check for cycles and instructions as they can fall back to legacy counters */
> +	for (i = 2; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
>  		if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
>  			pmu_hw_event_map[i].event_idx = -ENOENT;
>  	}

I'm assuming the riscv tree are handling perf patches to the riscv driver,
but please shout if not.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
