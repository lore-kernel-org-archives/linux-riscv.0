Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CCBC54F50
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuvejzm2bTpnnYsIOHtuKgLwEF1kUPfaLXZim54DgUw=; b=E+cMJO6wJ5Fhf7
	NIhU4YcPOODTLR+ntoyWLnzPImUQlt5sbhMKHbgnTrcp6/chIRLOwcEfMySlTO48dNLvCNY+iDpMK
	7CwJKA2zq4bpSZsclkV8fiSnzoHfB43TQq4KpLnuVBa6phDeO/c8Wtu3N0bOMDH2DLq9EbAEUXe5a
	X4WtzPKXw7R1CAN31RGQn1OIIJHwLjlx+Y6hUqSv1yGp5kYGcrQfXXUZk+oh+Oc0eSoizrJGnl2B9
	bj9IK5SuUSuPSJU51tjv6qmyj1QIuu6Bc5/dlAj0BQ7cPPxove7x+WRUhwS5i0DdmECDQrmniIGqA
	PFuLrAB749IukyrjdAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMH-000000000cB-0r83;
	Sat, 25 Jul 2026 04:51:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMA-000000000TB-3QSG;
	Sat, 25 Jul 2026 04:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E80451B1;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35739C4AF62;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=lS9ZHO5cU1PIgcluobW44ILgdd41TC3FoJ2uJmzxlZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OCfYhLcGTWSu0OGpNjadtm8op1mPLTctO2pSILFrQ2L3j2MFumVB3xJnvdVnZdKMy
	 ShwgXb5VXXqeDlcTzWymuL9BTlJsC/Zca4lSiCFaooESHyp3eSmzmd55Yt8qUiFBnc
	 LwBXypkzOAQKELiaDBL0Q6zIxQf0D61m515ZUfCgXqRZs087O+QxsHnWwV8ZzDa9wI
	 Cw81qB2GoQ3JLtZRue92DueGgeJdVYQl81kCsIE2bvOFnPFuBx/i2exHNAUWOd/o0w
	 jMfykA3Ynv4Wm0PLUnwyfzIV10+wEhyCs2fGgqtygblXw2tRfo5G2FD3pOjw9P/ilq
	 klQWNQlmh8MsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F702C5321B;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:25 -0400
Subject: [PATCH RESEND 16/17] riscv: dts: spacemit: k3-com260-ifx: enable
 the DisplayPort output
MIME-Version: 1.0
Message-Id: <20260725-k3-display-v1-16-6de34d80e86c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=1589;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=Ich4f6q4tajR0qNR1lNUbENzsTq+U+zWcM4jg4iHZLI=;
 b=svT50cqkUT9tdXpDqDr8V4BCs5YfVqOAVZzNMJjzwWS+MDxblUOIeTkUanQD2/zeXYdqDIDCB
 879Z9RzlqsCAxiurj9ssQLux8/nRm6Sx4LLBYT5iRHCVAXS2c+o8rjy
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

CoM260-IFX carries a single DisplayPort output, so the second DPU and
the DisplayPort controller it feeds are enabled.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..114d0e02fed9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -19,3 +20,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_3_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1e..dbe8db4a8b76 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -22,6 +22,17 @@ dp1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dp1_3_cfg: dp1-3-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(72, 4)>;	/* dp1 hpd */
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
