Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4335DEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zz4oPuxkUZuKY6sR6vFeioIBRiGtVfGKZWLnqppycxM=; b=rHOLOCr0ktV7VS
	XlNjGzVVPoYq8K3FN6OI6AhyH6wIVfKPlWraMB3gMsRwwd7yPjg6PVvOGtdwHbZDLH31n1xRn2b+5
	fQt6Rj9CzQWU6h6CQQBqLPLo9qLHMFLfkxKjB0zOu/5llSd/jjBCOpVyP/Cmlw1JsYUf5fxZETCL2
	rgPuZ8yrqPDda+FzoXXrbhPl3i0YdTS8qNX4wxEJ3C4huDJ+9shVIIVui9LVtfg4QrOqLP/i+YCUt
	9fDYKBblIW5Q22rSIZKrkBKudQrhYKGEcDpntQun7mUneDO85eYcWMskseEIVm+wQK3CO9hWseahV
	j1s9NsRW0FCal/170v9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMyQd-00FFUO-1g;
	Fri, 21 Jul 2023 22:16:51 +0000
Received: from out-41.mta1.migadu.com ([95.215.58.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMyQZ-00FFSh-10
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 22:16:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689977799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SGOT/l6CA2g1AAdldYA0RXmYrJ8ccwGw6CVVK+w5BCA=;
	b=VLdIbyfiarCZNCB0QlGxH273eSht0Yq8c8LmI3LDTUsl1VYdq+uOx1lz43tZRA8ERNOt9U
	yQE1SKMu2JAEAm51KsOLPPLUlM53OvVtECwynDB97Wm9cl4c9dYK3SId57lMAJC107p8jj
	x70KJmniOy1xmL1PXrPQt+03j+xfzjTLPDOwfpa96KiJ0RfqjhSxWczv6Sxn+YnNObhQ04
	+uFiu8BSWoEegNqTDmtgTSwGBMF3mMw8sjojvKJb+x3tis+ZERqMcFMJaY0j8lnlmCVrJa
	yBIyGkDKSbPxLjD5Btmia3l7tFY5kZ++eQuTUIBbyZmTDIzcPuBLXpUyMkrBVA==
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	John Watts <contact@jookia.org>
Subject: [PATCH v2 0/4] Add support for Allwinner D1 CAN controllers
Date: Sat, 22 Jul 2023 08:15:49 +1000
Message-ID: <20230721221552.1973203-2-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_151648_088253_BFB45FDC 
X-CRM114-Status: GOOD (  10.40  )
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

This patch series adds support for the Allwinner D1 CAN controllers.
It requires adding a new device tree compatible and driver support to
work around some hardware quirks.

This has been tested on the Mango Pi MQ Dual running a T113 and a Lichee
Panel 86 running a D1.

Changes in v2:
- Re-ordered patches to work with bisecting
- Fixed device tree label underscores
- Fixed email headers

John Watts (4):
  dt-bindings: net: can: Add support for Allwinner D1 CAN controller
  riscv: dts: allwinner: d1: Add CAN controller nodes
  can: sun4i_can: Add acceptance register quirk
  can: sun4i_can: Add support for the Allwinner D1

 .../net/can/allwinner,sun4i-a10-can.yaml      |  6 ++--
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
 drivers/net/can/Kconfig                       |  4 +--
 drivers/net/can/sun4i_can.c                   | 22 ++++++++++++--
 4 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
