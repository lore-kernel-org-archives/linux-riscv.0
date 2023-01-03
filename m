Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE430C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJbZpwXdXq9h4668BE9VmEmvYl/l5jwXKmFq0TmzI/4=; b=EMmMc4t8bej8d0
	/OX5X9bWtMXM5Jepv3hST+VtFpyZtnEwbG3pXoRw+M3Lbf7pnTDV0I7yza8x+l/wsH9wqCRaBDgGm
	KSrir+3XgohU360B5OiAWUSE6qwL5Zp+Tqa1zX4lGzUEegL9FAq5qKrHBkG0/RGTzEvTdllyeTpMO
	qOrpr2CleD+kO2NQQzVnBOWaXYiFaC0tm5YxM1Voj4XORWRv7ILexZjjJztEUAjuELbSuP6xL4kET
	2FtWV4apiK2CsMk7grLNvCLjnqUZOGzw1YNOkf7rYEX3S7mg3GqmTt9/pOLKjWnSrAQ+xfhoQ8aRq
	zpLsK7oK1YE3EEGMUaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmaS-004C5m-Lw; Tue, 03 Jan 2023 19:04:36 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClFf-003Uh5-I2
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 17:39:05 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F2C05C00BA;
	Tue,  3 Jan 2023 12:38:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 03 Jan 2023 12:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672767539; x=
	1672853939; bh=AL41jm0bguHLbqwrfAY4uxQqONM6OmyCgIZjUnM7MhM=; b=d
	WUZ0AB08T6h79Dkaxh4cGAeJG2slCfBS89ihY8HncRtwJkRdYHoo/soj6xIGodFB
	TmQUJLh33qJjWqbBt9Z9mRaEYUDU4J5zOXTD7HN2b3qpVz1HiECN39Yey+AIHWOG
	aaghK+DJnB9Ar0M7Lp5Q8SZ549NnM4Co8r5dlbh+JUtBn9O6xW+LP6yLz/m/gkGL
	qj/7ZFV492XVqNn3V8CzApVihQZjHxBT676v0pczf2Q4kQRVFA+pk5genOI6fB10
	5NhvorWjCvX6jIlMjTeskOvPooD5A35vFnAj1Xo4jBYNrIlmz9umeEgmumxERDlM
	ejhcXIEYRQFrw1cieHKPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672767539; x=
	1672853939; bh=AL41jm0bguHLbqwrfAY4uxQqONM6OmyCgIZjUnM7MhM=; b=L
	vzS2C0SkocKeU/XbJN8x6KO5vIwGnw1b6jThBhExLaAKeRYPBMyNZMck1mQ9pw6Q
	7t8I0fOTNt4cdswGBYik7H/Cq0bPtkeFMpc+7BWBB71ElBZD8m7FZAwsdRO3P7VP
	vbW1ETXOVderwqBbjBf+pFwZDnh8+KYG9dHCNtGomAPEpkwyBXAdEeGov4jieHeo
	DmUB+NnkPIc7Eazgg7Y3JPxZM0Hpb9IdAPoe6D96OeniJpDfiyC5GuHhANuVUNcY
	SU7NLqVfnZb9RDXnIIwYou28WZJkJO41/lHzSTSthEbuTUY9+3bdst4B0ggM6aV9
	gnXD8NObBkso6AkFNGUsA==
X-ME-Sender: <xms:Mmi0Yy2DCzQ5foQDze7omumT1bouPZXNpDmiNQuKD0lRdRhVO9YYqw>
    <xme:Mmi0Y1FkM7xCJwra159l-QxlutI2OXCL3WGNVj8XsmdJJEiB-GteP_jdb-a4GQpdq
    niICcU11FGUnNKN0Q>
X-ME-Received: <xmr:Mmi0Y67UDv4UnB8dvhJqCjMUxmDkxkYuSoMODz_CcWCGgTcDbl2FG0Dqa2DKZkksLMPD_PCLN-LkFWFJUjbE2sqJxwdiFfog8W0EUvqTjPFzsuttb6709rUWrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduhffffefhffduudetvdffkeetveeiueegfeelleffiedtuddt
    ffduhefgtdefgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:Mmi0Yz1OsLjfm_IkpncCnLTdTU5zX_3ETiF2zrokr6Hae927X9TUDg>
    <xmx:Mmi0Y1Hi20uqFRepiCYMU38DV3bRWqMsVxZCtYZxOccqKEaqceB0mw>
    <xmx:Mmi0Y8--hju2a4AyxXA1z_3xjha49esfvTrRUJ6Oe62trjaPgsi6-w>
    <xmx:M2i0Y0B4GbZOV4tICJ2STc5iL9V8bOOpiVrvUoj6iXG_YUdAIKx0BQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 12:38:57 -0500 (EST)
Message-ID: <6c8b40e5-7543-c86a-e3f1-f9df12e3745c@sholland.org>
Date: Tue, 3 Jan 2023 11:38:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_093903_756775_C6BF5840 
X-CRM114-Status: GOOD (  20.03  )
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

On 12/29/22 16:46, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Having a clocksource_arch_init() callback always sets vdso_clock_mode to
> VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
> required for the riscv-timer.
> 
> This works for platforms where just riscv-timer clocksource is present.
> On platforms where other clock sources are available we want them to
> register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.
> 
> On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
> avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
> move setting of vdso_clock_mode in the riscv-timer driver instead of doing
> this in clocksource_arch_init() callback as done similarly for ARM/64
> architecture.
> 
> [0] drivers/clocksource/renesas-ostm.c
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Samuel Holland <samuel@sholland.org>
> ---
> RFC -> v2
> * Dropped vdso_default static global variable
> * Used IS_ENABLED() macro
> * Included Tested-by from Samuel
> 
> RFC:
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  arch/riscv/Kconfig                | 1 -
>  arch/riscv/kernel/time.c          | 9 ---------
>  drivers/clocksource/timer-riscv.c | 5 +++++
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..9c687da7756d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,7 +12,6 @@ config 32BIT
>  
>  config RISCV
>  	def_bool y
> -	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_HAS_BINFMT_FLAT
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 8217b0f67c6c..42bee305e997 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -30,12 +30,3 @@ void __init time_init(void)
>  	of_clk_init(NULL);
>  	timer_probe();
>  }
> -
> -void clocksource_arch_init(struct clocksource *cs)
> -{
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> -	cs->vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
> -#else
> -	cs->vdso_clock_mode = VDSO_CLOCKMODE_NONE;
> -#endif
> -}
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 55dad7965f43..c416e5e934bf 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -77,6 +77,11 @@ static struct clocksource riscv_clocksource = {
>  	.mask		= CLOCKSOURCE_MASK(64),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	.read		= riscv_clocksource_rdtime,
> +#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
> +	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
> +#else
> +	.vdso_clock_mode = VDSO_CLOCKMODE_NONE,

The else case isn't strictly necessary because VDSO_CLOCKMODE_NONE is
the default. Either way it looks fine to me.

Reviewed-by: Samuel Holland <samuel@sholland.org>

And I tested v2 as well.

Regards,
Samuel

> +#endif
>  };
>  
>  static int riscv_timer_starting_cpu(unsigned int cpu)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
