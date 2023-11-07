Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87518C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLHLoDC7NJB7E4dM5M6iTfqQYgESCCFMKGX1NNW8rs8=; b=bXSG9KcTyVlLc1
	EzxVnnTVMvGBqmvDqQ3AdUX9v4TLmhGp7oEG+onmFbtCutfGQYBlrMZb0lmjxq5pbr+PWfxLRvIuR
	X4jjD0I+1K3Zal7VpHAcgeQbLKJNnZtntbKSjCWMLsGicXZD1eZCT9BS/FIYFgWCATqGV9T2za1im
	bum/eLNRaEtTyHmhvka0fT+j3s3DjYfflfppNM0s10B8p88cDvickN5ajbuJGbV2KvcSx2mKC/LYt
	9OJxOss5S5g79kVqKB2LL+2j7s4Fn27QhZ/l89mCKrvEcw+DCyfFtR36RYtgEKqfH3scxdhNwq3Qx
	7y5249XXkrOoyo8Be3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KY0-001Ma5-2N;
	Tue, 07 Nov 2023 11:47:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KXx-001MYP-0g;
	Tue, 07 Nov 2023 11:47:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08FE613D5;
	Tue,  7 Nov 2023 03:47:45 -0800 (PST)
Received: from bogus (unknown [10.57.82.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B8933F6C4;
	Tue,  7 Nov 2023 03:46:54 -0800 (PST)
Date: Tue, 7 Nov 2023 11:45:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, beata.michalska@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v5 1/7] topology: Add a new arch_scale_freq_reference
Message-ID: <20231107114521.GD954129@bogus>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
 <20231104105907.1365392-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231104105907.1365392-2-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_034705_319147_BADF7650 
X-CRM114-Status: GOOD (  12.41  )
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

On Sat, Nov 04, 2023 at 11:59:01AM +0100, Vincent Guittot wrote:
> Create a new method to get a unique and fixed max frequency. Currently
> cpuinfo.max_freq or the highest (or last) state of performance domain are
> used as the max frequency when computing the frequency for a level of
> utilization but:
> - cpuinfo_max_freq can change at runtime. boost is one example of
>   such change.
> - cpuinfo.max_freq and last item of the PD can be different leading to
>   different results between cpufreq and energy model.
> 
> We need to save the reference frequency that has been used when computing
> the CPUs capacity and use this fixed and coherent value to convert between
> frequency and CPU's capacity.
> 
> In fact, we already save the frequency that has been used when computing
> the capacity of each CPU. We extend the precision to save kHz instead of
> MHz currently and we modify the type to be aligned with other variables
> used when converting frequency to capacity and the other way.
> 

For all the topology related changes here and patch 6/7 and 7/7:

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
