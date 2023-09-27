Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6080E810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzjDYoyX+gQthTBYrvIWxC3m+5bHnummX70GAL34dys=; b=pvUDF1dsMbzMU9
	zdprlSkqvwr0PqIYjSE7HcdoM7kUmSd6kEFZjFl2uO2cfzlRuAUMrizoeNRJFjjmjSMhcRq/X1v7x
	WOabYvnW8A85jqASjeUIyYYmLic1vDEw9tbHdTpjjCdfIC1PQnsZuj3eyKUiIpU78ThU5wZYDNhLI
	JdMN4Quxtq/8n11Ypiz2KExsl8QtANWchKMtnhMUkazKY5F/ncfl3yT9hZkUd0PfvTuVG7/nCf07x
	QHAqFeEKIKST9ZEDDMtFxTq6nuC8eSv55BlDxyAE+4clfIP8ofoMSbTo+kR5lG+LpohJP0uHoOhSi
	UBByK/ahWtqYosj4GokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQZ-000Pcu-03;
	Wed, 27 Sep 2023 09:01:51 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQW-000Pao-0H
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:01:49 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6c4e7951dddso3420942a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805306; x=1696410106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXIpE3t2S5hvGBlA4qF3kN7EACJyW+Do/rfIdtRkLUc=;
        b=JlHgfe+ZIQBrfDD/yoQOCEzYDEevioqwmY9nYmFw1WKwardFP5EY1Ony9B5z5F6bpN
         qJGMB4yFZ/sWM1ImtIZZQKS8yzERWQdItDVjch/jh+313s6hHHD+zF5yy/ERMdPuAotj
         OYR4nbkBFLIquhVPdFmPxA+YQ5rKyAiamBEhGXGrKJ3CiNaQp0p54q87cQ2O77topI90
         JRggqHeFZYRBMPQn2knXfJniA6HpcQ7K596zm1ILhfvPyFyp4lZugvBCNZ0PS1yf9y+E
         4hTco1c66vpEBm+3dzR/nAnRadh6hLn1niXHBccwJ14YDpJ2/tIgRjFgOQN8DExQdaj6
         q3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805306; x=1696410106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXIpE3t2S5hvGBlA4qF3kN7EACJyW+Do/rfIdtRkLUc=;
        b=CL1PkH+wkgsy280+YAK2DqfECkvjdV+CA6LE4HHJmqmlDiQ1F7hqVDsMenoCE0zMID
         rSobHGlJajfSFueMVIouf4PQrMQHJz2c//9myt4D/H3jIAtdgvPb6GbQvhmXFtkB+Oh0
         yuQarSBpqrfIkvex0grDGSbpYUssbu5Ux8btc21L/C29ukUxOgbR9BFwUoh4GuwUBiHj
         bhcsPSkG5gY1eoBOkpkads9LQCtHqxA4QRdKZpGSFY4+rmbupxGXn6FGvTbwhGKIbobH
         k68dIM+gLRgSc1G4t1pACUjU6+B9WnDqAfeYQAitaFxMqMOHlG4eHfEyYNrumn4CZkZx
         dssw==
X-Gm-Message-State: AOJu0YwKlN7CEVkJPBx+taSaSo2tkyaxDf9X6MKjwesU/0CyDmzsSF/P
	WlSDV+gNa+foTCTlgrQC1ak=
X-Google-Smtp-Source: AGHT+IGIIPx7LpmWuBAwJyMC+B4D+B7f2hNQ3krtTefomBIb8tOVeWEMPZHi106hegZJOgN1jP48zA==
X-Received: by 2002:a05:6830:1291:b0:6c4:cdce:5de8 with SMTP id z17-20020a056830129100b006c4cdce5de8mr1517090otp.26.1695805305760;
        Wed, 27 Sep 2023 02:01:45 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id t7-20020a05683022e700b006b9b0a08fdasm2312157otc.59.2023.09.27.02.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:01:45 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <wangchen20@iscas.ac.cn>,
	Chen Wang <unicornxw@gmail.com>
Subject: [PATCH v3 06/11] dt-bindings: timer: Add Sophgo sg2042 CLINT timer
Date: Wed, 27 Sep 2023 17:01:37 +0800
Message-Id: <6e263430685732a4f354b45396c7422a37440ac8.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020148_122389_A08BC8B3 
X-CRM114-Status: GOOD (  14.34  )
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

From: Inochi Amaoto <inochiama@outlook.com>

The clint of Sophgo sg2042 is incompatible with the standard sifive
clint, as the timer and ipi device on the different address, and can
not be handled by the sifive,clint DT.

In addition, the timers of sg2042 are mapped by per cluster, which is
hard to merge with its ipi device.

To avoid conficts caused by using the same clint compatible string when
this device is parsed by SBI, add a new vendor specific compatible string
to identify the timer of sg2042 soc.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 .../timer/sophgo,sg2042-clint-mtimer.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml b/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml
new file mode 100644
index 000000000000..5da0947d048a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/sophgo,sg2042-clint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CLINT Timer
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-clint-mtimer
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    timer@ac000000 {
+      compatible = "sophgo,sg2042-clint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac000000 0x00010000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
