Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B30C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOhSziZVQsgwMr/4Pm8poqBCfPoX9XsIkJNV9HfjtLU=; b=DTx17yDiNHiq/1
	1GxuaVZeEzMaZIP3JwQ/uAiTFF00UPo+L0b9KN85itcUEUnoKej/FmJPnFgE0dZJPWpx0Gfs/lNYJ
	Ou589wG6lvE9ZtfuyRm8mwar3RFNYV7oWfZEhu78i/4gJ+yefRvpfds5dXb2PD2eOgNL80dIilmgu
	zzoA4XMLq3S+2z7rfynna8LOToIiMDLmxD08Sfngs8V5ZtcPzvWSUQP2+hyO/f+m6jxbPh+9FmE0j
	JSdwUg3q7KzP3FY7/xB5FxlVPLM9YC7CGjubt+CaABVfmaVc2BA61NYjIRMsjQhBj83q8wpexXLul
	x6mPvSPUXexeZfb2uSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olevj-002eME-BH; Thu, 20 Oct 2022 23:26:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olevg-002eKd-UF
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 23:26:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id q9so3342727ejd.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apZEUeUXkxNIajez79xJytejwJ3FgKAFjaiHw46ypy0=;
        b=iUfPskxV7cbQERK1sx8pxMDt+pLYI/lY0JO9O2aq6ImLoGY3qte4OWHXDAnDlVxQOr
         uXw2OqcvvgD//rbNlYWMv4VBmnHTY5Oet13tUsTnx/d4J6L/hMPymw0XRvBzfAH9tjf4
         UPAJHnKOJmW+1m988Yy8fUPl7LING+AtJhyyO8efeD1uKIzORU0VJNeGjPOmiY16EkzD
         XcYE00crERhXRDUejQng72H9RT+v4sIzvXCYo0KUbFHZZjtMVh8mTYakjWPkrP2H9D1s
         T73p9jBYHEEfDlM7+XVPg12mLH+jVX7TNs5P3fIa9IK+Q2kvm6UiRwqaNKxuEQbIxgKe
         2HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apZEUeUXkxNIajez79xJytejwJ3FgKAFjaiHw46ypy0=;
        b=jw0+MTISg6LPs5lsZUxXpTxi9kQi/IvkdXnxGMP8/HGla6J1H2c1rkjaQXQt35iMlD
         CGHU9vxLRw3Qa6jVgdnT69pXhVjcpRah6esf1di6pIIebM7xkX0KnQiol/ZXSyj2vNq4
         UARR4SGm43WPvCuoYuq/0j+Qlv/k9pwFMpJltCjX45nu/JXjptenkRE7GOgDDkhV1Q82
         rFCZMaNLqCi4rhAak+LMAQUb7gKg5cx8+ySrNpjDtY5p0Y9XTYc8n8xzqZO5w5a4SDa8
         XMrNNy64D1xdSBGlKAlXuWFpUK2PKpDPALInzf6AONItqcLTdQ/tY7thRFbMyYPsVctk
         oFaA==
X-Gm-Message-State: ACrzQf1cxYMfxVMos5sbxPQOFXg8dKrIc8Y8XcBOd6iGpohFuEL1kNE/
	PxX/q3b7g5n+OSMpwueRYME=
X-Google-Smtp-Source: AMsMyM6ODo5+3xnp+tlWJjTDesLy3Ko88edNSlOFVAkBnXBUEE1Yq0idWHXAYKRfWc5UUaMQCAEpFQ==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id wu10-20020a170906eeca00b007306880c397mr12948538ejb.593.1666308380301;
        Thu, 20 Oct 2022 16:26:20 -0700 (PDT)
Received: from andrea (host-87-17-41-249.retail.telecomitalia.it. [87.17.41.249])
        by smtp.gmail.com with ESMTPSA id kv25-20020a17090778d900b0078cf8a743d6sm10875532ejc.100.2022.10.20.16.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 16:26:19 -0700 (PDT)
Date: Fri, 21 Oct 2022 01:26:13 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
Message-ID: <Y1HZFcBo21SQzXVj@andrea>
References: <20221019154727.2395-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019154727.2395-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_162624_997733_EF0BD373 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Jisheng,

On Wed, Oct 19, 2022 at 11:47:27PM +0800, Jisheng Zhang wrote:
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
> 
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will make the shadow stack usage serialized.
> 
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 4 ++++
>  arch/riscv/kernel/traps.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..7b924b16792b 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>  
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:	la sp, spin_shadow_stack
> +	amoswap.w sp, sp, (sp)
> +	bnez sp, 1b
> +
>  	la sp, shadow_stack
>  	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>  
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..88a54947dffb 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>  		OVERFLOW_STACK_SIZE;
>  }
>  
> +atomic_t spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>  	unsigned long tsk_stk = (unsigned long)current->stack;
>  	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>  
> +	atomic_set_release(&spin_shadow_stack, 0);
> +

Have not really looked the details: should there be a matching acquire?

  Andrea


>  	console_verbose();
>  
>  	pr_emerg("Insufficient stack space to handle exception!\n");
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
