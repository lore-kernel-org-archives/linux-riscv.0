Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F785ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhULO4NZlj6g4N1oNf10FJ5i/vvOBY6Or+pAZN4HyOo=; b=4s16Q7wRj+Po9h
	DqTdetkxl2WQP/7WNLc0oKzf1/8nEQtieRgxTttWyjQgqTDMJf0pdEy8AIRIlmGFShLV9LwBVeoBh
	u3fSKCqDBIEujLncnQuWdxPixwT/Tz0ZDSgLxXdpQ3Erk3qjToFbvLJWIGnspceCVhjVlF4ZmL5ly
	VfLlzC05MF/kn4I86tfw3cCMWfDyCmoE8zlxeAmTB14vQsvHkXMeHr+MdZGadxownMhqZnYQSsa40
	+6liJkV/Uc9wKkJPhYe3r+EvbCo8mApnKpuw6x34h4ZaLLNn4sHitAj2T1gce8jZWbIyOsGKx8FNX
	75aYEzh+Gyv5TzkNqpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTvA3-00GOYZ-Jf; Fri, 02 Sep 2022 01:07:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTvA1-00GOU3-5T
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 01:07:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 464A3CE29B7
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA9DC433B5
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662080867;
	bh=YGW06h42fog0+829pIdqqfbbxG5/bSPM5IarAA8Qg4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=goPsjt9899ORTuqLLkog1synbcfRjehQYCiugCW4nLaM1EV6HU0+oYY/4uDwnRcl8
	 xWTV/9Ta9+eQJ/qmK3SCstibOAnexccPfKfCoiKLu+Nr+1VFvOElFT7q2bkpjDSZDB
	 dZxQIEKwUPAZDzdBji2Jh803TKzH9mFcrEQKLHxA3dkCJpTVyWG7HyowSedQ33YJIe
	 AGcYUog1piTixJzlR1dtwTdcaAqFE0SunInOP4nHkQc5xU8xXCdBeptCAdgIM3GpQ2
	 YjoimfAofZEYlMaqNZr8k94rGHcuqFBAkOm3fTpJJvKfr8HJqp/7n5LgDqLaUbukRC
	 wTdUxr4BdV/UQ==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1225219ee46so1465695fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 18:07:47 -0700 (PDT)
X-Gm-Message-State: ACgBeo33aBVmalHLrHIX6UtPpG2ZBVr7G29SgD7UMEGAbCoLiCGbVuTH
	PRxip6bX0zx76w3gmm0xMZxyOwMsa1GZgU5zTKA=
X-Google-Smtp-Source: AA6agR4Ocs9kP9xBS2wmYYMgKp46ESJNJgZQyzz/kLfwkEqbvIlyV+tofNOYNy9gfS/+9/H3rD1//vbYWh8e8wc+wg4=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr1043596oab.112.1662080866791; Thu, 01
 Sep 2022 18:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220901222744.2210215-1-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 2 Sep 2022 09:07:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRnhN37C3pd6FYKX8KEVUQHm5PzWTf6Urxe4kwVW5hg7Q@mail.gmail.com>
Message-ID: <CAJF2gTRnhN37C3pd6FYKX8KEVUQHm5PzWTf6Urxe4kwVW5hg7Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_180753_394715_F86F9181 
X-CRM114-Status: GOOD (  18.66  )
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

On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> This can also do without the ifdef and use IS_ENABLED instead and
> for better readability, getting rid of that switch also seems
> waranted.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..764ea220161f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -253,16 +253,13 @@ void __init riscv_fill_hwcap(void)
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>  {
> -#ifdef CONFIG_RISCV_ISA_SVPBMT
> -       switch (stage) {
> -       case RISCV_ALTERNATIVES_EARLY_BOOT:
> +       if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
>                 return false;
> -       default:
> -               return riscv_isa_extension_available(NULL, SVPBMT);
> -       }
> -#endif
>
> -       return false;
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       return riscv_isa_extension_available(NULL, SVPBMT);
>  }
>
>  static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
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
