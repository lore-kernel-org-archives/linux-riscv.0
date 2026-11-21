Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7E606A686
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=akjOL/Bo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoNvNfMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dkPtzZ6cJvT2px7y8H0TJGMKitUByY4X8kiGUBhe6FQ=; b=akjOL/BowvuWYxpWSLjWV37bzj
	dvpTYD75gSNbx5AiAJU0BqK/VOA2hiPqTTT3t2nIJkeMBKtMbiBnFkFy5sgJH9Pu7AVJqhufEHufa
	qo9swcADrAeevrG+bdyX2VWby0tWEiCPNWj4jC5aigXYmCIVVPwDVrQH9hVdj0mFoOupw10QgiP3E
	OHYtR8MEtMLF51p0/JOAFJ0XXr5M5BLwmIrWo8zEXVz8r8/O7K6bOK9KTMRBWBBeLXdBWuoyAM93A
	mc3t1t3D/KzelP6vGQIS/tU60ASrSgQxyOquoILeauzeyq4BrWxdX6dc2FqeoxgDvknG6WCT8n4Lu
	Hw9kUGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfib-0000000Gr5j-19Ku;
	Sat, 21 Nov 2026 07:41:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfiV-0000000Gr25-2S5k;
	Sat, 21 Nov 2026 07:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A0EF611E3;
	Sat, 21 Nov 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246858;
	b=eoNU/iq1cYMgwQ2R2z0Ijfa+hepndE+nFqb0OIeApgBQDA/HAet+lYNZzh0IfRrOOyXn
	 JG9sPNe14s1QcH/5CABQwl/yqhl+W6uLpJuQ2FI5FekGbJHY+os9OXiQ/9A2z15f1ppU1
	 we67twVmP1dybT4imtrtlh6LJKZQUbgfBXEAiBYPR1rEO+nTLsRNvmLqsqaA5h7ngsMb+
	 iC3pVXBmHdpJIEO7SAkQRSUx5jzOlonVhKVPztbpwwBS9jyH9HCb3yWyqXDyUcHBQOpV9
	 dIixDca2+MG4bQ/TOyiqpM+aUPY31wxutWEaPYNBMX50kfw2EOO1C/RD0Vcv7AKJ+bQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246858;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xTal5ga/GuUlZ1OXm8uu1wgssnVvijP3/pLDN+JzAVQ=;
	b=wOBXsbPfsTkFM+t6wsqMLZcwqzb12LLRLPn6LXWQO18II8RZvgHBUcmtBZaYU9buI/Jl
	 gpdht1IwMaVMZcZjxvUNnAiQ7W6WQtqhRDH7TaTwsDZOWJn3gkHCl2ktZ8oikNnhmhy8H
	 +6lEe37Ujx7h6EsVCG4QWnpi6OercMP2aWHErFXBWgqI+lVVZHuU1G2F7YlyM7clPpXjI
	 ppKa8gGw3fZPARPmAuWkcWE4MH/VLfhccbYMDG7S06aqaueCKiNnh+4axoHAvYsdKZw2m
	 cJiAhCnQrO6YK1+yzP7LPatfDYfM0ZyiPKZRaGRIOmSraHJn4or1x3G5g6jIRrSrYyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F8CF1F000D3;
	Sat, 21 Nov 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246858;
	bh=xTal5ga/GuUlZ1OXm8uu1wgssnVvijP3/pLDN+JzAVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LoNvNfMHWZTmBHF7WjtEkVrJGW2/aJ/IUsSd7qhwyxqEN+m1/ezl/lDH7XE94+0Fp
	 qpwyVKocRSx78K7u79b7ALM8m18Sp0ssCDIEXbJYbqSxvWq3hHGZ7mxftXCpDspB/c
	 CHW7wFqwWCX8WWXocjjCFNd8srxG1XF7K1gsd70uYm2KBRWer3KIiRvW27nKZu96XP
	 LN7gD6tw4r4CXseZYWSD0vhoRfI5bgWV555XC2TOG4ZIeoJrjte7aS+IPTSEutaEDJ
	 1qK32lIBnF5XjA1NBnNrYLt9+4M+ZGjHA+N4otK03Q3rTj+Im8vX0FyndXHVWCMjQm
	 CT9N2GYQBvwig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0394A4BB83;
	Sat, 21 Nov 2026 07:40:52 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:54 +0800
Subject: [PATCH v3 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-k3-display-v3-15-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=2008;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=MoqCFqqlUXTvshGeYEd8HbhhAB7iUB4488Rgem2ZH74=;
 b=AB0I96oNgFVfRozLOxYB2bk3Z8WxUwp8/VeoyxhlP6U/hW7FFRPg2UcHllruGl8ucRYfDzD5U
 IHiLflbIWRNDabyyChOBgNOaCVnYCHYptoRN3ZihzPh5WceQcqfTLJR
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cody Kang <codykang@vsit.ai>

Pico-ITX brings the second DPU's output to a USB Type-C receptacle,
as DisplayPort alternate mode. The mux and the PD controller in
front of the receptacle are run by the on-board EC and the SoC only
gets the HPD line back, so there is no connector node to link the
output to. Enable that DPU and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- commit message: the output is the Type-C receptacle's DP alternate
  mode, not a DisplayPort connector (Icenowy Zheng)
v2:
- no change
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2c..da042d7c30328 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
+#include "k3-display.dtsi"
 #include "k3-pinctrl.dtsi"
 
 / {
@@ -368,3 +369,13 @@ &usb3d {
 	phy-names = "usb2-phy", "usb3-phy";
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
index cb4f4f4e33aff..a3188ca0ceb36 100644
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
