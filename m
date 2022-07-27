Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D33BC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUe9nZMf2rWLg7PPx9ky4LrBvmML3R6Of0LANrNJfSM=; b=K6uszDHV1mdDfg
	7Xv5PwEdw4l4h9jBOm5mkuiJ3FxXSis+VfkkOAq5u5XpT1pqR+iaj3JyEylqrYGAQPAYgAqn+B1MA
	y22qSukLcWrOjvesMTD/WsuXMDcA0SzoKh+KAXP4VRdJCwEEO1NLDxkjN6Trs59DJHu0zndukxVTB
	8HPrJ0W75IMpGr856fVDp/iV1figHtSCVrNp3OPTvUfRKfyJdlwbgit5kbWMbuFU7Jy0+ERRlK4I6
	USW5KLZLfzmk8M61Yr8CMjIQTBAq2m6jCwm+h1SUlExXoZwCiNuYjTGIn5kdT8V+Xhb+DjhZQ8G1T
	mdZ/XwlPIlcb1hdihxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcpr-00BQXg-5Z; Wed, 27 Jul 2022 08:56:07 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcpp-00BQVR-BF
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:56:06 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 123so6399318ybv.7
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FkB6NL9eAnr19/TQLpmTufTfbZl37uoNWuGYLlmz/8k=;
        b=GqRkP7vFcAVq2DhhITbw1b0xfQ1uKUk6N6xmReUGdyyCKqbxM4CI7Fpe1h/97fSriA
         UrRy2LQNlfpk8GDHsobZT9fV74fJnv2kthAwTTDtdsT/nBhhH7KEfYbGkOsujUYJr2Tv
         eJjpGZpf7ScJwDsakDqoHDX5G2U5+pY83R03AJXK7iFTWfZJwSx1KvHpH5oNaTCAAWxw
         3ebU6Ts11JtpSpaHodhpQ6QeJCRTkyHJnUru1Xt5fJcTpMxS3bAgePlPON50cKKwGuB/
         QF5X14Q8ZVPhiozyWwGrZV3Q+F5tWEla7Lf29uSjyPmQzuOsaXChwzkm1evf60WcFtDT
         GaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkB6NL9eAnr19/TQLpmTufTfbZl37uoNWuGYLlmz/8k=;
        b=qn1CZSbBCwpM46/gOLZhD4Os3hyMp/ZMrOZgPdjq8xLbCsbe2HP/1r++t13Db3MdzR
         C3YCznRa1CCncAE1MkIMUc3ISI2tZAPMTWHqMTOKYQWHsKaTQyKS3SgDp88xHNZOVRAc
         gs//Q47zmO4uf9JHxZtppZvNHMvkWF5M+U0hKq4inqr5okq0hUNBxdDgZkg9Xf5JUae9
         YThfp1WwHYqlI+mKHlvzzsR/HetW1f77134DrRzbdUt6xj1B1hV/Sgxcoj7FhS4/M7TV
         YjJ9IXBrK0VMznsCgv9gQbeEY9QRpW1ASWBiAO7PWgmpO/nFO8MveVgQP8iKA2viKJFJ
         ALSA==
X-Gm-Message-State: AJIora8Q0kjah59w/m6MDfYm9ceDAcdLBg9FYjsiVmMsAqmzz4N/LShV
	ofvu3CF1zp5QLbKwenBPckP5Guf96EUZMXkkIN0=
X-Google-Smtp-Source: AGRyM1vxCFNIpm4r9DElzmSmhQabM1an5qQ3zyXIaUD5kyzOkB0PNy9FkUfrry+SpKtM+GOzesxYN8vcgJD352Iqfbg=
X-Received: by 2002:a05:6902:1082:b0:670:9307:b0eb with SMTP id
 v2-20020a056902108200b006709307b0ebmr17460924ybu.335.1658912164494; Wed, 27
 Jul 2022 01:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <7a02225c-5c7b-f342-e29e-995d1ae0f4e3@linaro.org>
In-Reply-To: <7a02225c-5c7b-f342-e29e-995d1ae0f4e3@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 09:55:37 +0100
Message-ID: <CA+V-a8vCRNb9r8o=C97DV11ZA4Uf+7rHmbO6+Gjq+q=CUuDPRA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015605_407342_EA8DB0C3 
X-CRM114-Status: GOOD (  16.87  )
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

Hi Krzysztof,

Thank you for the review.

On Wed, Jul 27, 2022 at 9:51 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> > (RISC-V arch).
>
> Your commit msg says one, but patch ignores r9a07g043f01 which sounds
> entirely different for non-Renesas people. Be a bit more clear.
>
Sure will update the commit message.

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> > index ff80152f092f..f646df1a23af 100644
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> >  maintainers:
> >    - Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > +# We want to ignore this schema if the board is of RISC-V arch
> > +select:
> > +  not:
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          items:
>
> It is only one item, so I guess you wanted here enum.
>
> Just like syscon is doing...
>
Ok I will switch to enum.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
