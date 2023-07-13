Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368F9EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IMJ3vJIPxtECgpJwpU1dTTdKwNBuaSNqJoLuxVUe9U=; b=IKzv6rP+Kthi6T
	ftL2r/XX55iJfXrNGJfBjMloihTJJ5RTZ5g+yDhcg4axAsf86KQBWst6ubr/YYYLtd5UOxm4oZbhV
	M/iBDBI06yDn9eGjRWeAJro1Tyh/qXG4vWKUPdO2zMan/cldRJe66WhpiBrUJYUUZ+zPpjRFaUaQS
	py6byywrqrX8FMPZK0bp8w2owuZHoiN1tuDDguckpqfHFnK27i3JMSPBx39wuaYh4EM/cyys7XiRI
	IrzOVD36drO+I2bgmaR2gE6jIesZzaPUQPc+ejxzVjuRI15Fs9TNThJfS2AzdzthlQBKGwWgbOaZi
	rvjJVx3mK09HRJJMIwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvX6-003Fte-2v;
	Thu, 13 Jul 2023 12:34:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvX3-003Fsx-0u
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:34:54 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4B0D03F730
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689251691;
	bh=0x7/BB02h/Vjaz89nOjegAfaWNL3HV1UN7FsNnRRs5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UamJr2oIDSh80bjbvkKWVPqMnxRbAUBbZFqQbTq3QQrq6odNl+a4du7qvO0eOpNZX
	 a+SBwqrPKxHPhm523ajYNBkVheY81U461U43E8rJu5TBq2lmoYOBCHHdt3NMXmqR67
	 eBH7I3CK4KMwVscGadIF6v8U5MP8JUwXFpCCEGPn4+geeup2W1HRDZzJlqcP115oar
	 pC3XHnKD0xi2HaIsXD107dEGIilIbQuZOaUumgd5J9boNqGZRtGYXLXh58K8p3/eOy
	 jVBddF2zwNfK0146LwoBuS4Imv51UHR073B6U2+6BStDM0peytezqIRIgL1JLKFD4t
	 vYEV0BnZ/SroA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-403a4cdbfa2so8220911cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251684; x=1691843684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x7/BB02h/Vjaz89nOjegAfaWNL3HV1UN7FsNnRRs5Y=;
        b=YkbcrSg+igNp6Vjokzu56RBx7rpoj4YedErHY+dt4imdKWSc21uv6+XCvq0TAq4Xni
         iy3gfIxo7kProWrvOkIx7NPQ0tWyItbZ0eyLmaBKONsvIXU+Tn0SaxhjSqmIiEK73FcT
         dNOF9ZHqpm5Hn2PGT/7dWeyOO3nznuUzf2U50mTK2/sKdpWZ6tr/jwI6I48rrh7zF9xA
         ZsKhiC044cRjLu32l+gdTebTAiIcXEWyGIsM88n11/YVGnG1mOpNGcZAocXrUwMDyA6M
         Vty4eDGuvKiI/sX3fBaY07NTFQNH3LgP5g7AOpRsWHVFWNV+A7HUwupuIJASMtFDIA+e
         OguA==
X-Gm-Message-State: ABy/qLamEhEH0TMfWk0Iy6lXRRuqqCHIJOixe26q5POvXsI35WJS8CtC
	uqLnPnIBMy2yHq5hYSz20MpkPbf+Ja3LxTbUwPr/0NPS8Itbjz3wnSFkg62SQpPEVwUjwg4zwfD
	5THtBc4N2pfyD9q33C9Mp5N+mSbk/4iO5NXXtlKdVAvmxdfClLNyv28cox+tKrQ==
X-Received: by 2002:ac8:58cb:0:b0:403:a9ba:d595 with SMTP id u11-20020ac858cb000000b00403a9bad595mr2189549qta.32.1689251684218;
        Thu, 13 Jul 2023 05:34:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG3uRO1DJxIMzsFBp7ZXZT9kVzajztPoJnaw8GSN7V/IFWeOTElpBFxOiBbpxw9/yVM5LzSpzhxS7VtF7gIEK4=
X-Received: by 2002:ac8:58cb:0:b0:403:a9ba:d595 with SMTP id
 u11-20020ac858cb000000b00403a9bad595mr2189533qta.32.1689251683990; Thu, 13
 Jul 2023 05:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-4-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-4-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 14:34:27 +0200
Message-ID: <CAJM55Z-3YPgFOTVbz=hdL-wbWCvYTb=KMiqFbU812zF06Lqx9w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL
 clock inputs
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_053453_476551_52F484B4 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add PLL clock inputs from PLL clock generator.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../bindings/clock/starfive,jh7110-syscrg.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> index 84373ae31644..5ba0a885aa80 100644
> --- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -27,6 +27,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
>
>        - items:
>            - description: Main Oscillator (24 MHz)
> @@ -38,6 +41,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
>
>    clock-names:
>      oneOf:
> @@ -52,6 +58,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
>
>        - items:
>            - const: osc
> @@ -63,6 +72,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
>
>    '#clock-cells':
>      const: 1
> @@ -93,12 +105,14 @@ examples:
>                   <&gmac1_rgmii_rxin>,
>                   <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                   <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -                 <&tdm_ext>, <&mclk_ext>;
> +                 <&tdm_ext>, <&mclk_ext>,
> +                 <&pllclk 0>, <&pllclk 1>, <&pllclk 2>;
>          clock-names = "osc", "gmac1_rmii_refin",
>                        "gmac1_rgmii_rxin",
>                        "i2stx_bclk_ext", "i2stx_lrck_ext",
>                        "i2srx_bclk_ext", "i2srx_lrck_ext",
> -                      "tdm_ext", "mclk_ext";
> +                      "tdm_ext", "mclk_ext",
> +                      "pll0_out", "pll1_out", "pll2_out";
>          #clock-cells = <1>;
>          #reset-cells = <1>;
>      };
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
