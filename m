Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02661C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlcP0CoWcocvZBRiLHGR9k3USWq1flwWOk/uTjZ2r/k=; b=tcg3SuPGq09onO
	VfSbn9gb76SUI5/hd8PCHnPCr6AByZD60pCJkpZlfm/Qzu1z/KfYKg+ouADRkmcCKTpT6tzyAZbZh
	IqHbNLSnpJbMMv9ESBfkxMIdfessZnWWmKhBnEbUaZ21gOKWIMeW3F1MjgkXLhgbLXAAY64YT8dwI
	ZblL7t00bD0JAz2pJwMfvg2y/PAdlotfdo0ttWf3R51Tl96ub3I1S6GJlJd9d5g5NUdOKLgBYZZpD
	jxR0IKS+6nL/r1qgxj+o7Fygzy4tdaubwllNECb1oA1ZB3T78yFipyaIvHgQnHerTYHrjWruRyWy3
	BF3KWxWUFn+WEna7jxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFAN-00Dfwg-J7; Wed, 01 Jun 2022 03:37:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFAK-00Dfvc-GW
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054619;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diXfH14fQbDhfoWdKmQOqCsBx1nPcLvkXuJMvjSWG+c=;
	b=YvgaD52sW97OLWeE6PahkyMK9EmEYtyIHl9rICzac5WTQGV0PabvTSHDjtQWefOL0gXBUb
	t0CeeL8T3JDZK2AfEGe1crgbnpTksuokDikw/L5YgkVooiWRFZJlYCbkSOBpEiTXEFO7YW
	VQqFjhh/R3z2wpqH5jvFGK7yP0gnHfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Zr9aHkJcNhGBXJ_V-BDaRA-1; Tue, 31 May 2022 23:36:55 -0400
X-MC-Unique: Zr9aHkJcNhGBXJ_V-BDaRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BDDB1C08989;
	Wed,  1 Jun 2022 03:36:55 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBD61410F36;
	Wed,  1 Jun 2022 03:36:49 +0000 (UTC)
Subject: Re: [PATCH v3 10/16] arch_topology: Set thread sibling cpumask only
 within the cluster
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <20220525081416.3306043-9-sudeep.holla@arm.com>
 <20220525081416.3306043-10-sudeep.holla@arm.com>
 <20220525081416.3306043-11-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <1a35c21c-25cf-46ef-6400-152db421de52@redhat.com>
Date: Wed, 1 Jun 2022 11:36:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-11-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203700_654057_063B969E 
X-CRM114-Status: GOOD (  24.04  )
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
Reply-To: Gavin Shan <gshan@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/25/22 4:14 PM, Sudeep Holla wrote:
> Currently the cluster identifier is not set on the DT based platforms.
> The reset or default value is -1 for all the CPUs. Once we assign the
> cluster identifier values correctly that imay result in getting the thread
> siblings wrongs as the core identifiers can be same for 2 different CPUs
> belonging to 2 different cluster.
> 
> So, in order to get the thread sibling cpumasks correct, we need to
> update them only if the cores they belong are in the same cluster within
> the socket. Let us skip updation of the thread sibling cpumaks if the
> cluster identifier doesn't match.
> 
> This change won't affect even if the cluster identifiers are not set
> currently but will avoid any breakage once we set the same correctly.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 76c702c217c5..59dc2c80c439 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -703,15 +703,17 @@ void update_siblings_masks(unsigned int cpuid)
>   		if (cpuid_topo->package_id != cpu_topo->package_id)
>   			continue;
>   
> -		if (cpuid_topo->cluster_id == cpu_topo->cluster_id &&
> -		    cpuid_topo->cluster_id != -1) {
> +		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> +		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
> +
> +		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
> +			continue;
> +
> +		if (cpuid_topo->cluster_id != -1) {
>   			cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
>   			cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
>   		}
>   
> -		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> -		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
> -
>   		if (cpuid_topo->core_id != cpu_topo->core_id)
>   			continue;
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
