Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E2CC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIBCjQPO+A8A3w0MxNCZqXVUkKexLJHJWoDakDcleJ4=; b=hLqyLLPIHDiOSH
	f6g2916IxRzSFkAnoBj2SG0gG3DRdUWTGG8mjqpeySCoEyyWz/9FBGfhfVkFQtVCy1hb7Z81a1wUD
	ncA13cJ0MJCvwmlvAwAk/xBh6bo8vSuUOqyWaPfO62gPirGapmyXFsupcaIcdQGrSWbW+8Z/22lUt
	dal5VRbQ5JxgvFASzb+J6t61WSjghuQ2O/1AY/47gjOdx5iRliRGua8l3BgsUpycY6NEBWVqHRTPB
	/Y02CZrJrHWMM8qF2xhBjUUIq94SgHEaNf/sJsPvJMYMAKNk/+Cemxv6lBq0MglALM0snwE6Cn6pW
	ljO7rbJjKS6s87MgJYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVxST-007Xc0-Fu; Wed, 07 Sep 2022 15:59:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVxSR-007XaR-6G
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 15:59:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94FB6619AB
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 15:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDE5C43470
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662566358;
	bh=xfHDa8Z2gPr0dZtyXQaf3jkII3Enpj+hX9D1LXf6pvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lfl+LCzMAq2Jj+m6i0q8jvk/Ywum9HztA8ocEjEn2VsP9bDd+I+bkoabRxPivOA8a
	 lQnf67c05RMkEO2W5k3O0Hy5/1BkCFF+ipAVcTKIplL/p3rg3eTzL7J4nsKI/eUAOi
	 XLg36jk4Lw3S+t9lOndtcpwF9yq7TD72SxyBIRfF02C/DBIsA5YPEWpK+fb3DkwJJN
	 v5oPf/DKMbc/Baw2xC57iomXjm67hMenxSR9q7Xi7u7SLFSIKn5nqhmfHke61SsYbe
	 SR37iIp/y5Cno5jutfN4mj2kaAJMB91gLyKVk28z66wMuu/EfZkkBs1a0XpwRUcScC
	 7LrYJb+fs9I/A==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-11e9a7135easo37109204fac.6
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 08:59:18 -0700 (PDT)
X-Gm-Message-State: ACgBeo2U4ihZNRI6NqdGM0vvPWyonNQP+1xV4E9EdRU9bpO1J2/c+gq8
	nVOMninWEA8OAbDKLF4aDPwjYfR1eLxbKXA3qzI=
X-Google-Smtp-Source: AA6agR7MvAlCAbk8bogv7PvRt1jry2ZgjDxXdRGIK2wehgNgr1Ni5jtfIXHdb/ktZY+HZtYkqi8h2gLJfSSOEzo+YUc=
X-Received: by 2002:a05:6808:150f:b0:343:3202:91cf with SMTP id
 u15-20020a056808150f00b00343320291cfmr12104572oiw.112.1662566357437; Wed, 07
 Sep 2022 08:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220907154932.2858518-1-heiko@sntech.de>
In-Reply-To: <20220907154932.2858518-1-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Sep 2022 23:59:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR0p1C=JN1gr_O7ThZririQ9wstMxcixKL4yqRQKdvrCg@mail.gmail.com>
Message-ID: <CAJF2gTR0p1C=JN1gr_O7ThZririQ9wstMxcixKL4yqRQKdvrCg@mail.gmail.com>
Subject: Re: [PATCH] riscv: make t-head erratas depend on MMU
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	samuel@sholland.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_085919_284970_A4744784 
X-CRM114-Status: GOOD (  17.78  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Sep 7, 2022 at 11:49 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Both basic extensions of SVPBMT and ZICBOM depend on CONFIG_MMU.
> Make the T-Head errata implementations of the similar functionality
> also depend on it to prevent build errors.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Fixes: d20ec7529236 ("riscv: implement cache-management errata for T-Head SoCs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig.erratas | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 6850e9389930..f3623df23b5f 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -46,7 +46,7 @@ config ERRATA_THEAD
>
>  config ERRATA_THEAD_PBMT
>         bool "Apply T-Head memory type errata"
> -       depends on ERRATA_THEAD && 64BIT
> +       depends on ERRATA_THEAD && 64BIT && MMU
>         select RISCV_ALTERNATIVE_EARLY
>         default y
>         help
> @@ -57,7 +57,7 @@ config ERRATA_THEAD_PBMT
>
>  config ERRATA_THEAD_CMO
>         bool "Apply T-Head cache management errata"
> -       depends on ERRATA_THEAD
> +       depends on ERRATA_THEAD && MMU
>         select RISCV_DMA_NONCOHERENT
>         default y
>         help
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
