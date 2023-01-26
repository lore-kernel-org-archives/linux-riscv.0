Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E377CC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu6v96KWzfuk6zTnhdmtYl5TPsiTfkvAWTW3SQCzhgw=; b=AySZa4CsUKB9UZ
	qkFhuGQwjYcoE7tSI6z/g+J7m+sQu5jRR7vXHsnWV3EIx+0amq72hAb2aFpXEfUzWEhZgTY0/yjV4
	MkPPQ25CCZDfzwua/9eyw1z8gADoxexR9BagclB4+fwq7riIUeUtOIff2gpU9wIX6X2iE94ICatJm
	cCJRvXkP/fMDk7DH+mB2KWm2v4f2WVGOdovS0Fa6zdTRDiNcOn6I9n5E2dmCp7nE/ksBj9h5YC5A3
	jeyXjkTQO6O2yB57T6Nu6dpV96+O5De57jaqeF5Z1DlrAQZtGqboc87UWZEXrP02iYFaz3NQH3Zx6
	g2/1kDsHQEjNiGHrPmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4i0-00BeN2-K1; Thu, 26 Jan 2023 16:02:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4hx-00BeLt-Pp
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 16:02:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id bk15so6261424ejb.9
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlKMRT9EHE65PtZHGD4k5FPNh/3AR3OGuPsdhBKT3qA=;
        b=gVGoa76c/5rcg8G4PJsKVsH40EqYRtPXBFl7cMEhxTAGOx7n3XRkZBT5M1LjyfxzzS
         NNTkEx8ZywN1TUdTYOGh6T2vQPp9JSmW2Ip0K4W3QnoyiA8dyh9gv0zxTLENpebOTA6Y
         2TxJyZ01aQkpqZQ1izt8958vsDK9vtJm81ED338cGJ//zUeessnoocomcBAR7VKzpYCs
         nJySEhKgBYDOjCcG+9shtL+EjAYO9GRPiQ8vR0Z5/+jhv3p0BDqHz5lEwigamOyQh5Uf
         BwYynfKbGPtzq8Eb51M8Ebjd2g8s4fmr9EU/yj7rgI2u+1LxavslRi4hqS7VpeUOnETi
         FSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlKMRT9EHE65PtZHGD4k5FPNh/3AR3OGuPsdhBKT3qA=;
        b=RFg2BsepSvZ/aGEnQxWoaf9cxax4zITlTh90WoXVLuuR/+eJ2+SbVwqKH4MO4rnSTm
         3dcYlSh9mQbhWVtZrCwOvmh5yhkcVI1215CBWeR167ssFIs9Ep1rMfqhgcSKWAPo505q
         HzwJgNF7ykrCitOBO6CDFR2i050VJGXaAKtjB9gxF/HskIDVArPpcU5cBVsbn/SNJaf7
         ERomRI6KDzhoFWNkN6peD4P53luwcISknOLczy9v8xeuKxGm6KCIg7mzz2jCTN2sBasC
         fMalKZYsN2o8g7OC7bDlne7P0gNvAPKmqQRcmbk0Uecr5NiNBCVTAxNRQpUNFPuH77y/
         NzDA==
X-Gm-Message-State: AFqh2krUOaN5I0MgUz0IWquqtxpOdASPOm7WyhH9D3oX0poM0pX3ANWg
	m0YVf8e44ZmJSW3nNPaPrQBbRg==
X-Google-Smtp-Source: AMrXdXsk6/rbV5qIL2/9m6irzy5vZLxenpeokFpPeGQyT1ZRaqMfMO3FJ+14IUiRM7HGjs6S8IzxYw==
X-Received: by 2002:a17:907:2489:b0:84d:255e:21a4 with SMTP id zg9-20020a170907248900b0084d255e21a4mr39291298ejb.2.1674748956236;
        Thu, 26 Jan 2023 08:02:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ec16-20020a170906b6d000b0073d796a1043sm762948ejb.123.2023.01.26.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:02:35 -0800 (PST)
Date: Thu, 26 Jan 2023 17:02:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <20230126160234.pkx4socjv3fcxpmn@orel>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112140304.1830648-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_080237_865403_826EF3DE 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Jan 12, 2023 at 07:32:59PM +0530, Anup Patel wrote:
> We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> and Ssaia (S-mode AIA CSRs).
> 
> We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 8 ++++++++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 86328e3acb02..c649e85ed7bb 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,10 +59,18 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_SSAIA,
> +	RISCV_ISA_EXT_SMAIA,

These will change a couple different ways due other other patches in
flight, but let's put the pair in alphabetical order now so they get
moved together that way.

>  	RISCV_ISA_EXT_ID_MAX
>  };
>  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
>  
> +#ifdef CONFIG_RISCV_M_MODE
> +#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
> +#else
> +#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
> +#endif

This isn't used in this patch, so should probably be introduced in a later
patch when it is.

> +
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
>   * keys. We can use static key to optimize code path if some ISA extensions
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..a215ec929160 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 93e45560af30..3c5b51f519d5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
