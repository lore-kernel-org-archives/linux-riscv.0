Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17360A3810
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ui4ZfNT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=eSJ0j/zy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:In-Reply-To:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rUFUtDxYKJf4rH4It6BjVx4UmW+JYbyr5oTijTAwC10=; b=1ui4ZfNTIYPiyPkiB09mUSeaz2
	s/bNPG2u/DSM1zvOKJ9HUSADRGSu/5fBjcz0sDGKnK8o0VVAKablargZNjTQoHI0ryoWdW0rELRAj
	42PEjFH5kKygkiXDWIuJ2twquFsIVhLxAa/Z3mnIntjMQkF+6Tpf5OTFOUyEI8/29wv3JArKoJ8Lk
	nmW7nol5dwMSYe17J+RNK8YcYy9om03BExslwKaX09q1kT5hFx3UxUjRJ4yHIoHQM+8uqxCKB8jcK
	uo5w3Q/+Bb7l8frG+gzMseTQ8hQ/qA4n9N9LVtrbJKBxdSvSIu/G7wwHOXMuC2caIAnh1pm0IjkNW
	W2mmpm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqs-00000006ykB-0PQJ;
	Tue, 24 Nov 2026 15:54:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqO-00000006yDc-2HiM;
	Tue, 24 Nov 2026 15:54:10 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155405euoutp015ac407c3ce906e43725bcabe259f2675~rBigHsSlr1661816618euoutp01h;
	Tue, 24 Nov 2026 15:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124155405euoutp015ac407c3ce906e43725bcabe259f2675~rBigHsSlr1661816618euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535645;
	bh=jENpz6dzCvEP9Gnuo5alwVcJmoZBCGPAfNYJOI8T6Fs=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=eSJ0j/zyhTzjaERBfi09hode5MG2FPtOqMJ3l7eexiVFkkL+iL5Sm6RZCewI4VTVV
	 /PL73YfWr/UAH4QOwidhXWOdsvGdQu1K8wJBeFDTASQzLxnZuwPegWQEzHGInAZ3bp
	 mPwh2f3i4rqBc+FGnXSahvGwbGFDr/Olcc/tgI1k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af~rBifz3E-30908509085eucas1p1I;
	Tue, 24 Nov 2026 15:54:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155403eusmtip1d5fc396a63b3ea918f46ec380b4991f3~rBieQLsYO2899328993eusmtip1I;
	Tue, 24 Nov 2026 15:54:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:39 +0100
Subject: [PATCH v8 03/18] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-jh7110-clean-send-v8-3-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=0Pe+zrvXANQYyAd1ud584zGkokHB97sZliMA0xpSBQ8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhb9ZHziPU+Vp42wYfaEieartA68NfTJcZNu4tn59
	6b77J6ejlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRujcMf+VlPcx3/P7D36MV
	L/1W6GHeHQbWjVcKOSZ+Csk9b/KqlJuR4fJeo6wtvbI/T+fNf7VmXckDb0b+Ky6Nbee2/f5b8uO
	kFDcA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
X-Msg-Generator: CA
X-RootMTR: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
X-EPHeader: CA
X-CMS-RootMailID: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075408_871910_96C20CAB 
X-CRM114-Status: GOOD (  16.03  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
(DRM bridge).

This device is the second child of the starfive,jh7110-hdmi-subsystem node.
It consumes its register access, audio master and audio bit clocks
(pclk, mclk, bclk) from voutcrg, and both the pixel clock (pixel) and
the PHY from its hdmi_phy sibling.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eb03404d8c60a6ecadd0a4f5aee7c46b6f4da3ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon HDMI Controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The controller portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-controller
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HDMI controller main clock
+      - description: Audio master clock
+      - description: Audio bit clock, from the I2S transmitter
+      - description: The pixel clock, generated by the PHY
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+      - const: bclk
+      - const: pixel
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  starfive,vout-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the dom_vout_syscon system controller, which holds the mux
+      selecting the DC8200 output that drives the HDMI transmitter.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input from the DC8200. The remote port number selects the DC8200
+          panel and the remote endpoint number the interface on that panel,
+          0 for DPI and 1 for DP.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - starfive,vout-syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    controller {
+        compatible = "starfive,jh7110-inno-hdmi-controller";
+        clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                 <&hdmi_phy>;
+        clock-names = "pclk", "mclk", "bclk", "pixel";
+        interrupts = <99>;
+        phys = <&hdmi_phy>;
+        resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+        starfive,vout-syscon = <&vout_syscon>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu_out_dpi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
