Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D9DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcu4TjN56ptt7ioL2Xbmc/R4cSjJNZCrat5T9q9Krnw=; b=Bhf8cNoWzmp8Qj
	AmhtBKHgOW6kt2vMellfCLnxQ/CiGTqMVNouBH0VTjOnRnlaarAin91BqAsP0dmhhcLTVwW/y/cJF
	yiLUvypd30mYhcP6t3IHadA8VWxiy8RRiDYtC45a5fcZA7mIXt4fJLBjo3T0kdc9VMy9+x7m6fVDL
	cFK93tzemq9VMMgM7CaC+YTAygLD/GP76juQOx7mmtuGkZe1F9A2SP99O74+okEUyXwrQfF9VR0wN
	ARNgOLsDqKCYIkHxyY8GUqsNvtJavUKst4EfqjR0VAAREfxr4Ows3WtR7++Q8ACXrcTDmaqa55fVL
	VwSDsaTPvsKZo0kPv/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ED7-00CWHS-K1; Mon, 19 Dec 2022 11:21:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ED4-00CWDP-RF
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 11:21:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id c66so12378596edf.5
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 03:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQqA7ygsto6xaIwShunauCg+8P+zPr4dDwx6z8aEPXk=;
        b=Qecx+b4KPAd9/b+nHyGpQdY6ioSxL7WtnO/O8BKN3xlRrLDu4JKdWez/YZqgCM1pkU
         oHF+aaw7v+iHBPAflj8s1AqvmZPQf9WosqgePDkQqSAMQsZRl9uS6MDOBkJs4qLTdjLN
         SQApEspVNLNaQtalgfWwNv3X2bW2/XQSKHnQdyEIWc6AMe/ah26IgFYyZZGzVZxVlSit
         jxESMo2+x+rGcJsXCPmlVQUoUOJvFjEOzZ6pxPwjXk6pLb/8BuVYiftWXsCQRuk8IkRI
         8229+/qKrVwOXwHsVskI6ZwbVklg1K/bbTEOgTzVO6ge0EC+UYkPwu05a4ta3BUOzrb8
         Piwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQqA7ygsto6xaIwShunauCg+8P+zPr4dDwx6z8aEPXk=;
        b=YYGVgxsOsoRw1Tu1cLRaRIXd5tKRmX+jLPpFVOwQzwVsXfx3XKfvYE7wfkTwq5t322
         hwh3ERW1pqz15chyfNj9hpun51HfU2V87BbJYaxZ1+ZEHCym/ngJLjQjnChkdr3BfkY3
         ZmDn6t6SBHKsoVU9LnWNlMUCg7ggLvS+JjLDQ3whA/GsZkEJxCk93pKGGj7aHdpJS3pI
         hT1tgkHJUNTQHyBdkXZNl+uCvfKWiztDH9wnrFaaCAbQliER/wvueQRh0FrXzNmBmi8Y
         a/2ORdmL4EWwE9IFdQPDThz/feekioG9RxwFB7L5m2JJ9u7Hl2OXwkQ1MMxwVijTNe+z
         Gl+A==
X-Gm-Message-State: ANoB5pkSFcsN/qTLxeDc86aPBrM/xSdGa/Q0Gxb0zQl9jNu23xV34c/v
	3KgOc39AvsvWjl7Ukqr8aZwjpezY+yrF9UqrgAw=
X-Google-Smtp-Source: AA0mqf4MJzdQeHVxrr4jU2yyYqIoZSH1BCgma3gnh1/Vinrzu8kFrTI3pr7SAtSy6Z9epAityEv24oeSY2sHT6rbsPM=
X-Received: by 2002:aa7:cc08:0:b0:461:8a43:e93 with SMTP id
 q8-20020aa7cc08000000b004618a430e93mr10171686edt.275.1671448887967; Mon, 19
 Dec 2022 03:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y54r+5lkSvgA9IxR@spud>
In-Reply-To: <Y54r+5lkSvgA9IxR@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Dec 2022 11:21:01 +0000
Message-ID: <CA+V-a8vdijL7qcju2zH2phfj2+NXNkw35g8j8KX=RR74jSAK1Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_032130_925215_691A4E31 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Conor,

Thank you for the review.

On Sat, Dec 17, 2022 at 8:52 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Prabhakar,
>
> On Mon, Dec 12, 2022 at 11:55:03AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass direction and operation to ALT_CMO_OP() macro.
> >
> > Vendors might want to perform different operations based on the direction
> > and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
> > arch_dma_prep_coherent) so to handle such cases pass the direction and
> > operation to ALT_CMO_OP() macro. This is in preparation for adding errata
> > for the Andes CPU core.
>
> This patch seems to break the build on top of the most recent
> linux-next:
> ......./stuff/linux/arch/riscv/mm/pmem.c:13:53: error: too few arguments provided to function-like macro invocation
>         ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
>                                                            ^
> /stuff/linux/arch/riscv/include/asm/errata_list.h:127:9: note: macro 'ALT_CMO_OP' defined here
> #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)          \
>         ^
> ..  CC      block/partitions/sgi.o
> .+...+/stuff/linux/arch/riscv/mm/pmem.c:13:2: error: use of undeclared identifier 'ALT_CMO_OP'
>         ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
>         ^
> /stuff/linux/arch/riscv/mm/pmem.c:19:53: error: too few arguments provided to function-like macro invocation
>         ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
>                                                            ^
> /stuff/linux/arch/riscv/include/asm/errata_list.h:127:9: note: macro 'ALT_CMO_OP' defined here
> #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)          \
>         ^
> ...........  AR      lib/math/built-in.a
> ./stuff/linux/arch/riscv/mm/pmem.c:19:2: .error: use of undeclared identifier 'ALT_CMO_OP'
>         ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
>         ^
> ..4 errors generated.
>
> The pmem stuff is new so that'd be why it has not come up before.
>
> (FWIW, clang allmodconfig)
>
Yes I need to rebase my changes on Palmer's branch.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
