Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B8BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjvq6uH/HflapOoVMe/JIsjbIuXtxh+3Qyzgj1FX9Hk=; b=fSY/kzV1tspHSt
	biWmIBlPyHiG7mNgTMEVrWhSAqTRrw9W1uzGUa+kLOTmcCKRaoWXnpUibDZ+TC1/KhyuR9qUQtVcR
	ulWSilz1OWHXPxzejMENBKgF+3sI5aVbfJk7ZGVD6NoPW3r9bJKjuGQO3MRzoHMTuP080QR5UoG0W
	MTPoCKfUu8AQ0bvPM/5HRf7qmCKGjRiKfF1tyjdc9/Ydj/wXT6/FyDl1x2IRhCOxrPgwn/lXrLrOx
	Syfcv5LdNgdo9R2e9lC8Ac/w5B9vyQgos1EVT9ZymwMfnl5T6uxXaTislJiZ/+8U5krTp3a/0OQzh
	5sLTJxwhtvDqLlaxx6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLX-00000004cyS-0Z0t;
	Sat, 23 Aug 2025 10:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk5w-00000004Pnq-037z
	for linux-riscv@bombadil.infradead.org;
	Sat, 23 Aug 2025 08:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ivruQgPAgnOsXQb561q1ghCx4pNshuV7J+JnMf6gLIQ=; b=GGq3ntIApzZKSxoUMv6uoqDV1X
	J7QCg/eEfI6QCFi/oJERzaC3CJAM3B2K5LY81T7RNRRVz5VO199/69tG5mzBPyCb6cLwyEJUMHmrg
	BFOnHqUS0dJXmiw6eI0ItxclEqbRkz4H8sU0UziKhLS1f/4EPIJbeQnaJ3qjhMkys9PILGcqmuVHY
	24EaumeK8ljdebzIx1TDq3LmAwiDr5mQIGoDl1qZDJlS3pQazIOG7i0Gfn9hrl69uM5UschoMqM3b
	ZjYXsZI/O3Ytg/3p9O+fiwzFMCENOa9oGY6sT0mMoLvOyAPbGV44OQDv72/k3PSpqUNs8W/Q/j2ic
	lviEk7rQ==;
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk5s-00000001NOB-3Vh4
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 08:59:26 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 6A05EB4E0023;
	Sat, 23 Aug 2025 10:59:18 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] riscv: dts: starfive: jh7110: add DMC memory controller
Date: Sat, 23 Aug 2025 01:58:01 -0700
Message-ID: <20250823085818.203263-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823085818.203263-1-e@freeshell.de>
References: <20250823085818.203263-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_095924_960739_0CB69F4A 
X-CRM114-Status: UNSURE (   6.02  )
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

Add JH7110 SoC DDR external memory controller.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0ba74ef04679..f3876660c07f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -931,6 +931,18 @@ watchdog@13070000 {
 				 <&syscrg JH7110_SYSRST_WDT_CORE>;
 		};
 
+		memory-controller@15700000 {
+			compatible = "starfive,jh7110-dmc";
+			reg = <0x0 0x15700000 0x0 0x10000>,
+			      <0x0 0x13000000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+			clock-names = "pll";
+			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+				 <&syscrg JH7110_SYSRST_DDR_OSC>,
+				 <&syscrg JH7110_SYSRST_DDR_APB>;
+			reset-names = "axi", "osc", "apb";
+		};
+
 		crypto: crypto@16000000 {
 			compatible = "starfive,jh7110-crypto";
 			reg = <0x0 0x16000000 0x0 0x4000>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
