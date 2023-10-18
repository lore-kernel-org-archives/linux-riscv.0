Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA8ECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lvy9iyEagTZ/75d24lBeQzJT1e/BUOuIazmQARXBHYg=; b=opE/eyiQoLYsoo
	7aP1vpILarY5XTAcdQD7hY8RL91H3IVoSN4xnpL/1V/3H61oDy90h2+gB26PpwSHlmi7dXrfzAInl
	k5+t1T6NRoRr/7O7ZsQOn/b+KulTXQ+yXC8MXbjO4NI9/kK9SsVavlZmWSG+uqNcETLLxrA3rG0MT
	lEJ1rLcdPOOha2RXlO/rPiV8VOH8G2RJdScqUQJKhd1E6/FjnIm3LAFeWSFiu77XgprJ+N8Z9S2Yy
	tVxgQgMxJHj20sXykFTEgRm/bPKtFxkoC7asWQHtJ1P47fy3FJ3ETC41m87ohQz42rp+Xk3a+R900
	xc35zhstWPQ94VRLtwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4WI-00EWuy-1U;
	Wed, 18 Oct 2023 11:15:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4WF-00EWtg-03;
	Wed, 18 Oct 2023 11:15:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D11E2F4;
	Wed, 18 Oct 2023 04:15:58 -0700 (PDT)
Received: from [10.57.81.189] (unknown [10.57.81.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDE113F762;
	Wed, 18 Oct 2023 04:15:12 -0700 (PDT)
Message-ID: <efa322b1-136a-4755-9abe-f808d6e8f4b1@arm.com>
Date: Wed, 18 Oct 2023 12:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] cpufreq: use the fixed and coherent frequency for
 scaling capacity
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com, juri.lelli@redhat.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, rostedt@goodmis.org,
 will@kernel.org, ionela.voinescu@arm.com, pierre.gondois@arm.com,
 viresh.kumar@linaro.org, peterz@infradead.org, gregkh@linuxfoundation.org,
 bristot@redhat.com, dietmar.eggemann@arm.com, lftan@kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com,
 linux-riscv@lists.infradead.org, mgorman@suse.de, bsegall@google.com,
 vschneid@redhat.com, linux@armlinux.org.uk, sudeep.holla@arm.com,
 rafael@kernel.org
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-4-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231009103621.374412-4-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_041519_100518_ED230534 
X-CRM114-Status: GOOD (  10.36  )
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



On 10/9/23 11:36, Vincent Guittot wrote:
> cpuinfo.max_freq can change at runtime because of boost as an example. This
> implies that the value could be different from the frequency that has been
> used to compute the capacity of a CPU.
> 
> The new arch_scale_freq_ref() returns a fixed and coherent frequency
> that can be used to compute the capacity for a given frequency.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   drivers/cpufreq/cpufreq.c | 4 ++--
>   include/linux/cpufreq.h   | 9 +++++++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
