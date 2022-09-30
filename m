Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 01:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tV0vcLeCKFF6t11s8blf2CyWt+6ZaFq9PeZ1AgifN8=; b=nFWaVlBrfpAkkP
	eVgxa/ml3OhHazMm8+0Mjm4STfXH/q9yi1gnxlRwM2sa77uNGfilNWXSYnwd9ymE+voWEegsd9LLX
	Aj7JMhw1Wcuc4Pxrg4FIpr3vSytMfqynzj3HXspfkHdtykyVD/nspMtTCp5XGaWqq1ZxCDj3lPV70
	sftPAsc2BpaYnw4WC5MYa23FvW7v0rSwwcTuR20xV3puZVrcrMDeiK0dzDgpfJdV8cpJC6SSOLoRs
	NmPgPQIkepjpm8u1uGPaJyANlog/b7iEVGl9xorJLxTN0Xr2O1rMpT8BMEPg3ZZaW0QKZj3eagZgI
	o+9A/wRvzbZ+XLAm5KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe5Fz-006eKE-JN; Fri, 30 Sep 2022 01:56:03 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe5Fw-006eIc-GB
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 01:56:01 +0000
Received: by mail-oi1-f169.google.com with SMTP id v130so3414478oie.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 18:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qiRw0pTmuHwBycLo8jnnh8c0JQNXJ8LTMj64UFcxJeQ=;
        b=Tx8yip9sxuvTNDbIXJsWwndp9eBVUcUgEIQ0wroaIT4VfRqvH752aW3lT9wQc7taXd
         flhmSksRpypATiKSiERjQh7DzHvnBTfHuCXPhGji9yFzfZbOohP9M5PME7xT+5Mf0QSW
         x2kqy09ISz2RYT2sLUUWi2mgP6Sf2D02m9Z50PjKrGj1BqzOrCligcsVTYgVZLQrPbyv
         lSUTu/5C5FwaS1dSyqwnJQBO++DEvIPnmdH5ERKBaBU5jr+JcS76IfOfm2v5KIF2Wiku
         y1VPLW5dAAB+emWFyxwMoxVeHx1krsyB/CnIVkfeBUOlQr2B8PuM7caCoJgU/P72syFK
         EoeA==
X-Gm-Message-State: ACrzQf2s26XJ1FVI8uwiGzqTXQoQ0SaNcxutqOdRQdSmvNTD+3P06Hbn
	QcJeEcJUmoWVYNGl2MNDRA==
X-Google-Smtp-Source: AMsMyM7TgwvvSOqiFejV1yl+V50bkYmm2hEDsKgeacT+I37/c1Bf/LW8nTKXMuPGrDzcnP+EIzzDAA==
X-Received: by 2002:a05:6808:1496:b0:350:4640:5462 with SMTP id e22-20020a056808149600b0035046405462mr8319344oiw.47.1664502957074;
        Thu, 29 Sep 2022 18:55:57 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n22-20020a056870241600b001317413344esm355801oap.47.2022.09.29.18.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 18:55:56 -0700 (PDT)
Received: (nullmailer pid 3142038 invoked by uid 1000);
	Fri, 30 Sep 2022 01:55:55 -0000
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
In-Reply-To: <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
Message-Id: <166450294103.3141703.10888748010920074288.robh@kernel.org>
Subject: Re: [PATCH v1 17/30] dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
Date: Thu, 29 Sep 2022 20:55:55 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_185600_553879_77A934D3 
X-CRM114-Status: GOOD (  12.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Sep 2022 06:26:47 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock generator on the JH7110
> RISC-V SoC by StarFive Technology Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../clock/starfive,jh7110-clkgen-sys.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.example.dts:18.47-31.11: Warning (unit_address_vs_reg): /example-0/clock-controller@13020000: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
