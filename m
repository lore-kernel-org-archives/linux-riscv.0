Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E85C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Rh57hPuGnqcdctO8NBN8hiYmN+ZyHgQXZSJP0npKPs=; b=spGfLaqnBj+zci
	MnCnVCOpXBeXbTTyQRzwHvhbtlnT6znLLZoD95YLKI5Jc6L9zW7LnnrnYcqqpA4J8QKK2hlFh75Vy
	xwN588NyOHuvh7DJW+eCpq+tLuCeD4mBMjubK7c1X2HRdFtynI5KNXa/XwCLCVQ0ejjJqltZKFkC3
	fZE/Ku66euTQGu3HL3keo6Hm2p9dZakhTzs5XtFyh+jYxsH/FJXv8h6yl9J2eUR75SXyYQqEIo+t0
	xZoiF+0JE+5W2+Ly/vkbYaV2NSMF0G0b87sMCFeUNsh88YZgU0kKNxv9Xc8008FIkoJ9cQLKifYoM
	iPpsb9rDcHaxi3O1q7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF5g-00Dez3-PI; Wed, 01 Jun 2022 03:32:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF5e-00Dey0-ON
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054329;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFnZIZTCkehypn5WjpiRH1ndutxaCmXxpws7LN8oRps=;
	b=a9SJeosiQC3Iq5/5H5htHNajjpDIeTpLyavNVVTyCi3PrGt+bkTJxYAr/fJNbtBFiOK9xK
	5aT9E3iy/PFFrGruPvMW202pqcOJ/yWgu+7GRIb9Itof1etqDWmeMRF3UEEI4+Ep35jLAz
	uC2hxtVNC5LpN1gRM8VqkMEdV4TNkco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-OCLPGme_PkSjycFeBZ5Y3w-1; Tue, 31 May 2022 23:32:00 -0400
X-MC-Unique: OCLPGme_PkSjycFeBZ5Y3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3D5880029D;
	Wed,  1 Jun 2022 03:31:59 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 202C940E80E1;
	Wed,  1 Jun 2022 03:31:53 +0000 (UTC)
Subject: Re: [PATCH v3 07/16] arch_topology: Use the last level cache
 information from the cacheinfo
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <7e77071b-ba1f-20f4-91b8-aa0b95e92967@redhat.com>
Date: Wed, 1 Jun 2022 11:31:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-8-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203210_914043_C9D4B78D 
X-CRM114-Status: GOOD (  22.75  )
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
> The cacheinfo is now initialised early along with the CPU topology
> initialisation. Instead of relying on the LLC ID information parsed
> separately only with ACPI PPTT elsewhere, migrate to use the similar
> information from the cacheinfo.
> 
> This is generic for both DT and ACPI systems. The ACPI LLC ID information
> parsed separately can now be removed from arch specific code.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 765723448b10..4c486e4e6f2f 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -663,7 +663,8 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
>   		/* not numa in package, lets use the package siblings */
>   		core_mask = &cpu_topology[cpu].core_sibling;
>   	}
> -	if (cpu_topology[cpu].llc_id != -1) {
> +
> +	if (last_level_cache_is_valid(cpu)) {
>   		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
>   			core_mask = &cpu_topology[cpu].llc_sibling;
>   	}
> @@ -694,7 +695,7 @@ void update_siblings_masks(unsigned int cpuid)
>   	for_each_online_cpu(cpu) {
>   		cpu_topo = &cpu_topology[cpu];
>   
> -		if (cpu_topo->llc_id != -1 && cpuid_topo->llc_id == cpu_topo->llc_id) {
> +		if (last_level_cache_is_shared(cpu, cpuid)) {
>   			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
>   			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
>   		}
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
