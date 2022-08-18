Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA32C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVusVJ6qUu/DnWOt1mLMJLkI1DR60YHqz+44nXhbXK8=; b=ex0/POAU9eWqpD
	9Svexp6Vsh19cqo2RcbOJUh68ugB5n0u8a/nf0quZUo25+SX/ZEFGFNKEoSPqwosTgMIcCas6FHB3
	JXLAjDrjS1EQT2H+o9GRkQGrebjysku+CEP8z09rhnDdfCuHT7rm7Eh4y00ExLYjuMyurcS3n+QWD
	/Ro5YhkhIyCyYSvlzYLcc8bRlQr4ruAcBge7G5DyQWb1yNd59Sl61QYFb3S8CRbUNn5S7myt33+XF
	2NbV20FribV9hN+mUGSGIlEn4/NqLAz4LXxMROio1TEsRH4kUg6p3wA0vJ8uasK8aHOAaFiodtn46
	kEs2zpDbPoKR5HFYGyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfeD-005Sh4-W9; Thu, 18 Aug 2022 13:33:22 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOf8y-004ylN-Tg
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 13:01:06 +0000
Received: by mail-qk1-f175.google.com with SMTP id w18so1005398qki.8
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 06:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zGVvOzOw3FBTHFQT/EuMN6lMzvUv1N/cJk4RG5KAwTQ=;
        b=kzHoqAwJMxuTqrdF/W513fa1eIyjN6gsFgcS3c3qu5aU4coUvRAgegTTaP8tPYNpSv
         J7WPnyOWpQX//5u0J3L7L3h3uLQI1KL/XAoWz9glT3EUdn78lSiqC/ejxb5iFIRktUL3
         P25R4fXhUh6T3C0ySHV6FCjDC+etx6A1gaxRJovKXtfMTyHcUL9bwGjwj6S8ECdJdCDo
         6hD1pb/hT+eFk5D0VUA4f2bqwUQ02hOiqWykrIlrzThSkoIFf7JJgEwG9NcvHNJY0GGL
         xgFKFYjrI4/dXYWQ+AYfl6xmTjqd1VR17n3pgd75nWj69fQOp74HhFcUk3h2qZzlLS9M
         tigw==
X-Gm-Message-State: ACgBeo1k1hUOnkBvQ3hAdGYn233cB5KZRmnMwXzvfNdogBttFSOGVg45
	ZpAfNfVFC0uTRc1RU1KX+wMYS766WoBtJw==
X-Google-Smtp-Source: AA6agR5eBtzGMT+OV81dwPT9n4Pv/VCHiPz+/GjfmatUXO0npLqZeIaLyttRPK5JrV7z9V2TLKBbuw==
X-Received: by 2002:a05:620a:400f:b0:6af:53bc:7311 with SMTP id h15-20020a05620a400f00b006af53bc7311mr1880321qko.305.1660827662026;
        Thu, 18 Aug 2022 06:01:02 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id m2-20020a05622a118200b003434f7483a1sm1011578qtk.32.2022.08.18.06.01.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:01:01 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33387bf0c4aso38341667b3.11
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 06:01:01 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr2722232ybl.89.1660827643670; Thu, 18
 Aug 2022 06:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 15:00:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+srXk8Wv1POMeLaoUnEt6TWUK3KVq-YBAbLtnk9AGjw@mail.gmail.com>
Message-ID: <CAMuHMdU+srXk8Wv1POMeLaoUnEt6TWUK3KVq-YBAbLtnk9AGjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Sort the CPU core list alphabetically
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_060105_070504_E67E69D4 
X-CRM114-Status: GOOD (  16.53  )
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

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Sort the CPU cores list alphabetically for maintenance.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
