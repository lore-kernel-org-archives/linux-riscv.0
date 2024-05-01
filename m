Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EEEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3q2dc0VCbmy7tTvlrPc1AtQq4g0v43cq7v5U8EsJa0A=; b=vLuFJ5epGxQLlS
	xOQl/SxZ/KdeJpf0G97TpfoxNvjzjPNBmNB+G/75xTAsbTCjSPw+lorwbHZpbgcW9yaiOVk/qmDav
	JREsePjmZ5HMb8S+7K5xLaxv7OUukovW7yU+9RaICg/ya0jBWU/YDDaM0QKHsK+DVXZyi85w8zRsI
	qHHyKWbtKMGPIWWaM5SZZCduf55GyZyEYW33X2IzFwq85clwV/5Hdl8TwmpTZzMP6ilXBpUQ8W9ll
	h3skTA4qH+rh3CYAvNmNFnSE6Sq5xRn7trrxmlzQW1/Y2xeD8RXi+YLVFWN7oXJdK4kIFvYTUWON9
	pywq8F4kdi5C1Nm9O6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2C0r-0000000A0ml-2RH0;
	Wed, 01 May 2024 15:36:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2C0o-0000000A0lW-3KxG
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 15:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDBF9CE12F6;
	Wed,  1 May 2024 15:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F879C072AA;
	Wed,  1 May 2024 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714577808;
	bh=H43Z4wgbneQvtO9lOey4SVLIXIEEJWVeRwaZ4YWCu7A=;
	h=From:To:Cc:Subject:Date:From;
	b=UsYOGQX/t6MdBD4L55qbAiRXgRV0yCJL0PcNAH1ykns2kVT6+aiGrDVNTioib50qO
	 fVuMzecaVmfudYZ8y/t696yAT9dEdBpGPbjSaGMGWU/wel/omYY6a/lGruZci9DqmS
	 /bUmpsqdbdWbAHpdI4cM+rFHTaVtiLAbUvbR7sOfUtbsZUh0/aSQdMZhmDDYRWzqqQ
	 VPkgWo2xyKeyfHiC3FjG0rL3SEwDLNS+4pteQEcEKYJiUADzefGYAiKJC3bvH63z1r
	 3bOHEjsY6Ee5t49S7R26BatI1lgqu0ROEiT4tdEVg/+25F8k1RSFwuO+J8fJyAf3hT
	 QPSp6tOzank6Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: add pac1934 power-monitor to icicle
Date: Wed,  1 May 2024 16:36:31 +0100
Message-ID: <20240501-spearman-primary-17df3c21c770@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FR3O438NmrY2UU2Fa9xj9X2SWoXZf7FrPgh3S7n8dV4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlGifUKzt45m0oaa5d41NdWVy8Mez3HUb3t6cwZywV9E hcqODB0lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIh0xn+mQrefiVZOiMkf9aE zSHevarTsgryiss2FzedmfU4pTpvBiPDt1/c3M9cc68WaAQYzvsoX/i+JfxTrGP6g97jhySOXlL lAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_083651_064502_F85A8091 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The binding for this landed in v6.9, add the description. In the
off-chance that there were people carrying local patches for this based
on the driver shipped on the Microchip website (or vendor kernel) both
the binding and sysfs filenames changed during upstreaming.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 222a39d90f85..f80df225f72b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -100,6 +100,38 @@ &i2c0 {
 
 &i2c1 {
 	status = "okay";
+
+	power-monitor@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDREG";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDA25";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDD25";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDA_REG";
+		};
+	};
 };
 
 &i2c2 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
