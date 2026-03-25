Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E45109C033
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jyOWS2MOUVWxHJ0dUfutuXTkh6HkRm8vZ/Go1gBaAo=; b=3yiMB9Mqr623I2
	H3HPamICF3503DCfeQS/g7yozLrHD/e5DyGf2l3N9F/7TlcBC28L2ZqsUe1CimhO3nukiW22lDW8S
	o0MOcPtzUrM1XvMkoyTSnf6JHnzftQXJcwsW6hlrpNMI0yPc9gxHAEHcLN7jp9E25Ge0QVdySy3Cj
	sOh/pyqErzNFBEGSTjoNBsKygbM6Kb+2XDf9iMzrSMxIL4LyuTULYyQiVeWli27FfSCWhMhpn4dK0
	cDrgNBaEjwC3aRJjgb0X2sOF48h7dr6C3E6d0P9SBReSMhuLiQbrNxjdL+aoiHaIn9TCMYTTu/5cu
	SBz2I4blI9u11MTe3cHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6n-00000003tBp-0z53;
	Wed, 25 Mar 2026 16:29:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6k-00000003tAP-09Mb
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97DC1423C9;
	Wed, 25 Mar 2026 16:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093EFC4CEF7;
	Wed, 25 Mar 2026 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456165;
	bh=Sn9HaRfi1ZPnZhiBsOsyXdj1yYXuqAPKpgTQlpo/qxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyZoEQh/MqFa3DZ7+PBz0skpBv9yN2/LxiWlHj1mnnnoqAuI2xmuYuMD4TRoK0XDd
	 5GrknwmTirExjtxscjBos+YON8HbteB1NtpcnKWrnjtIqffbnG0V0dbEgudgHzh2zI
	 afEVe65mHfMQob+6Dmo2x/Bhn3KE34LhXEAtu3R50skaCT/cePUMeuq75PtUaocGsp
	 NNtBGm8y1ARXKWHNYWD4zkDqOKhuoKgD3BdiZStjcw3dTQI4/1wYizlIWlK1wECCqW
	 xoNrN97U5mcc8s4MxdjMxWWsGMxLID5OBYBi3+My8s+myPseqWX64S9dxmKvYdoiT8
	 bAwLyOUSiBitA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 06/14] net: macb: np4 doesn't need a usrio pointer
Date: Wed, 25 Mar 2026 16:28:10 +0000
Message-ID: <20260325-passover-rimless-73c19c67d94b@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LNJYyIg9j07IeOpXCUTvA6g7fWFWRRaU24pBhU1Ggbo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM0e9xb8ujNFYPOCJczHZu58rnjXTq+cZ2uhjXnIr xCteRFFHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjInF8Mf0Wlu1eycMSezr3Z X3H9Yfa2gILboiqTztYF51dekv57R5WR4YNGisCduWsunay3/VjE/sbvvIG5sO/ln5EPRBWdO3Q l2AE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092926_111297_E23C06E6 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

USRIO is disabled on this platform, having a pointer to a usrio config
structure doesn't actually do anything other than look weird.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a436521460683..a1f8a6d9554fb 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5613,7 +5613,6 @@ static const struct macb_config emac_config = {
 
 static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
-	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config zynqmp_config = {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
