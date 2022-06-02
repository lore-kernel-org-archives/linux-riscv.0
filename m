Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826A6C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCI1D2dvA0nua/qu+FhXBOOfbipYvXizO96Z6rM6bUk=; b=QgMhGZbRsBCC5z
	DNI4xjp9eiE50iKzOWc74TZOxQCBtTL7Zl2hnOrgIztL6mRehB9Yc5GcMFXXWCtJ+hz8ouKdiTALs
	EBpn/h/kPfLzpSVkxP73r76cBcaiuIkwUkEzkyO8imrDFa3nPvJyPmvZKIB/hNOoh1M3f7zLynC60
	9o/IlA4s2KSPcGvUt+qlbT0Ge0xHz16xl09J1Gmp8TIKeiIehcnInkSV6ButonZp69iJG2k9mGcDW
	BsHeRkRVia18S+gAZbAuoqLryTwkTVqzwzhxb/N7o57uD1CCpRA5ktIXyMMue01BCt+U6KKtbkMV8
	r8y7nrozdkRJ9oabpPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweXW-001nAC-L8; Thu, 02 Jun 2022 06:42:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweXJ-001n5N-Vb
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 06:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654152143;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvZ5OMbEcwo0Xa7CqN8M7maUXV2iBoekFoadMgX1RCs=;
	b=KKj3fAAUMGjqIFqAvCnPHT8DCTULF0wg0k0jeiVa36/rUO/huJQxgUiJcM845cCEF1zwP9
	hmW+yLOVfkbPcPN7Do+UkQtbiXW9wPMc7ucNwu0DzgFWkEyKHfDDrEeNP69sBpJMuA2frP
	1iXRU+6UkQP4Tw3Rkpk1cGJ2O7D9QCI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-J5AQOQPmNeCLDk1obVMTng-1; Thu, 02 Jun 2022 02:42:18 -0400
X-MC-Unique: J5AQOQPmNeCLDk1obVMTng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A61AA8032E5;
	Thu,  2 Jun 2022 06:42:17 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 293D8492C3B;
	Thu,  2 Jun 2022 06:42:11 +0000 (UTC)
Subject: Re: [PATCH v3 08/16] arm64: topology: Remove redundant setting of
 llc_id in CPU topology
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <444a1540-cf3d-7144-4ebc-d6f4587272a5@redhat.com>
Date: Thu, 2 Jun 2022 14:42:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-9-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_234226_157283_E91B0040 
X-CRM114-Status: GOOD (  20.48  )
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
> Since the cacheinfo LLC information is used directly in arch_topology,
> there is no need to parse and fetch the LLC ID information only for
> ACPI systems.
> 
> Just drop the redundant parsing and setting of llc_id in CPU topology
> from ACPI PPTT.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   arch/arm64/kernel/topology.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 9ab78ad826e2..869ffc4d4484 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -89,8 +89,6 @@ int __init parse_acpi_topology(void)
>   		return 0;
>   
>   	for_each_possible_cpu(cpu) {
> -		int i, cache_id;
> -
>   		topology_id = find_acpi_cpu_topology(cpu, 0);
>   		if (topology_id < 0)
>   			return topology_id;
> @@ -107,18 +105,6 @@ int __init parse_acpi_topology(void)
>   		cpu_topology[cpu].cluster_id = topology_id;
>   		topology_id = find_acpi_cpu_topology_package(cpu);
>   		cpu_topology[cpu].package_id = topology_id;
> -
> -		i = acpi_find_last_cache_level(cpu);
> -
> -		if (i > 0) {
> -			/*
> -			 * this is the only part of cpu_topology that has
> -			 * a direct relationship with the cache topology
> -			 */
> -			cache_id = find_acpi_cpu_cache_topology(cpu, i);
> -			if (cache_id > 0)
> -				cpu_topology[cpu].llc_id = cache_id;
> -		}
>   	}
>   
>   	return 0;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
