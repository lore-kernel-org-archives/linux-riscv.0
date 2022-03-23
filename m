Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C3CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6boRlyz5PX/cBqOo/L+XfXVrR+JsQomsvzuyCSYQAYE=; b=An1sO5RA2wEZ7r2KYq8SZ63/ga
	tQ8RSEqRvPHOzshoXfUXQZhJ+Jkl9rzgLoWamhse2CldXryIFiESpE5EIOeEie4eAgRhoXirzoOmk
	Tb0cKBMdKZg3ykW8G3W1+9TaBOSUjDK9vTebEFm5DJ1b7sAbxjVEpT7aSH9shjn4w1O11eDehFd5M
	Mb6fzEbootzww34PVoNs4AtBXk29c3UGYekEuG1x3+OOu1VR1LWQz4LzcvpfV1uYy4Cs3XTHAeF8X
	sGbpeH4ijJxLbqJzYdU4qS4Xa+1GxQq6L++zCqGUXrqSX0+NG09PaNmSysgr+b7YZm8zeJg1XtGKe
	kaIDfujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWqJr-00Cbmn-0t; Wed, 23 Mar 2022 02:01:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWqJo-00CbmK-KU
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 02:01:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so362907pjp.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 19:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MnQlAny0sdy+dKCs5Y9bzvLk+GoNS2Nug2fitxt3pNU=;
 b=h5XNYGhU0tnKAa1pn3NPQXM0M5eJtPoqRXcrm4iHFa2g3z44VvYZNFRvaZaXs0jtsU
 fXFa03nxYTsEjxJaT21E3ThXBjW1d1zQh05sNekUbXFEwfeBd1rsLEdzl4sguvD/B5l6
 87z8ogjmzYhYp4sESHWyrUlCpQaJ4ApXP8XMvILfaEwxYmVsdS0x50cqTLQAA0lye2pS
 dVFyW4lTL95XH6dsE3bNQxPkAAPDKQ7ZTytc2zFg6uoeh3yD/jd/mrsiu/1RaGuvcEfT
 PoV/GdlhNUKlAcbeJMkRkQMA1+2XaIKJXxjGKUObIVfarZMqC+orjxqVfwGgG8X+Yxmr
 s4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MnQlAny0sdy+dKCs5Y9bzvLk+GoNS2Nug2fitxt3pNU=;
 b=oG9C+xHvDDjbkb7LJQw/nH1+w8YyQrfoeoGyr7TMVDevBFbkxRNUvR7IBRmZZrLPxx
 e5/CP8I+EV3Bo7T8eEC11ONlHgXATC+8ouhXNqPoLU4qp7Ky1ZaC4GEqbTfOqy8662j0
 +xpkt52zRMjuQ2dCb/GEUCg2EfSLrhydoXxy/edt37PJpLrsq7hy6XF5RGPOiOz372FM
 /Yrhj93mbxgVrKn+Tt0OmUyN1NQHyVH1S6VEGlr+SOKBMatkaNz6naen7hcC0kYWpUiN
 wxgUh+PfhKyJUDBXekcYxwVU+oTSZBtA/ntEyIAYoSiB21+wzVJy3L/bEMuZVUtRw3bG
 rXew==
X-Gm-Message-State: AOAM5305/qa8D4FUGGPQwmWDiuOiDzoM1EppxP+sUagW42Jv5IX+Sd5g
 eTEw/0yXc7OGtkd3EvWS86yKv4tR+wu3Jw==
X-Google-Smtp-Source: ABdhPJyGT4Fns0x7WySA/7WRL20BfRFSV200XpOoj6LsIaqkA9oGSdL5eHeqeQAJcuJtBdYQ06ZSAQ==
X-Received: by 2002:a17:90a:98b:b0:1c6:5824:cc0e with SMTP id
 11-20020a17090a098b00b001c65824cc0emr8458904pjo.209.1648000907599; 
 Tue, 22 Mar 2022 19:01:47 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i9-20020a17090a2a0900b001c6e540fb6asm3884797pjd.13.2022.03.22.19.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 19:01:46 -0700 (PDT)
Date: Tue, 22 Mar 2022 19:01:46 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 18:47:33 PDT (-0700)
Subject: Re: [PATCH] kernel module: fix apply_r_riscv_rcv_branch_rela typo
In-Reply-To: <20220304073730.48759-1-zepan@sipeed.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 zepan@sipeed.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zepan@sipeed.com
Message-ID: <mhng-23e6f236-333b-4bbd-a539-3dffd60a455f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_190148_734880_EFD9F986 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 03 Mar 2022 23:37:31 PST (-0800), zepan@sipeed.com wrote:
> From: Wu Caize <zepan@sipeed.com>
>
> This patch fix typo: apply_r_riscv_rcv_branch_rela -> apply_r_riscv_rvc_branch_rela
>
> ---
>  arch/riscv/kernel/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 68a9e3d1fe16..b92e93f2aac3 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -56,7 +56,7 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>
> -static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
> +static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
>  					 Elf_Addr v)
>  {
>  	ptrdiff_t offset = (void *)v - (void *)location;
> @@ -290,7 +290,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_64]			= apply_r_riscv_64_rela,
>  	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
>  	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
> -	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rcv_branch_rela,
> +	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
>  	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
>  	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
>  	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,

This is missing the Signed-off-by lines.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
