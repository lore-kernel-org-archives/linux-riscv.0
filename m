Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jISGtpq92DcxJKqB96fmBA+BTZvSFUomr3/aiFvPl84=; b=MVsNeMfpmkE09Y
	JxyC36lxKpJAysumhjAYIhwXu8UQWbwC6w+UfV5gtH5jeQbU+ST3OlvbEJNO7Bc+4oS24It5A8h02
	AVSSIcGH9fjrrP0qR5zmNap9RzlF/ODQui8INE4Oz5c+utmqG45/H8jZEsG7W6achLyt8SVCxkn4I
	/tpjt1J6GS6A7UdMC6ABKBOmyhAqJXPu7TEd2e8cGiIBKXs0+tj5zFBEGToNKKjzVSh7cKYZm9mjG
	a4pbTv+MK33+FsFDCTlp9quH7E7XWrezEnpB/exaXd+0aMTrVn3nBvyEQCstWjbab45zAoXvWnEKK
	rXdqe92e2viHKMy4i6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Ph-0071AG-3R; Thu, 24 Nov 2022 09:20:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Pd-007166-8P
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:20:55 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D3183F221
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669281650;
	bh=VRx51K+Grac4imHy1DHLCU82k/uWawM5zQfqB1/2368=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BTSb5oDPfk5kVdVNwh/WPgxbI/s03ycVt3H5olgJTv9wwLfLdHt+lPsGUA1RYeRrr
	 E+QELyzw7H9wkP6y64I6UlTd9z4511LRkY9EsWZ3sKZrfDF0hY8rAx5Q4XHNDuJaxR
	 6uD28+ZjNaZerOIbKO33njc0E5A0XyiuYi9jTrykz5g1cVgWBFfCafTOtnn427W2pa
	 3b9mfcDffeaTqB6MQb8HnSpEKSO8r3+Z6+QjACugugQrd5KxD4Jah5SgGHW7lb9uRm
	 hgOueE+0qB0KF6yzt4oNdmqRLD1/k5YurnzaAaxAsh9WFzI5dneKAM4jrCq3vTybq6
	 Omvj4AS2I7vnA==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-368994f4bc0so10852507b3.14
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRx51K+Grac4imHy1DHLCU82k/uWawM5zQfqB1/2368=;
        b=lYwiuoTIcHki6ZJbtxaJGr2YJEBrOeCEMyX5D7VxbbQtSq69K4EGgDF8KOdQ7gvAuE
         /d1CEvES8BbEgGNeOphnaeBdUbTmXsCal6I6r0WsCWHXcWTE2OgzkeLEuvHtbeJkbSFz
         uo3SmKProTOwjO98Xhqe2FqokQ3sG+HfgyvnTpa/ZLOqaVYasMUtdPTprbt4my8BB9e8
         eZXcDJa1bKr6rA1D5RkAlDxnctYVsK2/xs35z6kbSVlQa1y6SfOsBs9LpxA+qWOHRDk2
         AebE9P9q1dmjeuK1lr18Rl7wnfUtfQYYafY7uws6xzgkmQXxx9uo9nD21Asl5D0eIQtu
         oI5Q==
X-Gm-Message-State: ANoB5pk7rDBUVWo/i6l5kAQNKdS4rWY0sSKieVjXfiMUQLyd6iGc5qVi
	hBpiCxOKi/EPH9CfEadN1PQsWtWsB3uqkbAh+r8kLAcCT4/7Lxhbc5slVd8iNe49HR3hW7T02aB
	wyWnuEhTdQvwL8xEj9mEx4Ql+mrazAGjjHWIW7RK/nfYUcEwLprkRIKIaFsbqjg==
X-Received: by 2002:a25:4a86:0:b0:6f1:215a:2dbe with SMTP id x128-20020a254a86000000b006f1215a2dbemr3191239yba.469.1669281648234;
        Thu, 24 Nov 2022 01:20:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4H7k0go2dHlua8ClKkvM8qah93F0sS9CYUiwz8DhwGeE2xOLmvodSBoY+vtCQ2wxqkd5uAMT6yRu2cukAu/Qc=
X-Received: by 2002:a25:4a86:0:b0:6f1:215a:2dbe with SMTP id
 x128-20020a254a86000000b006f1215a2dbemr3191211yba.469.1669281648005; Thu, 24
 Nov 2022 01:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-2-hal.feng@starfivetech.com> <202211190418.2AJ4IQjc072382@SH1-CSMTP-DB111.sundns.com>
 <ca3e341a-3dc3-39d6-7e26-89ba65aa9473@starfivetech.com>
In-Reply-To: <ca3e341a-3dc3-39d6-7e26-89ba65aa9473@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 24 Nov 2022 10:20:32 +0100
Message-ID: <CAJM55Z-zgR=LKqtg4ioj9Ez1CT7wchrNWWPVT5XAMPF736OcRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_012053_733604_360E0BEA 
X-CRM114-Status: GOOD (  26.46  )
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

On Thu, 24 Nov 2022 at 06:56, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Sat, 19 Nov 2022 01:28:48 +0800, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 02:17, Hal Feng <hal.feng@starfivetech.com> wrote:
> > >
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >
> > > Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> > > and the VisionFive2 board [2] equipped with it.
> > >
> > > [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> > > [2]: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > index 5b36243fd674..64008c57e31f 100644
> > > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > > @@ -22,6 +22,10 @@ properties:
> > >            - const: beagle,beaglev-starlight-jh7100-r0
> > >            - const: starfive,jh7100
> > >
> > > +      - items:
> > > +          - const: starfive,visionfive-v2
> >
> > I think StarFive has switched to just calling it VisionFive 2 and not
> > V2. Please check up on this before committing to the compatible
> > string.
> >
> > Also there are going to be different revisions of the VisionFive 2
> > board, so maybe consider adding eg. starfive,visionfive-2-v1.1 and
> > starfive,visionfive-2-v1,2b early.
>
> I checked that the official name of this board is "VisionFive 2". The
> board has version A and version B, which are different in gmac and phy
> chip. The version A board has one 1000M and one 100M Ethernet ports
> while the version B board has two 1000M Ethernet ports. In dts, they
> have different configuration parameters for gmac. So I would like to
> distinguish them by two compatibles as below in the next version.
>
>       - items:
>           - enum:
>               - starfive,visionfive-2-va
>               - starfive,visionfive-2-vb
>           - const: starfive,jh7110

Cool. Though the silkscreen on my board says "VisionFive 2 V1.2B" so I
think it would be less confusing if you used that as the model, and
"starfive,visionfive-2-v1.2b" as the compatible string for the board.


> Best regards,
> Hal
>
> >
> > > +          - const: starfive,jh7110
> > > +
> > >  additionalProperties: true
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
