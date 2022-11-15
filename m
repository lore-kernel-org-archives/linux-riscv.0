Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAQ72PrfBYXPiU+klWQycLLEnslRlc9M2m89Eww5wDA=; b=MBE3e7Qg+fZeWN
	+LKakFuxKZcbRHLVhkMm9bhp1aROl5aeGkmmeLiLccfsK54Ovug/+LckvZjxyHhd/RvJ8oR1J58wX
	TUiNISyX/z2SzZE1fZu+NbsCfmQO5Gzy6Rv2qELcsBIC9Ue+pOHfZtkcqO6902JwxpOdBAW3Oq0DE
	kaJ8JtjIVegcas5qSLm1cpDCCqfoRfLLEGQISl9lSxyHJDMroo77VaiVw4HoD0TOf2Jdmd04D64b4
	v0lCPpo6WUbEnUCCKT2adHdM4aS6Xk0TqIOlGkSA16+pPIavNpi6a6Xpl0nQeiYFYk4ruMjC/LNDU
	YVMhnOlGrD8sXsVvtjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwtf-00BsQb-90; Tue, 15 Nov 2022 14:26:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwtY-00BsOQ-WE
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668522397; x=1700058397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XERZkaZEnlrgczx883x+W1hcSu7sIngfJcKE+vi5KY=;
  b=Acgal2CUM+ifr3jBJlNZzef55Z1LW/sLn+gC08rVzhy5U6J/wlywfkDW
   /pQA+YuzCioVo6v5LqSp5N0FSqwXiGjCgKPgZQ6uU9il0CJFthZnzq7TI
   CUQdhBufscmdJxl1eMi2dOxzMCYE/kzFcdPvISTq5Dz6KJKgmMVuD69gz
   vCE7OegrVIKrGvSbPp4DEtuGdMwX4MxWEy5rE3o9qZrWqAx2kmEC31hSw
   pj+w5egDL3C3uk1bKu3wXPeSXzkI716SmMx4swrxIjrtmPj9NXX5LcUMz
   cZpUjWBMNaExfGLAQiMjkS0JL74W1X82/Gkx1+iUPclCLCWrm4llNgJ31
   w==;
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="189058136"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 07:26:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 07:26:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 07:26:30 -0700
Date: Tue, 15 Nov 2022 14:26:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <guoren@kernel.org>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mark.rutland@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] riscv/ftrace: add ftrace_graph_func
Message-ID: <Y3OhhZGlk5I5DN+f@wendy>
References: <20221115061525.112757-1-suagrfillet@gmail.com>
 <20221115061525.112757-2-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115061525.112757-2-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_062637_059937_384F3702 
X-CRM114-Status: GOOD (  19.69  )
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

On Tue, Nov 15, 2022 at 02:15:23PM +0800, Song Shuai wrote:
> Here implements ftrace_graph_func as the function graph tracing function
> with FTRACE_WITH_REGS defined.
> 
> function_graph_func gets the point of the parent IP and the frame pointer
> from fregs and call prepare_ftrace_return for function graph tracing.
> 
> If FTRACE_WITH_REGS isn't defined, the enable/disable helpers of
> ftrace_graph_[regs]_call remain for serving the !FTRACE_WITH_REGS
> version ftrace_caller.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>

Hey Song,
Last time I saw your email I'd swear it was "sugarfillet", just making
sure that it is not a typo.

Anyways, checkpatch is whinging about some parenthesis stuff:
https://patchwork.kernel.org/project/linux-riscv/patch/20221115061525.112757-2-suagrfillet@gmail.com/

Would be nice to fix that when you resping.

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/ftrace.h | 13 +++++++++++--
>  arch/riscv/kernel/ftrace.c      | 16 ++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 04dad3380041..b33c98070972 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -81,8 +81,17 @@ do {									\
>  struct dyn_ftrace;
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  #define ftrace_init_nop ftrace_init_nop
> -#endif
>  
> -#endif
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +struct ftrace_ops;
> +struct ftrace_regs;
> +void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
> +			struct ftrace_ops *op, struct ftrace_regs *fregs);
> +#define ftrace_graph_func ftrace_graph_func
> +#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* CONFIG_DYNAMIC_FTRACE */
>  
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2086f6585773..2d7ce77d4f33 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -196,6 +196,20 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>  }
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +
> +void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
> +			struct ftrace_ops *op, struct ftrace_regs *fregs)
> +{
> +	struct pt_regs *regs = arch_ftrace_get_regs(fregs);
> +	unsigned long *parent = (unsigned long *)&(regs->ra);
> +
> +	prepare_ftrace_return(parent, ip, frame_pointer(regs));
> +}
> +
> +#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> +
>  extern void ftrace_graph_call(void);
>  extern void ftrace_graph_regs_call(void);
>  int ftrace_enable_ftrace_graph_caller(void)
> @@ -223,5 +237,7 @@ int ftrace_disable_ftrace_graph_caller(void)
>  	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
>  				    (unsigned long)&prepare_ftrace_return, false);
>  }
> +#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
> -- 
> 2.20.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
