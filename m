Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ECC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bryf82ZMClnDPgWux1fUVeewJFeCdSqsTRN7lRnirKU=; b=2zAej2ZT6mivO2
	Ci9zpW7Ks54aDGodmkCev2olHqaM+9O/npqA7edugukfZZPJrNXWzxJjnhbkJl1p4bgV0rHxaL5pQ
	QCt58zYHoTyyrmrDBILbmD8UMle7YQJmR+rKj8vXSKbY7Ih8V6hUZS6vYg0GetFSUhE28yTOw3mYc
	Rr73jIRzdq+O7waMIAvAbZIvHmsH942ez9mwGU/+f7zTTn6NAKdVNES0816EJMcl/U2whL0oDIE0Y
	EJiswELzy0eTO348OEA5qJWnPb5v50cuuFoA5SzSskjnYruzRuh2JP4nS1WJrWCrpn7RjkU14PApB
	bvRqb2moXeJjPf4z0VJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMG-000000000b3-3CTS;
	Sat, 25 Jul 2026 04:51:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMA-000000000TB-2C9G;
	Sat, 25 Jul 2026 04:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 631904519F;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26D7DC4DDEC;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=q1hgaX9wPrPFwUeLicxRrAbMkY6IDsu7w9/+g5n3QoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S8lOGUEe0PArVvRAkC3SnDX6jz5nZMZHsbs2KIMXvjPVeAad7XnPOrRcWrMDk1PoX
	 y8xuGBpabQN1tZgsGPc0x4EDjw8+0YjreRGzQ5Xc0bu6g45IvfbjJesdS42iF7fOjN
	 Li7PRlX3bD4DvlK/z4uLy7V+thXrT1kKjnK/N2iMrs2BnI+izAUcq158RqUEbuMZej
	 1RId2OzQiSzMhoXDVoiu9+Won9axm3QdvZVOxYC8Oa8U+2qj9GDgukTyuT7TLDB1E1
	 aTIbyV6dbiujyup3TKRiJO08zRuw9S32Avg3OEEk/6ri5jmaLqowN2Gidy7UStc2nE
	 7mRNhLhjxElgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D744C53219;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:24 -0400
Subject: [PATCH RESEND 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
MIME-Version: 1.0
Message-Id: <20260725-k3-display-v1-15-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=1628;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=itI/1VwTHA3V7ox5PXMT2Vrb2UKYmyIibaQ0egNmgMY=;
 b=lxKsxyQ3nsiDpUUUscV82alJ6SUbnc6qGxs7f5OilGXmyaEm1t4tajmxCZ6fWzlj3twP++IH3
 sOVsIHQ/RQ+AoQOv/aZ5YXzfJ5PmovX89KojRK+iFiaU+SLJWpbVNCv
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
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
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Cody Kang <codykang.hk@gmail.com>

Pico-ITX brings the second DPU's output to an external DisplayPort
connector. Enable that DPU and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..6c31460990a7 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
+#include "k3-display.dtsi"
 #include "k3-pinctrl.dtsi"
 
 / {
@@ -221,3 +222,13 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_1_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..2f36eba20f1e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,17 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	dp1_1_cfg: dp1-1-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(24, 6)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
