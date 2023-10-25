Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FAC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF0QW2i9ZCD3BxsI3IkVRvWXDyrro630Tl2p0FpqKVo=; b=BPljH80kHjbIPU
	07fM2xBIYDe9Xxcf6A4BRccLg6biBj0/+xEGBi/agmxj8Ed7Ce+M97qO/4iEaXZgXTvKe/vjLb5KG
	BrHGLb0iVJ5OCJA4JluAHywneoILT6eSCZ7Hqx8THV5im0EjrrDCQYgdVRmM49geORv32JSzJA0s6
	IZxHyNSj6c9MNy/fpEdALo52NsO93DVkoQQZZgb8xVU+AB4LQVJ0y3sDG2Aqikgby7vPIiFfCsEhO
	jcND5PspJszD1NiAjasbahCs3E1NAQ3BWEmlskJHM2SHtbpj5mKhqnKpW9q70WDyvSdTCL7SHhlcW
	KXKwCCtRhMGaBk7nnHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcwe-00CIPj-1u;
	Wed, 25 Oct 2023 12:25:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcwU-00CIMr-2K;
	Wed, 25 Oct 2023 12:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0wTA7EeJs4xuSZ97h4c5/blM/USRCJ+BXefRyNT99tw=; b=ShRhgn2DXJdLX76dHr3VQxbSf7
	mFxcr6xwaq+vkA2qJ4ZUZnL34a7vY3YFzTpoz0fjdHWrObng8cbuM+O6oN1SpgVXPubDF9GaOE49X
	ABcOYCAjzW+xa+GAnD4i1QBOoEVgG3bT/mi8v77iD4ogtuJqnsU7lfxshcuGn8AtnFOigkavn5W5P
	RRBbGph+s7u2GyOCHWa83RKz5Lm3Zh57K+wv7EYdRDgLNs071NJ0iVIuGgS/+3EslY2YkS41axKjG
	aD7sA+2ZylxLeimfBn1ZyIhazlnggrizRxKMmfLjf39GjwmD2xZrBeX8WMlpuYVfmekSUJD83BqIA
	X6gtUFZw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qvcwR-008ibE-In; Wed, 25 Oct 2023 12:24:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3C8AE30047C; Wed, 25 Oct 2023 14:24:55 +0200 (CEST)
Date: Wed, 25 Oct 2023 14:24:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v3 5/6] cpufreq/cppc: set the frequency used for
 computing the capacity
Message-ID: <20231025122455.GE31201@noisy.programming.kicks-ass.net>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-6-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018162540.667646-6-vincent.guittot@linaro.org>
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

On Wed, Oct 18, 2023 at 06:25:39PM +0200, Vincent Guittot wrote:
> Save the frequency associated to the performance that has been used when
> initializing the capacity of CPUs.
> Also, cppc cpufreq driver can register an artificial energy model. In such
> case, it needs the frequency for this compute capacity.
> We moved and renamed cppc_perf_to_khz and cppc_perf_to_khz to use them

perf_to_khz and khz_to_perf presumably :-)

> outside cppc_cpufreq in topology_init_cpu_capacity_cppc().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
