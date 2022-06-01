Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE80C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 02:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtKRwpzr2SZfeQ8JqJuwUrHvdQdjPrOgu0EyZ5HaoEY=; b=gdLNvKqmEz/ByB
	uhfykCOgNv9LLUj2M0KnA9l7ySGAslER/xjL1o3ovwc7Kze0OCX7ZahnylKuINzavGBP/geAgd18U
	taYh8Jx/u7EU2faxeEHYoqr2bNpoqrryb1+F1cKRYwhUqo4+OxE7kweNZxtsVGmUP+Yw1RIZ+2sam
	Y/YpTT1odA6iOpEU8yHuaGf/dcoBaQDTEXQckSsRtaSa08p5xNk0/4VPppONl43oBH4PeQcHn4hHV
	IdIsq2mjVGSv+f3DSo9nZl2j588Jx/2NfJPmNv6h370DQrqnrtHVfKqlytP2bZpBLNGNJZm/m1kJk
	YUbqYcgoZfMqAmIml2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwESv-00DXKO-7j; Wed, 01 Jun 2022 02:52:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwESl-00DXGU-I7
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 02:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654051918;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZz1I+wyn0aWj3S3QoNUnvvCym824eLN41CHiYsQFi0=;
	b=Yrg+FQTyf7HPVLWi7Sxp+/Bw1aP5SdHOEFNThN6OUjoXwqVMvWQRDcp7poTqQkClqfeTnA
	xuRPp/YarOxC8PYidq3vjmSPRNecBByTGuRZe6xEGFeDDEcdOUpwp/tGTxIspe4wk78q85
	h1EOelY3Hu8mlTImcgyiO/limBWbtyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-oR2SFYhPMnq0oHhTpTxB8w-1; Tue, 31 May 2022 22:51:50 -0400
X-MC-Unique: oR2SFYhPMnq0oHhTpTxB8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ADC9858EED;
	Wed,  1 Jun 2022 02:51:50 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A5D7492C3B;
	Wed,  1 Jun 2022 02:51:44 +0000 (UTC)
Subject: Re: [PATCH v3 03/16] cacheinfo: Move cache_leaves_are_shared out of
 CONFIG_OF
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <81bc47a8-ded7-be55-60c2-73bd1d363fd2@redhat.com>
Date: Wed, 1 Jun 2022 10:51:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-4-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_195159_701545_0500D51D 
X-CRM114-Status: GOOD (  26.68  )
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

Hi Sudeep,

On 5/25/22 4:14 PM, Sudeep Holla wrote:
> cache_leaves_are_shared is already used even with ACPI and PPTT. It checks
> if the cache leaves are the shared based on fw_token pointer. However it is
> defined conditionally only if CONFIG_OF is enabled which is wrong.
> 
> Move the function cache_leaves_are_shared out of CONFIG_OF and keep it
> generic. It also handles the case where both OF and ACPI is not defined.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/cacheinfo.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 

With below nits fixed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index c4547d8ac6f3..417e1ebf5525 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -33,13 +33,21 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
>   	return ci_cacheinfo(cpu);
>   }
>   
> -#ifdef CONFIG_OF
>   static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
>   					   struct cacheinfo *sib_leaf)
>   {
> +	/*
> +	 * For non DT/ACPI systems, assume unique level 1 caches,
> +	 * system-wide shared caches for all other levels. This will be used
> +	 * only if arch specific code has not populated shared_cpu_map
> +	 */
> +	if (!IS_ENABLED(CONFIG_OF) && !(IS_ENABLED(CONFIG_ACPI)))
> +		return !(this_leaf->level == 1);
> +
>   	return sib_leaf->fw_token == this_leaf->fw_token;
>   }
>   

	if (!IS_ENABLED(CONFIG_OF) && !IS_ENABLED(CONFIG_ACPI))

         or

	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))

> +#ifdef CONFIG_OF
>   /* OF properties to query for a given cache type */
>   struct cache_type_info {
>   	const char *size_prop;
> @@ -193,16 +201,6 @@ static int cache_setup_of_node(unsigned int cpu)
>   }
>   #else
>   static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
> -static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
> -					   struct cacheinfo *sib_leaf)
> -{
> -	/*
> -	 * For non-DT/ACPI systems, assume unique level 1 caches, system-wide
> -	 * shared caches for all other levels. This will be used only if
> -	 * arch specific code has not populated shared_cpu_map
> -	 */
> -	return !(this_leaf->level == 1);
> -}
>   #endif
>   
>   int __weak cache_setup_acpi(unsigned int cpu)
> 

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
