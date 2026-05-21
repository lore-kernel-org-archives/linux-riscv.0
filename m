Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C4CD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGslUZC+svUJuOFnvcXRTFqN2ejVCjtg8YlwvqUTxgQ=; b=q1JpPD6njKPsNN
	tlgZbbVWo1qU7YDUAJgXhOerftrCH9/0BhOH12zbY8QXZZpGAWTjCaFJnjP1Xw+nO84S6s8IPA5Q7
	glGgHLdIBLqWrNbJMsjRnj6blPFlYsKyUdI+/Tj88KZCBu6xpgEydg6Qt2PJWvEqji9r7J8bcGew/
	T6k4TtfNODj/nP1OmFB0h1zRNRIwH2nLVR1UI5f0knmgRTqfWobfDf/kz1YmSjapIyi/V5QEzta1Y
	7q2ks24vqEjrvGtU3MByWx5obkXDXECipw8ZkxBuT9Z+1SytfD1WW2Ecmu6ay3eJsEA/OtB0cL3gK
	aKbVHWJys+SZbsDuZeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7fq-00000008i7q-45Ie;
	Thu, 21 May 2026 17:59:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzrZ-00000007KhE-27b0;
	Thu, 21 May 2026 09:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=82qSLImWzSWwJwDL4P56RDhSxB/3/+bLg3x1B6/8Vyo=; b=0I4tMOaqwxFvPcLAyXC1tGPrfE
	HXHaVV7+wYwVP4UGjSNoFDd1VfRVRwKpSUpdi+/cM0lBIFBOtW57RPkKHZJ6gSZa57lZaOJNQszdB
	j5MhP9nNF2ZBC5XTLEZLefqvWnNibulepEtkV4okP/kU2AAENM/x1cT5yntunk8HjnN93yJVk0KhD
	4BGKyKzwZYIhS+icC3RQoCP/xlaXk2zQuPvKHmUwXbld7xPg620UPcbli2n9Nu98+Jo3ggiseSwXX
	f5u71NtNcCGIkISy1Bu3AzX1ANpj9jp2f9+W1J8qexkOfVBSIDSPhC21GfXXPezuckw1Oq9h13vk1
	Ke/2S4sA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-phy@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com, Abhinav Kumar <abhinav.kumar@linux.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy Yan <andy.yan@rock-chips.com>, Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <bhelgaas@google.com>, Can Guo <quic_cang@quicinc.com>, Chanho Park <chanho61.park@samsung.com>, Chen-Yu Tsai <wens@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, Daniel Machon <daniel.machon@microchip.com>, David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>, Dmitry Baryshkov <lumag@kernel.org>, Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Jakub Kicinski <kuba@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, JC Kuo <jckuo@nvidia.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, Joe Perches <joe@perches.com>, Johan Hovold <johan+linaro@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Xie <kevin.xie@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Linus Walleij <linusw@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Marijn Suijten <marijn.suijten@somainline.org>, Markus Schneider-Pargmann <msp@baylibre.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michael Dege <michael.dege@renesas.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Niklas Cassel <cassel@kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>, Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Chen <peter.chen@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>, Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Shawn Lin <shawn.lin@rock-chips.com>, Simona Vetter <simona@ffwll.ch>, Steen Hegelund <Steen.Hegelund@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tudor Ambarus <tudor.ambarus@linaro.org>, Vincent Mailhol <mailhol@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, Yixun Lan <dlan@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: (subset) [PATCH v8 phy-next 00/31] Split Generic PHY consumer and provider API
Date: Thu, 21 May 2026 11:38:18 +0200
Message-ID: <177935628872.1653123.15514691751947313571.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_023845_545820_DF2E24C3 
X-CRM114-Status: GOOD (  13.32  )
X-Mailman-Approved-At: Thu, 21 May 2026 10:59:10 -0700
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


On Tue, 05 May 2026 13:04:52 +0300, Vladimir Oltean wrote:
> The biggest problem requiring this split is the fact that consumer
> drivers poke around in struct phy, accessing fields which shouldn't be
> visible to them. Follow the example of mux, gpio, iio, spi offload,
> pwrsec, pinctrl and regulator, which each expose separate headers for
> consumers and providers.
> 
> Some off-list discussions were had with Vinod Koul regarding the 3 PHY
> providers outside the drivers/phy/ subsystem. It was agreed that it is
> desirable to relocate them to drivers/phy/, rather than to publish
> phy-provider.h to include/linux/phy/ for liberal use. Only phy.h and
> (new) phy-props.h - consumer-facing headers - stay there.
> 
> [...]

Applied, thanks!

[15/31] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
        commit: 9392e7340bffb406a705de755adfb44eab547d40

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
