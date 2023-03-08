Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E745C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G84nYR66bxy+H69KShkKztsPz0AjujbXFKZOPLLSkJU=; b=LQlW1o+XRJavA1
	KnbrqLgRN4gHxSpTPSOwtLZ8aaX7qgM29P1Xx/92BZRMa1UIVdaRyzMb12cL6NreXAmGpaw0dQDGz
	Vw25540Plldd84GzQyi+mglvwX4t5f0I4689tNao8NE33A0tWea/ISH6+lX7AXJkc4HT2xokHqhkl
	o7Z/YOdQuJPGl6fsfsCOtkncDCH+qKGi47N3HVXn6Ms+MoPBit2dsNI+it8DgZn1uhafvTYKhTYCn
	tAdETiuuDaquStdWE7RsRLOHzzopi348iHYrX0hJYWZ+ak7zkPEMRcDFG3Ceue4DAU2rfE6IEpCiB
	HX6K3hOozXVhkIDLkBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyGf-006K5a-RJ; Wed, 08 Mar 2023 18:12:01 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyGc-006K3y-Aq; Wed, 08 Mar 2023 18:11:59 +0000
Received: by mail-ot1-f44.google.com with SMTP id g6-20020a056830308600b0068d4b30536aso9441660ots.9;
        Wed, 08 Mar 2023 10:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIxmU/QtppDrzLwRQM4/EQwwRkPiWGOq6+7u8fs1B9E=;
        b=uKpDe5IxB+zH1rvKbWohl+VmGc6vtUDo1apfttSpkMqCWskxVWNjrnUoKIv85mxMYE
         j88Ixutx/RQDxMsG7nqXIHEIdMh+L9TbNA10/Bw5GoUiNqyW2vxPaTBVwxIs43TKdMAd
         S1XsbZraQRi5FEon8m6GWl5A6uxJznbBsdwLz4G98qGCc++aVC+Nl2uQbl4wO536EmDi
         h3WHQcu//jZ3vhOcozz3h67pG26MuMUUeOIyRl5v1sH/nm6NRHR/1sVGdFGLSMTEBr1v
         Xtzz3os380yd0UH96tsSL4Y/g8f5uD0ZIgtQPAKuW+B0XsKharixFwrmEwaSb3AzK4ML
         4/7w==
X-Gm-Message-State: AO0yUKXG+icbOT8MYBfCjR9jf0z9CO/q9N6tbrjrBXd87P0Vo/GpQN4C
	kmMjXS1oLjHLcpwHj0ENdg==
X-Google-Smtp-Source: AK7set9H8k0goZQjGPEgNkkixy3gs3vd/sHKzFTM0Gx4xSIKWRHwsc1ffnNsJ1R+prua9m2CbtMAgg==
X-Received: by 2002:a9d:7103:0:b0:690:d498:56d2 with SMTP id n3-20020a9d7103000000b00690d49856d2mr7763163otj.4.1678299114187;
        Wed, 08 Mar 2023 10:11:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d1-20020a056830138100b0068bb73bd95esm6636451otq.58.2023.03.08.10.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 10:11:53 -0800 (PST)
Received: (nullmailer pid 3526245 invoked by uid 1000);
	Wed, 08 Mar 2023 18:11:52 -0000
Date: Wed, 8 Mar 2023 12:11:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-crypto@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
	linux-riscv@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Eric Dumazet <edumazet@google.com>, 
	freedreno@lists.freedesktop.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Sean Paul <sean@poorly.run>, netdev@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <167828471597.2730705.13533520056770041535.robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_101158_380297_E2E8E718 
X-CRM114-Status: GOOD (  16.45  )
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


On Fri, 03 Mar 2023 15:42:23 -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/.yamllint   |  2 +-
>  .../bindings/clock/qcom,a53pll.yaml           |  4 ++--
>  .../devicetree/bindings/crypto/ti,sa2ul.yaml  |  4 ++--
>  .../bindings/display/msm/qcom,mdp5.yaml       |  2 +-
>  .../interrupt-controller/arm,gic.yaml         |  4 ++--
>  .../loongson,pch-msi.yaml                     |  2 +-
>  .../bindings/media/renesas,vin.yaml           |  4 ++--
>  .../devicetree/bindings/media/ti,cal.yaml     |  4 ++--
>  .../bindings/net/brcm,bcmgenet.yaml           |  2 --
>  .../bindings/net/cortina,gemini-ethernet.yaml |  6 ++---
>  .../devicetree/bindings/net/mdio-gpio.yaml    |  4 ++--
>  .../phy/marvell,armada-cp110-utmi-phy.yaml    |  2 +-
>  .../bindings/phy/phy-stm32-usbphyc.yaml       |  2 +-
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  2 +-
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      |  2 +-
>  .../regulator/nxp,pca9450-regulator.yaml      |  8 +++----
>  .../regulator/rohm,bd71828-regulator.yaml     | 20 ++++++++--------
>  .../regulator/rohm,bd71837-regulator.yaml     |  6 ++---
>  .../regulator/rohm,bd71847-regulator.yaml     |  6 ++---
>  .../bindings/soc/renesas/renesas.yaml         |  2 +-
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |  2 +-
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml |  2 +-
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  4 ++--
>  .../sound/qcom,q6dsp-lpass-ports.yaml         |  2 +-
>  .../bindings/sound/simple-card.yaml           | 24 +++++++++----------
>  .../bindings/spi/microchip,mpfs-spi.yaml      |  2 +-
>  28 files changed, 65 insertions(+), 67 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
