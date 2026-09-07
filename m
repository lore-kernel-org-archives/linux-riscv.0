Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41BEC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mkuga5dg3D3SAxePLd2a5GRcocxC4NvQV+B5HvgSKus=; b=ZLZaIe8ouxrm4Z
	BciCDe0llsM8cvtoKIbtVXyAMpPIJlXNhCt3QkvXQ+eADvyKofP9XuyGXgvqfKK7yfX1vMom+UFTI
	fOeu/OytR624iL/zDeE8srPntre9Tps7jHe+AY4SSSGuOSvo+pYZ4UeQcKXIrbSRxTdj17qkl7GzX
	+hANxbHYIPRWxYfbxfif4qT8IeQKtWlunUVcy8YLd/2Y7sVrd2aJyikhnpHNvahN7Qh72G6C11xS1
	5dGUQ6dcbWwESr0TqOR3j8hNBO27WFAef0JirIJRadIM1WXzNq6ALl7vsaP0Ex90KhMkYMxa3OF+w
	v0wVvSW0u8/Pv1G9lmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7S-00000006PTl-1qCD;
	Mon, 07 Sep 2026 09:58:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7P-00000006PSV-1LRF
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C29544832;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AA6CC4AF0D;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788775106;
	bh=6CZneFBn+qYzCyZ4soOnwEiAxpmztku5TRHKpXHT0OQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A3kGGpHeyQTsnep0/+XHzgYiulMqnkfmqjW+aBpkYo2V5if/QcqNx9xBBopOfo6bf
	 NZH4onhDJUCQcdCQ8kZuqkT/b635VAlcoSjZtm6udjdPAJdUzC0lVP3os0IhDmi0/H
	 5yuZ6xq6yGZOjMBGVzddbKXMzxOGkO8ddtV5fRGXehHDSC2TedEphhyZlniFLLy4YD
	 LfxJxMq6Juvvgh6zoDqyiAVSMrUPPKuTEnQLadKY7YeMEbwvuaSxipXEZftr7DBkGJ
	 QhDYRO0lPAd8djL0dCBp8A+k95bsX5umPX8yPq+BymdpUHIzNXYF6VKm1ZtXUaB9Ox
	 ZCg0Hw3zDlcPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164DBC79F99;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 07 Sep 2026 17:54:44 +0800
Subject: [PATCH v2 05/10] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for UltraRISC DP1000 SoC
MIME-Version: 1.0
Message-Id: <20260907-ultrarisc-dts-v2-5-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775103; l=1663;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=MXexzfKaPsc1YI5omohzcuM1x6URdiZA7ZlibFWo5PY=;
 b=jHfiWF3egeJiK4FJHG5XZJ1nRggFi5xxHcKkEwd489i11A9dsyBbH2WRxwI0hbTImifyHwAIs
 albED9FdwPtDjWNaBmhG8DAPlQojzHWfV20BSgWMUNeSwi3TMJrs+A8
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add the SoC-specific compatible string and use the generic one as fallback
for the UltraRISC DP1000 SPI controller.

The DP1000 integrates two SPI controllers. SPI0 supports standard, dual
and quad transfers with three native chip-select signals. SPI1 supports
standard transfers with four native chip-select signals.

Both controllers have one register range and separate reference and APB
interface clocks.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index 1e70c6804d5d..e8d6d5d858b6 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -44,6 +44,21 @@ allOf:
     else:
       properties:
         starfive,sfc-filter-syscon: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ultrarisc,dp1000-spi
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clock-names
 
 properties:
   compatible:
@@ -63,6 +78,7 @@ properties:
               - mscc,jaguar2-spi
               - sophgo,sg2042-spi
               - thead,th1520-spi
+              - ultrarisc,dp1000-spi
           - const: snps,dw-apb-ssi
       - description: Vendor controllers compatible with v1.01a
         items:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
