Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31BAC30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+s3KRKsT1ji4Nm3VdkOKgQ+3SyIl3MZpIZCeKPtoFmA=; b=cgtsZPT1QT7KEzc2g+h1Xl+54+
	IWJ868W+HqPsfrew+f7OzCBVoYzlOtGsaOkQk3MUIiZI4N6Am/lQW/lijq9j70OMtNPe0yK41rAKq
	sfai0scGSyjTvIP32MSHHK+qVguBhFee08xJAMBldA52tQRV5Do1LQsrvsJCa4B54naoAqGrm1+gk
	U1ayykbfPb32/eJ2ehZnViZV1PUtTzwgxme2sMD9Jr3mAZ9/8WiY5u1SqB0ZCwARNa6OevV9iXGi+
	DWFS9dc/RnTDOi+DRGmHwILhqoCqRhzQ25UoIYOlrW92+spa0qfyIuboFtT8HC9UsI/4RukPKJu9z
	K11fChcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGIn-00000003HlU-1NJF;
	Mon, 01 Jul 2024 12:38:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGDh-00000003EYB-2hbI
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:33:23 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 852363FE09
	for <linux-riscv@lists.infradead.org>; Mon,  1 Jul 2024 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1719837196;
	bh=d0e/e2pXlpxb22nPKrMuU5Hax3H7AOyGMYL3diD46zE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EZwtrBxfLR7H+TO1elWsU/ATh3+MW8fq7sFnUiEqD3qmN/1xr8n7W8ll9o6yETP0R
	 sgL+KgE8I74FItsdMUkiVoA7qlpkDg5SXIHooaR9UE/wb0LU0J8g54ZeVCsIbtNlC5
	 loJdjPtTJ+piqj7N9g3pktryvPZkx6mXCdgDw4EwABaGvFBRr+Pcx06Mh9VP8HS9DJ
	 RUTK7hJk8mIXxoxaCkn+KBXjpG/czYxmdZ6iocvBCMw7FhsVayevs1rWJ5ecm9vC1C
	 bJ4gXnJyqjOZPExYxnsqEa07k/PyCnKgDQ2afr321qQUg9+NYUkpOVM7L+4GUc6jBL
	 5znM1xeqJa+1g==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4465028c0abso43019431cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719837193; x=1720441993;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0e/e2pXlpxb22nPKrMuU5Hax3H7AOyGMYL3diD46zE=;
        b=OpdnT0vKgVsfoCUz8M6mWzcNdJGXHRv2KWZVNAXdXk4f8iOjswtglf+u2oXe2ckvdT
         KJ+E6224FjFff+PrVd8TCQ1c4JGhPTYiyEvme8s6G83Ek86Ht0vqLyfeslOCSLea3nQm
         2qrq5+ZmvYlmlUAaPFvDrgcea3tDHt2rwT2aVe3rcLF36gnWuR2aCcxJfGaNnHLKR3rI
         7qGsLv8NFLYCY10/hQ1W50lISpSTCWuZhS0yZIE8ZMlLMBP0ER2RLr6W2TMtyaR4SO1R
         IdtTibl5xlm5xKVk+WWUhhvMJ2FA6xhpTH3YtFdVb275LtScZ6acAwjSkK5gwQAkG+Qq
         P8EA==
X-Forwarded-Encrypted: i=1; AJvYcCVMEBnw1jyc5pkUxuvGpHXI8yeNxaWivvrKtFF/eU3a+ye20mVaVizJBK+Ahp1KbcVzr8j7MYsfan9GCrNB4DhoDAp4Lb4Mq+DaZKYOqMdC
X-Gm-Message-State: AOJu0YwyRhYIAkR1JfzES0WS+IY+FAE3aof33M9O0P2xX2IV5yTTNdLA
	CyD3wJzoPJ7eaNDCPK0U9kx912/xSRmHP/+JSId6bB8YhqCZZXOBN0bHP6gxHzpOqL66+r/qvsJ
	F2kdGqt6hhA0eu6xc4szh7baozhZ7HpDEgu9fNOUO79W7saTJY83mdnpMSamCQQSwe9rTOtuBOD
	bdOJjaIsJCxQztFeYEYAWKUi5fodf4yNaJWudgPBkLMRsp5a5/k7EC9gU2
X-Received: by 2002:a05:622a:188e:b0:43f:ee9d:c2ce with SMTP id d75a77b69052e-44662e6a81cmr77375051cf.45.1719837193097;
        Mon, 01 Jul 2024 05:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh4KuzfoIjzU8YO1Hl9u0fOt1wzZ3+gb6jLWL+lbAdzwOQZo03t1//Q2PkHrWASmLQlr+nTGkCz6Z3Ea4CYF8=
X-Received: by 2002:a05:622a:188e:b0:43f:ee9d:c2ce with SMTP id
 d75a77b69052e-44662e6a81cmr77374811cf.45.1719837192686; Mon, 01 Jul 2024
 05:33:12 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jul 2024 12:33:10 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com>
 <20240115173657.GA999912-robh@kernel.org> <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
Mime-Version: 1.0
Date: Mon, 1 Jul 2024 12:33:10 +0000
Message-ID: <CAJM55Z-ds0ZtFCKnpFyGnWidSjj6eORW+5gBPBjdidJxSLynwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_053321_838263_54617672 
X-CRM114-Status: GOOD (  41.05  )
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

Emil Renner Berthing wrote:
> Rob Herring wrote:
> > On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > ---
> > >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> > >  1 file changed, 372 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..d3ad7a7cfdd1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > @@ -0,0 +1,372 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: T-Head TH1520 SoC pin controller
> > > +
> > > +maintainers:
> > > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > +
> > > +description: |
> > > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > > +
> > > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > > +  Confusingly the memory ranges are named
> > > +    PADCTRL_AOSYS  -> PAD Group 1
> > > +    PADCTRL1_APSYS -> PAD Group 2
> > > +    PADCTRL0_APSYS -> PAD Group 3
> > > +
> > > +  Each pad can be muxed individually to up to 6 different functions. For most
> > > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > > +  group 1 does not support muxing at all.
> > > +
> > > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > > +  be configured or has some special functions. The rest have configurable drive
> > > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > > +  addition to a special strong pull up.
> > > +
> > > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > > +  are then meant to be used by the audio co-processor. Each such pad can then
> > > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > > +  also configured in different registers. All of this is done from a different
> > > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> >
> > It is still not clear to me if each instance is a different programming
> > model or the same with just different connections. The latter should
> > be the same compatible string. That needs to be answered in *this*
> > patch, not a reply.
>
> Hi Rob,
>
> Sorry for the late response. I honestly don't know exactly what you mean by
> differenty programming models and what the difference is, so I'll need a bit of
> help with what you want me to write here.
>
> Any driver for the TH1520 SoC (not just Linux) would need some way to discern
> between the 3 pin controllers so they know how many pins to control and what
> pinmux settings are valid. Basically they'd need the data in the three
> th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
> to use.
>
> https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/
>
> Another solution would be to just have one compatible value, and then let the
> driver figure out which of the 3 pin controllers it's probing from the base
> physical memory address. That would work fine.
>
> A third solution would be to encode the data in those three arrays into the
> device tree, but I thought we didn't want to encode register information in
> device trees.

Hi Rob,

Any chance you could give me some advice on this, or should I just send it
again as is?

Other patchsets depend on this. Eg.:
https://lore.kernel.org/all/20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com/

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
