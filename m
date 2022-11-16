Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB99C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kykg2ru/Gz3hrziVkDBxx95SZYOztAsd0OynT8VGbA=; b=LIpMFjtdZ4f08o
	vVrYSjh9Qvh6dIWnNmO/ZHXXblIGGCT1uW4r+GbYK5cXSYynRLJR1NjINZt6Lbu3g7mGarsEJMR/k
	WX6IijdIMzFJ550ti/lYKGDoYxW7IOnaU/0Q9o3q0gqGEIx4SvVVJpq/FFjSUNLELFdxNV6BY3P5v
	m9JsqXaWu8x0F8G5BcUJ/+Fco0iASAD8GmNXjsLeGi+aP5AsT/q07Qq/7wTe/AjFzf5LiLOf880cu
	L8hQWSk0edXx88gkhggCBNpbj2vnMuHzxaP4g1x58Qz+ZR750OlYooRL8euwvfiCLcA/j4mTZOGmi
	wZeyhIgnUTx6m2wsey2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovESP-001YYd-SL; Wed, 16 Nov 2022 09:11:45 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEPZ-001WW9-V0
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:08:52 +0000
Received: by mail-qt1-f169.google.com with SMTP id z6so10307067qtv.5
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIWXjhE2AkSBl2f/+niXCfGWT7FJ5HFVL2ihSjlnu8U=;
        b=6X4guW20CR2NNI4s8tOVKwv6USyipBnDM/Bwth5K6MzkHdewGEpkP8AepEBo2mOwsX
         NjWACaOUOOejyAiEnDGHBwOp9H63AEz8URp16mZnKryPixfEUfzC6Jhc89MaCLun7E7z
         3A6X0nXNZkchYiCsIA9d6zmdTwx+3HOa4RAgdaB7ioy1NAjspBTo/lvPRT4jcuVXtn7G
         apVch/N06EQ3WhFsc1JXebGuGcaGAZrOjBEeJ6R2afH5mhs2pzyi9/yuiZw3umu/nJ4Q
         wvc4V8xoqLm36bBfhYjF0uqlddBNHHIkcyOhJVveP2QxwiJuQPrP3/Tt/dOlU/X2ch3S
         LuuQ==
X-Gm-Message-State: ANoB5pmXnRpAVyUlNfpeCQ7/cOQZJSYeeVguKe5+6nik9A8m6I9B7zPi
	g4XgLMD3F7TNr8xm9SambC4YXi/uSJfitQ==
X-Google-Smtp-Source: AA0mqf6AD1rDcvfxPzkL8R8IJH6/xW4VlKSmNLtFmQxsKhScS1pePWkkojPn3dty2JJvt7qg7BEA6w==
X-Received: by 2002:ac8:4a10:0:b0:3a5:7c31:2e3e with SMTP id x16-20020ac84a10000000b003a57c312e3emr19956579qtq.111.1668589727302;
        Wed, 16 Nov 2022 01:08:47 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x28-20020a05620a01fc00b006ed30a8fb21sm9400839qkn.76.2022.11.16.01.08.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:08:46 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-367cd2807f2so161856987b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:08:46 -0800 (PST)
X-Received: by 2002:a81:1c52:0:b0:357:66a5:bb25 with SMTP id
 c79-20020a811c52000000b0035766a5bb25mr21236225ywc.383.1668589725887; Wed, 16
 Nov 2022 01:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221115105135.1180490-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221115105135.1180490-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Nov 2022 10:08:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhn6UT+SnQsVOy52NJ9f+W_zuEBB-Yh9qVK4kxrVdbOw@mail.gmail.com>
Message-ID: <CAMuHMdXhn6UT+SnQsVOy52NJ9f+W_zuEBB-Yh9qVK4kxrVdbOw@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_010850_059036_63D8BCE9 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Nov 15, 2022 at 11:57 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable CANFD and I2C on RZ/Five SMARC EVK.
>
> Note, these blocks are enabled in RZ/G2UL SMARC EVK DTSI [0] hence
> deleting these disabled nodes from RZ/Five SMARC EVK DTSI enables them
> here too as we include [0] in RZ/Five SMARC EVK DTSI.
>
> [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2, with the other DTS patch.

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
