Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5629C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2bUFW4iF4nhfvclUl3QukW4EaGwi4WpJSVe4dpy9/s=; b=qbtMdTJUMZK98E
	gGGpOO3aoRPAdJ16dgbfJ4y707ySSMoKgXQf8UwNqQ4qR107keQPiOLuF1MiaWUIozfxM8X4GZgDq
	UeLBxj0/CH5YVxfXRed39cUAcnmybdrCnI+9We0aE1+FyhGiuDIMmEUx00tiYspD8m8qvZMGiYV0q
	2Fj27QsYmLWAevxYN4YVfYTw/68O522Z1SCjLO2Tl7CvgT13sSFKQRXc93glISACsJ6YVMUzcY5LL
	aR5YU+K7yKHltj1Ztakpbq94QNlezTaqz8XA2iCUJ6DXneJTMXeHx8c1H5AYC5018QAzhDCqBbhGz
	A3cAuR85YMn/RSjaqQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msL24-007qT3-7c; Wed, 01 Dec 2021 08:32:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msL1w-007qQl-9Y
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 08:32:02 +0000
Received: by mail-ed1-x529.google.com with SMTP id x6so97927221edr.5
 for <linux-riscv@lists.infradead.org>; Wed, 01 Dec 2021 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5HOck1fEk2VUiruxwewQWZzWWWlPc/W2sLGU1bYMrc=;
 b=tcvSR5VNdA3GOJ0wdRaUkZ12xaQZCRclO2Rmxaf/cusWemvGwLfvHTqq6FLFEr6fZk
 nPj7+B/CK4LARDHsHbYrxJyHX53LQUjKXtkeBcrRXx0bSjSSO1KXRyG+X/il5UXsuJFG
 z9g0hS1eNWXOOxUeWht/oXKSDTeF63Wd2nYK8cqmSyKIfUi7fb97ZUES0AGBxwzNjtCz
 3LP6Zdv8Bef3bNkzKgh8Ek/C4LuJgI2TYO/QJzL+wz5i8VMOfS1fNms+HCA1Q15O08DJ
 cwMYNsqMB04F/4hhIMjjKiwG3egZhTkblyQjzJFEigZfjCs/6pN/GXXk/UWnzNP8PB5J
 6JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5HOck1fEk2VUiruxwewQWZzWWWlPc/W2sLGU1bYMrc=;
 b=RDyIwVo8BCvx1z04bFrVziN0mZ+yJUwSEf2xaCep1m/JRYZ0naxC6NG1XfdOCbXpcu
 vqU1bYyzAzrYXgXhAJ7phYJvVnsJauJEOMPgXf+UC08ALq+gkRKH1dH4CLhcHLAnr5Rg
 ahfC7t8Mau3REuJtsur5rbLVlu1EUJ3SRE+036bmZ8sWCuSqE0UcL7QYynpOhxnwb9vE
 Fszfaaw2rU2TeW/Ap/HNiHxL+rC9sGLRNUzdaHHQeTIlU+ig39hT8Kw9o/qt2DZ9HLhx
 W+O8SsUG9j/X7CMgjaJI1UIUT7+IOFuMMzaWGucgRz5kr1haO3mIE5SuljKABUqHy4SS
 DjHg==
X-Gm-Message-State: AOAM531wpA4qH482/PFhn6IdtvaKWYYqJ0Qz+G6n00tgPUAu5TjibLKE
 EveGJpX6L/mStC8Zdp0ryChuIyVBQymbNfX8qIKm0w==
X-Google-Smtp-Source: ABdhPJwc153YPxsCmrMpC83eX6OEq/+lb+TpgYJaHlvE++shwkC6Y1HTqxmqyp56ZKFJLq4p0tdfAhGegMst5hWjvDE=
X-Received: by 2002:a50:e611:: with SMTP id y17mr6611165edm.270.1638347513444; 
 Wed, 01 Dec 2021 00:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org>
In-Reply-To: <20211125152043.162655-1-geert@linux-m68k.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Dec 2021 09:31:42 +0100
Message-ID: <CAMRc=McNjiOhth7YURTppWnL_rvd2Erh97PJt09cchCqbGrQsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Yash Shah <yash.shah@sifive.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_003156_357039_53813992 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> To improve human readability and enable automatic validation, the tuples
> in "interrupts" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index c2902aac25145205..e04349567eebb72c 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -77,7 +77,8 @@ examples:
>        gpio@10060000 {
>          compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
>          interrupt-parent = <&plic>;
> -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> +                     <17>, <18>, <19>, <20>, <21>, <22>;
>          reg = <0x10060000 0x1000>;
>          clocks = <&tlclk PRCI_CLK_TLCLK>;
>          gpio-controller;
> --
> 2.25.1
>

Applied, thanks!

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
