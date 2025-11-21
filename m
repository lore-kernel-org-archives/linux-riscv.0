Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B6DCFC27C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJkaBaBerKzZ/ktgWsMe3hjbE5tXjJw3cpycigaUutM=; b=Y3ddPUufG4APHw
	UmqGvDKMlsIiyZxFHyd05QhsmEEoOUp+yJ2o+HXIO/RSAcahlccXcAzWzU7jMnmwKNAyXS3okL6S4
	pyTdCTtGVCvrJoDePCmtq26GbOn/BreWGbkA13q6VYNoJ8VQmNJ5jMknNuVHkACNJ14i88GAU5BX0
	QlWwy0dXMY/AYHlwg1Cy/KHW39aaA3vFYP2pI/DJkgle39bnLZHN/mi/yU2M6njJ6HFEeH9Jplb9F
	Nf/TQ9ojMChWke1S00RkjCD4Aqu+MWIqC3ypJAyg4saujCn7Mi0sB2kPOaknln3q7IueTt+V2Ec71
	6tIe+rcCmWBBgZnRjJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQu-00000008R71-30Gl;
	Fri, 21 Nov 2025 13:44:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQr-00000008R5i-2mfs
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EE8F4189D;
	Fri, 21 Nov 2025 13:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4313C4CEF1;
	Fri, 21 Nov 2025 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732653;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ol/gUFQMczSrgF4dRYg+nQikDPq38qhKah68ijPzBb9d3Y2CCyFjY5jc+AYaYj+H5
	 8m+xYq7jgfeA3ukeVAH04lzhon4UHa8zmUDaEMPvqNhE36DOSGXSH1skt5cxPYydSN
	 3d4bwn+kA1N3/NeQsH/cLqXq90D/PAk8pv+qTCBTX/VjHJIZjJshfyaLJYofvS3cQA
	 LJiOHt9lzGBypP54svXdLPiOW8+MBjbwhbJPAUrwPbDtgBSOfbzcCMrOfSgUkjkp7/
	 L9VguOhd8Grjkf82EmhnmFFeIgt6LAoZlLUp02saR4N0ybn+YgIa0ZyI6hhbjjPQX/
	 5MyCG3gbgaXTg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Fri, 21 Nov 2025 13:44:01 +0000
Message-ID: <20251121-trade-slacked-5fc7c1139cb2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121-tartar-drew-ba31c5ec9192@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6u/MVsorAWOBiuYW/sM6Lc9tNpUToYIrlt3K2vcU0zQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfMz906riTc7xdT856JynvxRZbZp8tvWTz5RKr9o8 ZxdSz2XdZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAivsUM/xRktZm5fr7iXed4 ZJbyffkL5z5emWB6f/8qlW1tbYXVu30ZGV4Er1sTmKh0IJJnv2Cc5Edt7qdXubY07GqPZW3L6Z6 7hAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_054413_722951_2A07CE47 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
