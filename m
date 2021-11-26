Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06ADC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDbBlx6RA1/R/UPOgRe5YXDmEd3xmgPnbtSOEWZjBMU=; b=CuOPVsxqHIPqSx
	VbxgnsUwzqqPy2Mh04rlunAIBiTzbRca/LV0U8zErOaY3Je4zOmhjfc7uyVTPynfziCM/f2oCLqcZ
	hU8wwPg7ys0JGQD+qmP2g+H+ikAeV005MV12dm1Ny47PSY8o+GPCyAGgFqTkJQN42oCkGk5jjROIT
	zAxBL6W1bqEGhaXdL1FhSIW7/Lu8NOIUV+Mb2No9haBGNDAQbf3olT8/+/tppv/w+7eP1OlOFbtKZ
	92blrkSWJ0kb3F0jAiM06q/GXMFufT0cb3N9K28I4Jma+ayP4skEs01F9loKkuXZQ2gWJFXRFpkU7
	0xa9xHqc+OfdMEQXsppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVxt-009VU6-UU; Fri, 26 Nov 2021 07:48:13 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqVxr-009VRu-1r
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 07:48:12 +0000
Received: by mail-vk1-f178.google.com with SMTP id f7so5399906vkf.10
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 23:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+WB98uVMoTfL9kTGPdtgqlO5TacGgYCY8mjvq5BMMc=;
 b=RU0p6UMk3sOzzmMk8SwW4+7n3Vi2WOaj1Y5oHrjwAlHXSifDXkc2cqEIf/RnUsElm4
 z77w4SKVX4Wyspyhj/WKtANuFWTqgnjV43EsDXLsKxmX1ICHgWWNSuH7kZsOoSgE3l1t
 wa0/0hNjBu7/fHkLTx7w998g2rQonjf99WV/Iy+glxoSksVA4egUwvYVV1nlFmTHwJgx
 bi7cNIQFDnI2xv/LpeSFfqTbrllUmSCCr1wmfYeZcjYyopagzUUqEKOy+eSDzeW6clSC
 WfKGokbqf5OWS6rUSrngIlWw3NzlnO6/ghX+pSGSSuw/mJeYwMeSst5SaAUvVK3aSZlh
 N0Ug==
X-Gm-Message-State: AOAM530ZUHJKiNqaVS2srIyZpomvmCHDHQwxhvgRkER5gw2Iqjseso+3
 wTRUFTlc5Q4W3dfxYRwNOakWQ9ize9cVJQ==
X-Google-Smtp-Source: ABdhPJzqWjs4D2sWdDOEiUFKVq3NckLuMjvjwyE0iD6cxfbI8p4PYwKXpNtPhkJgUbt/W2FMiuswiw==
X-Received: by 2002:a1f:c9c2:: with SMTP id z185mr17853299vkf.26.1637912887811; 
 Thu, 25 Nov 2021 23:48:07 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id g16sm3091971vsp.18.2021.11.25.23.48.06
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:48:06 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id ay21so16897425uab.12
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 23:48:06 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr32201048uar.14.1637912886319; 
 Thu, 25 Nov 2021 23:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org>
 <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
In-Reply-To: <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 08:47:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0awdFCB+vWyy5TZMUeKoii8_Y8NaZO77sMaOniaOy1g@mail.gmail.com>
Message-ID: <CAMuHMdX0awdFCB+vWyy5TZMUeKoii8_Y8NaZO77sMaOniaOy1g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Yash Shah <yash.shah@sifive.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_234811_141673_30E9C9E8 
X-CRM114-Status: GOOD (  18.57  )
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

Hi Linus,

On Fri, Nov 26, 2021 at 2:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > To improve human readability and enable automatic validation, the tuples
> > in "interrupts" properties should be grouped using angle brackets.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> (...)
> > -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> > +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> > +                     <17>, <18>, <19>, <20>, <21>, <22>;
>
> Tuples? Hm they look single. Like singletons?

Yeah, plic has #interrupt-cells = <1>.

> Anyway:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

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
