Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F566C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwH+o7525p4lXdeWBd+/amVAqZ7/0w/4lcu3ZcXo4rU=; b=0q/KoH15har/0r
	S8xMAktNbpokdEuASSufpaJ/S9vlK+ZOe4KGKsI3oY2REuZjS+TJO0HWBj75jXUgrVde/S0FDF8zU
	yPVtO7LanX08NTImsD8QvVeqYEqZf6fv/qHJ9SzN/JBhZSLQc2+u4UEqhHhK64Q7RVDgpBwadQ9I4
	qK06mkwhSB1v75HHdQVPLNwpHeDxu1jkv+gYKgcVGZSmrov+x1+XH4zk3HYtRoeDVJPvXlzm0aZ7G
	eDIZFMpSc3qotzR4A/PyVBRLqZjmllXEJ4bccpl3iOQ0YmENNtW4mLV4nMF1jIkYbq5TqnPNrs0Rc
	GWAVxYl4ayMzCIaro5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox58K-00CzSw-6P; Mon, 21 Nov 2022 11:38:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox58G-00CzRD-QT
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:38:38 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 44D4B3F54C
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669030715;
	bh=k1LFdNn2YthCqXfDo2Al9HOEWWRFBoST7OMZo/loF+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qQ8GF2PFJQe0ondbPn9KpePolZeE1DCKWnPRm56IMDk88w2zK9Zpy9idVkUprUBt3
	 jkzpC9PlwKjo6el/z7T5MlZVEzsLu24aa1TW1l7YjsETi/B1liUtAzPM1zlGdCtgs4
	 qtE19++7cSBqoisFsV2WTIYxL6Ww383Se8cbWhqCy+Xt4d48vxfc0f0WOTIvK6HFu8
	 vhyCcXhZo4bXlHeHdFEiPoGx1E6PmUfrYXPMrrZNu37v36HlimV04T5aD5YC+4sBIy
	 ojRUuI21RWdd9bPGAHmoEuAwC7P8a6wc3U8Hnp0nRIl9DRUz3uTq6UR2CnNwU7Barn
	 3eZrQY0GjyLGw==
Received: by mail-yb1-f197.google.com with SMTP id y6-20020a25b9c6000000b006c1c6161716so10682058ybj.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1LFdNn2YthCqXfDo2Al9HOEWWRFBoST7OMZo/loF+4=;
        b=r2MVRIwJ27AI0CkM9r33BsZ1QXiLnGXLswseyDypbFfgi22KB2L2Dp1yIgV/4zN2uC
         cEMPwRtb0N2OIhk0HytexDX7Jh+ZDASbQRFYMak9MTR/zMpCtp3UxyvDv2vvtwZF5A74
         cLcMtrz8elODlr3Y2fSH82h+6zQuPpWFPsfOPg9NgNoyADhFieReVE48qtisH6ygF1SK
         9M5Ft2TIY7ACys6D2XgJV/a/Y8U4H3p5hieidVL+ZPzA27igwo1hOUx3RhjrufAR8W9B
         NUjx53y0Y1CRTNykZDU+vyzqmceEaGEvBMGP7/e6zx6RbTspU/5mOZyiy5yy58TKUKq6
         i/Ow==
X-Gm-Message-State: ANoB5pnWCrX+jEgvCYbVrsnPzZ/pF0qLzPxbnXLRDVrc2yBgypRMwYVj
	/SVcGcv+/AgX0lw6rBZUtIZaXEW2MRvYSz48LuRQucbZRhqKKJH37CLK3be7oVwNCAEt9yOLfmq
	TzLETiuEqiSNbVE9TcRK1ubCpRweaZoVKD/VfpbwQjbqkYq5AYTz+vA6DMT+BWQ==
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id k15-20020a25e80f000000b006df927f38c9mr16158711ybd.92.1669030713973;
        Mon, 21 Nov 2022 03:38:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WqnZPCDXzAGWO5+CsGrfvY5dZ99oEse/5+ZdgxQLRmeJNBWFQZouQa8Zd7b6wtc3vX0BNaCAIpFXWIf5Gs/k=
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id
 k15-20020a25e80f000000b006df927f38c9mr16158698ybd.92.1669030713733; Mon, 21
 Nov 2022 03:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com> <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
In-Reply-To: <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 21 Nov 2022 12:38:17 +0100
Message-ID: <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_033837_002974_6EB901F3 
X-CRM114-Status: GOOD (  19.33  )
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

On Mon, 21 Nov 2022 at 09:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/11/2022 02:06, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add bindings for the always-on clock and reset generator (AONCRG) on the
> > JH7110 RISC-V SoC by StarFive Ltd.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> > new file mode 100644
> > index 000000000000..afbb205e294f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 Always-On Clock and Reset Generator
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <kernel@esmil.dk>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh7110-aoncrg
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main Oscillator
> > +      - description: RTC clock
>
> Real Time Clock clock? :) I don't think the input to clock controller is
> the output of RTC...

The description is bad, but even the documentation calls it "clk_rtc"
even though it's really an optional input from a 32k oscillator.

> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
