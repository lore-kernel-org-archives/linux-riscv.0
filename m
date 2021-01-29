Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E367C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 13:53:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E2264DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E2264DD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlgBbtoC8WvVC0PHlam2oTDOaQ51WRAj8/QC+Q0I80U=; b=y5La0qNTkESnRPa9vstmhhO4u
	vGLMIAsi6o+/cEbRm1CqLMg8jSvMKTpU6AGSSNL92K7mTgcw2E2nK3s6WXpA7tjDImwbJBpJdJDMG
	q8EGlkSnMXrO6qV9PsnUD2BvVbAX69ZuZFuOwf/H3qfHkqJ93FayikEdFiPFrZNgfc6qP3FZkqhVV
	bpiamBYsyvVV5BLd7ts+MwnFp+gsgmxcF2E5706d5FviERxPPbKkFRGXLW3wyQjOIRogITbw2P8fx
	VSsW/6Bi3oKwHp9UbxISurSqYI597J+33Vn16ZIkQ5C5VNPE2RhN7kxdopB+G0CTN5upAXtC93pab
	WLVlYKeug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5UCx-0003zb-I6; Fri, 29 Jan 2021 13:53:07 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5UCv-0003yn-23
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 13:53:05 +0000
Received: by mail-oo1-f45.google.com with SMTP id j8so2326252oon.3
 for <linux-riscv@lists.infradead.org>; Fri, 29 Jan 2021 05:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGLytFOO+UFa1DFHWGP4zt0cqWqbAIcxrQdePUjwqM4=;
 b=PP5kFiNDoxy+MZ3Y0jRnUg3lJmEDsHZuS2G8L8/LfecqsFqOtQeSeVB7Suz6TJwQV/
 RUWJ4CZ8YIFGa4wjIC80ukQe4NaVznepImf2SloIi6dQ7fuW9w1BCAqv1HTH5UkZEk36
 dUqvdeqy7k2hb4jwPsZCeRlxtSIj1SufOtm+1JumoIgXZTihu/P8M8fojVoh1g9DQBaI
 suZfVcEEtaPzBu4Oq0x4rATMlDYRWvrHz27my33kddrfAcA8RfCRegmjy2Hurh+QIhNY
 rgyhPE8Fk5J7laxhOudvdnQxR5mxFihKQIfAh6pMTp6Xt2QrGFeKBfWwwMw35MyC9Xd2
 yaLg==
X-Gm-Message-State: AOAM533lhPWxHByDsz1nS8x3Ox3kzUMMh+Tx3Yi/lV84/vXd7/3PoM08
 3Lbq3dzWzxhEOnCqnVnQcKKCQSBP2r/Hk1XKFk8=
X-Google-Smtp-Source: ABdhPJxNnCuuDetqKbVCzsLqUcaubkNcK+KA9er+HtvMWqtX+KzEYoq6SjkwhpMpoQYUISbjQb7xasohU50DOV/BcHg=
X-Received: by 2002:a4a:8353:: with SMTP id q19mr3127511oog.40.1611928383082; 
 Fri, 29 Jan 2021 05:53:03 -0800 (PST)
MIME-Version: 1.0
References: <b67f8941-6624-d814-e6d3-2ddfdfbdf7dd@infradead.org>
 <CAOnJCUJc0-x-gmLAKxb9ULjOX1yBjxZvwi4=_0ETH-L7JtKhNw@mail.gmail.com>
In-Reply-To: <CAOnJCUJc0-x-gmLAKxb9ULjOX1yBjxZvwi4=_0ETH-L7JtKhNw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Jan 2021 14:52:51 +0100
Message-ID: <CAMuHMdWb8We=-L3mrZi5dSc308rapqH8NyAq9OJU=Qo7YijGpw@mail.gmail.com>
Subject: Re: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_085305_175199_B9BF3BBD 
X-CRM114-Status: GOOD (  14.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Thu, Jan 28, 2021 at 9:09 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Wed, Jan 27, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > I took a riscv-32 .config from kernel test robot (it was for a clang build)
> > and did a "make olddefconfig" (using gcc tools) and got build errors
> > due to this config item from arch/riscv/Kconfig;
> >
> >
> > config PAGE_OFFSET
> >         hex
> >         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
> >         default 0x80000000 if 64BIT && !MMU
> >         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> >         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> >
> > PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.
>
> Because, RV32 doesn't support 2GB physical memory yet.
>
> The compilation errors can be fixed by not allowing MAXPHYSMEM_2GB for RV32 and
> MAXPHYSMEM_1GB for RV64. How about this ?
>
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -253,8 +253,10 @@ choice
>         default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
>
>         config MAXPHYSMEM_1GB
> +               depends on 32BIT
>                 bool "1GiB"
>         config MAXPHYSMEM_2GB
> +               depends on 64BIT && CMODEL_MEDLOW
>                 bool "2GiB"
>         config MAXPHYSMEM_128GB
>                 depends on 64BIT && CMODEL_MEDANY

Thanks, works fine on litex-vexriscv.
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
