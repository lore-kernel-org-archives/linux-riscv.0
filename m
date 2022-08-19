Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D109C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeRi5/QwP3Han96m60J4/VvpvF9xl23/MKeEQahDjGo=; b=KtemupFqjqyddx
	G7X/+eN/+D+YWZWDSTzfdsB6tS9OJcRtMHXuNgZl3UOByIbTOcebK3RAk/pIiOufLaQNFa9JxpCfn
	nMvjFbssArhTDkzkSCO4n+qiUfA/WNVkdrUs3VWz/WLhJPTJM6aL03OQq0egwu7/mcKYG4sMplFoI
	JKN6KlhX/VZb+qO9D6PySFTS57eP0HYf4bUv7mJfIJjfvmWLHaVQ5tA60HiCiYIQR+qzvvpB1NzVC
	3jZ25c5c88VSVpc9iKVSkE+ogm0AVzqVGH5yWYZfrUKHYcuqqvylojwv814AgHtJtkBmvgYV7Rq+2
	eNWVlzEPiirrRfLKbwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOx6u-003ry2-Ds; Fri, 19 Aug 2022 08:12:08 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOx6r-003rwh-W7
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:12:07 +0000
Received: by mail-qt1-f180.google.com with SMTP id l5so2829210qtv.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=13cZgSYlONAYh9NAs+6LHBFcHKVS3iOvfRVkc4Te0KI=;
        b=vn2W8pwALM96en2BPJmvhS2opYnNfD44xGX0uyllAq9me1c4r1k66USzJIpx26cXBL
         iIHAfPr/bmx/aOFbhkMGS7Eg015E6lheTwyRASo3+8QIv12860D8x3BFoh5qBPEquJcK
         fuwe3vMSBxGx+WafqU7kSQs/bzMyKqmFcqKIJsgI4uLMW0IxUjZxE6IT3AXRF7V+ZKda
         tn3QEADVc5iQ8K0JZ+wm+H6pGPmFWn//NSwSBpMm37yvEvjL2fAULa6hGczpH0xAH2Gr
         QSkuXZ2jhGZ2OMMkHr1Giz1r2CXox63PpV/FTxC//FZqmSZ7aq9sl4mBJUGGjxuJKJRY
         yehA==
X-Gm-Message-State: ACgBeo3lwax/xWCzagOtIez5gvAAc+hP86c6B3u/i0/+7PRKMyODzn/T
	w+f0Ugj7dq4JyKU89zWe/K8ddvZS8++wYA==
X-Google-Smtp-Source: AA6agR7uOcycFNtZF74PZXM/2mP+DK2NLrqbcKFuVqc8A2i5CET756scfC0OHJaIIvJHPbJJ2AnmYw==
X-Received: by 2002:a05:622a:20e:b0:343:7345:36cc with SMTP id b14-20020a05622a020e00b00343734536ccmr5630624qtx.669.1660896721761;
        Fri, 19 Aug 2022 01:12:01 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id f1-20020ac84641000000b0031ef6dd9700sm2647042qto.55.2022.08.19.01.12.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:12:01 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3246910dac3so102188597b3.12
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:12:01 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr6358491ybq.543.1660896721064; Fri, 19
 Aug 2022 01:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 10:11:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYOWZ8tG-OLLam3ROAtriO=VEOH0nrWfC2T1iOoq=LWQ@mail.gmail.com>
Message-ID: <CAMuHMdUYOWZ8tG-OLLam3ROAtriO=VEOH0nrWfC2T1iOoq=LWQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
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
X-CRM114-CacheID: sfid-20220819_011206_053981_AC926DB8 
X-CRM114-Status: GOOD (  16.58  )
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
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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
