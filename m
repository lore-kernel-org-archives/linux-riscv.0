Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E03C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 02:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPW1YGDHJ1nJ74T0npONTkwuUxI1tOBRCYt8ZcL8z9Y=; b=PtG84yd2/GNQ/h
	3z8G+AW+7o9GzeRFB1v/wViBjbaiubA+1VGNxj5yZfWtE9YFcGOANM+s2R014IlcrFpEHsGR9d2at
	8SPbU/j9DKSTF4Q1QUTI5npe/PPxFPvxi7D88NnULcr5lprp7ivI7+9HyvQQY3HytBs/ASTjWN1Pn
	P0dC8b+V1/tpe//rw1icWZyZwbWyGOpqQeqK+GiTXsjmwXs2mE9DCHhJi8wXkPP81rRCpOKIvC/mj
	ZM5kMkFiOV7nLxqYzwM5WUvaVH0QuVu5YwNEJnrdqopBwAYPbfGQYMLd5K5G3kWBxa7os/lENBsdE
	vEtQAfPRMqg4WzxsUlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ4C-00GRbm-A7; Fri, 27 May 2022 02:51:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ46-00GRa7-Ht
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 02:51:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42A6F61D5C
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F196C385A9
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653619851;
	bh=VW2B/834QEadFvp2MVBpsXYQ9PdcdQlwPrY/Trn8VGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KB6rmH+NKrsn4vdTB2x+jryBkGyTASZU5IZDBlwgqDmFXSXUHIIxI/4PX/oGDZfK3
	 nqHJLFaZj17CA2qgYskE63BasOJOB/KTE6zzMgwzQuT/XP6VFlMEf3NiudKloUjDHd
	 MSzfiMZJFv46g5FRmO48rRUz/yaIM+Kb+A+JtkxRigjA3oAB3kEny9cDeHXoreiCPY
	 y3kI6uGjmQCka8vUWVKik0RKAdVa4r8xTzfOF8huC+RNRrvuRaIYnBBe7FmGqgJMaf
	 Qpj29vLq7Ksp3LFcRKo2bgepjpbJN6hKsYak+CyD7FtJ7f5d5VFrBPdE1MJShjGnty
	 UxCF6B8o1b/mw==
Received: by mail-vk1-f178.google.com with SMTP id d132so1527300vke.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 19:50:51 -0700 (PDT)
X-Gm-Message-State: AOAM5322mxaF66L9fMP3ioUJBdITwVXM/YYYVByRXkuWQnR5rimyqVSZ
	yq3JQUqdTnIxbOt0+kavt494rWin2mFO1cuqQs0=
X-Google-Smtp-Source: ABdhPJxCY0KFOVgzAOyccpbA9v4KJUZMQ2Q5ufs9Y5IWvX1RYvYBuQyNFpioDHUmGn3USdzdYpYeRRWgZ+D1e655FvU=
X-Received: by 2002:a1f:1c47:0:b0:357:d477:3354 with SMTP id
 c68-20020a1f1c47000000b00357d4773354mr8052414vkc.28.1653619850462; Thu, 26
 May 2022 19:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220526205646.258337-1-heiko@sntech.de> <20220526205646.258337-5-heiko@sntech.de>
In-Reply-To: <20220526205646.258337-5-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 May 2022 10:50:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS0zyM9sM8y6krHoMzhrLRGJPBfuXDvATw0Tm7KyE=NwQ@mail.gmail.com>
Message-ID: <CAJF2gTS0zyM9sM8y6krHoMzhrLRGJPBfuXDvATw0Tm7KyE=NwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: fix dependency for t-head errata
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, kernel test robot <yujie.liu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_195102_673212_502E3C09 
X-CRM114-Status: GOOD (  18.34  )
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

Em... This is a limitation to our scenario but seems it okay for
current t-thead SoC products.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Fri, May 27, 2022 at 4:57 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> alternatives only work correctly on non-xip-kernels and while the
> selected alternative-symbol has the correct dependency the symbol
> selecting it also needs that dependency.
>
> So add the missing dependency to the T-Head errata Kconfig symbol.
>
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig.erratas | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index ebfcd5cc6eaf..457ac72c9b36 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -35,6 +35,7 @@ config ERRATA_SIFIVE_CIP_1200
>
>  config ERRATA_THEAD
>         bool "T-HEAD errata"
> +       depends on !XIP_KERNEL
>         select RISCV_ALTERNATIVE
>         help
>           All T-HEAD errata Kconfig depend on this Kconfig. Disabling
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
