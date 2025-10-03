Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED9DCCA471
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYBPgpDrPeFrzfzQ4xtlhXSkraYQLaQKN5Za0rHN3KY=; b=LHXW4MSfW+/X6B
	1H5pVitAJKcxmBG/za2ky2DiEZLX+nuUK6IGhN1aPRYafljTCDS8gkXHkoxeYe8icp2qDU7XFHt6C
	YR71UmQlCQ8iTApEJOVgtJP6LpJrw2w8SqDRKd/SXGw4KqqsaQO24xouCG/iNFVF5ceV4se+j8gQX
	Jeqz96T86XG0bT9d+93OD8i9VVUhX0XsnWm/61ILCt1mlXpsERtbW7vh9Ui6R52hub/Hzbu3jLkeD
	ix05JnsfUn03EGsziZBdeofO8e5/FlYUab1ismXfc5SDSHiQ4aiqCDsIV2AZcrF/8UBLWQ4Tv5/fC
	NpA7gUGXzJpxy07fyeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ci6-0000000C0e8-3BZE;
	Fri, 03 Oct 2025 10:08:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ci4-0000000C0cz-1Dht
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 10:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95F3541708;
	Fri,  3 Oct 2025 10:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F85FC4CEF5;
	Fri,  3 Oct 2025 10:08:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
Date: Fri,  3 Oct 2025 12:07:49 +0200
Message-ID: <8e7c7881800827467f1687432751addb822bb85b.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759485668.git.geert+renesas@glider.be>
References: <cover.1759485668.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_030820_345627_472640EB 
X-CRM114-Status: GOOD (  10.04  )
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

Move the "interrupt-parent = <&plic>" property from the soc node to the
top node, for consistency with
arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index a8bcb26f42700644..571de3cafa8214e4 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -12,6 +12,8 @@
 #include <arm64/renesas/r9a07g043.dtsi>
 
 / {
+	interrupt-parent = <&plic>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -52,7 +54,6 @@ &pinctrl {
 
 &soc {
 	dma-noncoherent;
-	interrupt-parent = <&plic>;
 
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043f-irqc";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
