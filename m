Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA6EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STGSsf/ap+4BcHQParZc0o/jdbAYWJHrX6uymZceFpA=; b=KR/tSskghP/+NR
	JyNMZeWmTLOy+Kumb2lkNbsDgOMpgAhM49Ic6U9RjwEU7WFenhlL3XHFGiTZs99qZmlPz776WlsS2
	DuwfQTy1A5OMu4eRy2n1suxlfH2HQPXSfyDD4nibZBumYsPpS8f1LSAzO/EZeFMciN0kCd5NI4MT8
	4BlKlFj91OBUohdkaEFmHb+z7waE/hic9a/f/iTgXfkI/chreAm/PTwF/XxXujEIMxGhLhb6HiyF/
	l7cEwKeS+b9m5r46m1HP7xgt9IO1wfkOh+hlZNOrMb6DPDAyK00E9b/Z5sI7nZ4gvE7eOHeTKEKjq
	dNduVqRXUryzIqbe8FoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mszg7-00EDuY-QB; Fri, 03 Dec 2021 03:56:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mszg4-00EDtp-5V
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 03:56:06 +0000
Received: by mail-lf1-x12c.google.com with SMTP id r26so3359319lfn.8
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 19:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqWClX8wf746RWljknNlhrCQutL2BNblsj8hgdUcX34=;
 b=Z0PiBT5EJSG48ueRdwGCYZ2YEGpS1/EI5veqmY2d+e49m8I+Igi8YFh9LRiov19ajJ
 h3WbYTKuzknud+jaaJavQDJZWYzl1ZqLw+Sl5oFc1BkBLgTziaXm6taEb8U4HzzR/OwM
 ZTK9RCNuA/ckTzS6+m9lDHq2R4nKImctiFJUSG/Zp7SKMGudHMxkGn3DT/IU3jeyydoS
 gSIhb+eBFPE8eNWSjjcxZCB+5jhJcRtNOe2Q8T8PpLvaHkvn0sbBlLJ2vzcWtLZCBg+k
 R+yGnX1dtIPTJL3EMuI7CvXFvKnYXW5PQYqrxVULcwh4379sNYt9efWtCOGXkziyX1DR
 xjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqWClX8wf746RWljknNlhrCQutL2BNblsj8hgdUcX34=;
 b=0QT5z4uUcIuQNghpb8hCuq7fQnVceWyUj1FLa+5IdXnxiCwFGHT0M87fiF6hae9uAK
 GqCewpp0iX9pUh0x/h3RIW/49qZHfRj1YM6HPH5CYULi3xY5nU0Bia7J6pjPbRHsMUA2
 4FgW/vdrbH58CzEqAbgaW/v/CTcda1rmr1IE2G1EbIAIrnSBXbe+l53WaNt2aj8dNNd7
 LNsWN6aKFnsVCWpexjKGxYhlCRDxaFcq4IFxPfSrxeG3EIfEqHHb3EUFmPvqFlYNiCn0
 Z8eVGZXnrkTDb4Tc2LTCuN3AHw9WOwBytW9Ff0BH9h8qr9ahbbigmNvK31y/UYp52xFY
 fmCg==
X-Gm-Message-State: AOAM532EjN6ZnjdrmnlddJprs1LOlCc4BkQ6nx8dLKa+jFZsy+xyGI24
 ckQT9mV8QjDHWM81J++w2memKlm9T733Dok9iLQ=
X-Google-Smtp-Source: ABdhPJzqLqjG1FfR5n/iHBX9kenXQxkhOBEtQ/bCp2OeEdSaMzLUwYt2983bqJXPJgA2PCkZv0fFA79sHvNOCjA7XT8=
X-Received: by 2002:a05:6512:3988:: with SMTP id
 j8mr15859575lfu.599.1638503761493; 
 Thu, 02 Dec 2021 19:56:01 -0800 (PST)
MIME-Version: 1.0
References: <537742e7af4a21baf79429469ba7c30947ddca7a.1637362542.git.plr.vincent@gmail.com>
 <mhng-25baa8a5-d7c1-4a37-8489-123fd12499f0@palmer-ri-x1c9>
In-Reply-To: <mhng-25baa8a5-d7c1-4a37-8489-123fd12499f0@palmer-ri-x1c9>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 3 Dec 2021 05:55:25 +0200
Message-ID: <CAEn-LTpjqroMXbncWrxa9+3fMyF2jQUkhPocO18qAd2PQJKZFA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] riscv: dts: sifive unmatched: Fix regulator for
 board rev3
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: plr.vincent@gmail.com, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 krzysztof.kozlowski@canonical.com, qiuwenbo@kylinos.com.cn, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_195604_269941_B1231FA2 
X-CRM114-Status: GOOD (  25.26  )
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

"

On Thu, Dec 2, 2021 at 11:45 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 19 Nov 2021 14:55:41 PST (-0800), plr.vincent@gmail.com wrote:
> > The existing values are rejected by the da9063 regulator driver, as they
> > are unachievable with the declared chip setup (non-merged vcore and bmem
> > are unable to provide the declared curent).
> >
> > Fix voltages to match rev3 schematics, which also matches their boot-up
>
> There's a few references to rev 3 here.  I'm not sure if that means we
> should have multiple device trees -- this one seems pretty benign, but
> some of the regulator stuff worries me there, where anything rev 3
> specific might not be safe on other revisions.

As I mentioned some time before there is no such thing as Unmatched "A00".

The production boards is:
PCB revision: 3
BOM revision: B
BOM variant: 0

Or "3B0".

There are a few "3A0" boards out in the wild, but the changes are
minimal and the same DT applies.

>
> Did any previous revisions make it out of the lab?
>
> > configuration within the chip's available precision.
> > Declare bcore1/bcore2 and bmem/bio as merged.
> > Set ldo09 and ldo10 as always-on as their consumers are not declared but
> > exist.
> > Drop ldo current limits as there is no current limit feature for these
> > regulators in the DA9063. Fixes warnings like:
> >   DA9063_LDO3: Operation of current configuration missing
> >
> > Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> >
> > ---
> > Changes since v2:
> > - Fix end-of-commit-message separator so change lists do not end up in them.
> > Changes since v1:
> > - Remove trailing "." on subject line.
> > ---
> >  .../boot/dts/sifive/hifive-unmatched-a00.dts  | 84 ++++++-------------
> >  1 file changed, 24 insertions(+), 60 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index 6e7775fdae32..1abad0eec02e 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -93,47 +93,31 @@ wdt {
> >               };
> >
> >               regulators {
> > -                     vdd_bcore1: bcore1 {
> > -                             regulator-min-microvolt = <900000>;
> > -                             regulator-max-microvolt = <900000>;
> > -                             regulator-min-microamp = <5000000>;
> > -                             regulator-max-microamp = <5000000>;
> > -                             regulator-always-on;
> > -                     };
> > -
> > -                     vdd_bcore2: bcore2 {
> > -                             regulator-min-microvolt = <900000>;
> > -                             regulator-max-microvolt = <900000>;
> > -                             regulator-min-microamp = <5000000>;
> > -                             regulator-max-microamp = <5000000>;
> > +                     vdd_bcore: bcores-merged {
> > +                             regulator-min-microvolt = <1050000>;
> > +                             regulator-max-microvolt = <1050000>;
> > +                             regulator-min-microamp = <4800000>;
> > +                             regulator-max-microamp = <4800000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_bpro: bpro {
> >                               regulator-min-microvolt = <1800000>;
> >                               regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <2500000>;
> > -                             regulator-max-microamp = <2500000>;
> > +                             regulator-min-microamp = <2400000>;
> > +                             regulator-max-microamp = <2400000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_bperi: bperi {
> > -                             regulator-min-microvolt = <1050000>;
> > -                             regulator-max-microvolt = <1050000>;
> > +                             regulator-min-microvolt = <1060000>;
> > +                             regulator-max-microvolt = <1060000>;
> >                               regulator-min-microamp = <1500000>;
> >                               regulator-max-microamp = <1500000>;
> >                               regulator-always-on;
> >                       };
> >
> > -                     vdd_bmem: bmem {
> > -                             regulator-min-microvolt = <1200000>;
> > -                             regulator-max-microvolt = <1200000>;
> > -                             regulator-min-microamp = <3000000>;
> > -                             regulator-max-microamp = <3000000>;
> > -                             regulator-always-on;
> > -                     };
> > -
> > -                     vdd_bio: bio {
> > +                     vdd_bmem_bio: bmem-bio-merged {
> >                               regulator-min-microvolt = <1200000>;
> >                               regulator-max-microvolt = <1200000>;
> >                               regulator-min-microamp = <3000000>;
> > @@ -144,86 +128,66 @@ vdd_bio: bio {
> >                       vdd_ldo1: ldo1 {
> >                               regulator-min-microvolt = <1800000>;
> >                               regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <100000>;
> > -                             regulator-max-microamp = <100000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo2: ldo2 {
> >                               regulator-min-microvolt = <1800000>;
> >                               regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo3: ldo3 {
> > -                             regulator-min-microvolt = <1800000>;
> > -                             regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo4: ldo4 {
> > -                             regulator-min-microvolt = <1800000>;
> > -                             regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-min-microvolt = <2500000>;
> > +                             regulator-max-microvolt = <2500000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo5: ldo5 {
> > -                             regulator-min-microvolt = <1800000>;
> > -                             regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <100000>;
> > -                             regulator-max-microamp = <100000>;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo6: ldo6 {
> > -                             regulator-min-microvolt = <3300000>;
> > -                             regulator-max-microvolt = <3300000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <1800000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo7: ldo7 {
> > -                             regulator-min-microvolt = <1800000>;
> > -                             regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ldo8: ldo8 {
> > -                             regulator-min-microvolt = <1800000>;
> > -                             regulator-max-microvolt = <1800000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> >                               regulator-always-on;
> >                       };
> >
> >                       vdd_ld09: ldo9 {
> >                               regulator-min-microvolt = <1050000>;
> >                               regulator-max-microvolt = <1050000>;
> > -                             regulator-min-microamp = <200000>;
> > -                             regulator-max-microamp = <200000>;
> > +                             regulator-always-on;
> >                       };
> >
> >                       vdd_ldo10: ldo10 {
> >                               regulator-min-microvolt = <1000000>;
> >                               regulator-max-microvolt = <1000000>;
> > -                             regulator-min-microamp = <300000>;
> > -                             regulator-max-microamp = <300000>;
> > +                             regulator-always-on;
> >                       };
> >
> >                       vdd_ldo11: ldo11 {
> >                               regulator-min-microvolt = <2500000>;
> >                               regulator-max-microvolt = <2500000>;
> > -                             regulator-min-microamp = <300000>;
> > -                             regulator-max-microamp = <300000>;
> >                               regulator-always-on;
> >                       };
> >               };
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
