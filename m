Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5954CEFD20F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS80JKn79UKekGiGBku2KBkcZ8/QZyqkzHCw0u1Yci4=; b=u1Os50npWW9Cpa
	5sdsYYgQOpU2Ztfr4aRsKvKlgGJng8MnkadFTlw80zYsQPIZtJ0JFpmwhxWqK2ZT+6OcnWjteZ1XT
	mqFx67dARXpL0x+vKwHaXPImLHDINuVXUcpFJ3qN00eM7lKOevXSpt7hbJAoR3TDK8jyMgUZ+op7u
	+fmQos9JVv4Xf0OhKGoHSCA9jRwFl5hStyXbfNCqsfgvud36Rgw4Kt0HUI7hMSVR7/NyLYmSBy1jr
	zGvkg04cAJa94yM3urWNvlsasIl7YUD8dVvIhsikj3VkeZmMqmRCs2pqhO/Yvu01XJUEKMFyVUvtp
	ebQ8T1jcvSelqjsEGUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhE-00000003axL-075R;
	Wed, 25 Feb 2026 08:56:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAhB-00000003avo-2rg5
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xf8+OZcmoIyytCbp2McPycGgJD3eEGnFFpN1akGoeGQ=; b=EwzCnTfmjWSqeTBtmmOcPdepWK
	JWO5cR5hpsaYqhCFUaItfoxnGaGCOV4ULfqamOxU+GOoeiSpy7/il97+IKbkBZVHcQIXNcNU+eXJg
	ZL6vYCVV1v3RfNFQn+4avedzhsO1TxIYr9Y1VBmnsFcUt/KIY/KjIDrvG51F0EeBHXTgPU6deR7fE
	1tRo2PJcusizTWAOiQOvmlSkHceVpONg2qPdbL3OEe7BhY6GjR1pbL0eXJHl6a2boG2ofG9/hVZWI
	QI1ePI45LsvtgocTf1IkVwAn0foA2sOHHU4v8UFT4BoMKzPQurdR9D90MtwI4lLb1xmnf+h3Qv/mN
	6jhslEcg==;
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh7-00000008bma-3htj
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 08:56:36 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 61P8tBd6077809;
	Wed, 25 Feb 2026 16:55:12 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Feb
 2026 16:55:11 +0800
From: Randolph <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <pjw@kernel.org>,
        <christian.bruel@foss.st.com>, <Ghennadi.Procopciuc@nxp.com>,
        <quic_wenbyao@quicinc.com>, <qiang.yu@oss.qualcomm.com>,
        <vincent.guittot@linaro.org>, <vidyas@nvidia.com>,
        <elder@riscstar.com>, <s-vadapalli@ti.com>,
        <ciprianmarian.costea@nxp.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v11 2/4] riscv: dts: qilai: Add PCIe node into the QiLai SoC
Date: Wed, 25 Feb 2026 16:55:02 +0800
Message-ID: <20260225085504.3757601-3-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225085504.3757601-1-randolph@andestech.com>
References: <20260225085504.3757601-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 61P8tBd6077809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085634_499643_7699AC04 
X-CRM114-Status: UNSURE (   7.68  )
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

From: Randolph Lin <randolph@andestech.com>

Add the Andes QiLai PCIe node, which includes 3 Root Complexes.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 arch/riscv/boot/dts/andes/qilai.dtsi | 109 +++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
index de3de32f8c39..731ba12ccc95 100644
--- a/arch/riscv/boot/dts/andes/qilai.dtsi
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -123,6 +123,7 @@ cpu3_intc: interrupt-controller {
 	soc {
 		compatible = "simple-bus";
 		ranges;
+		dma-ranges;
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -182,5 +183,113 @@ uart0: serial@30300000 {
 			reg-io-width = <4>;
 			no-loopback-test;
 		};
+
+		bus@80000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x44 0x00000000 0x04 0x00000000 0x04 0x00000000>;
+			ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x20000000>,
+				 <0x00 0x04000000 0x00 0x04000000 0x00 0x00001000>,
+				 <0x00 0x00000000 0x20 0x00000000 0x20 0x00000000>;
+
+			pcie@80000000 {
+				compatible = "andestech,qilai-pcie";
+				device_type = "pci";
+				reg = <0x00 0x80000000 0x00 0x20000000>, /* DBI registers */
+				      <0x00 0x04000000 0x00 0x00001000>, /* APB registers */
+				      <0x00 0x00000000 0x00 0x00010000>; /* Configuration registers */
+				reg-names = "dbi", "apb", "config";
+				dma-coherent;
+
+				linux,pci-domain = <0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x02 0x00000000>;
+
+				#interrupt-cells = <1>;
+				interrupts = <0xf 0x4>;
+				interrupt-names = "msi";
+				interrupt-parent = <&plic>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 1 &plic 0xf 0x4>,
+						<0 0 0 2 &plic 0xf 0x4>,
+						<0 0 0 3 &plic 0xf 0x4>,
+						<0 0 0 4 &plic 0xf 0x4>;
+			};
+		};
+
+		bus@a0000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x44 0x00000000 0x04 0x00000000 0x04 0x00000000>;
+			ranges = <0x00 0xa0000000 0x00 0xa0000000 0x00 0x20000000>,
+				 <0x00 0x04001000 0x00 0x04001000 0x00 0x00001000>,
+				 <0x00 0x00000000 0x10 0x00000000 0x08 0x00000000>;
+
+			pcie@a0000000 {
+				compatible = "andestech,qilai-pcie";
+				device_type = "pci";
+				reg = <0x00 0xa0000000 0x00 0x20000000>, /* DBI registers */
+				      <0x00 0x04001000 0x00 0x00001000>, /* APB registers */
+				      <0x00 0x00000000 0x00 0x00010000>; /* Configuration registers */
+				reg-names = "dbi", "apb", "config";
+				dma-coherent;
+
+				linux,pci-domain = <1>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x02 0x00000000>;
+
+				#interrupt-cells = <1>;
+				interrupts = <0xe 0x4>;
+				interrupt-names = "msi";
+				interrupt-parent = <&plic>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 1 &plic 0xe 0x4>,
+						<0 0 0 2 &plic 0xe 0x4>,
+						<0 0 0 3 &plic 0xe 0x4>,
+						<0 0 0 4 &plic 0xe 0x4>;
+			};
+		};
+
+		bus@c0000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x44 0x00000000 0x04 0x00000000 0x04 0x00000000>;
+			ranges = <0x00 0xc0000000 0x00 0xc0000000 0x00 0x20000000>,
+				 <0x00 0x04002000 0x00 0x04002000 0x00 0x00001000>,
+				 <0x00 0x00000000 0x18 0x00000000 0x08 0x00000000>;
+
+			pcie@c0000000 {
+				compatible = "andestech,qilai-pcie";
+				device_type = "pci";
+				reg = <0x00 0xc0000000 0x00 0x20000000>, /* DBI registers */
+				      <0x00 0x04002000 0x00 0x00001000>, /* APB registers */
+				      <0x00 0x00000000 0x00 0x00010000>; /* Configuration registers */
+				reg-names = "dbi", "apb", "config";
+				dma-coherent;
+
+				linux,pci-domain = <2>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x02 0x00000000>;
+
+				#interrupt-cells = <1>;
+				interrupts = <0xd 0x4>;
+				interrupt-names = "msi";
+				interrupt-parent = <&plic>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 1 &plic 0xd 0x4>,
+						<0 0 0 2 &plic 0xd 0x4>,
+						<0 0 0 3 &plic 0xd 0x4>,
+						<0 0 0 4 &plic 0xd 0x4>;
+			};
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
