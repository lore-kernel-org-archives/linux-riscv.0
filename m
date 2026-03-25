Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946F1109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZJGemnSPYIg2GRliXLKHxeatBVoqNaBJvrPxmcnnwQ=; b=sbIOxOyyAaDIq9
	5pl3pmqMWtcFJdjCtzg5XBtCtPsMe9kG+i5TkyMCnLcVt+Cp/qvI0lkUn/bi5DlC4R2C89kMGANZs
	Eyq0DSwcU05pVCDrlV53KAwttrN8DEOkzyCQG9SC6Gm3358EZUGwVCtbHqZkLhQUFtJ5V+OeI39Ik
	5IVefrF4Cj2pkyaU1Nr1rwTyUWwzMlc5oVJwiWQGZz8vMCL6nMSqcgRHoUjlgjT9wILT48txZx1hH
	wE79LUFRuOZzn1b+etKnyzDlQ45gxD4wsl57Pm0PNg/B8X56p2JoWZ31r/IlGD1UI05qPDR65HXED
	/aDTS/z6udtZggUi+y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R79-00000003tPH-2AWu;
	Wed, 25 Mar 2026 16:29:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R77-00000003tNw-2IEi
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F49643C95;
	Wed, 25 Mar 2026 16:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74340C4CEF7;
	Wed, 25 Mar 2026 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456189;
	bh=djigdiiWtg5Ve5KXosHk2GFYWy4trdHi+BpBld8PyFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNUDHwPvLt7vwM1JGqjK0eft5SREZLSN3w90el4jsWOtsVnpv99o+6aN9KM+iDu9/
	 1b3TIaXgNyCQ6Ji7yJRPyoGrslQJBxztTPGYs2oezcnbk1u7Q14odTn7IlI3RtdB5i
	 CCvi7dGKL1tmoJBeKCcmEI3KhUbGHgFyEkR2x7TZyibYoWuCrdHxUQjmQMTd2bH0x8
	 /FUpUGkZLa9HG/1xTC1WCKEJIEBM7HmRUd4enMB/hn5X/ZD582f6DRwlniMxFz9R/6
	 Mpeye4BBtDogFUZSdty6wit+T96xoVljx1t7DSMu8mVmRJNr6ZV9vXgHtsmz9fh024
	 fFsKx4dJW+vNw==
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
	Kevin Hao <haokexin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next v5 10/14] dt-bindings: net: macb: add property indicating timer adjust mode
Date: Wed, 25 Mar 2026 16:28:14 +0000
Message-ID: <20260325-daily-entitle-3640f7254da4@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=PRhIJTmaVKMM0MQHK+yqnhr39wQYhs54BbhF9Smsdok=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM2Xz190RHr6nlUFK5/P8vOq3avWVaUrntvhv7JpO q9f0j6pjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk/1VGhot8a1tPrf902l8z 9xmrXIXI+fU3trmvdap/suTo/3930xMZ/td8sPAM29q9KcmTY/nGmrb96ov0zm46/CrpB5vakfp rfnwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092949_629545_EE2B4DF0 
X-CRM114-Status: GOOD (  12.78  )
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

The GEM IP has two methods for modifying the ptp timer. The first of
these, named "increment mode", relies on software controlling the timer
by setting tsu_timer_incr and tsu_timer_incr_sub_nsec and performing
once-off adjustments via the tsu_timer_adjust register. This is what the
macb driver uses. The second mechanism, "timer adjust mode" uses the
gem_tsu_inc_ctrl and gem_tsu_ms signals to control the timer. These
modes are not intended to be used in parallel, but both can be possible
on the same device and which mode is used cannot be determined from the
compatible on all devices, because some users of the GEM IP are SoC
FPGAs that permit configuring how the IP is wired up.

Add a property to indicate that gem_tsu_inc_ctrl and gem_tsu_ms are wired
up for timer adjust mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/cdns,macb.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 50490acbb6fc4..2c8c080a3d881 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -158,6 +158,12 @@ properties:
       that need to be filled, before the forwarding process is activated.
       Width of the SRAM is platform dependent, and can be 4, 8 or 16 bytes.
 
+  cdns,timer-adjust:
+    type: boolean
+    description:
+      Set when the hardware is operating in timer-adjust mode, where the timer
+      is controlled by the gem_tsu_inc_ctrl and gem_tsu_ms inputs.
+
   '#address-cells':
     const: 1
 
@@ -207,6 +213,15 @@ allOf:
       properties:
         reg:
           maxItems: 1
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: microchip,mpfs-macb
+    then:
+      properties:
+        cdns,timer-adjust: false
 
   - if:
       properties:
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
