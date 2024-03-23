Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050AACD11DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=dK/sjMe8kuv5Dk
	5pgAViDlOmhg8li84ZS25kr8xSLDto1rmywLCkGMQ0b50RgqScim2NnYQu0cPuBmgV465x3X2va+b
	T7+oEqssd4ny8B22fTcEAU1qNoyHla91KH2xDFcg30CIc4/bHJ+HNaIQkQKLWOLSBxr0f9VhGUYR3
	8nqhq+LYG5vri4EJMpsibAaPp4H5ndywcgYyC5jOL5HfXtSUwN2Wr8pQm5/tuMgeuJYR+AZKQ+k5u
	sHU7khFrHWDSa/EzD3XnAl6E5GAVHu+SHNW1avcOJD3VC5v/XjOCzarRjLEM2syzVij2CKRhy72gt
	0FanEWSboIjiBe2nhycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FA-0000000AKdl-1933;
	Sat, 23 Mar 2024 12:13:00 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0F6-0000000AKbN-2NV2
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195965; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UAwxZfTOnsMlrE0TydZIYo2U64LS6Whupe6SfLEEtEOlbmXjOxygdcxmK5wZ3cK2d
	 6Lltbx/BQLihIpvr/9ZN3RZMuh073rTY2wnl/VThwTXbxaCnHKCo0edtWmjS62xRXi
	 jRgecDXEwuLgJFvQOFB3kbkqXaDYI3HvwOSA/m4c=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195961tqo3gwp33
Message-ID: <tencent_1B8B214D8D4B7C2D8251DA428E0CB8013108@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeie4AIX3n0T6n2lu58j6vXgROfiC092HgAEm8RRTXfZaJpCzJ9OiY
	 2B7IOHvEe5F7TNPSPasm4NV1ylAM/5PTbvvLAZQKWxONeUuasKlNFaqFniXuJbAmXfkNXgjS/ZZz
	 OimQYeLT+dYTxJ/EIkojZeoS5ivI/d+OxLzQopg9DxHHf+IN7/cTQJpD+3CZltaKO7K5AwOZdGmj
	 CTKTJpKvbSugjXBsYoaxWNZpMv6VSspUOXTfnHfMND5W0cK5AUxRKRqj2/TNcEsLefe2TXaaW1pt
	 zmTyQ3GyRo3XCgpuYMhQZisBFfPtlx6QOh9MrH5l0C6v7GMjX/NEbBVh5WCqQ09sg/nHeOWxP3hp
	 oqiNSgxKNddrjrUy9zMTtwdE90mvNvHK3g3DLtqIjRaAy4cOddiEZHdnQh29hrvnM2K2PKJrm3rf
	 fRegbfQZYzl4O3N4Rb1fOimJxgnMEX8Is7NVK55JzYR5gd7rZqYVVeFV2t+xDmzcEPNcjiDawpyr
	 06xovEC5i6TYjxdMVYVsfRhqeQhRoK5zo+1KLniy2UI8tkKk8Upn5pnf+Da2N6jaltb3U1IogbsY
	 6km1CBdbtyJo4K7ewGF9kP8deREHeoMrJfmzQU+P2l5rxMU6Hy5Wcm3uhbJLZ9+hcIRZOTlaNpy4
	 b5OSShNl/P9PnZ8OJ1bA4/ZdCfdafoRZm4hKXEHYB9wSOhhDG4lUGuz+z5iJrCUrfBzs+U5xXmdd
	 XfI4GM3/nbRaHBcY18Ker+tzMJBTS/xwJ8VlSUAf9SoBc17iguf0PwElOK08rNH1zl71NRvzS40B
	 //uBduVqBx9JYSwCGlngR1wy/RQ+UQPH+rllMv+eByNiD3+9uFQF3EQJj47SG3QN3EIpxDI3OAMY
	 BAXG83xCcSc2tvgPdGWJWN86nWFZxBrjYEPwYLC7aYJfkuuvz4oDznP27HGQ5Ej6YjfQoBpPYg4U
	 HBkgRnDB1ylFphWhvEeQBAXLY8VezRIeDWfL+plC8WkZQjZK7wBnOG/BNoLzjTOUPTNpLDf8df8P
	 5lIPm+YKySKuJyNLDV
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 02/11] dt-bindings: add Canaan K230 boards compatible strings
Date: Sat, 23 Mar 2024 20:12:14 +0800
X-OQ-MSGID: <20240323121223.1729328-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051256_960996_8CD0FDD4 
X-CRM114-Status: UNSURE (   9.63  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..f9854ff43ac6 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,12 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - enum:
+              - canaan,canmv-k230
+              - canaan,k230-usip-lp3-evb
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
