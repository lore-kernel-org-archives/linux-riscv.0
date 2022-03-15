Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473AFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HUDnWcWeQT3f+2iEdLFRf522S1CUt31f5Ix50VqADk=; b=ujOGvrz/rZJL5b
	IV6dR/fLiAsjJdTK38btZyaHkFdQmwSXQzNtlLNDGLJ1rk6ZzKgV1PthumsQScEloSoUYwPz+mFeA
	F8uvyOoRzC7YOeUKJeWpow47ItBplIAR2swNKYX5n2eaT0RlZneIgdV6PooH0+LbbCfPIwuHXnnOk
	wgAFjXBxsbRnta5YgBZt/twsm7we9XW/5TivKKXYYU6/9K5MlmeDx0J6H+NAPmoSpg6HpQSpi+vKt
	QTosxPJt/A0Fiss6xqoiFjPV4JlwST/ylOgO7wgzKZFBb4EslJAgaVaYXIFtgH8jCjxdHiXc0uiU5
	VmrSPcDyVNM8EIv3u6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3Ud-008WqQ-Se; Tue, 15 Mar 2022 09:29:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3UT-008Wo9-3p; Tue, 15 Mar 2022 09:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cel52PCZmDp474IDTrptYa/K7FZfnPi1T3WBf/SpAes=; b=MdFhnzm3MmebOVnmxqzOy/huTl
 MvlZX/8Zd5y7jE3BstkmKLW31K2jBfLJeCYX6fhy8c0FOHIxFkchtdC68adaopQwzsvqUcY9CLw9x
 RFcYVbRrx0QQzLvYm/PjRAAIMPsxWs0nbMN9f8C0O3G8ki++Bqq5j2aexH9dkUa0Zon4fjHXrEQ12
 bVOv1AU0mynXo7uzLwDInXqXxuwzJSp3v4OQsHegm9d6KmSritxS6aNk1LYmBHs/iqi9C6yF8WFXb
 u5qBR9aM0k4VRhnuMZSWIyVc7/sdT9PK1yusixmT0sWL8YSi/tdQuuAdqzDWOMZqjONXKZ5HRcDCE
 Nb1T0W1w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3UN-001AjL-HG; Tue, 15 Mar 2022 09:29:11 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 256A598620D; Tue, 15 Mar 2022 10:29:11 +0100 (CET)
Date: Tue, 15 Mar 2022 10:29:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qing Wang <wangqing@vivo.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] sched: dynamic config sd_flags if described in DT
Message-ID: <20220315092911.GD8939@worktop.programming.kicks-ass.net>
References: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
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

On Tue, Mar 15, 2022 at 12:58:54AM -0700, Qing Wang wrote:
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1527,6 +1527,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  	struct sched_domain *sd = *per_cpu_ptr(sdd->sd, cpu);
>  	int sd_id, sd_weight, sd_flags = 0;
>  	struct cpumask *sd_span;
> +	int ret;
>  
>  #ifdef CONFIG_NUMA
>  	/*
> @@ -1539,6 +1540,15 @@ sd_init(struct sched_domain_topology_level *tl,
>  
>  	if (tl->sd_flags)
>  		sd_flags = (*tl->sd_flags)();
> +
> +#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
> +	ret = cpus_share_self_cache(cpu_map);
> +	if (ret == 1)
> +		sd_flags |= SD_SHARE_PKG_RESOURCES;
> +	else if (ret == 0)
> +		sd_flags &= ~SD_SHARE_PKG_RESOURCES;
> +#endif
> +
>  	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
>  			"wrong sd_flags in topology description\n"))
>  		sd_flags &= TOPOLOGY_SD_FLAGS;

Still NAK, you don't have to touch generic code for any of this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
