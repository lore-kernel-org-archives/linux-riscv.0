Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E318C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mki/0gPXD/e3CScGaoOIogjpLnXLfDwiDzK5EQABTlI=; b=2SqcGYrUCNuiEw
	nQbtGJQ/WiB/9YCfpA1j7stePaAmKCTSNkTSLo6cHrne552lKDN5CeYsXG+UnkYjBIfQ7WXxUdE/v
	M23tWGiFe8u1TCIwJUWYj64idEhfngi7yP/j6qJexcirSKZKB6AKFaqKaw99HeEPQKfZVE6U+7fNx
	7qhgrHtpQsBXvsoCA6cky4yBtETeQNwSqSIpOQJQdlc0GRjeq4Ns4W+a7jxzQjefzmjNKWJ0QbRlv
	akuuJbPzC6HsGjPO8AX7nvxOZkmTt2Z0jT7gh7fNmcceDg+5lwAc89MHFLfomsNTyHmsE+NDeS/TR
	T2/ZDbmp+LxcsczVrT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNa-000000082xL-0EVF;
	Thu, 24 Jul 2025 17:05:14 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewn0-00000007j8l-0qlz
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 14:19:21 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250724141912euoutp013146092aa834d605401d52811b69ebc2~VNcV5DzpD1183411834euoutp01G
	for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 14:19:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250724141912euoutp013146092aa834d605401d52811b69ebc2~VNcV5DzpD1183411834euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753366752;
	bh=CBTIoTUh/JK2Ij3TR8T6JZaiVwSrQaeq4RIFydAsf+s=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Mp8nJ1dmBQmQDEwCWlyE6Hn4/nK4ZPjq8rQAQp+KNrIi3QywGIie3DpTXkBOtDDPj
	 xf1D80+YpLbc77Ni4STOPM9Eogvbg9WFXuvMsmz0FE0GvMKWCHx8TcJQQU+wnu40Bu
	 HxPnDjUEw0R9qWh+OkGW5dCoYdtC3EgkCUzu5SIY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250724141911eucas1p17071ea620f183faff7ca00cad25cf824~VNcVa5bj52680726807eucas1p1k;
	Thu, 24 Jul 2025 14:19:11 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250724141910eusmtip2a5cd8181dd521e8058bd91caf82ae834~VNcUU-_Gm0090400904eusmtip2x;
	Thu, 24 Jul 2025 14:19:10 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 24 Jul 2025 16:18:59 +0200
Subject: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 compatible
MIME-Version: 1.0
Message-Id: <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
In-Reply-To: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250724141911eucas1p17071ea620f183faff7ca00cad25cf824
X-Msg-Generator: CA
X-RootMTR: 20250724141911eucas1p17071ea620f183faff7ca00cad25cf824
X-EPHeader: CA
X-CMS-RootMailID: 20250724141911eucas1p17071ea620f183faff7ca00cad25cf824
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
	<CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071918_627751_8FB41608 
X-CRM114-Status: GOOD (  12.49  )
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

Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
specific GPU compatible string.

The thead,th1520-gpu compatible, along with its full chain
img,img-bxm-4-64, and img,img-rogue, is added to the
list of recognized GPU types.

While the BXM-4-64 GPU IP is designed with two distinct power domains,
the TH1520 SoC integrates it with only a single, unified power gate that
is controllable by the kernel.

To model this reality correctly while keeping the binding accurate for
other devices, add conditional constraints to the `allOf` section:
 - An if block for thead,th1520-gpu enforces a maximum of one
   power domain and disallows the power-domain-names property.
 - A separate if block applies to other B-series GPUs
   img,img-bxm-4-64 and img,img-bxs-4-64. A not clause within this
   block excludes the thead,th1520-gpu compatible, ensuring this rule
   requires a minimum of two power domains only for non TH1520 B-series
   GPU's.

This makes the binding strict and correct for both the specific TH1520
implementation and for other SoCs that use the B-series Rogue GPUs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..2c5c278b730145a983d1ddfa4014b3c5046bcd52 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -21,6 +21,11 @@ properties:
           # work with newer dts.
           - const: img,img-axe
           - const: img,img-rogue
+      - items:
+          - enum:
+              - thead,th1520-gpu
+          - const: img,img-bxm-4-64
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,j721s2-gpu
@@ -84,11 +89,29 @@ allOf:
         compatible:
           contains:
             const: img,img-rogue
+      not:
+        properties:
+          compatible:
+            contains:
+              const: thead,th1520-gpu
     then:
       required:
         - power-domains
         - power-domain-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-gpu
+    then:
+      required:
+        - power-domains
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+
   - if:
       properties:
         compatible:
@@ -105,7 +128,14 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            enum:
+              - img,img-bxm-4-64
+              - img,img-bxs-4-64
+      not:
+        properties:
+          compatible:
+            contains:
+              const: thead,th1520-gpu
     then:
       properties:
         power-domains:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
