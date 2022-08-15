Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7CAC25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoP+2L0c67vQ/gNowuJlEDd6SjrF9FnEwCQemcRNoKM=; b=xyNmjWySbiXQgv
	ypYCWTNJhfkmznpEQuzEGgN0l6IxqjEv9vRJk1MePAX5hr79gG8Rh1L8wBrdSNPdW7ZEq25qxHWq2
	OGEo2m8MLhd6mU44o9KrdzoswdRiXBYMLMd27PlGpcJ5L0ljnTHN/rHtfQNYDHmQaae3uvFIQtyuV
	lrWMn972k2BiR2DYbmcQsmtKu8bg8fi8L3QSMHFLptA/VMYEAkvlFm///lY34JnGjrcVH7OssXRE+
	zfT2WjC2h6CzlUjUzZ/eVvdwibVKRGD9+7wlFfITam5E42fJIHLr+GT/Q/iXwhOm6fr4Npemr+gAF
	91jmvIg/T+K2nS7XTVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgW9-004dXR-8Q; Mon, 15 Aug 2022 20:16:57 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgVu-004dS7-Na
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 20:16:44 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-32fd97c199fso75721997b3.6
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F3WR7fgDxcCodVgsjoOsS+f77Gv20JzgJQeYT8zBw8Y=;
        b=m4GdyZOqTzEPFE5ZNoXqTb7eVjWUfyZNn3ENU/zHMsrwZhp3Byl1BKCAW+70SAfFlX
         7/EnRFBWxMB+0PFZFjCFYokpp3R6JFLkyEt7jKdgUe3iREKIe2pwbnnEQKGdq9zSi/Rk
         8eRe2Y2oLaOqAyYlPvVRk5Dtbl/ti9cBijHFqsXdih7YukZVF22d5LMh2iNLnv1op0mO
         eAFtV1e+FeT9O3GtU65MlTg4wC+BxRO5o4bPRQ/FaMXPRNu0/3PBw2+xt6gnYop4UatJ
         /2kZkldAP8qpB7fze71ZA2XURtodoYr5XChHX6Es3I896c5gDy65wASUMMfjRHpWbtU9
         mSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F3WR7fgDxcCodVgsjoOsS+f77Gv20JzgJQeYT8zBw8Y=;
        b=CNtPANK+1xYOextMEUqctscFOhS+wfgOfYtAj1EOpRsmwCIPYACbvRKkOjnTD+iQRE
         EHnC+4xQb44QoFDCRwaPZ5elhi1LgSHNzXZ0E30UzNL9kh0+/zVGbph4VoPTgvL3OEHW
         LfCt9EJQdiLMHjA++sUXOTfhPhES96tdgSJOfcixpdU5hNbPMSKWTVMia6QRi5MqaYof
         WKtIS5rSpoWeuZoQFw/3WzjMq281SJALxoCTPaSKjkPH7MJbPfEK8f96YaNv+g3a8EUQ
         oNo28jmV1cwes/nUsKiymM9J3Zy3mauN5sG5HEAa9NQpzIaoz3aO1XmuvVT0wlGmKTqj
         GzGw==
X-Gm-Message-State: ACgBeo1SAiE7C4vtvgjpvw6d7sqw5Ai6N9oabwM6oPD4sONjHY3ynTm3
	gveoZTjTmmzxigCMHiFrabNs+hz06kaI8oK396E=
X-Google-Smtp-Source: AA6agR53x6Ky5DFoyiOZsi1UNCdLAREHkkmy3+pa3bj7rCyr5qdJmXVXVMo0vrQdOzqePpsCUG0fqZm8CD4XyiuvFwk=
X-Received: by 2002:a25:3206:0:b0:677:2480:ffa6 with SMTP id
 y6-20020a253206000000b006772480ffa6mr13207204yby.335.1660594600950; Mon, 15
 Aug 2022 13:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com>
In-Reply-To: <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Aug 2022 21:16:13 +0100
Message-ID: <CA+V-a8uNRr+WPX=YC+UMT4ch4S5XwsatHCzUoSt+hTk4C=cheA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_131642_829924_3F801691 
X-CRM114-Status: GOOD (  22.27  )
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

On Mon, Aug 15, 2022 at 8:00 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/08/2022 16:14, Lad Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Enable the minimal blocks required for booting the Renesas RZ/Five
> > SMARC EVK with initramfs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * New patch
> > ---
> >  arch/riscv/boot/dts/Makefile                  |  1 +
> >  arch/riscv/boot/dts/renesas/Makefile          |  2 ++
> >  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
> >  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
> >  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
> >  5 files changed, 73 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
> >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> >  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>
> Just to sort out some of my own confusion here - is the smarc EVK
> shared between your arm boards and the riscv ones? Or just the
> peripherals etc on the soc?
>
RZ/Five SoC is pin compatible with RZ/G2UL Type 1 SoC (ARM64). RZ/G2UL
SMARC EVK carrier board can be swapped with RZ/Five or RZ/G2UL SMARC
SoM and still be used.

> If it is the forver, does the approach suggested here for the
> allwinner stuff make sense to also use for risc-v stuff with
> shared parts of devicetrees?
> https://lore.kernel.org/linux-riscv/3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com/
>
it does make sense. But I wonder where we would place the common
shared dtsi that can be used by two arch's.

> Would at least be interesting in hearing more opinions from the dt
> people, Geert & Palmer. We have some SOM based stuff too with carriers
> so I am interested in seeing how the cross platform part of that works
> out.
>
Yep, that would be interesting.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
