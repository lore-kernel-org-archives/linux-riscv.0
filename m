Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59453C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 02:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WVaxsSB7PQM6texoW3GCKs3MX3eW880Srwh8Ge4u6g=; b=l40uzb+ujYbOd9
	WPRPT6K8y15JbYVDWvC1+4tuPOe9LPYXZJ9VdJjWbhxnW7QoJKMzdnHHMDeSO6mr/n1zQBEZ/aQdF
	2nuh1yNn/JDy4qta8O9gECt3O3tCrmMn0wusWxTUw4O0E/carotn3At0URUpmEDwe9astGJDsxAuF
	K8RrGA7pNVXPSL0uZMsieSzYDyQPZpxwcoj5yzy0Pvo2hXa9u4c/AGk+RhQ/V/yXMlCUTLggEiSuq
	aFabRZK9kC3QkUsh4N5Fts43r1akywyGB0uRQk3QTc4IPYx4wjnBFOt9ncwdMxwsXgIWaeg0C+cTZ
	AVFpGPd1lMUKmH1zWBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ58-00GRho-F7; Fri, 27 May 2022 02:52:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuQ55-00GRgv-AA
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 02:52:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7DD45B82219
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71029C3411D
	for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 02:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653619919;
	bh=OhUSVwwxmQWmtdYehk2z+rTsYhQelhX/UsHYByr0FqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gNEFVg8VpES7qyfTs9UZK6a/EoBEP9rHRQZgrEb9ycWCsRkKYGQcitJrxcIQesWwO
	 0W3H1SFpC4jZj8+ygsc9PQNI3vKBpZcIelWyuGscvzopoSKomwk26ZYwuTykV9ft2+
	 x8LXguvGiqncljQE2maiMXdLJ7H0wuWA3ULhScIcQV993xXD28g0UR+LYwTce73E/K
	 uJbUGVAlzPG7gXp6CBDuMJPQm1G3RSe7hkh3Y/B48abcUP8dkmZOJgTw7Wj9afu34c
	 JgQdPPZ8IKtcw4NyWltlE/1ce/n26st3t2B+tyAeTS9497qeUNPSG0JJuulh6aX3k5
	 MGG89ws7BKYxw==
Received: by mail-vk1-f172.google.com with SMTP id d132so1527886vke.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 19:51:59 -0700 (PDT)
X-Gm-Message-State: AOAM532BRW5S8bU3oQAdxXfes++xX+HgfxWY/WPqsnfD8V6FYsUOLoUJ
	1OaLBEsiINEJksQcbzX3az7QcXMeJ22n5SaKJM4=
X-Google-Smtp-Source: ABdhPJyzoytGEgPaq6S94T0HlxJIxiV6vIsr0HjRiAqFC2P06wXo4MZ5JQvchtpJf2KygzwmAzX0onAw2PR63kBlVb8=
X-Received: by 2002:a1f:1f55:0:b0:357:a8d7:b76c with SMTP id
 f82-20020a1f1f55000000b00357a8d7b76cmr9159707vkf.35.1653619918334; Thu, 26
 May 2022 19:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220526205646.258337-1-heiko@sntech.de> <20220526205646.258337-3-heiko@sntech.de>
In-Reply-To: <20220526205646.258337-3-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 May 2022 10:51:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSd-XJiSQcS=dY5YTSL_V4wJQb+e7yRywNsrTfLstQfA@mail.gmail.com>
Message-ID: <CAJF2gTTSd-XJiSQcS=dY5YTSL_V4wJQb+e7yRywNsrTfLstQfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: Improve description for RISCV_ISA_SVPBMT
 Kconfig symbol
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_195203_682497_39FA85F2 
X-CRM114-Status: GOOD (  21.44  )
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

On Fri, May 27, 2022 at 4:57 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> This improves the symbol's description to make it easier for
> people to understand what it is about.
>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Suggested-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 65285b980134..a4b299ad4473 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -356,8 +356,13 @@ config RISCV_ISA_SVPBMT
>         select RISCV_ALTERNATIVE
>         default y
>         help
> -          Adds support to dynamically detect the presence of the SVPBMT extension
> -          (Supervisor-mode: page-based memory types) and enable its usage.
> +          Adds support to dynamically detect the presence of the SVPBMT
> +          ISA-extension (Supervisor-mode: page-based memory types) and
> +          enable its usage.
> +
> +          The memory type for a page contains a combination of attributes
> +          that indicate the cacheability, idempotency, and ordering
> +          properties for access to that page.
>
>            The SVPBMT extension is only available on 64Bit cpus.
>
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
