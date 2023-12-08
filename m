Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BFAC10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fqi2zwiT5Phk6TVO0afoZjdwFSq1trh1MZ6cowvzn+w=; b=YNhPLQXdoo2OAl
	viBNVUjbXwgu43xfMnDxll+LMFMnwSHJm1+TYQ3+YEez6GSpSrv6d0H219sjPNpFj1z2fhituXRjO
	juveaHJR7Ez8igkxugZ36eO+O7c3JfuihKXpRiLXWDxpZZ1ELjd+mlTX8+XvqYxW8XaDoTH0ctaPn
	a1vptvD9uNlFrt7iCOkgmTJNxvmsOI+xzGGSe2i7IM+ET3xc4ftilygOmu9SHE3OjPNb2eBvVHDI6
	K0E1kV23TaNzCHx8S4FCftAELQsoTvnRDfENXIhoCW+6hfNRQggYf0tulMSM1YWK4xD3O3ISviTgu
	JOHGHFV3x59RmoR9B+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePn-00G8it-2z;
	Fri, 08 Dec 2023 17:13:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePk-00G8gV-2v
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DA9A62529;
	Fri,  8 Dec 2023 17:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C14FC433CA;
	Fri,  8 Dec 2023 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055604;
	bh=8ebnwItR1hA/vG3C99K441+Vr5JnEbuXL+hnQjJvrlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TAmcUMkQgVIofiBroeXwmP8mYZXdKSioXvQqiTLBvW9FPtTQyLwDLPGNmlvNVFqQR
	 +uvda5arfvyt8eCWgXSMAye8qqDTSZ+PSAkqV9bZW28SldC4Mw0RJeD6uu91Vjcriu
	 apQz1mzct1m0LYg4klTqSlxLE6qgOEHKpKekm9fZgg4X2Zh7EVsseQWYA+a6yR/TF1
	 9zSisp+eO+ecV1QL2SW4sMhh42lDxErTvJ0MQZ+UB4l9Ja+swIeeXTfyFUjtrSV1Hb
	 Mt1jyhNSDg3fI/xKqdCPocb/CmYyU61CqN5q/3jKVB5H2LdS812ZRlZ1R57I/HbuXA
	 alZ+axg3839rw==
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
Subject: [PATCH RESEND v1 7/7] riscv: dts: microchip: add missing CAN bus clocks
Date: Fri,  8 Dec 2023 17:12:29 +0000
Message-Id: <20231208-resample-selection-3c2c8cecc489@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208-reenter-ajar-b6223e5134b3@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RYPfJmYcs7V5ACe/34q2uMhx5X6TiyQw/MbNSCCgx2w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnFfhWd25pCLOOPcTcWOnLsarjXMGNLbUqY/C/Nuy4uX ksOVJ3pKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQazzL84f1mHnxx+6Gvt77X 30v2q376f8XhnOeVFya7hUQJGGkFrmb4H/WOae21x1cDEzZY1l1xvbswMWRqwJp1er9vPps4sey TOzMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091324_988706_FFBD270D 
X-CRM114-Status: GOOD (  10.34  )
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

The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
CAN bus clock. The bus clock was omitted when the binding was written,
but is required for operation. Make up for lost time and add to the DT.

Fixes: 38a71fc04895 ("riscv: dts: microchip: add mpfs's CAN controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 266489d43912..4d70df0f908c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -416,7 +416,7 @@ i2c1: i2c@2010b000 {
 		can0: can@2010c000 {
 			compatible = "microchip,mpfs-can";
 			reg = <0x0 0x2010c000 0x0 0x1000>;
-			clocks = <&clkcfg CLK_CAN0>;
+			clocks = <&clkcfg CLK_CAN0>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <56>;
 			status = "disabled";
@@ -425,7 +425,7 @@ can0: can@2010c000 {
 		can1: can@2010d000 {
 			compatible = "microchip,mpfs-can";
 			reg = <0x0 0x2010d000 0x0 0x1000>;
-			clocks = <&clkcfg CLK_CAN1>;
+			clocks = <&clkcfg CLK_CAN1>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <57>;
 			status = "disabled";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
