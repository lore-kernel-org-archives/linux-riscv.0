Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42710C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GszfaxfKcQu4Iri44D8htrJoC3WisL7k/iWZ8j2aZpk=; b=iPgVap2JwJSiuo
	X4g5ItgZdnvKyFqJj+eIaKzNK63gKD4brE4jDLdXYXs+xg3TvdsZIDjU80xpZO9KJgoUwQA5hoU4x
	EiKPuNfQORrk9Lxsc2EJ5Zmo/Rpvh2qjAIrNMmXF84tINYZhNXEZ79wYtioujba9v3HCztdTiZbnO
	DAQEcHgypNJ9XgeQeJ37oYHgSmvrrHcgUEo47cklEbaDH4kLpiIT/sBWprOKX929j4HV49ggtsAwj
	h9/Wtr5leSmAYN3eOT/aHaDCjDwVRt8QXzAwTiLcAE9Pjnji6h4+WtG4oghNY4Wea0t9NP73tXDGw
	69d3bU3igMtl1UJNcxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaVr-00HSFW-8n; Fri, 25 Nov 2022 15:21:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaTf-00HQpA-HW; Fri, 25 Nov 2022 15:18:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F5142B;
	Fri, 25 Nov 2022 07:18:59 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48CE23F587;
	Fri, 25 Nov 2022 07:18:50 -0800 (PST)
Date: Fri, 25 Nov 2022 15:18:47 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Ionela.Voinescu@arm.com,
	Rob.Herring@arm.com, Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>, Peter Chen <peter.chen@kernel.org>,
	SeongJae Park <sj@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ACPI: PPTT: Update acpi_find_last_cache_level()
 to acpi_get_cache_info()
Message-ID: <20221125151847.ortklu4ptaftua6u@bogus>
References: <20221121171217.3581004-1-pierre.gondois@arm.com>
 <20221121171217.3581004-5-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121171217.3581004-5-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_071855_673037_3A776041 
X-CRM114-Status: GOOD (  22.97  )
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

On Mon, Nov 21, 2022 at 06:12:12PM +0100, Pierre Gondois wrote:
> acpi_find_last_cache_level() allows to find the last level of cache
> for a given CPU. The function is only called on arm64 ACPI based
> platforms to check for cache information that would be missing in
> the CLIDR_EL1 register.
> To allow populating (struct cpu_cacheinfo).num_leaves by only parsing
> a PPTT, update acpi_find_last_cache_level() to get the 'split_levels',
> i.e. the number of cache levels being split in data/instruction
> caches.
> 
> It is assumed that there will not be data/instruction caches above a
> unified cache.
> If a split level consist of one data cache and no instruction cache
> (or opposite), then the missing cache will still be populated
> by default with minimal cache information, and maximal cpumask
> (all non-existing caches have the same fw_token).
> 
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>  arch/arm64/kernel/cacheinfo.c |  9 +++--
>  drivers/acpi/pptt.c           | 76 +++++++++++++++++++++++------------
>  include/linux/cacheinfo.h     |  8 ++--
>  3 files changed, 61 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index 97c42be71338..164255651d64 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -46,7 +46,7 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
>  int init_cache_level(unsigned int cpu)
>  {
>  	unsigned int ctype, level, leaves;
> -	int fw_level;
> +	int fw_level, ret;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  
>  	for (level = 1, leaves = 0; level <= MAX_CACHE_LEVEL; level++) {
> @@ -61,8 +61,11 @@ int init_cache_level(unsigned int cpu)
>  
>  	if (acpi_disabled)
>  		fw_level = of_find_last_cache_level(cpu);
> -	else
> -		fw_level = acpi_find_last_cache_level(cpu);
> +	else {

You need to add braces to if as well in such cases. I think checkpatch
might tell you that. Just found this by chance.

Anyways, this looks good to me.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>


-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
