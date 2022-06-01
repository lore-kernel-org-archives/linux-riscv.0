Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24ECC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7E5XyezVfexQB8tthtKRg9ai0+TuXTqb/6sXSMcgfM=; b=Grjn6GeWAobRu5
	dk1oRXfv/jPr7oITAgEkk987xiVaK3U5AR/K5bi80WFBRFlz0F4jR2iaR8P06hqC2hxfiQpbbMpdQ
	oWFBTClZWpgFkmwvcvpJsXkYO952OpTl+GbJxPmEx8Khm2Tju9aAk6VRN03JQ9CgLOPXhSP7aWsqT
	vOhrkglODZySm+13EhWqmvcmVeA2x9x/UfarRDF81Kqk1P9iP5ByGa1m+DeKraRjCvx2utuOKURfN
	kWEN2MWfu2Z77VSq9PCG4C+WCTqyTW6WOgqFNRRhuyRvtqIcHMieLDPu8IgPDSAhrOyDHe4E3ax6f
	yX7kui+YQsv7pFxL6gpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFCD-00DgLi-Je; Wed, 01 Jun 2022 03:38:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFCB-00DgK8-1b
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054733;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdJmymFf2YAiMmnGWERaLkVy5zEh8JzP2qaAQeVYdW8=;
	b=KaRIps2S5/rAHz4y94Nib3qdQvH/nHIsvBAKj9IodO0MZpw5SCuw5DnxRxCAR+V/1PrjZU
	QecK9nAlB12o5HDmWr0YnGQp0j9NkZ4V0fo1S0mbQPkBS+z/Q8/GaeLT6ueJnWiGPnnlqD
	PIh3O911PHmVh5yBc/v9yV+/xjZd17k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-q6fYUvoyNNaHwJnVxqBdUg-1; Tue, 31 May 2022 23:38:42 -0400
X-MC-Unique: q6fYUvoyNNaHwJnVxqBdUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A293803D5B;
	Wed,  1 Jun 2022 03:38:42 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C8140CF8ED;
	Wed,  1 Jun 2022 03:38:36 +0000 (UTC)
Subject: Re: [PATCH v3 11/16] arch_topology: Check for non-negative value
 rather than -1 for IDs validity
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
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
 <20220525081416.3306043-12-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <59764f2b-60c8-3f0c-8159-3103f606494c@redhat.com>
Date: Wed, 1 Jun 2022 11:38:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-12-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203855_209980_E1189538 
X-CRM114-Status: GOOD (  21.07  )
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
> Instead of just comparing the cpu topology IDs with -1 to check their
> validity, improve that by checking for a valid non-negative value.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 59dc2c80c439..f73a5e669e42 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -637,7 +637,7 @@ static int __init parse_dt_topology(void)
>   	 * only mark cores described in the DT as possible.
>   	 */
>   	for_each_possible_cpu(cpu)
> -		if (cpu_topology[cpu].package_id == -1)
> +		if (cpu_topology[cpu].package_id < 0)
>   			ret = -EINVAL;
>   
>   out_map:
> @@ -709,7 +709,7 @@ void update_siblings_masks(unsigned int cpuid)
>   		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
>   			continue;
>   
> -		if (cpuid_topo->cluster_id != -1) {
> +		if (cpuid_topo->cluster_id >= 0) {
>   			cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
>   			cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
>   		}
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
