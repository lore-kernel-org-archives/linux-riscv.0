Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCE0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 02:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/VBbx7uLgmuXBwROEUGmqvxCFfT4b8LR9q1BR9raGA=; b=T0vAbaKZ0qjDSj
	PFwvwDR+3ecMy7Iu8TyQFXhqwMNyxA+iAiWGHkPz905SwYCxkO9zIXZrr4x9MnQrDYy1MXGu48IjM
	CLhPP85Hlan5HlMZ0W3saB0n0rkCDh2wvnsUKfJJswdfO0IMzx/6sPC5amJPg6LY2eSw3sqBZP6QT
	8woth7+74eZE8znVBzWvI5zFdMm9MDtzmZUR+dYYEf/zrL7Sge80KgQvKN2qLHeTJ1t5blojK+HFs
	JwTMLQbBEUFXXfhvr5eOlfdweTZRXu1UWSXYts0NNMwDAPksvj5VkLSIfndVF65Uifk7eQV3geqhI
	SA0t7iIS6CXbuXQkrCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEMI-00DTz5-LB; Wed, 01 Jun 2022 02:45:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEMF-00DTxw-TG
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 02:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654051513;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEUTBuWVkrETXE9QRFuZ4bP6hQm8hLmCEidMv+jxERM=;
	b=C0heZlbOv7FKAQlxZ21Vk/bCMblQ4xC5lTqv5f+3iilzBWUPGm3XviftxBEL3e7M9UMPFp
	N99FAGkG1cc7DCTdIiWpu/Xg9LwQUdapoGDwh1iacdt0Jehx0+bmUlNGXgKFg3FJLYmI8p
	f/3GiyRWKFYJ+sqnrsiJJAwfI1wPRBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-yHCAUUJzO--fSDe1x9l4pQ-1; Tue, 31 May 2022 22:44:31 -0400
X-MC-Unique: yHCAUUJzO--fSDe1x9l4pQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A9D9833976;
	Wed,  1 Jun 2022 02:44:31 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 701128288A;
	Wed,  1 Jun 2022 02:44:23 +0000 (UTC)
Subject: Re: [PATCH v3 02/16] cacheinfo: Add helper to access any cache index
 for a given CPU
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9a70f2b2-e45c-b125-1c14-d5a06097be58@redhat.com>
Date: Wed, 1 Jun 2022 10:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-3-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_194516_069556_B5C397EA 
X-CRM114-Status: GOOD (  26.34  )
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
> The cacheinfo for a given CPU at a given index is used at quite a few
> places by fetching the base point for index 0 using the helper
> per_cpu_cacheinfo(cpu) and offseting it by the required index.
> 
> Instead, add another helper to fetch the required pointer directly and
> use it to simplify and improve readability.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/cacheinfo.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 

s/offseting/offsetting

It looks good to me with below nits fixed:

Reviewed-by: Gavin Shan <gshan@redhat.com>


> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index b0bde272e2ae..c4547d8ac6f3 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -25,6 +25,8 @@ static DEFINE_PER_CPU(struct cpu_cacheinfo, ci_cpu_cacheinfo);
>   #define ci_cacheinfo(cpu)	(&per_cpu(ci_cpu_cacheinfo, cpu))
>   #define cache_leaves(cpu)	(ci_cacheinfo(cpu)->num_leaves)
>   #define per_cpu_cacheinfo(cpu)	(ci_cacheinfo(cpu)->info_list)
> +#define per_cpu_cacheinfo_idx(cpu, idx)		\
> +				(per_cpu_cacheinfo(cpu) + (idx))
>   
>   struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
>   {
> @@ -172,7 +174,7 @@ static int cache_setup_of_node(unsigned int cpu)
>   	}
>   
>   	while (index < cache_leaves(cpu)) {
> -		this_leaf = this_cpu_ci->info_list + index;
> +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
>   		if (this_leaf->level != 1)
>   			np = of_find_next_cache_node(np);
>   		else
> @@ -231,7 +233,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
>   	for (index = 0; index < cache_leaves(cpu); index++) {
>   		unsigned int i;
>   
> -		this_leaf = this_cpu_ci->info_list + index;
> +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
>   		/* skip if shared_cpu_map is already populated */
>   		if (!cpumask_empty(&this_leaf->shared_cpu_map))
>   			continue;
> @@ -242,7 +244,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
>   
>   			if (i == cpu || !sib_cpu_ci->info_list)
>   				continue;/* skip if itself or no cacheinfo */
> -			sib_leaf = sib_cpu_ci->info_list + index;
> +			sib_leaf = per_cpu_cacheinfo_idx(i, index);
>   			if (cache_leaves_are_shared(this_leaf, sib_leaf)) {
>   				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
>   				cpumask_set_cpu(i, &this_leaf->shared_cpu_map);
> @@ -258,12 +260,11 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
>   
>   static void cache_shared_cpu_map_remove(unsigned int cpu)
>   {
> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	struct cacheinfo *this_leaf, *sib_leaf;
>   	unsigned int sibling, index;
>   
>   	for (index = 0; index < cache_leaves(cpu); index++) {
> -		this_leaf = this_cpu_ci->info_list + index;
> +		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
>   		for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
>   			struct cpu_cacheinfo *sib_cpu_ci;
> 

In cache_shared_cpu_map_remove(), the newly introduced macro
can be applied when the sibling CPU's cache info is fetched.

     sib_leaf = sib_cpu_ci->info_list + index;

     to

     sib_leaf = per_cpu_cacheinfo_idx(sibling, index);

   
> @@ -609,7 +610,6 @@ static int cache_add_dev(unsigned int cpu)
>   	int rc;
>   	struct device *ci_dev, *parent;
>   	struct cacheinfo *this_leaf;
> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	const struct attribute_group **cache_groups;
>   
>   	rc = cpu_cache_sysfs_init(cpu);
> @@ -618,7 +618,7 @@ static int cache_add_dev(unsigned int cpu)
>   
>   	parent = per_cpu_cache_dev(cpu);
>   	for (i = 0; i < cache_leaves(cpu); i++) {
> -		this_leaf = this_cpu_ci->info_list + i;
> +		this_leaf = per_cpu_cacheinfo_idx(cpu, i);
>   		if (this_leaf->disable_sysfs)
>   			continue;
>   		if (this_leaf->type == CACHE_TYPE_NOCACHE)
> 

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
