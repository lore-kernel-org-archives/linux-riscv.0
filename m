Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56120C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5hNiTgOnebNlz6KFHUdrPdQSOp7gu8TSyvfNJARcUQ=; b=3G4RIiswKv9fkq
	JKvHH509GrlbiG2sVE56mhdh9+IH0NhS7Wn8399JN+zQxL/z3DojKVzShOfKXPy8lyux+5fp5UOZA
	TigvTmugEuTLtIOXlf4NuwOJDpHTY2QdZf6WP0h6XPiMCLmHydM29w7SSbQ8Qou2tLjDUzacNQpR1
	lbz5KUmZoGadpgOTPXH060JHTMc2LrRnR2uNhjAptyRJDxsqM1VR6oRbaWsAqDKBLgTGeveFGnljI
	BjQzafAKr8dQ2IrXgw4r8ILvlKUtFNs9m9q+7HKbz61jQDkXjXd+o5DNww8Wk9XQGiFxqEoTNrQkS
	iY3vSnpOqChRc73sTaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEuX-00Dd5V-4a; Wed, 01 Jun 2022 03:20:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEuK-00Dd3U-FS
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654053627;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBZo/5acJzjtkfbN0zPOUXTmooXsDFbwGkdumr2Rppw=;
	b=hNxIDv4osCZAJw62tjxCmcRcmA0lpCdPWvW+93bKUkPUx4eu9D78rb0kuIhzNhU618o5mF
	faZcnGDmGuCq354J5BUYKitQrvgpFsRwd5Wa9zyNJsVe4iavA7FOFsJfm91+xBIbs+4N2h
	I7RVTA4ho4F7mVcgpY7xfvRboIFyA+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-TIkAbRDJPAKi2hnHaoJ0_w-1; Tue, 31 May 2022 23:20:22 -0400
X-MC-Unique: TIkAbRDJPAKi2hnHaoJ0_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82E0E811E7A;
	Wed,  1 Jun 2022 03:20:21 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB8A1731B;
	Wed,  1 Jun 2022 03:20:15 +0000 (UTC)
Subject: Re: [PATCH v3 04/16] cacheinfo: Add support to check if last level
 cache(LLC) is valid or shared
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <bf63ca22-944d-b709-242f-fd09c66ff519@redhat.com>
Date: Wed, 1 Jun 2022 11:20:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-5-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_202028_623943_32DA874D 
X-CRM114-Status: GOOD (  27.08  )
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
> It is useful to have helper to check if the given two CPUs share last level
> cache. We can do that check by comparing fw_token or by comparing the cache
> ID. Currently we check just for fw_token as the cache ID is optional.
> 
> This helper can be used to build the llc_sibling during arch specific
> topology parsing and feeding information to the sched_domains. This also
> helps to get rid of llc_id in the CPU topology as it is sort of duplicate
> information.
> 
> Also add helper to check if the llc information in cacheinfo is valid or not.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/cacheinfo.c  | 26 ++++++++++++++++++++++++++
>   include/linux/cacheinfo.h |  2 ++
>   2 files changed, 28 insertions(+)
> 

With below nits fixed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 417e1ebf5525..ed74db18468f 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -47,6 +47,32 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
>   	return sib_leaf->fw_token == this_leaf->fw_token;
>   }
>   
> +bool last_level_cache_is_valid(unsigned int cpu)
> +{
> +	struct cacheinfo *llc;
> +
> +	if (!cache_leaves(cpu))
> +		return false;
> +
> +	llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
> +
> +	return llc->fw_token;
> +}
> +

	return !!llc->fw_token;

> +bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
> +{
> +	struct cacheinfo *llc_x, *llc_y;
> +
> +	if (!last_level_cache_is_valid(cpu_x) ||
> +	    !last_level_cache_is_valid(cpu_y))
> +		return false;
> +
> +	llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
> +	llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
> +
> +	return cache_leaves_are_shared(llc_x, llc_y);
> +}
> +
>   #ifdef CONFIG_OF
>   /* OF properties to query for a given cache type */
>   struct cache_type_info {
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 4ff37cb763ae..7e429bc5c1a4 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -82,6 +82,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
>   int init_cache_level(unsigned int cpu);
>   int populate_cache_leaves(unsigned int cpu);
>   int cache_setup_acpi(unsigned int cpu);
> +bool last_level_cache_is_valid(unsigned int cpu);
> +bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
>   #ifndef CONFIG_ACPI_PPTT
>   /*
>    * acpi_find_last_cache_level is only called on ACPI enabled
> 

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
