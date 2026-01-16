Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5F9D4A619
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4e8QO99dbhB1HxmRFKU5w51JmMkudchUXSAKaB2JG0=; b=qhdl9hbpzItjzE
	MNL507E8CQOpDb2HGtz6KAJNDZ6/rRQ4pSLIn6firY0gvcYWsfBEMmMGGpBA3WvJnvnHkLAgQzFX3
	rIzJoSNl2gzix81yzQ96MvDtGG8KqlhmYDBiO92a8vs1BGTrvfXsGC7VT9qTcl5rYWOuVdu68X9dn
	LNYVWbu43ES60xsD8ZUIn+BxegDPIxYLqaYr3IWPvQkfHX8atv9vXY3LhwKHHOrTr/PlKTEO1UVqc
	eSv9uCbUiSwteMRy6Ei7ilCWpn1LehemJo+r21E0xWlERawcJXCo3F18j55ibXnDc90c5KETH8m+R
	ZXydY8k2gs0Xd5CRydMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggdB-0000000DtgR-2Oh6;
	Fri, 16 Jan 2026 10:00:37 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggd9-0000000Dtfg-2vsd
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 10:00:36 +0000
Received: from localhost.localdomain (unknown [116.25.94.194])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30e8ca650;
	Fri, 16 Jan 2026 18:00:33 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for OrangePi
Date: Fri, 16 Jan 2026 18:00:01 +0800
Message-Id: <20260116100001.208334-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260116100001.208334-1-amadeus@jmu.edu.cn>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9bc63fde9403a2kunm651e977725ca95
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxpDVhkYGU0dTkJDHk1LGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJPWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_020035_901728_3B7FBC70 
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

Define the power input and the 4V / 3.3V power as fixed regulator
supplies for the PMIC, PCIe and Wi-Fi.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
index b4808f258adf..c71c5bc1d341 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
@@ -17,6 +17,34 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie_vcc3v3";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
+	vcc_5v0: regulator-vcc-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc4v0: regulator-vcc4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc4v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		vin-supply = <&vcc_5v0>;
+	};
 };
 
 &eth0 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
