Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D665EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NuRcurOKza+kAl/aC0fsuqyYIzxaCAzboc+qZxl8NbU=; b=VNH3WlVX5ebuII
	gTYdkjjAeXlNoVEKSQfhFtiIJkiqqIidVTBQZwoEkxPQ2mMwU239FUpmK1VJpSutS/kIzRzl11twV
	1ef1QPnKz7QaenG72XvPeZ7SP2rUaWRpTkdh7TO522/HLfYzx4zDVWOjmISyF9h3avaxiXKv7XUaj
	2qS05HTosPYtbrSY3sSSSsBXqxxYN/3vnTLw0Bmqx27mNx/GXGSv6EgbBhRz1rBbVhf+TcPCDr1Ii
	WYkzHes9KM3saL1kiDIqsVRW6MQr+TjJOvDgxsZOWoIyxImr7B0+IiSH9IWVy/C/mxqrdAacmZaL2
	88IJtUvALiVcwp7kygUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJV0v-00Gt3K-1T;
	Wed, 12 Jul 2023 08:15:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJV0s-00Gt1e-2N
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689149754; x=1720685754;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eeJoNzKNu6qUVnwz+5GZhUrJMC3KM11Xsjrz/i3wt6I=;
  b=12ysNlmEeY8BY1dI/V+tLonmfhBU2T2rJJAujN2bHy7lE/GKstqqAxv8
   Ehi54StDlcbO/WoQVPccum8qR/GhgcV5N+O8LsQFvqDJ0wOUATWW34T40
   LV88N/oMNJicrNU28Yw66y8gX/mJehaSzIAVAoRXPiBFrlxT+BUla6sIy
   OKx1L4f/rNCZY3gFGB8fz1oj+nN42bdvlZlb1QMgo9nJkXS3UAeJxm5Nn
   YbrOc1r7mWfAxfoATQyp9W4A3nQQ5MxilO0hLLRTxEZgCoVNBEyG/b49G
   fU87zGFkkswKgdR+Rqo9IyzJEUSHBKJtr8ggyJw2aKzqvZdzKe1fePkRU
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="235030971"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2023 01:15:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 01:15:40 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 01:15:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <geert+renesas@glider.be>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] riscv: dts: renesas: clean up dtbs_check W=1 warning due to empty phy node
Date: Wed, 12 Jul 2023 09:14:44 +0100
Message-ID: <20230712-squealer-walmart-9587342ddec1@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eeJoNzKNu6qUVnwz+5GZhUrJMC3KM11Xsjrz/i3wt6I=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrEj6ZJprzlM1qf2eXt+dhTsY7CwupUy7/hFckhnO8Voic /GpzRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYi48/wP69ijZVUyPadHeuPb8oVc5 Ccwev1cfWPpzxix3MT5EIlhRgZ7t1t/yL6i43ZpMW0utjItHHiNqeb8rKb7ZIvuF/UdnzBCgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_011554_892838_D4A4343C 
X-CRM114-Status: GOOD (  10.90  )
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

dtbs_check w/ W=1 complains:
Warning (unit_address_vs_reg): /soc/ethernet@11c20000/ethernet-phy@7: node has a unit name, but no reg or ranges property
Warning (avoid_unnecessary_addr_size): /soc/ethernet@11c20000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

The ethernet@11c20000 node is guarded by an `#if (!SW_ET0_EN_N)` in
rzg2ul-smarc-som.dtsi, where the phy child node is added. In
rzfive-smarc-som.dtsi, the ethernet node is marked disabled & the
interrupt properties are deleted from the phy child node. As a result,
the produced dts looks like:
	ethernet@11c20000 {
		compatible = "renesas,r9a07g043-gbeth\0renesas,rzg2l-gbeth";
		/* snip */
		#address-cells = <0x01>;
		#size-cells = <0x00>;
		status = "disabled";

		ethernet-phy@7 {
		};
	};

Adding a corresponding `#if (!SW_ET0_EN_N)` around the node in
rzfive-smarc-som.dtsi avoids the complaint, as the empty child node is
not added:
	ethernet@11c20000 {
		compatible = "renesas,r9a07g043-gbeth\0renesas,rzg2l-gbeth";
		/* snip */
		#address-cells = <0x01>;
		#size-cells = <0x00>;
		status = "disabled";
	};

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index d6f18754eb5d..c62debc7ca7e 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -22,6 +22,7 @@ &dmac {
 	status = "disabled";
 };
 
+#if (!SW_ET0_EN_N)
 &eth0 {
 	status = "disabled";
 
@@ -30,6 +31,7 @@ phy0: ethernet-phy@7 {
 		/delete-property/ interrupts;
 	};
 };
+#endif
 
 &eth1 {
 	status = "disabled";
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
