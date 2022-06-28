Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A14C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1qFIWzIv5kSwo/AFcBhdHn/0DSzq8QKMOdZNxDASB8=; b=nP2EJ3wn+G4psd
	pbT24Sf7vHHs4NLlMMFtJzgNqr390AdWaOXq19L2a4GTTIr/L2W93PasG1AWAcQEI4QQkxeM6qsR7
	BkxHKqn/qLlZDFq0B3UpQqg672jC2+cl/dK6ONAqm61ZFsypKV+WuweTanXC+7z40r7pERr2av3wG
	TI/2zIqO+QyvU1s0010ZYnEjw6Qgv3SK+ho84BL3TtzVLqzAE5XlmfwDIc7l/ImRbmcDpIfWXV5qi
	Ru5Pq9vmMPxdgTPG18u6pWDccIyVYjFMvPOJIJThhMobwg3Ah95KPgDNMJxkYvJYpBvaLqDsk5RE4
	cI74dlGdQ1UK2Expo+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o68SO-005hCn-Ox; Tue, 28 Jun 2022 10:28:32 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o68SD-005h9I-EV
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 10:28:23 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id q132so21401876ybg.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tr8hNJ5eGXGi4MzVwC12AfLwt6PrO5SxdG32nN7sPTs=;
        b=DGI2+bQiZLRn7rOb21b70S3FwW5tLVuBbW1gU/KvN5VsrzkyQRAJKYRqO+5v/wyKLv
         SMPsnPa5AS5TofF80RGOdathylRq17vYNqTSKeFqG/wpo9IxO7Ra6A3OXIRf8WTAXFXG
         kfcJoq0WNCTSw+gHySXvUnAOGBybi9F/QGTDXbDI3nOKbJK9R11vuUDsYHmyGnpnbZ6s
         7kv4vHsU7Ll9Aa7Xrk0nVtCTeVYc01+UH9PCt0Fm6En6jMiI/DevzD2JHyytHDdSnTka
         CT6F7659sEP10CEDPUiAe3fzfVFjegKShwTBtgYlstEGfd4pZ73Ak11hOSc4zS7HBsUf
         DNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tr8hNJ5eGXGi4MzVwC12AfLwt6PrO5SxdG32nN7sPTs=;
        b=etDhw1ngDIFx3Uo9C+usEnqSUHHMNMS1hudtVJ5nZeESSscVvaTURnl171OMHmLoAN
         rtqQVYReMzOB3Z0z8ReXaf1oFJQ/nrQJp6poDV//m5bF+KYLRs+kRhJqowJM97MEintB
         sYGmVQiu2RTM6uXVKV8r1lLlsqWt5L3UzRMai1WWh5vUHEuliXTQiSsm85njKSOBa3tl
         7MTChxojAWM1W96hzrxqewDcaKeZgnbUIkzKVpZjKD0gSg0BsyUJ8CfBZIlj+hIK43QK
         FM04SSkPT36+LMW9X/G4nqOO5UCxHWaLJ4SDp9eZFJFm/5wWw31vwudMc06vDkY8nkMe
         mh/w==
X-Gm-Message-State: AJIora9M5RTAURrTOmjmhrUDbx6PJmsA0vrxlOe8ApWZB7al78XkG1Gz
	JigwrBn4Dfz/6LQVSTQPVEWJ92sGHebkCeJBmevxPQ==
X-Google-Smtp-Source: AGRyM1tyhQmIiBjffMOtzfYHHShHgpDSi1VYIPKvp76WScOPCV1jQFvsODs545vwIDZGE+tg+nLGwWDvjgZ0IJ4tq0o=
X-Received: by 2002:a25:e695:0:b0:66c:faea:ca55 with SMTP id
 d143-20020a25e695000000b0066cfaeaca55mr7128367ybh.300.1656412098004; Tue, 28
 Jun 2022 03:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220627165047.336669-1-sudeep.holla@arm.com> <20220627165047.336669-17-sudeep.holla@arm.com>
In-Reply-To: <20220627165047.336669-17-sudeep.holla@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 28 Jun 2022 12:28:05 +0200
Message-ID: <CAKfTPtAxNKV=L0DHuBGmBiUww5tDhyAiw-6N3cun11iQLALYHA@mail.gmail.com>
Subject: Re: [PATCH v5 16/19] arch_topology: Limit span of cpu_clustergroup_mask()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Darren Hart <darren@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_032821_524965_02DA19CB 
X-CRM114-Status: GOOD (  24.53  )
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

On Mon, 27 Jun 2022 at 18:51, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> From: Ionela Voinescu <ionela.voinescu@arm.com>
>
> Currently the cluster identifier is not set on DT based platforms.
> The reset or default value is -1 for all the CPUs. Once we assign the
> cluster identifier values correctly, the cluster_sibling mask will be
> populated and returned by cpu_clustergroup_mask() to contribute in the
> creation of the CLS scheduling domain level, if SCHED_CLUSTER is
> enabled.
>
> To avoid topologies that will result in questionable or incorrect
> scheduling domains, impose restrictions regarding the span of clusters,
> as presented to scheduling domains building code: cluster_sibling should
> not span more or the same CPUs as cpu_coregroup_mask().
>
> This is needed in order to obtain a strict separation between the MC and
> CLS levels, and maintain the same domains for existing platforms in
> the presence of CONFIG_SCHED_CLUSTER, where the new cluster information
> is redundant and irrelevant for the scheduler.
>
> While previously the scheduling domain builder code would have removed MC
> as redundant and kept CLS if SCHED_CLUSTER was enabled and the
> cpu_coregroup_mask() and cpu_clustergroup_mask() spanned the same CPUs,
> now CLS will be removed and MC kept.
>
> Link: https://lore.kernel.org/r/20220621192034.3332546-18-sudeep.holla@arm.com
> Cc: Darren Hart <darren@os.amperecomputing.com>
> Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 46fa1b70b02b..277b65cf3306 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -686,6 +686,14 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
>
>  const struct cpumask *cpu_clustergroup_mask(int cpu)
>  {
> +       /*
> +        * Forbid cpu_clustergroup_mask() to span more or the same CPUs as
> +        * cpu_coregroup_mask().
> +        */
> +       if (cpumask_subset(cpu_coregroup_mask(cpu),
> +                          &cpu_topology[cpu].cluster_sibling))
> +               return get_cpu_mask(cpu);

AFAICT, this will change the Altra scheduling topology which will now
have a MC level instead of the CLS but it's probably not a problem as
the flags are the same for now

Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

> +
>         return &cpu_topology[cpu].cluster_sibling;
>  }
>
> --
> 2.36.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
