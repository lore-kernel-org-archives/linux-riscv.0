Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C01C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 23:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk90ZYijP72o3sNzTePKIizfjHgPrCScOtwFEP4bhws=; b=vQ+EKx319ZhCtj
	CCqdPbIsvN/SN5yi5YhD0vQeA4IOcf07NHflp1C02mS9ycBtMht/R5/AVOOSl869Cbtvsj+jAs0Aq
	Xkq2z5+AR4/+7z5zo/zlOH7D0vOAVAXVBbl9PY5ZdXJak3i/tLi9cRkAcxSqGkGqnr43yHyA9VyMy
	qeBdj61CLJ8eSy1hYF3zV2nlFEzNeWrQko6FzQa4KK26i4yYWGVJAVla+TNWcjV3atVGodb3n/lGj
	EH57bfp68RfzvnGlfSxrhwL/IzmhGLymPPsa7xfXjYMpjHJKfGKtp0QrXlDTbPRsF9Vr3w6fCN5tZ
	YezVq+uBZnVJrEugzuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7mCo-005ufe-WE; Tue, 20 Dec 2022 23:39:31 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7mCa-005uYB-52; Tue, 20 Dec 2022 23:39:18 +0000
Received: by mail-ot1-f43.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so5027267otk.8;
        Tue, 20 Dec 2022 15:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XlyL4eZgxl2gJRdFFgKM+VBWZmuzkyYGsqXR6u61R0=;
        b=sfIb+LrTz6nC/oAsMvn8HdR1ITbkACayHvo4YJc0wWXeC0NvpV/2kdgyGIoKy8Y6ol
         BgZkVRd+8sFwfoPpo9ErtCv35e519Y4QclElLMouI1T/4rSgPNExN/+4C0KsUwNQHJ7x
         VA+9HQYWC3/Ng47/vI43aJKCwTPHRMZJT6rx7+nlUJM4AaE/FAgILJzPBtbpJmCdHliA
         gpbEMB4q3RLeIeHVe2SKf3qh0kfqPv4ycLXOzWzivwMncvYiYH/lpUxeunTYKEEO4QLp
         Mb1pxUwEpSDh0Ap+jNPaRATbwHS0+maUmFt7rH+Fj2xDDO6PgZT85juyvQ2E1xZt0zgH
         sUCg==
X-Gm-Message-State: ANoB5pl/1fdkJqCJyIkcRqqR2oGd+B8gD3zOCBEdFPejdkxGFUSCJG0H
	jHKEdM84tk1OM0i5rdv56g==
X-Google-Smtp-Source: AA0mqf76HhtVIRBeJvzpUAhwT9Xm/qY66R7iSPT7ARjb2LU3Qded5XZ+7SyPF0eEzj0tLE9RivBBUA==
X-Received: by 2002:a05:6830:2782:b0:661:dfeb:ea5a with SMTP id x2-20020a056830278200b00661dfebea5amr26041265otu.25.1671579553857;
        Tue, 20 Dec 2022 15:39:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t26-20020a05683022fa00b00661ad8741b4sm6299549otc.24.2022.12.20.15.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 15:39:13 -0800 (PST)
Received: (nullmailer pid 1289304 invoked by uid 1000);
	Tue, 20 Dec 2022 23:39:12 -0000
Date: Tue, 20 Dec 2022 17:39:12 -0600
From: Rob Herring <robh@kernel.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, palmer@rivosinc.com, Ionela.Voinescu@arm.com, Conor Dooley <conor.dooley@microchip.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 1/5] cacheinfo: Use RISC-V's init_cache_level() as
 generic OF implementation
Message-ID: <20221220233912.GA1193943-robh@kernel.org>
References: <20221209103130.572196-1-pierre.gondois@arm.com>
 <20221209103130.572196-2-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221209103130.572196-2-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_153916_236921_4D82E42F 
X-CRM114-Status: GOOD (  18.12  )
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

On Fri, Dec 09, 2022 at 11:31:23AM +0100, Pierre Gondois wrote:
> RISC-V's implementation of init_of_cache_level() is following
> the Devicetree Specification v0.3 regarding caches, cf.:
> - s3.7.3 'Internal (L1) Cache Properties'
> - s3.8 'Multi-level and Shared Cache Nodes'
> 
> Allow reusing the implementation by moving it.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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

Not in this patch, but in patch 5, shouldn't riscv init_cache_level() be 
removed? The topology code already called init_of_cache_level() and 
RiscV has nothing architectural to add/change. IOW, init_cache_level() 
should only do architecture defined init, and not anything DT or ACPI 
related (unless those are non-standard).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
