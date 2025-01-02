Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF913E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 20:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eXuM0cCGQLjEoxJGnZGRXKJrvETiOHxXvp6DeaojZg=; b=mcC/8YNHA3t+nH
	82CcaXn8SzD3eM3exwBF4KxM2a/MSJtx1VONAXhCtNDtHqQWthzE/j2exC19DRLwynV16g6nhUP2T
	v1f2btt10DgB+lDRmiAv5N5yD+DVe8maLBJEtBdyGsPAUxCtKL3IZda3PyMyg/g9LB+toiWP8sDin
	AgxZ9z2/dOXGfvovlxVB6fg+IvWyiQm7T84RC3G+WDHJ9Y/7VdkaoyzLEFmKD7xSlJKV/IXQ0Uc5o
	KR8INUn5J1hqbGf3n5Fct/ezap88EifSXiIXyOvNPt6DzZr0azqohFu9+eNF7x706MDyyIuDQMPgk
	cqh+r3k2fmiPZfODi4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS4n-0000000BQG2-2C1m;
	Thu, 02 Jan 2025 20:45:53 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS1M-0000000BPeW-1xs0
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 20:42:21 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B1FF5B220C7F;
	Thu,  2 Jan 2025 21:42:16 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [RFC PATCH v1 2/3] riscv: dts: starfive: jh7110: add DRAM memory controller node
Date: Thu,  2 Jan 2025 12:41:22 -0800
Message-ID: <20250102204137.423081-3-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102204137.423081-1-e@freeshell.de>
References: <20250102204137.423081-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124220_674000_1D6ED55B 
X-CRM114-Status: UNSURE (   7.01  )
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

add DRAM memory controller node (no driver), required for U-Boot to boot
successfully.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0bc922b3ae8a..6948974400c1 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -381,6 +381,19 @@ ccache: cache-controller@2010000 {
 			cache-unified;
 		};
 
+		dmc: dmc@15700000 {
+			compatible = "starfive,jh7110-dmc";
+			reg = <0x0 0x15700000 0x0 0x10000>,
+			      <0x0 0x13000000 0x0 0x10000>;
+			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+				 <&syscrg JH7110_SYSRST_DDR_OSC>,
+				 <&syscrg JH7110_SYSRST_DDR_APB>;
+			reset-names = "axi", "osc", "apb";
+			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+			clock-names = "pll1_out";
+			clock-frequency = <2133>;
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "starfive,jh7110-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
