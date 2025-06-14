Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31237C7115A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoxDYOs4vcrl1UAJ+cmbdsB6TveFURND1ua2iPMl03o=; b=zawySW8DWn8u82
	Q1yvhNlHG4GcK4gcxUMwkCEihA0tjQnRYC55T+YXyNjBt8YIdCPB8ewR7Cx9MTIQ3jRzuDZBtS7kh
	JV91q66qSHBMSH6COEq3lEamx7JectXPkh+2/emAd2C4JA+Uggo2Uyy3wxR1iOJKVaKNXDQauyjjT
	riuTibPDbu/9UzVsfrGyQxB8SkNepTQ/Rj+SSjj7twwmW8dY5BODw0BdztLfK2f/1k7tSxx7FhNIh
	pLA0GBuXxxxhkiHDqzcfJ9+rCIwfNMusFsilU81XdGArWQCplsN6C3V7tdEo8LskEv335oHuGzckp
	wt7pXV2WKHnkOqC5HDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJf-00000001cqm-3d5a;
	Sat, 14 Jun 2025 18:09:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVJa-00000001cne-3Ksu
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 18:09:18 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250614180913euoutp01513943341bc4a9cf8e47ac5346ebe648~I_xwYSP9e2694526945euoutp01s
	for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:09:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250614180913euoutp01513943341bc4a9cf8e47ac5346ebe648~I_xwYSP9e2694526945euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749924553;
	bh=4SD9BrnW26vlYTv5xxgtljWZoRvQzpufshnL3EiSwm8=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qoJ4DxsRi8sEwWUB9y4YHfgjGEL3yF+0Zo7/r0xn3Li+Mh6raI8/k7AeL59cZvaRg
	 j9qWI3dDDbOdsuTQM0Hz+oAcIz8+teA1j+GrS05ZcdaIDxg2i56JAb6UP7Sol9ZpPy
	 em4kiov8brjNd7N5nI+GMkdq1/iIsvoSjKdrL22g=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250614180912eucas1p283681bf6a16249417e5e6d8eb25b969c~I_xvxBwqg2666126661eucas1p22;
	Sat, 14 Jun 2025 18:09:12 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250614180911eusmtip148cda267a8f953c22a047410b87efabf~I_xuqY_Yz2797327973eusmtip1d;
	Sat, 14 Jun 2025 18:09:11 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 14 Jun 2025 20:06:11 +0200
Subject: [PATCH v4 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 compatible
MIME-Version: 1.0
Message-Id: <20250614-apr_14_for_sending-v4-5-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180912eucas1p283681bf6a16249417e5e6d8eb25b969c
X-Msg-Generator: CA
X-RootMTR: 20250614180912eucas1p283681bf6a16249417e5e6d8eb25b969c
X-EPHeader: CA
X-CMS-RootMailID: 20250614180912eucas1p283681bf6a16249417e5e6d8eb25b969c
References: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
	<CGME20250614180912eucas1p283681bf6a16249417e5e6d8eb25b969c@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_110916_053314_73D1364A 
X-CRM114-Status: GOOD (  10.27  )
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

The power-domains property requirement for img,img-bxm-4-64 is also
ensured by adding it to the relevant allOf condition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
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
@@ -93,7 +98,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-axe-1-16m
+            enum:
+              - img,img-axe-1-16m
+              - img,img-bxm-4-64
     then:
       properties:
         power-domains:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
