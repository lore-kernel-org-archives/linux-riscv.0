Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CECC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnuVGbMut7bi8rxGFHFpIyyIEJV13fT+nZjqplJ3jvU=; b=NOUQ5/ajqo6Wp0
	6/mQtb1JPfMfT3pAvPhasHr9Tr3tP2eb/C9yynvkV2TxN3oyJM66cuH0anO/+3AyBRJphQyq1wPPP
	bpaQX4jh5Tfs31agM3ZgfKmp9hb3Ll2vZJTPGHQviPB6jUW8j8/Sa5D4YcFDQ3mOyvr/bktUYns2/
	odcJuQX4oAU6HFmSQ5avv0bL5Qd8zhpJ4zcCgwg2kJpd2EYqLJgzYURC8SRWwytVsfdrPePIr6O41
	aqJxK4bs4vHsPxA6XuSsMf8yTos/QMcB5DKV5gLZy2W6JgD+qCUK29UExQDHml/vmo/rI9nrtJ6g7
	EGJA/qj0YDdffiEDLX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA5F-00DuWu-Gf; Thu, 11 Aug 2022 15:26:53 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA5B-00DuPK-Sr
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 15:26:51 +0000
Received: by mail-qt1-f171.google.com with SMTP id c20so3892213qtw.8
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DTtQnNq6ywRHsZZL/uujOqWlFtBnXuiLlCZYEJfCk7M=;
        b=caHu8zAgvqt7g5pHzWo9AS9UEL2GRK80JjpB/O4/1SjNKCnlZKN84Tflj+KuwAC9rK
         bk/uJNW9etnpVNG9xYMwMT/i+VgeNb7oIlKwygftWuYd3OCNZyD5z3XbPFPwIQE5uF/f
         I201xkF/d2RpYlTyA8JzjwPQY2LUb62IIMEXWMGcxm+00Qy3VMIsKImIGube1O9eODmw
         DroNLBiCJtTyaF7usXOqcCXVR+NxcNFqliW6/iwNIyHvhTU0wJTbr2kH+XQMsV347FBr
         AY+jwlgPEp28QTSAdu2rsWgrT6Uq/C95/5j63eV/nr8B5rDbHYA3ItGMjpgBZH9Dq2Qg
         wHvw==
X-Gm-Message-State: ACgBeo3p3MZRcp5S+rVNqTTQSCdegP+XetFzSyeIoGgNvmTn5Dm40Bpa
	sTV9P3RtfFDgUHkzmgHtf0q0FchgHfwcB4ze
X-Google-Smtp-Source: AA6agR5/JPd35G8qAEIa/BFkeHprY8CKErGCm7zULWSecOrwOcOquOrwBujM97GVfN15nYilav7y3Q==
X-Received: by 2002:a05:622a:1354:b0:342:fcd9:23f4 with SMTP id w20-20020a05622a135400b00342fcd923f4mr15477469qtk.424.1660231605757;
        Thu, 11 Aug 2022 08:26:45 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id c2-20020ac853c2000000b0031ecddf2278sm1776718qtq.37.2022.08.11.08.26.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:26:44 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31f443e276fso176560747b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:26:44 -0700 (PDT)
X-Received: by 2002:a81:af42:0:b0:31f:4e9a:74ad with SMTP id
 x2-20020a81af42000000b0031f4e9a74admr33633524ywj.358.1660231603773; Thu, 11
 Aug 2022 08:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org> <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
 <3e3c0c80-48eb-098d-977d-a1801036fc0c@linaro.org> <CA+V-a8tJVGz57FcJVnbksMot=pg5dXALo4QEyqO+57HnOTJLfQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tJVGz57FcJVnbksMot=pg5dXALo4QEyqO+57HnOTJLfQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 17:26:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWih6XiVfLT0g=k8QrMmVzb2sqv9hxqtGE1t1F1Jvj_QA@mail.gmail.com>
Message-ID: <CAMuHMdWih6XiVfLT0g=k8QrMmVzb2sqv9hxqtGE1t1F1Jvj_QA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_082649_953895_DC549930 
X-CRM114-Status: GOOD (  29.56  )
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

On Wed, Jul 27, 2022 at 11:48 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Jul 27, 2022 at 10:31 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 27/07/2022 11:00, Lad, Prabhakar wrote:
> > > On Wed, Jul 27, 2022 at 9:53 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > >>> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> > >>> (RISC-V arch).
> > >>>
> > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
> > >>>  1 file changed, 9 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> > >>> index ff80152f092f..f646df1a23af 100644
> > >>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > >>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > >>> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> > >>>  maintainers:
> > >>>    - Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>
> > >>> +# We want to ignore this schema if the board is of RISC-V arch
> > >>> +select:
> > >>> +  not:
> > >>> +    properties:
> > >>> +      compatible:
> > >>> +        contains:
> > >>> +          items:
> > >>> +            - const: renesas,r9a07g043f01
> > >>
> > >> Second issue - why not renesas,r9a07g043?
> > >>
> > > We have two R9A07G043 SOC'S one is based on ARM64 and other on RISC-V.
> > >
> > > RZ/G2UL ARM64:
> > > Type-1 Part Number: R9A07G043U11GBG#BC0
> > > Type-2 Part Number: R9A07G043U12GBG#BC0
> > >
> > > RZ/Five RISCV:
> > > 13 x 13 mm Package Part Number: R9A07G043F01GBG#BC0
> > >
> > > So to differentiate in ARM schema I am using  renesas,r9a07g043f01.
> >
> > What is the point to keep then r9a07g043 fallback? The two SoCs are not
> > compatible at all, so they must not use the same fallback.
> >
> Agreed, I wanted to keep it consistent with what was done with ARM64
> (since both the SoCs shared R9A07G043 part number).
>
> Geert - What are your thoughts on the above?

"renesas,r9a07g043" is the CPU-less SoC base containing I/O devices.
"renesas,r9a07g043f01", "renesas,r9a07g043u11", and
"renesas,r9a07g043u12" are SoCs built by integrating one or more
RV64 or ARM64 CPU cores and the related interrupt controllers with
the CPU-less SoC base.

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
