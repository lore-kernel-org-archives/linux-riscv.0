Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0375DCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIJ55rpZmQmBdojb39e4fdyAee8v37Cg8CkHzIy91CA=; b=CbhaAzhm7UvWOi
	ZUy/riFF33h346uOxxDFft/A0Uq6fFkNULi1xtazY9ouLC2PttRcy2ATCCL2a5Ezd0br8vV+3Ivtu
	kjCGJ0ADW7xzzcC3EmIFXbmbt/5P/N8swR7NGxSknpTzlr1UZYYPPDxzdzavw3JCsyvfLMWQJEnZi
	aRS9HODFweyN0gzLgpGRvXcVgyXokKngRhm8YQQJIbdkuu0+7/rx2jWbwEmpwXAq7Na+3bDhhvH5V
	2G6U19/wwINo52ydyaNeAEHewWMFyCQ0ojWf2Z56tUgpuQiofJfciwd51K9ckNQLlYNTHpbzqGBbm
	NZbZeEE172du6JuE6rCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2eX-00EFlS-2F;
	Wed, 18 Oct 2023 09:15:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2eU-00EFkD-1T;
	Wed, 18 Oct 2023 09:15:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC89F2F4;
	Wed, 18 Oct 2023 02:16:17 -0700 (PDT)
Received: from [10.57.81.189] (unknown [10.57.81.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6462B3F64C;
	Wed, 18 Oct 2023 02:15:32 -0700 (PDT)
Message-ID: <d2ac3963-9c91-4256-a1e3-ea5990848c1e@arm.com>
Date: Wed, 18 Oct 2023 10:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] energy_model: use a fixed reference frequency
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: dietmar.eggemann@arm.com, bristot@redhat.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, conor.dooley@microchip.com,
 rostedt@goodmis.org, juri.lelli@redhat.com, viresh.kumar@linaro.org,
 suagrfillet@gmail.com, linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
 vschneid@redhat.com, ajones@ventanamicro.com, catalin.marinas@arm.com,
 linux@armlinux.org.uk, linux-riscv@lists.infradead.org,
 pierre.gondois@arm.com, lftan@kernel.org, linux-kernel@vger.kernel.org,
 bsegall@google.com, mingo@redhat.com, rafael@kernel.org,
 linux-arm-kernel@lists.infradead.org, peterz@infradead.org,
 gregkh@linuxfoundation.org, mgorman@suse.de, will@kernel.org,
 sudeep.holla@arm.com
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-6-vincent.guittot@linaro.org>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231009103621.374412-6-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_021542_571753_677C83CF 
X-CRM114-Status: GOOD (  14.23  )
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

Hi Vincent,


On 10/9/23 11:36, Vincent Guittot wrote:
> The last item of a performance domain is not always the performance point
> that has been used to compute CPU's capacity. This can lead to different
> target frequency compared with other part of the system like schedutil and
> would result in wrong energy estimation.
> 
> A new arch_scale_freq_ref() is available to return a fixed and coherent
> frequency reference that can be used when computing the CPU's frequency
> for an level of utilization. Use this function to get this reference
> frequency.
> 
> Energy model is never used without defining arch_scale_freq_ref() but
> can be compiled. Define a default arch_scale_freq_ref() returning 0
> in such case.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   include/linux/energy_model.h | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 

LGTM, taking into account the patch 2/6 that we don't include any
boost freq (so no changes w.r.t. current EAS situation)

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
