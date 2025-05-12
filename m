Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F6FC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSwfhVWucDxxqbW4GDgMKxy5CTDym3uujzY3pBuF7s4=; b=RdGjGBztwa+Pe6
	PSWv3VhdmfmI3hU1um7pYvGquxLXMBKqZ4jxFvwmusYxURMMSBatueDE2C7AhmQgvCRp3tfQ2vw2Q
	zCCY3NPBzSDOdW6cLp7Ri7zMjMfCqYMVmReB1MqLgjsL2dvHCMYUt7rvCWFxrg8id1SRNNAhjZarC
	Y1YO4f++xLvy3AS1hyzCIIAX+rjh4BJalTDWfgY30y/2ODfe5FHf8JWdWkfJCIzIG5iG1zPjyb+AU
	2qs7tVRNqMRKC12NkgOIDZUw7SE1Y+JmDCJsrHD5keItA5Ggqz8/GaCQYRoDc2Iq+tjeNxNkVOcxu
	q6Oj+Qt2UfXDmmZOzfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4n-00000009i19-1Tim;
	Mon, 12 May 2025 14:24:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETWD-00000009c1G-05mi
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 13:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 061C762A1F;
	Mon, 12 May 2025 13:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA2BC4CEEF;
	Mon, 12 May 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057711;
	bh=ZtcN5AbkC6JRxscSzpTZ6yhbH1um53//UF1LbMyQjx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVcbS+6a89aPGN7YF1tPHEst6vPTmCaJEw3geIxrbuxAZY7qMMT6GEQHe2sm98oCn
	 CmAdmkp5b5Y6ykcZrLjp6rKhEXOofLIuIs+L1HBAK9n5qmvok9JYtK4uucb3luySvX
	 xenRAyO7edwT+3OD6NOxtRm1iyhdvKeUsBGr2NAgqOEGE5CNROG+5FpxA1L/E9xc4M
	 hjUy5cP4/jXoVcCFcoYKSZnI6y3E9SpGJ0Zz5S5X2AuTbQ8CQ7pVtzsTMyg0H4dXc/
	 c/YM3/oV4skQ38V57vibpr2kW3XX/6trfXQAEBdPQGrNhKu1fXSvZ8Elv5Y0dOjM76
	 OhM+/+O1Kiw7g==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
Date: Mon, 12 May 2025 14:48:15 +0100
Message-ID: <20250512-sphere-plenty-8ce4cd772745@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512-daily-saga-36a3a017dd42@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ybCPqZEqw4uWvO05OQd8ua1QcdWR7/7pRvsx7RcK7bg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2QnyJscNLaJb6tofyZ/7prgnseHPl9o4bW49FpbY Tn72WrpjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkWBDDX5FTBssymqYJrnuS 997tyvr+/fHndz+JcrBd4LfqYsKPLA6GfzorrtV+q2jR4S5c5nZoPueNJxoan99dPskQufvrvkn 2l1kB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Acked-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index e0ddf8f602c79..a8bcb26f42700 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "andestech,ax45mp-cache", "cache";
+		compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+			     "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
 		cache-size = <0x40000>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
