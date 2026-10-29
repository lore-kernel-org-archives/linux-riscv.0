Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F17606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJtbyT0M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REPNfOIq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ldKIWp0ZU6vFSAv/PdfpjxmygQT3GtjrtWNKUcfU7Us=; b=dJtbyT0MNyyD0RCFDpmz+8bvIr
	LUdc8odsmQQsuTngxpfYryJfRCcDTAw+E9EL0q83XFsDLhHHPnCFSOJhY78pYybcI3zl1ajfd6zpq
	enrckSdgNPeKgElfIoEDQDVgZQ6ifS6wKMgzN7fZS10j1Higndt0gvuz0EIrNAdnbl7ZEokukLxXd
	hnbV0Snt8cCq8lcrcVtK3Q1expzpraD4r8M9+tPIQn0XzZs7SGysBZ2ovq/cfhyT0qCy6RelDWslF
	2VBwXzPwdL4a67F1zjnq3oXt/hgX1Y85IJrDOGsaxrw43svWUX7ED7kPZiS9w9IIPbZH4PjDyb5t4
	7Mmjwx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMU5B-00000009zLo-0oFF;
	Thu, 29 Oct 2026 17:38:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMU58-00000009zLP-1QX4;
	Thu, 29 Oct 2026 17:38:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BFA9414F5;
	Thu, 29 Oct 2026 17:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D1C1F01816;
	Thu, 29 Oct 2026 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793295509;
	bh=3yi7vVuv+eKxDx87ExEOV1/lyZsRH8+jZ24mpM+JqJ8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=REPNfOIq3/sYRsL8rQJyzwTAAZo5OUyxQPjLaI+R+hfPwuSNLQY1vG0tgQQ4A/gCO
	 ellW8oyVoeTUNvfT9oWU4Ls7NzL71AxafFZEqztIg16oqVOo87aBg4QF3fR9A/dOPY
	 kcG0BBxWwDH8Owa9G9hGWs5BBJK+BUFsenfJSUDyhuglCMc03EsgGnegkFcyk4uJod
	 I/2IiIf7i4sARTh1agGKBNXN9qFSLosip5Pcl97ihq2vObgT/WAMYDQAYDEkMw/q2V
	 J7ujr7G8cu43PRX+Tsu020HQHDhAcaFsQYixOPTUJoKUsdySkIOVVNhQGdE5bdLIwS
	 QeR4REAJQLGdg==
Date: Thu, 29 Oct 2026 12:38:25 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 William Qiu <william.qiu@starfivetech.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, Andy Yan <andyshrk@163.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Dominique Belhachemi <db@domibel.de>, 
 Maud Spierings <maud_spierings@murena.io>, 
 Joshua Peisach <jpeisach@ubuntu.com>, David Airlie <airlied@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Paul Walmsley <pjw@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Yakir Yang <kuankuan.y@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, dri-devel@lists.freedesktop.org, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonas Karlman <jonas@kwiboo.se>, Graham Markall <hello@big-grey.co.uk>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
Message-Id: <179329528881.3539981.14637229355908751610.robh@kernel.org>
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 29 Oct 2026 08:53:38 +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map, and its
> two children: the PHY and the controller.
> 
> The two have separate resources. The PHY takes the 24 MHz reference
> clock and provides both the pixel clock, which the VOUT clock generator
> routes on to the display controller, and the phy the controller uses.
> The controller takes its clocks from the VOUT clock generator. What
> they share is the register space, which the parent maps.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml: Unresolvable reference: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: hdmi@29590000 (starfive,jh7110-hdmi-subsystem): phy: False schema does not allow {'compatible': ['starfive,jh7110-inno-hdmi-phy'], '#clock-cells': 0, 'clocks': [[4294967295]], '#phy-cells': 0, 'phandle': 2}
	from schema $id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: /example-0/soc/hdmi@29590000/phy: failed to match any schema with compatible: ['starfive,jh7110-inno-hdmi-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
