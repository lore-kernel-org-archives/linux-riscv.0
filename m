Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 01:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdgBJjbasgwFeunz1AxQZ4L8/K1u/MWOseYz+0P5wKo=; b=i+oMUz2VC8S5lT
	w5r+k/Ith3daHevrvjpCLZlywfFC+BwkFnC08Wo+eRvv4rCKymksuuxQgkMdhje5QNpByISp1KCHc
	YcgXo1o0y/2TDgeVc51gWdMSKzIgXXdeCt8jr8CVEiBASRQIGepJMLg2qOWj1wzkc2YTyFiq3D1Lt
	K58Km5080yVHUG/Zzdq0XKctcagbGsa1gURS94h/K+zKwuIuAhOnY/xKQ9YKT2ST751TMMFnRMZZG
	kRIxBjhXTTsM+hlqavztk91ykK7msxyHpJN2RoU8da1ky5B/CPWgAyu8PZMNHDdg5nji/M0b0YTs1
	3wuLIYUv7gNfi6f9vhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njsaI-004EMb-Jv; Thu, 28 Apr 2022 01:04:42 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njsZw-004EC9-Dh; Thu, 28 Apr 2022 01:04:22 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B3E55C00CF;
 Wed, 27 Apr 2022 21:04:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 27 Apr 2022 21:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107856; x=1651194256; bh=kp
 LZSWY5pulSybgy+J3BHvwPqsyKhKZy8Hob8bLRgSg=; b=eaVtCutJFC89h8TSye
 kLgrAxKv7mv8BB3RX8FsQV7YUJ2RC/w2St56QIpWTwuaKQqVt3pY3LcqpBkjCpTT
 ykj3Q6ICT5Vr+U7/uxidw+apIT6qLv4EqbgmLYViSzNEfj0iPRHuNv8uLW2bKywN
 owiGCwiX9PP7aAXvm7RNZ+oLgUW9014iZ6QNK7bbHIdr6ADen10qKr4sFZh3l4FP
 +mXooRjN9vX9IpXnsrwOHbtJ1vc5DiwXsHmUyuTxBy0x2gEF5uUZxfJvXZPEJn5O
 oF89vHZzwRwlo2ZlS5EQC6S2qPOuo1a7fYSJbrdVYw6vK6ME9GpfuMASXFIc/jNT
 8y1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107856; x=1651194256; bh=kpLZSWY5pulSybgy+J3BHvwPqsyKhKZy8Ho
 b8bLRgSg=; b=S1i8lZN3lIqHPk2XZ+Jri1eBBAk0E5/ClkcJX4vi6nXmiPEVGZn
 TQe2QXLlGpBd71gc65+nXhUnTGXeq4f+3u0Mf5+vSPI5+pyEckyVg/YS4qfxP+GB
 EpzNx+cqUe/zzyxn7mChk8CU9LlrjeTd+jRHqcTmcZEktbGnDZAx6rvvO37+DbDx
 PS7ZN+D3NZoMRLc2o8ym+jst1ifJaUGBicHLvih4siw6clmK1j4/oadezgB2H29X
 OI+NvchmEfRxmmtCP+hFWjR/0BDIdwh2Ykc7vomhEBEJPgCDYHbg3+YJqPy8HiZS
 g8D/dz06+SXrsJhp+btgN0E/UH+yM4s8SdQ==
X-ME-Sender: <xms:EOhpYu5rICuAfhOyvhG3zBn6SsmosX9sa0QwBgkEGzgIVwutKwsCpw>
 <xme:EOhpYn7kI6lE-vmIDGjcCVFPEyCQyEptO7JZzaFPXy9zVq_mco20xBjT61625nrbI
 -F14DwV2cL1ssV7jw>
X-ME-Received: <xmr:EOhpYtfVGSM7evT-89FyD_wca4youZjNuT6WKzxWqty_q_y6GGHN5HE-eAMvtepPioOvRUK72_5KuYtch4XYvVEiwwLpjzvy2TvQugkWadzLXrdtQAhJmGn4CGVhD8GHIEAN6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:EOhpYrKiNgGyGRcR3093GrJAZecRwQTXKAhNGkHpj6jKimrQYutSuw>
 <xmx:EOhpYiL2yi74IQfBWUPtp7H7fZnFwVKJ2DUrSNOHFRItvIROIq7ifQ>
 <xmx:EOhpYsz0yymD3QJ07hXzkWy5mfkGQvCL7QgIYtQjpHLxs5GA_MMscw>
 <xmx:EOhpYn7jcvmGpZ7QiIF9HAPNh4dg0GCA_nU8OqiAJg5uBL8Myr4nsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:15 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH 1/5] dt-bindings: iommu: sun50i: Add compatible for Allwinner
 D1
Date: Wed, 27 Apr 2022 20:03:56 -0500
Message-Id: <20220428010401.11323-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_180420_785841_7CB9F79C 
X-CRM114-Status: UNSURE (   9.17  )
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

D1 contains an IOMMU similar to the one in the H6 SoC, but the D1
variant has no external reset signal.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../iommu/allwinner,sun50i-h6-iommu.yaml         | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
index 5e125cf2a88b..18d3451d4dd5 100644
--- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -17,7 +17,9 @@ properties:
       The content of the cell is the master ID.
 
   compatible:
-    const: allwinner,sun50i-h6-iommu
+    enum:
+      - allwinner,sun20i-d1-iommu
+      - allwinner,sun50i-h6-iommu
 
   reg:
     maxItems: 1
@@ -37,7 +39,17 @@ required:
   - reg
   - interrupts
   - clocks
-  - resets
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-h6-iommu
+
+then:
+  required:
+    - resets
 
 additionalProperties: false
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
