Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE0CA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV2DwuSRkh2ZQ1Obt6xbjEJZWVUYF9AoYfbmUBvO2AI=; b=mDpVcO+Ct7wqzn
	NQ787jHd0SBvJQTpVXFosJEG65DLwPP7gyMAWzmMVDRSBrIFK0vrkfWLQy2gru2XDCcrOEVyqOnM+
	JWfPCpBorZRXF1lxWB3sQ5YthYtVH1GHLYLyLJvFXwQkTL3yCQ+IHGwHvVGSlWMqCvp6BpubsfBRS
	o/57tCw3b0AW8t6tkFY89Q/KnhZuQfQI1fY0pzDZi2HZlpagk7vq5Szb2VV0oUWNE/+5jD+DDwB4Z
	C4earGq4pB0t4XG1rhn3AFeafbJlg1rUvfwv7d8/cafOEnS8AkFJrT+oRsfHBq/c/6XWHNssXohqo
	4XmzX6tKJbFGSt3B/5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQqC-0000000BD2C-3i0g;
	Tue, 19 Aug 2025 18:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMLX-0000000Aay7-2520;
	Tue, 19 Aug 2025 13:25:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CEF116A3;
	Tue, 19 Aug 2025 06:25:42 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 884583F738;
	Tue, 19 Aug 2025 06:25:46 -0700 (PDT)
Message-ID: <271daf71-3c57-49a5-a65f-c58ac670864f@arm.com>
Date: Tue, 19 Aug 2025 14:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
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
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_062551_585873_0AA4631D 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13/08/2025 6:01 pm, Robin Murphy wrote:
[...]
> diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
> index 297ff5adb667..98ffab403bb4 100644
> --- a/arch/x86/events/intel/uncore.c
> +++ b/arch/x86/events/intel/uncore.c
> @@ -731,24 +731,11 @@ static int uncore_pmu_event_init(struct perf_event *event)
>   	struct hw_perf_event *hwc = &event->hw;
>   	int ret;
>   
> -	if (event->attr.type != event->pmu->type)
> -		return -ENOENT;
> -
>   	pmu = uncore_event_to_pmu(event);
>   	/* no device found for this pmu */
>   	if (!pmu->registered)
>   		return -ENOENT;
>   
> -	/* Sampling not supported yet */
> -	if (hwc->sample_period)
> -		return -EINVAL;
> -
> -	/*
> -	 * Place all uncore events for a particular physical package
> -	 * onto a single cpu
> -	 */
> -	if (event->cpu < 0)
> -		return -EINVAL;

Oopsie, I missed that this isn't just the usual boilerplate as the 
comment kind of implies, but is also necessary to prevent the 
uncore_pmu_to_box() lookup going wrong (since the core code won't reject 
a task-bound event until later). I'll put this back with an updated 
comment for v2 (and double-check everything else again...), thanks LKP!

Robin.


>   	box = uncore_pmu_to_box(pmu, event->cpu);
>   	if (!box || box->cpu < 0)
>   		return -EINVAL;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
