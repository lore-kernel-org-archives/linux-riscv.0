Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0079C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i3AOHjKPa4LD+SxmbOPjdqTgJ2SIALK1nFLJmSH1X3E=; b=hNsL/0Xpk4xAYy
	3mQ8yGOrk6jhXpr92+afrt91JofLExo6TZS/zLcCCzfZxyRa/BRKtRYZQe1nU/cBNIAZeVh8wfh16
	HVclvxvKDTYSHt4nliK9HZsqiEUjBNFY443fSe4bStB4D1Cd9ROhrME9oZKACUASQVpAmBFDjmid8
	lzpoRdDQONnZEPDpgLrs+Rsf7nd63sufv/Y0CUpiRTJ/5MU90nINe+d2bpa1fYMvT260iIBvrhvrt
	OvjyIw2L9g28CCiXZE55vHsKEqjSfkQk/5UWMd8AHKP/g8R6B8Qa+6W6ZDzTlnjbkAbj6Av7WPXDM
	53C/Ot2M5FQ0SmLb2rmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mg-00GrBd-2v;
	Wed, 22 Mar 2023 17:35:10 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mb-00Gr96-0Z;
	Wed, 22 Mar 2023 17:35:07 +0000
Received: by mail-ot1-f47.google.com with SMTP id x22-20020a056830409600b0069b30fb38f7so10785714ott.5;
        Wed, 22 Mar 2023 10:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iBFMrGCXs7aCaesF7jmbgEDqOsWeQiS1SA88xm+gP4=;
        b=FIJ+e4YJFs6FdyD/av9Q7k4YG4wrr0om2eYCQNWH9QXsGS4a7kKJN+9j1T1Aywieqk
         5CIdbZsICi2SjiIImuRRXr1tf5eY9/+cMAK67ewGpwvZIDINcY3DkmaZ791qMI6dp+sj
         SPkMMO3Afgf0IhSDj8EDi4ihpLTwwLMKy6+5PnfbxWfeTQdX5Oz0G7ondycS6sO/9Jcl
         PYgXNQ/GISeoJ4XfIzrh7FdXhh/GGCYqHqv8HJpIsm5M+VlVdSkpRBV4WtVpdJi1hZpV
         y/M+wcUJ7T30RTIJRDZqwHe3oTFu433Lh0yEME3DI7q6O+EZ/n1WBwA0AqazT4RABTEs
         PEng==
X-Gm-Message-State: AO0yUKUngmsNVySYBkswQaCJvw2n0wAsVCO3l+D66jRPMf3ji2QSjuK5
	dXBaQOexG3ipMgBX2VB/+7gYHJNlHg==
X-Google-Smtp-Source: AK7set8m4syrOCyuvx0eJfcZmRDih7NX1pwJMSBfADgJk63vKLPYr43ZCbmjV3U24/oNGz5bTTge9g==
X-Received: by 2002:a05:6830:129a:b0:69f:289:1fe9 with SMTP id z26-20020a056830129a00b0069f02891fe9mr2058230otp.17.1679506502895;
        Wed, 22 Mar 2023 10:35:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l26-20020a0568301d7a00b0069fa776d3c2sm162320oti.18.2023.03.22.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:34:58 -0700 (PDT)
Received: (nullmailer pid 3970918 invoked by uid 1000);
	Wed, 22 Mar 2023 17:34:56 -0000
From: Rob Herring <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Date: Wed, 22 Mar 2023 12:34:48 -0500
Message-Id: <20230322173449.3970718-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_103505_239005_630097AD 
X-CRM114-Status: UNSURE (   8.31  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   | 4 ++--
 .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
 Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml   | 4 ++--
 Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
 .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index dfd26b998189..385809ed1569 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson Message-Handling-Unit Controller
 
diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index 935937c67133..404477910f02 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
 
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index d888ead09282..7f18fb10435d 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm APCS global block
 
diff --git a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
index bdfb4a8220c5..b526f9c0c272 100644
--- a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Spreadtrum mailbox controller
 
diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
index 0dfe05a04dd0..134fd223a02b 100644
--- a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 IPC controller
 
diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
index 2193141dd7fd..45df46343f6a 100644
--- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Xilinx IPI(Inter Processor Interrupt) mailbox controller
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
