Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9810A1E63
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0tv6fLelTh3qfbtsp0QHTfpC7W/jGv/u8VZ+QeMRMM=; b=C9JCNnYhyjdJOP
	/EwP6AUWPxXUM/CnPmAmngYNARfrDxd2wi9q9deAhP1+8XCfza/HU4kGW1L+U+2uzb9juuPeB36qK
	OcWWCdvIgweyUwSvLC0a+rv51WsGDQuYddLi+kE0fboxiA+VV0lOo/Nnt5Q0TG42z93g05Zr7lur3
	wwbJLoMMxrLne6pKVkic8y/hbKAOPtsi7lh+DuIFlSGVb8hEhcGDVxVAL+gGdMp435u/VFyuGyrcW
	bJjTnNOIpyjeKS3MkWNyundGEuXkpmwKcl7E9UiMRf2GVvdmOeg9mjf29+2tc5Zh/jOlBvpUY4tDY
	ad+XfPnbctPSrTGf+Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pas-0000000638p-35o9;
	Thu, 26 Mar 2026 18:38:10 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pao-0000000635k-3WSx
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 18:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=+KcrpH8cwpBflE8VQsFexd/Z08Riudm3og8OXJwlHKs=; b=e9aQd6DzTfCmxNpweipgrREW1l
	0UXaQu4R9x8fFWKS1BIIj9CQfmi3R2KaM6qU+uFNDy19x8Vy1x6oL0psyhdicFnl4PetlH/rcGsd3
	5bbphhjJUniMorY84mibFyR94ezf6t/9lQknfVW/qwhnNlmBOxAFSYNCqp/LA0sH2KfChIgh7PwlO
	ddEsDQ8FI1qJApvR+vNh2nt0enzH5f+u+Bh+r8H1+LNBoQVqCDbkQdtGa5adIHd90dSxYxIxx8rom
	nk3Wr57Y36Mqc+/30tC7GcOyhLGL19i96tTrkjbBXGOxdUJCQw1BPkZlE92TXVy4Sp7z9mn7pOYLF
	5q1unowQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pal-0000000GAjN-3tDk;
	Thu, 26 Mar 2026 19:38:03 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
Date: Thu, 26 Mar 2026 19:35:29 +0100
Message-ID: <20260326183745.1370642-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113806_873748_63BD5C9E 
X-CRM114-Status: UNSURE (   8.72  )
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

The Milk-V Jupiter board provides support for two LEDs through the front
panel header. The "Power LED" indicates the system is running, and the
"HDD LED" shows disk activity. Configure the corresponding LED triggers
accordingly.

Caveats:
- The LEDs are driven through a 4.7k series resistor, making them
  quite faint.
- The disk activity trigger requires a storage controller on the M.2 or
  PCIe interface. That said, it matches the purpose and the vendor
  kernel.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

v2:
 - Collect Reviewed-by:


diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 9959c8023ece0..3cd83c5924e4f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -21,6 +21,23 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "pwr-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+			default-state = "on";
+		};
+
+		led2 {
+			label = "hdd-led";
+			gpios = <&gpio K1_GPIO(92) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
+
 	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
