Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8D2C2BD05
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXpK3rfjF6en90Qun4UOOAaVFo1kjllJEAUfNYNy6qk=; b=VvmEyBy/+gy4fb
	2mqKNsIfZfZd4m6TrXwoRO/104HJivPBIsu7nmRXe0MzNdZiSoANEbybsOnHUvlYgXsSGR2DDzm+B
	RbxNDn6Jv+Aut2jeSwZ1J00+8Kzhe6FgAuOPEWAIem6FI0zkyslXT/R5s26oc6MbjFzqQSvs4AVz5
	P0VOk9ANqHoXubwYwchqjxswCHRYFLI1dxMklESM+BthU+iatIzas12g03ZT35oCaDuPC3JwyUKw+
	1hPXuDDq5NvyqTZCoZT2FDvAFdj72DbMziih2OVHFBQWKaOspLQ/SFM+Sltg8mE5vcZEQKSjMKgFg
	3xAFbVJYlp3W0wHlGJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2LB-0000000CIAT-0nPF;
	Sat, 22 Jun 2024 15:07:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2L2-0000000CI6y-3EHd;
	Sat, 22 Jun 2024 15:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AFB16126B;
	Sat, 22 Jun 2024 15:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C450CC4AF09;
	Sat, 22 Jun 2024 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719068854;
	bh=FkLEANghdY0F2D5oAhPpzR3TSX+luZAk5onCsfRlqBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAHAxa3cyqn+is4Ur9RvX89VJ5N24VnFsJ4lM9RIBxdR1c4OlWYUt1ck7wimyjFqL
	 cyrwM32ibLLYu/jbT8anZF4vdW4lfswSeZ7d2OtdIY4u0lCGpp+Yz9jdLjs5rc4Ae5
	 QnAclpNZkg2OX1ZPgJywYRMp/FWeFUgpKkil/1+WUnqCGsgl8Q4R57f/Tks29rnFJ1
	 0ZhsbNVUg24Wduhlzl99PP4GStWBUTQhAoou674xYgb9aMGYS1WTEZuz8o9mcQJ8Qa
	 WyUwG/f4SE7zdyEmzXqXOLE4f5hnmFJjZ3a0PY0CnoH6m+iCxAE/tq+xZZ4NOrdl9a
	 k4uvOWV3hmaXw==
Received: by wens.tw (Postfix, from userid 1000)
	id AFE9B60341; Sat, 22 Jun 2024 23:07:32 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: dts: allwinner: d1s-t113: Add system LDOs
Date: Sat, 22 Jun 2024 23:07:30 +0800
Message-Id: <20240622150731.1105901-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622150731.1105901-1-wens@kernel.org>
References: <20240622150731.1105901-1-wens@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_080736_917990_1E963078 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Chen-Yu Tsai <wens@csie.org>

Now that the bindings for the system LDOs have been merged, the nodes
for the system LDOs can be added. These are used on the ClockworkPi.

This was originally part of Samuel's D1 device tree series [1], but was
dropped in v5 as the regulator bindings weren't merged at the time.

[1] https://lore.kernel.org/linux-sunxi/20221231233851.24923-1-samuel@sholland.org/

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..e4175adb028d 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -396,6 +396,17 @@ syscon: syscon@3000000 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			regulators@3000150 {
+				compatible = "allwinner,sun20i-d1-system-ldos";
+				reg = <0x3000150 0x4>;
+
+				reg_ldoa: ldoa {
+				};
+
+				reg_ldob: ldob {
+				};
+			};
 		};
 
 		dma: dma-controller@3002000 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
