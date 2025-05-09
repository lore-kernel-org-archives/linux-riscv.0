Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03825C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fN5cpxrlPEvjLn+ki5d1jD/pT5nXAS3SGZsaNimzPLA=; b=4H+e9/P0kUjorQ
	XYvx6kAZF2VZ/l/2K9gonvxPBTtSM+WmGR0prjb8byyl6E2kP5reEPm6WZy3qGvDstW2v0SRXKzqC
	/+5o1VRn1SiA8O7xb4HajW6me6grSN/R7ACE+IkYEU4kqHf4jBWPSFDxKAB4HHkjmb6/mBY0KmR9P
	fAp9cLHq4QtJPE60lcgb9X8reR9qu70HQgh5KMP4ykPfLcVYkTGte8bqs6Gu0YVbgUdsPCa+14mlF
	lP9r84e+Gnkk35368TKI7ULpbW3Z2YuBe4fm8TBPt7e3Js+dsqj2FvPTklO6via1xhrDTuW26LmDl
	NuIffN37NINByz98ERLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRpK-00000004UER-33KO;
	Fri, 09 May 2025 17:48:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPoy-000000047bs-0Dvo
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 15:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C613A49EFA;
	Fri,  9 May 2025 15:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CE8C4CEE4;
	Fri,  9 May 2025 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805171;
	bh=h35KYhyDIY5FYpoH0z1DlbM6R9T4ekv/dXpUMKacj7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=meSdd+cQkAcZMRTu/XE5E9PC5QCOgy4oI2z0NCbqt89fIE/gZbnMkd0Zw/jbXO9Qj
	 nWH9PWj3OTf8KbvTBCnXnpJw50jcjl1OlhtHbHTqdMo8pViaBBdT3xuIhxqUWE2MOf
	 TjBxgsWGx6kB11wgPls+veS+qTTdaaGxURCTw4BCzDwKt7V2Aj0JvJJlbsuIn/M4Oo
	 tRzTYCAVVls9vUlMMzw2GN+CAaKDq/a929hBst+U2+wfwG60EJ1htnOqOLI1EoRfoD
	 sjnkWPhuew0yyZ130ZelHWGnQNyCsRfI4uOPc4EcnFWAUU1pDwZzOxphCozb9fyOkR
	 aaXJNbVf8bt7w==
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
Subject: [PATCH v1 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
Date: Fri,  9 May 2025 16:37:59 +0100
Message-ID: <20250509-mantra-trickery-56f699596346@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-sapling-exhale-72815a023ac1@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VAAp3Lqucp6m4bL2Y2Prj3TWCfZjW9uhGkbCvekmR9Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiqFHm4XeKr7gPH9WNImJWzb92b/l70VeO2W5hrbuW 6B7ulmjo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOJusHwV+5u25LDDZ6sHx3y klT3ydy9+8Y74L6kjX7Y2t8zFW5L7GH4H8n/7XzO5kjn+U8n/CueGbTjTOMTdx19r+64Y0Kr2lf mMQIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083932_157912_605E0570 
X-CRM114-Status: GOOD (  11.74  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index e0ddf8f602c79..66c6fe0cd162f 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -143,7 +143,7 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "andestech,ax45mp-cache", "cache";
+		compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
 		cache-size = <0x40000>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
