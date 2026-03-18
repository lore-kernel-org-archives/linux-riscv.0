Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046DB10775E1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbUGLEnl1LcGNIj9i5r5q9CdJaCJ0Jwe4wP6sPCHcFY=; b=sZ0bntcJQ1Op/6
	wZearq85vnBe8X0HEBhN+C369tY1xcfkThv+iAt/Zh3A0u27QAL28z/LdiBG45dXY3rgrH7uR1MIy
	W18FQNPLoIOMjZ/Y6/8DRdo0xOL7vWJBfDlNOVGxnGPY+N3C0rlSk2+RxBNftw+3g53h6iM5NMuv5
	YxSggVf/Ou9Q14S9OyaiQleGsdnjsouc/iREMMyQI5Lus/OA++tltoj79WvKJWIPRobzRh+dnS/+n
	tIx9v9ifR1iteP6NRf5sCt1t7IncYh8D8gr8hm6kd++KnD29y2d8xbsFUMTRMFz/wRE64Vuxs+nVD
	2OVmP05BcvaH5mOpDmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuv-00000008yBz-0ENq;
	Wed, 18 Mar 2026 16:38:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tus-00000008y9k-2faq
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B2DF41E53;
	Wed, 18 Mar 2026 16:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7823DC2BCB2;
	Wed, 18 Mar 2026 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851921;
	bh=gjHC8nKBbyN/J7nUktQURQT8MLrY5TCbtclmLfjJxcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/FKct6+uK+T5Tfm5J8abXN6B2PFfJyBjsDFx4A5VbcORHRuI5TwGXnhQhk2Vyfp4
	 gCSu1s0vr49Y6T6FxWP+l63sxrbo+GlzYbtXmFZLCgU3PQS85P6sjtRKEn6eKnwJnP
	 DeNzS8TcTHDf3pJwsvcd+9rmmM2O7Lk1kcVM3xtHwRvo1nRkd02wCXh9yMe+qd6xmy
	 QHPlwPgxCMeUjLrsFX1c63Xu5MuHmIZQsHz4M/S76YPAdrMjAtpl8tuvOmkbRQP7BQ
	 TIdOq1W/bsnwS/XN71qoM1DrIydNUhRDzmA1FmjRtlKHDzrILTjfjAhmQO6vwmX34i
	 vo2aTjY1Tc27Q==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next v4 09/13] dt-bindings: net: macb: add property indicating timer adjust mode
Date: Wed, 18 Mar 2026 16:37:40 +0000
Message-ID: <20260318-overdue-rotten-0edf34901a3d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=g/wRNKNLFPT+82I0uxzexOCw4Xbz/Y2VsmMJeulMEF0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rly6LfIuj32O8wEvx7OSbabC1dvdlVOWHsiQ8Fghy qw5+5BaRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaS4MXwV27HlyWqCYyNx7sL Pk7lz54Xe/nHJ+upqrtFJzZwKa8MP8zwv+7fpGqmvgnnUpNCtgQbNLe3Pwyb5TAp/kVG1pp3E2q 7OQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_093842_723078_BAFEC0FF 
X-CRM114-Status: GOOD (  12.32  )
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
index f6df793c4af65..b9caa7e5ef328 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -150,6 +150,12 @@ properties:
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
 
@@ -199,6 +205,15 @@ allOf:
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
