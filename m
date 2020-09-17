Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13403C35257
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:58:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B01382083B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 06:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7zc2tOy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ireK4mUj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B01382083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NuQMZP7KF1ruLg2hv+PeAoKRgZOMijD8cqYQluShLkM=; b=s7zc2tOysv8toyPJ9ASEb4iXf
	LS3eAjRKcVZXknPnbTZKr1QL5B0NhZCdK0B3gmOhOGadKHCa0uPfv+9trJMcGZHTADbCUISoX0m7k
	+4UQ8oubNuTJwthAXATRTN9yUDC9hTNuxSBpO6SEkgZMcLxvdl9UOJkeezSFFuCufVtnjDPbftiJA
	5nI8ROjrSYr/Vl8E6G/A/F6j/RL1fmbIJDPi+n8tnPUYAAAujAIxZV3yopkd4ClaRpPEn5lXydaVn
	DAXLsQRz6SWt4TeBxTZaDH/dzcxX6t9aNAm9sgo5/n/8VY/JSv27ooAAnAlMuO0m8JDhf7mRFNL1V
	YtJK0qwTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInsG-0008Mk-89; Thu, 17 Sep 2020 06:58:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInsC-0008LU-4F; Thu, 17 Sep 2020 06:58:29 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2DB0221F1;
 Thu, 17 Sep 2020 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600325907;
 bh=nPSrDuBIqK++Cs2Yf8watCT9FKUAvE8l/UEvBK+iyoI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ireK4mUjRTqzSuHxOMq/8P03KTTPU2Z0ts/OTfO2sTSPznNJ0a2B67cYEfQeGlg4j
 6xip99TL20eHHAbQBd3VMLQXOngAAOdVrQIff8ySO/3rl31MfU87HFrn9V1fNJHVB9
 lB3AMi2Zv2pGKQ9u4wSxtVx1pDOYuaaBqYRzKQ+Y=
Received: by mail-ed1-f50.google.com with SMTP id w1so1336812edr.3;
 Wed, 16 Sep 2020 23:58:26 -0700 (PDT)
X-Gm-Message-State: AOAM532Pdyd0BLM6MtSRfhT8EMwwMHQaf89PsRlo8AO9b7tUJWumyYMn
 x/fU4BE3EkMVL+ykRstFzbVkWAJyVJCdWkl/+2k=
X-Google-Smtp-Source: ABdhPJw6oBjGfpKJpPCFXBca1WTyVw1bjowRIiOkT6Iq1M84hhnCUG0jSC0ArmHu21bBl/Bc3OMUftiIy2mZoqPT59s=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr31833332edn.104.1600325905101; 
 Wed, 16 Sep 2020 23:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-3-krzk@kernel.org>
 <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
In-Reply-To: <CAMuHMdUS134fokz9Xus_pnL6tVYvgQE_uAS4Q-+B4r77VeY=xg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 17 Sep 2020 08:58:13 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeTTbrz5Ja8Y=qeCx_vbUub9sBzQqQY1yNa8dWN0nafGg@mail.gmail.com>
Message-ID: <CAJKOXPeTTbrz5Ja8Y=qeCx_vbUub9sBzQqQY1yNa8dWN0nafGg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO
 controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_025828_310083_71040AEB 
X-CRM114-Status: GOOD (  19.04  )
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

On Thu, 17 Sep 2020 at 08:40, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Include the common GPIO schema in GPIO controllers to be sure all common
> > properties are properly validated.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Thanks for your patch!
>
> > ---
> >  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
> >  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
> >  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
> >  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
> >  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
> >  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
> >  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
> >  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
> >  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
> >  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
> >  13 files changed, 37 insertions(+)
>
> There are more binding files describing GPIO controllers outside the
> Documentation/devicetree/bindings/gpio/ subdirectory, cfr.
> 'git grep gpio-controller:.true -- "Doc*yaml"'

Oh, indeed. Thanks for spotting these. I will check them and send a follow up.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
