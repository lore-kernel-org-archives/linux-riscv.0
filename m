Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A132CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hpiISppTtMKYf03eLC0nU1b88QQHNbv7Ur6MSveSXo=; b=bYgA/ktdtvLVLv
	VSv1PNg0CurYkVH0F1kjYQzjJO3Bd/1KwwqX7C3eo2uEv6FLDkyBXh0OdccqqV9f1OS1OqFBxETPC
	Wl808JmNfMfDQHOhwqRqkWOUBYRh3ZOZ9CvGGSZikX8ko3PKsHDqwgUlG9V5x2OmZIcKqpvJLLvbL
	5YPSBGQNpfWw5D0Pr/8nxwGK8fufC8TgmsCer2ZHD8UvWNuAY45YymFFFStfrudaGoKoXRyUT0q0W
	jTQYuLDh6Ccs+cAPoWPoHrhN7ZQxoKCBMwEx3o8us5HmYaXI6Dd0FnCwpk3Np6zVI5s8JBkXZMKOs
	kNkR+Hs4s5zMKSuJrEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeU-0000000E4ub-1K1U;
	Mon, 13 Oct 2025 17:48:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeS-0000000E4sw-1NOe
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A41B45E75;
	Mon, 13 Oct 2025 17:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200C9C19423;
	Mon, 13 Oct 2025 17:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377683;
	bh=yx40n6aW+7axlHFIv+/k4z1XcQ+4QDorszZ6b/jKM44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1ov6qgsCC+yGKq4N9oLMRt+D9rGFNCpo4Rew9BM8xH0s0J+vdCDQPHen6LUokd+p
	 zdNQgFL/ENzp/uEI4qGNRdP+xoJ73FZ5OO8RBGA7yD8iDStSc/b28iaV5io7o3aN4e
	 apK4mMyE/mV5K1eI/s+3Tn6L8z6/lb3t0W8HI8lJtlCXLTPewSwJMNBacEClO5f+LY
	 h6SLU2UGc8AlDgxeO95rf+uDNn9R2XM+nYDPOAAcO2yrzXV74plEM3maipS2xiFEbj
	 2szzCtlpodmJNerS047bDB4c7vRXlhhwI064vI+w1+pFYeU+C6FZKO/H+wp9tlseew
	 8NdLXNaZFxJNQ==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] riscv: dts: microchip: fix mailbox description
Date: Mon, 13 Oct 2025 18:45:38 +0100
Message-ID: <20251013-failing-wobbly-56a7bce3f21b@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CJ93zZ/gwT2VF26tXat2Gljwq2Roq9NVUZwBFI4dODQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrQ4Ebjlkd6djitCy1O23n+oLfs3xrs+9d8kwppUti Tnqy6+PHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIMTmGf+aNet8uPzNZfdj6 /gZf7pSp9SmHb1/dU3n8ctKTeXfudW5gZFijeLvuTvn+VU4/XqgvCjM4PbH9zQz16W8WCBvukPq 9rJ0FAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104804_407574_99329AED 
X-CRM114-Status: GOOD (  11.32  )
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

When the binding for the mailbox on PolarFire SoC was originally
written, and later modified, mistakes were made - and the precise
nature of the later modification should have been a giveaway, but alas
I was naive at the time.

A more correct modelling of the hardware is to use two syscons and have
a single reg entry for the mailbox, containing the mailbox region. The
two syscons contain the general control/status registers for the mailbox
and the interrupt related registers respectively. The reason for two
syscons is that the same mailbox is present on the non-SoC version of
the FPGA, which has no interrupt controller, and the shared part of the
rtl was unchanged between devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c5..f9d6bf08e717 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -259,6 +259,11 @@ clkcfg: clkcfg@20002000 {
 			#reset-cells = <1>;
 		};
 
+		sysreg_scb: syscon@20003000 {
+			compatible = "microchip,mpfs-sysreg-scb", "syscon";
+			reg = <0x0 0x20003000 0x0 0x1000>;
+		};
+
 		ccc_se: clock-controller@38010000 {
 			compatible = "microchip,mpfs-ccc";
 			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
@@ -521,10 +526,14 @@ usb: usb@20201000 {
 			status = "disabled";
 		};
 
-		mbox: mailbox@37020000 {
+		control_scb: syscon@37020000 {
+			compatible = "microchip,mpfs-control-scb", "syscon";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		mbox: mailbox@37020800 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
-			      <0x0 0x37020800 0x0 0x100>;
+			reg = <0x0 0x37020800 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
