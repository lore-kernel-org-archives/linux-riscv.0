Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687CAC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:40:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E319D2067C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZNIYIHz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E319D2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mVW/RY417hAF+3u655A8v4+OhWd+PrI0/zNtmSa8ut4=; b=gZNIYIHzkmSRVaGkwJdZXCpo7
	4aMhgQTEbkBJ+HDlYbD33SThzWG97vEs/7zRi6TN+Ap+vsmBhYPKo2xYlFWSCjysI/j6NwpZzNHRy
	PLATeGQdjl/dUIRQfccEr7ScU5L9WK1qWDSwrv/V7CKjV9nPXIzazJ1DZz2Iv1MEXKcuV4RuTdT6a
	wgFTBf7+ET/lf7+T1yUSY6jk8xKpxy43Hv3zj5tyKPiQ8sIPZYMtxQqrjMsqh5O3yO5vQT0pH7GT1
	obGKyueKod2XFajJnTaVc17YKfoj2aEfHZCbmaYYRXJku3d61z6KBsNc7bycP86BRu/FjF2gidL8M
	wPz0kCtZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInam-0005PB-FX; Thu, 17 Sep 2020 06:40:28 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInah-0005No-2J; Thu, 17 Sep 2020 06:40:25 +0000
Received: by mail-oi1-f196.google.com with SMTP id x69so1251633oia.8;
 Wed, 16 Sep 2020 23:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pAuv3apgn3zMedgKzg1fHsW6HJeuRQq0Uxv7kzEHzU=;
 b=iAsZ9GZQj59O5PE38zIAxtiICy86x4wrvCF0Fwpg3LIOGRiEBPTwpl8dc5zq+zMKTU
 B1DcjyEjQpdNaHgsWWrvlrA/jZzlElWL0plv1Nq6GSmWqDEwwndwVFdtnNcy9/I5LNib
 tPG2RXpi/ECmoOtDCkzdUumBV56EoTkVn0U8CF6TFgExm8AeavmSUHIHTjFNyjbOyI6D
 aq7UN+KxoE54EZy2dxgtssLVOueq3KKu0tN01MtqLbsrpQBZPngw6lJj+cqm5TaFY0zT
 vqA982dNkI1DoNb+14xMwdw8083SOpsX9Qq0spyZbTNvTckTQVxy05rYl8pGwjrrpC4X
 EABw==
X-Gm-Message-State: AOAM533uq9xTBqK2Xt+LQQ9MDPgwSDY1PbDf00MU8u8NuVaUxadi0bQx
 +hoCYkLhg5L1bl02zN8G3EZAt0HonNIp9IEznRw=
X-Google-Smtp-Source: ABdhPJwRx5EmCljn9g3yX8DYdM4t9aUSxsmqF94I58rxrRGiI/zXEZcu6GX1mLgMwnc0JY0rw/qLetnZRUk/FQe87lA=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5458445oib.54.1600324822000; 
 Wed, 16 Sep 2020 23:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-3-krzk@kernel.org>
In-Reply-To: <20200916162250.16098-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2020 08:40:10 +0200
Message-ID: <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_024023_143253_19B319A7 
X-CRM114-Status: GOOD (  13.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sungbo Eo <mans0n@gorani.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Include the common GPIO schema in GPIO controllers to be sure all common
> properties are properly validated.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for your patch!

> ---
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
>  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
>  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
>  13 files changed, 37 insertions(+)

There are more binding files describing GPIO controllers outside the
Documentation/devicetree/bindings/gpio/ subdirectory, cfr.
'git grep gpio-controller:.true -- "Doc*yaml"'

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
