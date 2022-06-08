Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHW+/K53xcYOLo28OAjnKu9rKiKR1odwULFk1LKR8cY=; b=2zSxHmz5AJqt1b
	eF8M06HhvMwTslVR0coGnVYO/uN0WtVateqelVUoif8QDLXwbT+7nB2KD/YQM6ibpk/CnJiVfVRkZ
	6AgcvNGStJCGR/x9IY9y5MoJCQBsydWo77HF+oLgse5ZJh77sagd3gov4s7ltR2YkRv5UsFs98MgP
	HVCBFU85+3V40L+IVfUGaq4SdIifzFcJSWmnOxdc0SBv/zFBBTSmLXulFYPFbr93RwUFW+beMzqZz
	1eRhrfXk9lVHIDvPqvEorItRKeEM02PlokdSFdFf0izUyCQfhi+mB0OUHDErcCK+BfgJS3Bqj5iD4
	99YaAugolWyTYlApmLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzfY-00EWYO-48; Wed, 08 Jun 2022 17:40:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzfX-00EWWd-1V
	for linux-riscv@bombadil.infradead.org; Wed, 08 Jun 2022 17:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PxkU1zqSpy3+j4QBEZfELzSFwLGuTltk4n6Ro6hW0SE=; b=NzlziWtCxyHaV8KQbYe2fdLYfB
	Toabz1Lg6CPI6v8C+KO2n6WKo3c5lvEkY4qPcZUlgkR8jb85Rgj2QhB27O62E/DRvXDfaM9rGcLwc
	OKLlNTWHHfS+t4KMLpzlV2Xv1HxwGFkxPB5pwE7Q9lf6Iz08PU0ptG6h8RD13/ZQmb9Fomy8SLgDE
	0gEZPXqXpS70CrlqkaEJuN9jEAy+U/aI7nUdmnfy0JySkiMJX9uhoCQgumibpoDFGg4EUQ2RYMi6/
	Le62TsORdiDN0MwBkf9rqA3sqnfVzJEAxjb6jdsJYZNMoPbUpaY/52GiXC56MByvczEc0I282a4i1
	RTDwa2ag==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyYw-006934-GS
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 16:29:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 58CEBB828A9;
	Wed,  8 Jun 2022 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76102C3411D;
	Wed,  8 Jun 2022 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654705775;
	bh=Rl+DUn/Nzlxn4nlbJanjmwhDoU4icyUwT8ssx2EkXCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0iV9olUahbUYftDKWhbviAUNLNB6RMv87CvNijiYZZQUVVXNYYJT3gP7/0+lEjZB
	 hElkhcZJCfcUII6GJh8rEoRFr7BqZ0Z+F7dpPS33V/tD8SJsf2HJTZHCGGl+84O2vK
	 juvkd8yiWoboAfKsckJzf8gQMubWwBbkv5+98hJFU/cq/sgOBq5d39GRTkks/dABRL
	 /BMsME2Va5LAjG9J7Eu2+pbcdIG8aDJ1CAt2TkHtyHEKwziYeQiJ2nDitm+Dy9flHM
	 23zN5b/0zb0x/bqQWaRx9J4+s3jWcwSkl4Y2S+WnWz9jC87ceClq0BBEg6XGh4WnDA
	 nMnoxx4bx3bWA==
Date: Thu, 9 Jun 2022 00:20:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Russel King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: initialize jump labels before early_init_dt_scan()
Message-ID: <YqDMZOTtmOcMlGM7@xhacker>
References: <20220607195752.1146431-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607195752.1146431-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_172942_907582_9D28F37F 
X-CRM114-Status: GOOD (  22.10  )
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

On Tue, Jun 07, 2022 at 09:57:52PM +0200, Jason A. Donenfeld wrote:
> Stephen reported that a static key warning splat appears during early
> boot on arm64 systems that credit randomness from device trees that
> contain an "rng-seed" property, because the dtb is parsed is called
> before jump_label_init() during setup_arch(), which was fixed by
> 73e2d827a501 ("arm64: Initialize jump labels before
> setup_machine_fdt()").
> 
> The same basic issue applies to RISC-V as well. So this commit moves the

> call to jump_label_init() just before early_init_dt_scan().
> jump_label_init() actually requires sbi_init() to be called first for

Moving the sbi_init() earlier has been sent out but the patch is missing
in 5.19-rc1

https://lore.kernel.org/linux-riscv/20220521143456.2759-1-jszhang@kernel.org/T/#m00c3cb5e4e360ca8d7aa10c79c10437b7307c16c



> proper functioning, so it also moves that to the right place.
> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Reported-by: Phil Elwell <phil@raspberrypi.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russel King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Fixes: f5bda35fba61 ("random: use static branch for crng_ready()")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/riscv/kernel/setup.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f0f36a4a0e9b..c44c81b1cfb3 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -263,13 +263,15 @@ static void __init parse_dtb(void)
>  
>  void __init setup_arch(char **cmdline_p)
>  {
> +	early_ioremap_setup();
> +	sbi_init();
> +	jump_label_init();
> +
>  	parse_dtb();
>  	setup_initial_init_mm(_stext, _etext, _edata, _end);
>  
>  	*cmdline_p = boot_command_line;
>  
> -	early_ioremap_setup();
> -	jump_label_init();
>  	parse_early_param();
>  
>  	efi_init();
> @@ -285,7 +287,6 @@ void __init setup_arch(char **cmdline_p)
>  	misc_mem_init();
>  
>  	init_resources();
> -	sbi_init();
>  
>  #ifdef CONFIG_KASAN
>  	kasan_init();
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
