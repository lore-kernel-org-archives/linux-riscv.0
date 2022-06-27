Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F2BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kSN65adtiyjZwvDUIQzZodQH8vDoEwE8nm4GM1FuCY=; b=b8Tl0ZfByJVqOn
	FcP16Oe1mqCk562jQgMrFWDo1bBByK3Pl5kn3PEh6EZMly/MInahsOogpAlkhOmKzHjSQ7eqH0sqF
	qddiiZmWj9IrrP4Vhsl/wpQJagzZTEh98HblnasjnNLtaAhCxbubs6pVxWn0KS8PQci0P1mUqlARb
	IfgFK2NnsETt0aMs8x7S4hZFYzeoaVJd3yrVNpeqNuKFFlvDCTSzoIdipMcy7ZxbPWfD59SSyOV2f
	D7EExcTEemeIVCKw4WU8FhF2Wd3thBR4cz7wPA8pxXu6cOkG+iDckq5a8JoYr9ZNorPRQ2mjx+jfo
	+Hj/gbEPsBvwaA0R+/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p26-001CvN-2c; Mon, 27 Jun 2022 13:44:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p1s-001CqI-Fa; Mon, 27 Jun 2022 13:43:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17BF6175A;
	Mon, 27 Jun 2022 06:43:50 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD093F5A1;
	Mon, 27 Jun 2022 06:43:49 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:43:47 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 15/20] arch_topology: Don't set cluster identifier as
 physical package identifier
Message-ID: <Yrm0E3mFHvJ5Nkgt@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-16-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-16-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_064352_607024_A04D49B5 
X-CRM114-Status: GOOD (  21.48  )
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

On Tuesday 21 Jun 2022 at 20:20:29 (+0100), Sudeep Holla wrote:
> Currently as we parse the CPU topology from /cpu-map node from the
> device tree, we assign generated cluster count as the physical package
> identifier for each CPU which is wrong.
> 
> The device tree bindings for CPU topology supports sockets to infer
> the socket or physical package identifier for a given CPU. Since it is
> fairly new and not support on most of the old and existing systems, we
                     ^^^^^^^
Nit:		     supported
> can assume all such systems have single socket/physical package.
> 
> Fix the physical package identifier to 0 by removing the assignment of
> cluster identifier to the same.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>

Thanks,
Ionela.

> ---
>  drivers/base/arch_topology.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 7a569aefe313..46fa1b70b02b 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -549,7 +549,6 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
>  	bool leaf = true;
>  	bool has_cores = false;
>  	struct device_node *c;
> -	static int package_id __initdata;
>  	int core_id = 0;
>  	int i, ret;
>  
> @@ -588,7 +587,7 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
>  			}
>  
>  			if (leaf) {
> -				ret = parse_core(c, package_id, core_id++);
> +				ret = parse_core(c, 0, core_id++);
>  			} else {
>  				pr_err("%pOF: Non-leaf cluster with core %s\n",
>  				       cluster, name);
> @@ -605,9 +604,6 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
>  	if (leaf && !has_cores)
>  		pr_warn("%pOF: empty cluster\n", cluster);
>  
> -	if (leaf)
> -		package_id++;
> -
>  	return 0;
>  }
>  
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
