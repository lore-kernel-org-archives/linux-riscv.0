Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73601C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9Y+3/iSCBNA8kLUD900Og8k2B+mdqTQOw3lv6bSKCE=; b=FXMO/o4Vy6vmJ/
	Npf5+rR8SLd1UG5fZ4Sb9UKelijQEhVZYS9m2TPqFwxgCnq4AbeHBbZbZCn7OeTqhhZ75ADqEIgZ+
	bq19xbNPHq4q1cFnoFvAThnW5xcsxGRUdfaUjYFBGFVZ7f12R/0iH1EFQ1uxY88u4d7LN4MVs49Kt
	QM91MwIWBBkacuBgUSAqbFLqe4bO204nKKISJQ6wUZ3VcGXP/WflLsD9AKugta8UIPbgYMNTtT5oY
	OOYqrRwT+TifVpPvQa2dIXveI/pT+Uw6V29OJbrnw+Fp5ZrukLzTuYC4dSf/8qfxiHNBs7CbKf6L3
	7X4jmM8i9UTP34e1ifig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DLs-004juC-AJ; Mon, 05 Dec 2022 15:25:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DLk-004jqq-G5
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 15:25:48 +0000
Received: by mail-ej1-x62b.google.com with SMTP id t17so3318086eju.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1z97OrGTU/hJWYAfqZfW/MI++6sXrfXzrMwpvG8EePg=;
        b=dCM178E8Suk100QO/ms7b3XLKbOF+8tZvEEe9/zk+YQFvI3lnSe87JvStybbKAIfub
         awqCa8ezZ4Uu3oKML0aHEtQOrVWM0NOjSyxTARAgBYK/FwVOxscrIDZb0vo9C0F1vhTv
         CVlVKF5k1rIiSR4jcc1yHO9lBRBOEi2eHTk67Em7XOp7ByTQwljVXxY+ojE4+ei+ajt8
         TEkAfU/7OsPg0uqxbXrxu8GBaSxhxorn+jHdkq93jedGn6DJ+7fXOLXWI5Q/4PjAoldP
         831OfGZiiaXYkhnPAWplr8SxMrNd9DsxE7ZD4/4GiOHVOhoemq1Qq6Zm+ib+IqnFJXjX
         Ns7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z97OrGTU/hJWYAfqZfW/MI++6sXrfXzrMwpvG8EePg=;
        b=FT6xielz4EeD8DlWy4XR75I4bUI92Jujk3yZRNG9geS4zox/aJcitDCcCMvTDa+nAS
         Lv9xpwUHgzS8HR+LxeUTvet5IaNeRcFYF26tk70WUHjoG9s/jRw9qeCMyEWnD8rHk5KO
         I1FTVkssjC47/A4v3O2BVaBJ9vBmtE1xfmKUcFoOhpNoj71C7uyByTDoQqWwQzjLsOhC
         PhBz/SmoEXZztfU1NEIyUfBWbSpo0s32FLxcbPgd0Kyj/2WASo6oQjAETqZi68EXpbNX
         G59eASw5lD0hwGaDDiwQqBFb5dhfMnDmEIGPejeWn3MkqOAPYe9T0jk8dKNRNsaWBBw9
         Z/Jg==
X-Gm-Message-State: ANoB5pnLUGMk9B69LqOVsGMW+dghdp9PBL4vtHuNsh9Zu1J312emdCe7
	a/ZuDEw+M7wn1z3Z9zG3cPS2Iw==
X-Google-Smtp-Source: AA0mqf6QxKwgJA2/+pD4o+mt3tAj8MLTz+WBlne9oWrdNVyr9G8GnF6kna89ihFcFCFx1zccpM/vew==
X-Received: by 2002:a17:906:94e:b0:7ba:4617:3f17 with SMTP id j14-20020a170906094e00b007ba46173f17mr47839324ejd.226.1670253942928;
        Mon, 05 Dec 2022 07:25:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id ca13-20020a170906a3cd00b007c08439161dsm6338597ejb.50.2022.12.05.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:25:42 -0800 (PST)
Date: Mon, 5 Dec 2022 16:25:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/13] riscv: module: move find_section to module.h
Message-ID: <20221205152541.5ahiqvlb7lt6np7w@kamzik>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-9-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204174632.3677-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_072544_592755_B1534270 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, Dec 05, 2022 at 01:46:27AM +0800, Jisheng Zhang wrote:
> Move it to the header so that the implementation can be shared
> by the alternatives code.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/module.h | 15 +++++++++++++++
>  arch/riscv/kernel/module.c      | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 76aa96a9fc08..78722a79fc59 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -111,4 +111,19 @@ static inline struct plt_entry *get_plt_entry(unsigned long val,
>  
>  #endif /* CONFIG_MODULE_SECTIONS */

Should probably add an explicit #include <linux/elf.h>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  
> +static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> +					   const Elf_Shdr *sechdrs,
> +					   const char *name)
> +{
> +	const Elf_Shdr *s, *se;
> +	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
> +
> +	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
> +		if (strcmp(name, secstrs + s->sh_name) == 0)
> +			return s;
> +	}
> +
> +	return NULL;
> +}
> +
>  #endif /* _ASM_RISCV_MODULE_H */
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 91fe16bfaa07..76f4b9c2ec5b 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -429,21 +429,6 @@ void *module_alloc(unsigned long size)
>  }
>  #endif
>  
> -static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> -				    const Elf_Shdr *sechdrs,
> -				    const char *name)
> -{
> -	const Elf_Shdr *s, *se;
> -	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
> -
> -	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
> -		if (strcmp(name, secstrs + s->sh_name) == 0)
> -			return s;
> -	}
> -
> -	return NULL;
> -}
> -
>  int module_finalize(const Elf_Ehdr *hdr,
>  		    const Elf_Shdr *sechdrs,
>  		    struct module *me)
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
