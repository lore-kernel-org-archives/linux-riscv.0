Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAAFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 02:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3zQmFxfdGs6fxHuY0SO4/R124dNBXc6nQ+MuAfIu+s=; b=LtbjH8w/IxcbiM
	WHzbfEEP9bIp6f1wVm7JRLoZl1dufNsDKVpW0nc8DjLxaJEasQin8wMZXnEpg3uk5gTSKNzDyc/AG
	nWrRFVcXROWJpUPaUlxnrCOmYLUiDqFb6kY0//MeHEjmuMvV1e+vQ+dHNxYSMwt45qaLPXRpj/tVY
	neRXcwLXbQ9d/GJc8kKg0dj1iTZvLDAgE3bB4MrgyZy5KkTFLJTufa0k5uRz2gl24TLJhwTl/pPTr
	aqO6xKg3EPJs36/q01djCzxO6y5L73tK/Pamewr5t3+Fq/PuSC46HJpVJXPk6priUSAYZbEDzs4u5
	SynCDzqQ3WukJqAkVs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ1i-00GRKO-Sf; Fri, 27 May 2022 02:48:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ1f-00GRII-OO
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 02:48:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD1661D82
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE885C3411C
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653619707;
	bh=lYtZ/6P5eMtzXk+deuEB2yU0KAz6cUfOhQlu+NizlJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C4H5NOwaUqURMgxnWg+/u4j9dWb/33ZYM01ogjiBR/xZyouylvWSmCSNf3Zpx6YiG
	 gyTdI846Y6UrkhJ9Jwcj4LHj2dVt1R/4OYFxQPwySDL8NFx3LUc2nmf4XyoH/RFiRW
	 wmASHKCtSG+DrMB1tINmAQkJMmZxgUgyoEmatPsLkgZJ9ZFT9amhD8zjIQLvIL5scC
	 Kcx0wHXRudIw5VILeaFhC2LeMgFma46n7XMOQpQuyPRBQoskqMbQZ/9y8xfYpYPtFR
	 Mxv2dAnKJLj3ZPoLqaNaITP602Sz74HcILGDAk26ZHsrIxQvSuczWVfbYCKduoCj7y
	 XU94AgD4DUG+Q==
Received: by mail-vs1-f53.google.com with SMTP id j7so3113145vsj.7
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 19:48:26 -0700 (PDT)
X-Gm-Message-State: AOAM5324eoE7nIOAbLA23xAlLvoU4VwVQeUYge7VTB2Ea4NZngAFnEFM
	1qClEvdGIzDb4l9Z6jt7qx51LYGPWu2mCyc0JsI=
X-Google-Smtp-Source: ABdhPJzcTwWBMG9c+TPVk9yGa3IRggU9hfJbCZvdgATbLXoJzJHGgt2WvBmsLK7Cop4ISYZgN5e+X5d53y3EWaseqr4=
X-Received: by 2002:a67:e046:0:b0:335:d1a2:6192 with SMTP id
 n6-20020a67e046000000b00335d1a26192mr16970483vsl.8.1653619705914; Thu, 26 May
 2022 19:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220526205646.258337-1-heiko@sntech.de> <20220526205646.258337-2-heiko@sntech.de>
In-Reply-To: <20220526205646.258337-2-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 May 2022 10:48:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQwT1hhOxqNYiV8ReQdq2xJSbxDeART0fiLLatSg+Yq+g@mail.gmail.com>
Message-ID: <CAJF2gTQwT1hhOxqNYiV8ReQdq2xJSbxDeART0fiLLatSg+Yq+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: drop cpufeature_apply_feature tracking variable
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_194831_914302_169FC794 
X-CRM114-Status: GOOD (  19.00  )
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

Safe modification.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Fri, May 27, 2022 at 4:57 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The variable was tracking which feature patches got applied
> but that information was never actually used - and thus resulted
> in a warning as well.
>
> Drop the variable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dea3ea19deee..b33564df81e1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -294,7 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>                                                   unsigned int stage)
>  {
>         u32 cpu_req_feature = cpufeature_probe(stage);
> -       u32 cpu_apply_feature = 0;
>         struct alt_entry *alt;
>         u32 tmp;
>
> @@ -308,10 +307,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>                 }
>
>                 tmp = (1U << alt->errata_id);
> -               if (cpu_req_feature & tmp) {
> +               if (cpu_req_feature & tmp)
>                         patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> -                       cpu_apply_feature |= tmp;
> -               }
>         }
>  }
>  #endif
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
