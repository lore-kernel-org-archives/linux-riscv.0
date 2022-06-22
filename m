Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0999C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DxNYHWdz75tW88pmwzbY+/cjN3byd3gjEPafrz3nR8=; b=js7g8PyYQ22zU+
	dhnjNJ8YDw85v38JaaL4jtT/upni7QjoTICBwhbOtftTPSo8chCQfc60OJoT10mVgo+IzDSCxLEhB
	PStcEMNECQLisLwJGBfB/WR/a0o1ju8edazOITsxjSE1kaoLGObE0BIGjd5AOPTo5XgMW2RapoyCo
	Zy/gb8QU58OGRYD7qMhSaMOVQPJhOcYq0gcKj+9PEpgnykaqsz4XkCTXgGdOgy6LsZ9U0rfRh43ES
	FE73G9X5PGaxhtkDH9LZDFjIpAEQNTukBxKz7ciSL79G5dB/0RC/XhRvfH4M9bKMEYVW+E6zqoNe6
	4oIfZ1ouSh1pOtk1lp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41wN-00B76a-OA; Wed, 22 Jun 2022 15:06:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41wA-00B72g-Of; Wed, 22 Jun 2022 15:06:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68EAD12FC;
	Wed, 22 Jun 2022 08:06:31 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67D83F792;
	Wed, 22 Jun 2022 08:06:30 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:06:29 +0100
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
Subject: Re: [PATCH v4 20/20] arch_topology: Warn that topology for nested
 clusters is not supported
Message-ID: <YrMv9eqUrsYS6oO0@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-21-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-21-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_080634_887080_BFCB5F7F 
X-CRM114-Status: GOOD (  18.84  )
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

Hi,

I just noticed this in a quick test.

On Tuesday 21 Jun 2022 at 20:20:34 (+0100), Sudeep Holla wrote:
> We don't support the topology for clusters of CPU clusters while the
> DT and ACPI bindings theoritcally support the same. Just warn about the
> same so that it is clear to the users of arch_topology that the nested
> clusters are not yet supported.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index ed1cb64a95aa..1c5fa7bbbd00 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -567,6 +567,8 @@ static int __init parse_cluster(struct device_node *cluster, int package_id,
>  		if (c) {
>  			leaf = false;
>  			ret = parse_cluster(c, package_id, i, depth + 1);
> +			if (depth > 1)
> +				pr_warn("Topology for clusters of clusters not yet supported\n");

I think the check should be for (depth > 0) or (depth >= 1).

We end up having depth = 2 when we have

cluster 0 {
	//depth is 0
	cluster 0 {
		//depth is 1
		cluster0 {
			//depth is 2
...

I suppose we should warn about nested clusters from depth 1, right?

Thanks,
Ionela.

>  			of_node_put(c);
>  			if (ret != 0)
>  				return ret;
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
