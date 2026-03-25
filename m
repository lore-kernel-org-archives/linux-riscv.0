Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A27FEA82F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tF1OdT0qu3iNaMId8QwhERQX6KoYGt4zi38mT7R6k4E=; b=TPAt0d4jflCv0N
	p1GN4ivSnbnhYYTptrRGzk3dZynSdoB0C5eUFEkwsof6RKV2PQtHd2jAAWw/2Bc/ELg8tdOU3+2Xl
	tXCR8m3qjh8iyHpHto28JdWQYia7PFbLZ4eAlRMIgeEi3YII/pxkXcgcSuvI22tb/E1AS7i4WLRXf
	v2cx034YIAhNgzFa3/q/uN/PIn/loiNK3g1Fg+vPKXFmFPsFk3WPpADX3gyFPRV6dksKJHwSXQQyq
	HhvwbJ8fwmNRLQR1xJGK2mJ6aaR5UCOfUNVZ9mhYWUOy4W3qQrTpqP4DoQSDMJFn8saa0zPIJJRjE
	yRrzCBDNbZqYdu50WgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JSz-00000002wFj-3wuX;
	Wed, 25 Mar 2026 08:19:53 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JSx-00000002wEw-0nh2
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 08:19:52 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3lmak4038010;
	Wed, 25 Mar 2026 08:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=afRNwy/kx9NsNPjTaedXKXS
	gza37hgSnrdJAE79BC2Q=; b=stDsGRAfKTwBIMgpoH58J/JLIOgZG8Hjk5xZ6sL
	L8mJrlVsVBenV4Oug9dSYytXOpIXdRcTltbljRpPP5JnmSbNe/yqX20IJi+p3NRr
	FDWJCOAPhGzDyg+4+vxwUFc9trR1PKfL7QxGQcgBQea6WT9E1SclZ37OxzqXhyLH
	WtR4nN4tKlxwQhrPCGEw/3i1WEY4S8Fxa8o+Z2bVD6kIE3BMJVaGyKnqyiiQgwwX
	CoOFEfexBTxuI39KljS6S/035hJNJlKf8NPrXV6bdy1invzZWHWzpGjiKe38HmL5
	yDsb/ofnw21AH9U13blOMOHp5R/LN9A/N/oceaYdRUMAh+w==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d3xbc8hmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 08:19:32 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.92) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 25 Mar
 2026 08:19:30 +0000
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Wed, 25 Mar 2026 09:18:59 +0100
Subject: [PATCH] riscv: dts: thead: beaglev-ahead: enable HDMI output
MIME-Version: 1.0
Message-ID: <20260325-hdmi-beaglev-ahead-v1-1-e71b41b98dca@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAHOaw2kC/x3MSwqAIBRG4a3EHXehFI3aSjSw/MsLvVCIINp70
 vAbnPNQQhQk6oqHIi5JcuwZdVnQFNy+gMVnk6qUrbQyHPwmPMItKy52Ac7zOBmjW+tNA0s5PCN
 muf9pP7zvB0yG+XVkAAAA
X-Change-ID: 20260325-hdmi-beaglev-ahead-bc55396d57e6
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Robert Mazur <robert.mazur@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774426770; l=1787;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=pTg+utSCyG7wZZOQyIhVF1sI+fvLSEvknrPySU/Dpk4=;
 b=NX+ICaWJ7ng7R2yfs5biUZLBjOJfQ26w/qtnvDdYYkW6gsxZRgEeRJNmfwe7/Lfr/NKSJ22p0
 q+8IhntunuXAvl+XywFmLbJJZdMFjdaTP46yRJGVOfsYBZEPwy5b23Z
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.10.92]
X-Proofpoint-ORIG-GUID: LYlXj9FfH91mfh2kmKBTdCfjYAqdjnxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1OCBTYWx0ZWRfX5uBeveiAnQBt
 UwpW1pClmNs/BVMi0D1XNnckfwJn5sGokXHzgvbQQ2rIQCmqS6b5B7Msejzhh+kZrPBYNtp85Dd
 O2kGeiw2qwIFpQOqo4libKTSJSmIBkbf3NhXyIOjikc8NXvvO+Uk7mle7sfUB16VoCjuZ+DSqAR
 REw6ptK4IVyRLH3N/qGtgNSfXVop/4ZV77pbi7ThKiLTROGuRriibNpSXkDI3Z2wme3Xdd1asin
 WDSx9mb/USfNH2SRcJOCzPj6Vuprv9uGhRx3pzVrG1weWlmxa5CEC2H1Tp2hCZ7RKwHi1iUKQHp
 zPPjJBD0Rb6zj+F9DrVLMcDLJm0BBuwFOSLhOJvpxdF1EaZkATGm61uSy3zMrUp2oTFxisHkx/0
 j1M8YqsrB10ZmbswIegC15DhwfKgpYi2UdL4kibHBSRJgp8enVTNGXoZ7QtJnItheselzhKW4RU
 3vgxO896m1Dw+DGeyjg==
X-Proofpoint-GUID: LYlXj9FfH91mfh2kmKBTdCfjYAqdjnxc
X-Authority-Analysis: v=2.4 cv=bMkb4f+Z c=1 sm=1 tr=0 ts=69c39a94 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=REVHNWFD5ocA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=dc_29QX9MvWPFfCYLDcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_011951_527226_A73F0E1B 
X-CRM114-Status: GOOD (  11.71  )
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

The BeagleV Ahead board includes a micro HDMI connector (Type-D)
wired to the TH1520 SoC's HDMI transmitter.

Enable the display pipeline by adding the HDMI connector node,
connecting it to the HDMI controller, and activating the DPU
and HDMI nodes.

Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
This patch enables HDMI output on the BeagleV-Ahead board by wiring up
the DPU and HDMI nodes added in the following series:

Depends-on: https://lore.kernel.org/r/20260129023922.1527729-7-zhengxingda@iscas.ac.cn/

The patch has been tested on BeagleV-Ahead hardware with the above
series applied. HDMI output is functional.
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 21c33f165ba9..91f3f9b987bc 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -75,6 +75,17 @@ led-5 {
 			label = "led5";
 		};
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &osc {
@@ -236,6 +247,20 @@ &sdio0 {
 	status = "okay";
 };
 
+&dpu {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out_port {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;

---
base-commit: d2e20c8951e4bb5f4a828aed39813599980353b6
change-id: 20260325-hdmi-beaglev-ahead-bc55396d57e6

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
