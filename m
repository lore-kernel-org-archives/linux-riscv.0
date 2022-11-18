Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD3C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9EiAlsIcRBa57vbf8d7MqLb7Tg4Ex/Km0OMcXGy/Jg=; b=b7NYWJpN4v6AGc
	YcLp+riwOTaytZA9W6rLcr1QSZvAew/KRJuF2IhaklWfw0rLFrSPgplcYcVdBtBnN5vzHGYs36i6u
	egoQCz1mQuTQGVTYitBWG/jr2Ljth4qBuHF9suA26hp0HjJrqHVSyoTSqA+U/7trI/rvbysuYGD/F
	pTHrwMGAL2J40LCCnT4NGXKAUUL9ARqKkXuIVv1xWpmZFtO6NkwVxOJZDweLb8YEdsWDyEB+zmn8s
	HTduIQSxbVGLaMwlieK3gpRpLrRc+ZPf1CUgT36Kr3Ja2lmCzlQQmnqO5mc2vlCp+YGoqO57kCkmD
	gKG+fppg3j3ypmiGsXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5B1-005oxc-4S; Fri, 18 Nov 2022 17:29:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5Ax-005or0-9c
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:29:17 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B7383F1C4
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668792546;
	bh=D0in/Z5ItBo4bdyVRZYshRBIPhbza+KDsy6dYC3xe9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gvhMagL8TblZL70Tc6THJTlXdp75lwl7v0l0TZWQW0yHIt2N8g0twTfAvS1IGXQmv
	 Mc1rAy8wnWMnOJ4sMXsvbL9EB0ObeWgPquVLwlCd5D8RY9dLNL4t9iXtlkbSGq3Hqg
	 E89+Hz/jsmYbBoNDx3r1LZhItO6OVFB0JdTFmT0sbcKC61CqLXTfrNZeP63KCpJ4zQ
	 QVsN90o7EK2xYt9psqdOvBc2pQ1aBAxWsO82z8zj0Q3WE1fhwPJv6lqpY5kjVq1cqM
	 +hRDacLcIIdJlR5qkvzCJQgvkncxH1UW9aG8ALRUor01goo+/dBAemS3hg0IzkoMAI
	 ehTeZSRnnSWTA==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-37010fefe48so54895127b3.19
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0in/Z5ItBo4bdyVRZYshRBIPhbza+KDsy6dYC3xe9Y=;
        b=MOXtRYGta0+bEecWrPyhfcN7lndSYkuKPCDMzTXt5rHM4ScLkFJ5GlaMFPymou/eA7
         +bvzVs6q/uKPIhR6fhnYAEDdAvI4WAkayUBeZEm9dX28yRnzLScsy8TpIH3NMHPWhUbi
         JdVAMKm+3vXI1GVDnKnvqTV5rBAeyHSM/D/rPLGYLd9e4b9IgmOi34OW/+5Opy1/3MRv
         ei+P8UYJ0S02iuu//d+OCoVFjGS4mJPPpfpGpZz8BJL425ir3WGUY+cObAJ9wHBdA66d
         pzmZkVLFOruXYO5VxAdf65hqxM4HXvf1fh1JV9q6F3i/GyHrAwgbSHA8UYhW7CGxTuq/
         rdBg==
X-Gm-Message-State: ANoB5pn3n+1iRYnlMMoeaYyvGFGFESigWXxBJPkMzokuYQ6C0OJ1mPSU
	LqW3U0tqHbOoHCk6viwdYvNKtJa7cfz+jarFA4zFzfRfUgtIbyWfmHlCMGNyq1609OmE9XZ/EJu
	HQzg+cRZTzbLrHo5/iNUOW9buFxEcUKQ3OD9aUMf60VRvN6m0xPna6+AeICV+ew==
X-Received: by 2002:a81:f805:0:b0:378:5e3a:8fad with SMTP id z5-20020a81f805000000b003785e3a8fadmr7407471ywm.78.1668792544555;
        Fri, 18 Nov 2022 09:29:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5xnJuotP89nNaWExJLuyVqseyLjsk+palJNHhKiqjsaZh7uoGA0lWccqFwr0budyNZij53O6Nn3CKWVR32m1M=
X-Received: by 2002:a81:f805:0:b0:378:5e3a:8fad with SMTP id
 z5-20020a81f805000000b003785e3a8fadmr7407449ywm.78.1668792544329; Fri, 18 Nov
 2022 09:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com> <20221118011714.70877-2-hal.feng@starfivetech.com>
In-Reply-To: <20221118011714.70877-2-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:28:48 +0100
Message-ID: <CAJM55Z8edRB8U9tn5Ytyb37R-yD=QJ621rziqKDrtXNDppK=ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_092915_503592_EE38C664 
X-CRM114-Status: GOOD (  17.28  )
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

On Fri, 18 Nov 2022 at 02:17, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> and the VisionFive2 board [2] equipped with it.
>
> [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> [2]: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 5b36243fd674..64008c57e31f 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -22,6 +22,10 @@ properties:
>            - const: beagle,beaglev-starlight-jh7100-r0
>            - const: starfive,jh7100
>
> +      - items:
> +          - const: starfive,visionfive-v2

I think StarFive has switched to just calling it VisionFive 2 and not
V2. Please check up on this before committing to the compatible
string.

Also there are going to be different revisions of the VisionFive 2
board, so maybe consider adding eg. starfive,visionfive-2-v1.1 and
starfive,visionfive-2-v1,2b early.

> +          - const: starfive,jh7110
> +
>  additionalProperties: true
>
>  ...
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
