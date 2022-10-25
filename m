Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C84C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzyb9w5Hfy4ES9XFMG9cvgRPZWH8OjAlALrsMReiVnE=; b=MnyYgsAGUPJFvw
	UEWVZ5kS96x/vFR6pfdz0WYYA8vB8EJb8JcoNivH8/nhrllBQ3bkIIsAenZfcxjf9IynPvOaWpXnT
	2ZTup+SGyAJCNGJdTyM8279c1W22pmeP61uZTzh5ueIUdSRR8enNylwUkavE5IvlH7phEQpPwQ5eN
	gA6zmOMt7J1HFl9HK/TC+OVH5fCSox9qB1+qknvZ/tF0d4FDLjtEfWPRsRJMh6Nc0mfDMs8AbEAA8
	XauABI6SnoRsKGLOwEfvxWLL8oba3hZo7lhgCO+Nc7TGGvSiCZshqwyo//L3J9pPCSuw+N+qLO1S6
	yDYxtfb0zo311DyOKUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJMN-005H1E-2J; Tue, 25 Oct 2022 12:48:47 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJM1-005Gs4-0I; Tue, 25 Oct 2022 12:48:26 +0000
Received: by mail-qk1-f182.google.com with SMTP id o2so7891312qkk.10;
        Tue, 25 Oct 2022 05:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaYh77K+gCSv1Fw/DuS4kr5mhCxIMTP6JrJoQ/+vP5Q=;
        b=5vgeF3pks+H9CH4yK4+msWgKpRirorzLrJkn2M3jrVyc/Kx5HPkc/TygzFwJLNtSyj
         1m5Qc9fAA+5a56TYYIYM9aTVTX4V8tNXh7LTtz3/PMm9o5UEQR+du99bR71P9AownFxU
         F4Wj4MyHny76Yb5eLpHN36Xe09W9cPYvS3716KVPYeZhadUGlz7mhpSvOKPSAXXvKyry
         nofWPTD7EIa37AROMDMD1SWnyG83NE5c8QUY6/SEWmhuASo0pmjDPlaTQC3DbIfKr2n1
         gi3AMYNgeU/J5BrcTw1y/f0Qiw4ePdX565g4eP5+cm6JNg9KYhk1SSFwPzI3QZqp7JiT
         /XSg==
X-Gm-Message-State: ACrzQf1m6gO6ZTF0xvuKW6Al12T0KRE616TQLKJ9l1fxYIB5JFcK+IhK
	6yQui8dtW/Y5Ccw7zB4TNx/8WbHVyswXWA==
X-Google-Smtp-Source: AMsMyM5AC+jTzWoXxii4NSxlNk0YuTG1eTIpc/WgN3vrNGEO9nYcH/Hxqy1612l1qUjiJIKSR20fGg==
X-Received: by 2002:a37:e10e:0:b0:6cd:f114:6a85 with SMTP id c14-20020a37e10e000000b006cdf1146a85mr27052176qkm.77.1666702102506;
        Tue, 25 Oct 2022 05:48:22 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id ci25-20020a05622a261900b00397b1c60780sm1518608qtb.61.2022.10.25.05.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:48:22 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-36cbcda2157so54950017b3.11;
        Tue, 25 Oct 2022 05:48:22 -0700 (PDT)
X-Received: by 2002:a5b:52:0:b0:6cb:7584:1b20 with SMTP id e18-20020a5b0052000000b006cb75841b20mr1953298ybp.380.1666701756292;
 Tue, 25 Oct 2022 05:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:42:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
Message-ID: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_054825_064087_51A77C40 
X-CRM114-Status: GOOD (  26.28  )
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

Hi Prabhakar,

(now replying to the latest version)

On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> so that this can be shared with the RZ/Five SoC.
>
> Implementation is based on the discussion [0] where I have used option#2.
>
> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> (r9a07g043F.dtsi)

Thanks for your series!

> Sending this as an RFC to get some feedback.
>
> r9a07g043f.dtsi will look something like below:
>
> #include <dt-bindings/interrupt-controller/irq.h>
>
> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na

Originally, when I assumed incorrectly that dtc does not support
arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
although the second parameter now has a completely different meaning ;-)

However, as the NCEPLIC does support interrupt flags, unlike the SiFive
PLIC, there is no need to have the flags parameter in the macro.

Moreover,  it looks like the SOC_PERIPHERAL_IRQ_NUMBER()
intermediate is not needed, so you can just write:

    #define SOC_PERIPHERAL_IRQ(nr)  (nr + 32)

> #include <arm64/renesas/r9a07g043.dtsi>
>
> / {
>    ...
>    ...
> };

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
