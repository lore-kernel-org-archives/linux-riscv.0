Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE15C43219
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaRK67LltH5FIpgHQNsjSOFngXko5EeSPJwg06Arv/E=; b=pSqd6214tVEw8N
	2iGgmXb8MaSrn37Lvn2Z0lrwp1Ht/NgtBNrN8KKr4gcirnKHGCT75T8F4OvJ6e4oyfvHO7nsJVXrc
	bAVnrsKWgTMFaOcNYQm2Pzy8EoW23a2u3d2e1IlNoEbd6Ajm2rzlYpxtywxCLsT/V75C6VwFFQ+SL
	y2/HT61u20QxwHTwAgg16Z0D2dq4OQ0YwIe6am5gkCUU+nOJSry75Hg5TIAV/mNCbDkyj7eLOvcqV
	w25zrIQTRruILtWN6zEonL8dWUapgWUnbKGXTO81960AZ1zmoUj1gONeb3KCN695ON4GliFqFCAdo
	4lGM0kFOQ/JXSVbPzP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPGv-005pzM-LW; Tue, 08 Nov 2022 14:08:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPGl-005pp6-9T; Tue, 08 Nov 2022 14:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667916482; x=1699452482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xOw7QIJLsuxkX05KFxFMzYRYL4KbLRoTNIigZpHSnz8=;
  b=vMntfpU8hrSPKlYlFUHMlxiwnlA/hm6djB5ERxBcxDV1gU2ocCuSlKM2
   TE9hivElzRM9wm5IhL8dqFdKbBne8PLJduFfeR6XHvOK1heozcWak2KFv
   PH3swss88D1kFvjT1qrSFttLqoEKUsYMfe8NdOrdD2gE9ShjScFe8FIF9
   yXSGmLSD3BQOrm1jZGdG7e2ujlyKqtOkXKtunym1dblSyYJ37V8YlPbkT
   rM0d8l1qgxqDtj+nrg1Pag0r/17DUU9azp+ifomcoLxvzpNYHhbz3zIqT
   7njzP+1V703VRgnRqvnlDFQw0XBwJ+pqOwdz8XTYs9mbF7hY0lLSd46Nb
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="198904540"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 07:08:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 07:08:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 07:07:57 -0700
Date: Tue, 8 Nov 2022 14:07:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Pierre Gondois <pierre.gondois@arm.com>
CC: <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sudeep
 Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Gavin Shan <gshan@redhat.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Jani Nikula
	<jani.nikula@intel.com>, Jakub Kicinski <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH 1/5] cacheinfo: Use riscv's init_cache_level() as generic
 OF implem
Message-ID: <Y2pirStbsJOidAkz@wendy>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-2-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108110424.166896-2-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_060803_361340_42383497 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue, Nov 08, 2022 at 12:04:17PM +0100, Pierre Gondois wrote:
> Riscv's implementation of init_of_cache_level() is following

heh, "Riscv" always looks a bit odd!
Code movement looks fine, nothing surface level is broken on RISC-V.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> the Devicetree Specification v0.3 regarding caches, cf.:
> - s3.7.3 'Internal (L1) Cache Properties'
> - s3.8 'Multi-level and Shared Cache Nodes'
> 
> Allow reusing the implementation by moving it.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 39 +------------------------------
>  drivers/base/cacheinfo.c      | 44 +++++++++++++++++++++++++++++++++++
>  include/linux/cacheinfo.h     |  1 +
>  3 files changed, 46 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 90deabfe63ea..440a3df5944c 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -115,44 +115,7 @@ static void fill_cacheinfo(struct cacheinfo **this_leaf,
>  
>  int init_cache_level(unsigned int cpu)
>  {
> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> -	struct device_node *np = of_cpu_device_node_get(cpu);
> -	struct device_node *prev = NULL;
> -	int levels = 0, leaves = 0, level;
> -
> -	if (of_property_read_bool(np, "cache-size"))
> -		++leaves;
> -	if (of_property_read_bool(np, "i-cache-size"))
> -		++leaves;
> -	if (of_property_read_bool(np, "d-cache-size"))
> -		++leaves;
> -	if (leaves > 0)
> -		levels = 1;
> -
> -	prev = np;
> -	while ((np = of_find_next_cache_node(np))) {
> -		of_node_put(prev);
> -		prev = np;
> -		if (!of_device_is_compatible(np, "cache"))
> -			break;
> -		if (of_property_read_u32(np, "cache-level", &level))
> -			break;
> -		if (level <= levels)
> -			break;
> -		if (of_property_read_bool(np, "cache-size"))
> -			++leaves;
> -		if (of_property_read_bool(np, "i-cache-size"))
> -			++leaves;
> -		if (of_property_read_bool(np, "d-cache-size"))
> -			++leaves;
> -		levels = level;
> -	}
> -
> -	of_node_put(np);
> -	this_cpu_ci->num_levels = levels;
> -	this_cpu_ci->num_leaves = leaves;
> -
> -	return 0;
> +	return init_of_cache_level(cpu);
>  }
>  
>  int populate_cache_leaves(unsigned int cpu)
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 4b5cd08c5a65..a4308b48dd3e 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -224,8 +224,52 @@ static int cache_setup_of_node(unsigned int cpu)
>  
>  	return 0;
>  }
> +
> +int init_of_cache_level(unsigned int cpu)
> +{
> +	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> +	struct device_node *np = of_cpu_device_node_get(cpu);
> +	struct device_node *prev = NULL;
> +	int levels = 0, leaves = 0, level;
> +
> +	if (of_property_read_bool(np, "cache-size"))
> +		++leaves;
> +	if (of_property_read_bool(np, "i-cache-size"))
> +		++leaves;
> +	if (of_property_read_bool(np, "d-cache-size"))
> +		++leaves;
> +	if (leaves > 0)
> +		levels = 1;
> +
> +	prev = np;
> +	while ((np = of_find_next_cache_node(np))) {
> +		of_node_put(prev);
> +		prev = np;
> +		if (!of_device_is_compatible(np, "cache"))
> +			break;
> +		if (of_property_read_u32(np, "cache-level", &level))
> +			break;
> +		if (level <= levels)
> +			break;
> +		if (of_property_read_bool(np, "cache-size"))
> +			++leaves;
> +		if (of_property_read_bool(np, "i-cache-size"))
> +			++leaves;
> +		if (of_property_read_bool(np, "d-cache-size"))
> +			++leaves;
> +		levels = level;
> +	}
> +
> +	of_node_put(np);
> +	this_cpu_ci->num_levels = levels;
> +	this_cpu_ci->num_leaves = leaves;
> +
> +	return 0;
> +}
> +
>  #else
>  static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
> +int init_of_cache_level(unsigned int cpu) { return 0; }
>  #endif
>  
>  int __weak cache_setup_acpi(unsigned int cpu)
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 00b7a6ae8617..ff0328f3fbb0 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -80,6 +80,7 @@ struct cpu_cacheinfo {
>  
>  struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
>  int init_cache_level(unsigned int cpu);
> +int init_of_cache_level(unsigned int cpu);
>  int populate_cache_leaves(unsigned int cpu);
>  int cache_setup_acpi(unsigned int cpu);
>  bool last_level_cache_is_valid(unsigned int cpu);
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
