Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB12EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzFKgk2tkAHGmxIIS/L+GMjhzHmYwYIzjS4tyLJGom8=; b=ZtOtaOweVqsLSZ
	wCDsw++zLnqA8dX1xTwDyo6AHgT89SV5b9eoogVJyHucS25QLsjv8/NSibAXUCbjC5eEdqbDJEw59
	BlJI5aK4vAxu7Z73QWB/ll08QtyjlDmSZTvsj6WENW/c1kcIdkpMAVw8unz9sFqn+/UhjvtXpZ5db
	Qc7gc+IJkQLO9zOJrc0+V/iC2MDgVgdrDaFkz7WGut+wSj7T6yCun4jwDIvPDVUz7Npq7Me/263z6
	5O7eTsqBtA5kTr9SCzqwXshwr81b/ZMYgaabn34X0qjfqNp7vuvTKW/m248172EB3LwXaOv1XIlLi
	JFUnvHjMHqYJ47/g8j0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePN-00G8Us-1G;
	Fri, 08 Dec 2023 17:13:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePL-00G8U5-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4784E62513;
	Fri,  8 Dec 2023 17:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4568C433CD;
	Fri,  8 Dec 2023 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055576;
	bh=iSOH3A5QgqhsUj9+GFj8Hb2u5gLp0VTCfaRJ8xMnQ1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VABdvc3X+HfnTcOrHRSGRUAlP3Uu1ZxOXC3BOmQniPEwEvKAIf8IoNlcMYa50lrJz
	 16uCHntwA8hPcEbJoeoKu2M++xYwFNPcdVp1/y8/HTN/E6lut08HsKyVl+uuSvVlXE
	 C+M8qRtJipr+GhcqeMabuac5x1ckqTkeFgLuZc7xPGkQut7S3o+BFoZuqiPKK9TAeP
	 4/+rkiXDgyE6I3nrkkmkb26s1+916Xhb7XXKxph1y0nTUeqD/7sbFNZv5jtCAvPo6/
	 78anyRettPtws0obn4n8Q4SbOIYDTUSqHTZFRm2oYjHO8u3R+T/++NxLql6pVxT7ec
	 hwCqrh4TCECJg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND v1 1/7] dt-bindings: clock: mpfs: add more MSSPLL output definitions
Date: Fri,  8 Dec 2023 17:12:23 +0000
Message-Id: <20231208-unripe-maximum-fc77f4967561@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208-reenter-ajar-b6223e5134b3@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IbMe5Hhtp7MV7Ctc98IUVkgW0I0cOo4e8OWx+9g0CX8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnFfuU+JieKTecHfDe752ckWn/icPKJfy8j7nDpGagsS b4oX2DdUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInYaTP895jzPVshhKlxzoHU gpCrj+ZY3rrPoMV6z5xjYsLJe2rc3xn+KfKuLrouzmB/5vnhywLhrufmzys1Y37vX5fz11SfwWI ROwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091259_264327_4C91117F 
X-CRM114-Status: UNSURE (   7.81  )
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

There are 3 undocumented outputs of the MSSPLL that are used for the CAN
bus, "user crypto" module and eMMC. Add their clock IDs so that they can
be hooked up in DT.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 79775a5134ca..b52f19a2b480 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -44,6 +44,11 @@
 
 #define CLK_RTCREF	33
 #define CLK_MSSPLL	34
+#define CLK_MSSPLL0	34
+#define CLK_MSSPLL1	35
+#define CLK_MSSPLL2	36
+#define CLK_MSSPLL3	37
+/* 38 is reserved for MSS PLL internals */
 
 /* Clock Conditioning Circuitry Clock IDs */
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
