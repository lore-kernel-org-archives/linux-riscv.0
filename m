Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0324F60A260F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ResddcHc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAW5ntxr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wOSfKDMi1CooT85igENmBj0fTxgSQpta7JiUGSk475Y=; b=ResddcHcIpda744zLdEisrrBEG
	hyx5gtZSGKylyQ3xbgQVLYw2i5nryuPkCo2CO/gaaBnn7lg9lmWNh9E2/yRXeKWE6rI//vJkCYqZ+
	0+GR4pgHtOscG2Cy940UVqGhYjPXHa9FVSyJx4XJcTzF7MAyWRTInHQ93m165LxZ6js1Ggtwagry1
	vSIODVEcK8Wk0R/5WDIQ0tFnI5qQA+VS56LcJEp0NfytR05TejewsScXFYyGGldCAyR8Wgj+4MK+p
	aHYrH3gOgI8m/kDuZym6uEqwbimWx1Q0HeICD7TM1VD6sTrxo0keEsCRlt4UiYBszU5JQJwNo2SA6
	hIa1WguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfih-0000000GrEy-1WDY;
	Sat, 21 Nov 2026 07:41:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfiY-0000000Gr34-0kYe;
	Sat, 21 Nov 2026 07:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2E0B4600E;
	Sat, 21 Nov 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246861;
	b=NKHwadUQ1dcymoFGjCAKW/YcaYGTADsJRsl/c+9F0Pbv77RJnpwAK6zv9tExvS/2U6Pw
	 1Tr5dpgTL3OrsLX+LYKyQzLlrcTqCNJkDi3NhwPMlUowkWNaLIlZYRN8XHgSzCQy/LzmZ
	 m9024udJfIKZClaHlipU1lMCLsk2hkeu/AXhTSmUGbXK9zsd86biidWMjGM5UbUyNCo9W
	 sCgQfsFoQLaw3VOSutQXmexV3yh+rRwPkW4LqKi2nROPhMnMLPS50mt/oDED26FtvrGA2
	 yvDPk9n1Q+WX99rJ3lJx8XvORBQ/1Qlp7YWyQALkfGfvd3Q8PWSjxXA+jQjWdcIqq7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=knBV86Q5FiXjXVG2W+ZEgSUEQlgIpJm2XykazWaZvzY=;
	b=tTb0PDtUwe28QgrlCUyf2/jani9UOHRShXsQJy8luGSMB02/vqMZJ4YUK42FQ42TOTto
	 QJcGWJo+uyuhnjRCDi3y57H5fxwlOFsPUKh17gNVqUgD86dR+2s0TKqeEQrZ0Lzjrtp7s
	 wyz/P997kDQr+I7KTB7oFzE1cpWrAeF4L1F5piOjOjHXylqIK6gWGIUKqfyCWt58wWPI7
	 ho31L0EQCCd8A3MOPAtYeGI8nlF/IZOO0At6CY8Usph1aOiz7aUTMJ1CW56jlen5wSIAO
	 4lPSzmqYp8WzK0+4aoReRg00zuGohP3muizz0AfoSNiOBm6MdTqPjt0dQEzjFHDl2jQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1318B1F00A03;
	Sat, 21 Nov 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246861;
	bh=knBV86Q5FiXjXVG2W+ZEgSUEQlgIpJm2XykazWaZvzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAW5ntxrJOUwGpzLIgx2G+o09j4tLmctXwK98DJFK1dMyWYeHYLEzSs7qBQc/SX6w
	 dylb1og4aZIQT/BhhdVDwSVGtLUd0ddsnQkE2lHGxWF/ZyV46XS/leg5tlFgMpa4rO
	 cg8EXGme4ooiD7IJDMa3vpWKRC8C+3V2X+wAJbxtoQOrgIFTlfemNPz4XazPbeYB/Q
	 PK8nOZdytr32pkBohPo1uO+LWf+Hl4Um0ajWqvfqKHj6sECWDJrwXvEL4JKmE3WkqY
	 TlPqqlNdeCqmigq3D3M+8fBn32eVy/dPxpn0flkLaRg1ClerM/RKsnafpRmGYbcbUD
	 jolYL5xH+SLvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1CAC54BB87;
	Sat, 21 Nov 2026 07:40:52 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:55 +0800
Subject: [PATCH v3 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-k3-display-v3-16-ec419e8e96b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=2262;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=E78ySXuc7cskakorLvfTKi4q+Aj5tLnVas7172iViS8=;
 b=+l50UcVZTidzyMw5IfVtxsgruvr+qucZeTZdrIakHSuASGpLlWMuz53votn1rMk41mdq+AJcS
 Tip6sDvTE3vAA6fbTQP9FnGI+FyOl3lltKHH3tbERd4D25Yn9IX64lU
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

CoM260-IFX carries a single DisplayPort output. Enable the second DPU
and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- describe the HPD pad at the 1.8 V it runs at
- commit message: reworded
v2:
- describe the DP receptacle (dp-connector) and link it to dp1 port@1
  (Rob Herring, on patch 03)
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 27 ++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index fadcf28389be9..321715d455865 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -20,6 +21,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
+
 	reg_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_HUB";
@@ -129,3 +142,17 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
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
+
+&dp1_out {
+	remote-endpoint = <&dp1_connector_in>;
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index a3188ca0ceb36..ea88ec95b9136 100644
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
+			power-source = <1800>;
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
