Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7250FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6Hets4BojugsMetOqw/lAR+yodWtP41M+vlwfjpV4Y=; b=uYBpGixioShsxo
	JglCwB2vqlvIrv5Oom9T2l463qlGzDTwd45JgZXh0G8tq7Y2wJycyiNLgIM5j8LbXARLpiE2NyP40
	2+ZiaWt2N5KLcyFNU2Le1iMKpfNXJesLlw/ZvewF2kUns2/uVCXhybS/aR593as3AjOcLwIPnmmbi
	uTHla2FtYTMKXekfXI6+2ilmcz7yr/07WW7Cfsaf4H2Sl+kk0f1GP+9RoXKqAi2Xa2mLM/q/touFD
	WUF4Nm/d+a45wV98DYeCsA6sbDxgMLQyRuNtBcfUAVPY1JPH0rOZPm7Cme6W2EcLN5SeNOz0pszuo
	ProFzKHLZA8oJ0JYLvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR3f-002jGV-H6; Thu, 06 Oct 2022 13:37:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR3c-002jF5-G2
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:37:01 +0000
Received: by mail-ed1-x532.google.com with SMTP id u21so2834956edi.9
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=DZoJlUHmQo7sC5JniZgyDQJ0wSD+jVGoLhaBhI1aGrY=;
        b=VrDqkwCw5gUn3mEQeJpu9dZ6AF1IXGZyviXwZK0a0SBl8C3saY78DBhb/NdOBGw77D
         sioORUtf+ZoAvGawjjvFeAr50qIikDof/HLUpqsqTrCtVa84hHZkd/E0dpQmOvJmsCKg
         qZ9OMEmE/hBTKMJW/rXB9LjDUvMy45qOBk1xsAcIxkP1o1SOlIqrt5LYHaxORiElDwe4
         R9MZ0qz9U5yOptdEaPV/ZihLWb3ludMoViQRvpsVTZslK6Hu73ZRKH1EXmP8DwyIesF7
         oz8lu2coaNvI6Sl0AoAymj5KIn4GobvoY9tgws3Nwugy4Wj5zSaaSmR9MocBH/bPBHRk
         J+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DZoJlUHmQo7sC5JniZgyDQJ0wSD+jVGoLhaBhI1aGrY=;
        b=EoUXLdNWdCc6p/soAbI62W5ySTelNHFCXqlTdsMpz/JvYn0zIhv58vg17lXrcSrVzd
         86lbL9TbxscTYu+Za4ZXoy3lkOftBrzw5u+r8rtlyADZUBBBKBjJbmyVDdK2R6mpP3hI
         0gJybf3Rpi8ylaua9e5ywHqVUdcQxwEeJBkALxv0ODUU1Uv+qgR74I6QhA6uAGpziNca
         aH3Ts5BCqMJwCigQRHCZcwY6Szpe6o/QgrWWzJMfCXsMwDWQmVL9EnajLLo67SHTUkj+
         Fy6PDc61dY1al0pMBCkd3ur+a4OSs7HDwR/Nz3tTArrxJXzu/EpsRBjwSviS9HPK8vnN
         FDQA==
X-Gm-Message-State: ACrzQf21XfoL1+3MA+3Pn+IEGOy+yin3rscqrxk6j+bckQHroVy9RQzZ
	rfNtIX7JYO99VPVhp2adPY6MVlnwK0AgOg==
X-Google-Smtp-Source: AMsMyM4nMOW1IAKp6SZkiuHt6/NehY++eUad8HKnZasoygesNi8fvEa5ilT/pi5mdZrAC6xvW9K3kQ==
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id g12-20020a056402428c00b0044082597a2bmr4549032edc.329.1665063417836;
        Thu, 06 Oct 2022 06:36:57 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e24-20020a17090681d800b0078246b1360csm10146351ejx.225.2022.10.06.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:36:57 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:36:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
Message-ID: <20221006133656.sdtxrpopvmy6b5mw@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063700_554734_92B87292 
X-CRM114-Status: GOOD (  14.23  )
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

On Thu, Oct 06, 2022 at 03:08:16PM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from statich branch to the new helper
> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
