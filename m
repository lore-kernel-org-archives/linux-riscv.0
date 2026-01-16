Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22220D47CD6
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG0oNtA0w5XQoxo5ssVOpuq90xZRSL9f6dMbTi6+rHM=; b=vEByMFsvLJANBB
	z5dFmNLoIHlnPsNS7q7vlrnSXyTc8EM3sbifKnRgIXXL0ez79djPWxiNo81ng7zHBenpjfHSWsBgi
	OTpITQK/yHAJvRieHZH8v1BAtLm337N26g4l6R+gKcCSyTl0u7dmvz3nC5OT474nUcBAJrVID2WcC
	mVYVcrFY13cfU6reLJsXSAvlWkmnw+tgWCnUhd8YIodjJqHjIer6fk//BgwokJ+NTC6QspEnei4mU
	2/CMtGTO3ZA5SKusn55gti8XuCr/nfGKslTXw61AiV2S3kR7Bw54SrFjtW++PC46cMRZwb8tbxkln
	gfnO54iNnjSYraMoWSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghpT-0000000E1cr-2KSc;
	Fri, 16 Jan 2026 11:17:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghpS-0000000E1c8-2T3L
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Jan 2026 11:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vnejVg8n/2TZ+308ZJMkSF7jTK/RAgzeTOdJ+3gpLQI=; b=DS7PhIjz0zLma1KYUJjYx6gZtQ
	6R/lr+UsR8IAmVLlbaYWcbjrWWPGAxCG19pNGK4LY2wXpPZsONpEMQmUL2Nt6kyL7759fm1o/eM33
	5bkzmqxrsr8FucQ8TBpeZKDjOLUnODdx57hKil1s5otgSjBm7VpVA7PCZ04QfJBCFUKuviEl30mmD
	ClHK+vI3WsUAhJ3E4mvKv0Q4thnuyrBiharfQyjmPBz5lvLrFSMHHhGoMQoCU/wepRyeQLDVlaOA1
	GhZyxJNMFgqjACv8qzGVT/gGBR82DkXfw+UvsSDsdh/DCVl22EbMb8MghU4uIBaRtduGKquvR7BJC
	Rf2b2bCg==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghpL-00000009GtM-3l8g
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 11:17:21 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 60GB71vK034332
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:07:01 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60GB2fnx031253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 16 Jan 2026 19:02:41 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Jan
 2026 19:02:41 +0800
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
        <christian.bruel@foss.st.com>, <quic_wenbyao@quicinc.com>,
        <vincent.guittot@linaro.org>, <elder@riscstar.com>,
        <s-vadapalli@ti.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v10 2/4] riscv: dts: qilai: Add PCIe node into the QiLai SoC
Date: Fri, 16 Jan 2026 19:02:32 +0800
Message-ID: <20260116110234.1908263-3-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116110234.1908263-1-randolph@andestech.com>
References: <20260116110234.1908263-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60GB71vK034332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_111716_454709_1F5922C0 
X-CRM114-Status: UNSURE (   7.02  )
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
 arch/riscv/boot/dts/andes/qilai.dtsi | 106 +++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
index de3de32f8c39..afa7b75a7e7a 100644
--- a/arch/riscv/boot/dts/andes/qilai.dtsi
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -182,5 +182,111 @@ uart0: serial@30300000 {
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
+
+				linux,pci-domain = <0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x1f 0x00000000>;
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
+
+				linux,pci-domain = <1>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x0 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x7 0x00000000>;
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
+
+				linux,pci-domain = <2>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x0 0xf0000000>,
+					 <0x43000000 0x01 0x00000000 0x01 0x00000000 0x7 0x00000000>;
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
+
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
