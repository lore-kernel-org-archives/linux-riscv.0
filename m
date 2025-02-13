Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A39BC021A6
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 20:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDe0rDSPGDsZG133T1k0Mqn2/zzEFet+9ExLbsUPU14=; b=btFHFdVC4xoRAK
	8zgX/kdyVE9djAAw+cIeaIc/AfczSSCGLq6zo6FD6RSugR8qEkyT6Db3Vfk2HD4vUh10GUcSgXTgk
	7h1gggqKaYRRaV2qVU39gYpffS+o144tGPLJZ/GIT99ZMlXl6Cf15PqfsxX/3H1e7lrQbqoiNw9sk
	mO/9JdR9KLwLuBV8oTXTxiGOtC9QsCzMP8UICp1WbY52qD4CQubTH0LAEjNaRDQO9gftmY5IBKInn
	5ry5/IfW6bOUbtSGq+E+pgQFuFEnz9f6Lotjq4S5HFLNOLxX7qhZWaLTBTwagU9bUsxnvJClWQ7jx
	VjCRrFxkrrl3hiK6ZiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1S-0000000CZT9-0i4T;
	Thu, 13 Feb 2025 20:41:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tieEG-0000000CIEn-0tfq
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:46:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so1823129a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 10:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739472386; x=1740077186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=aAW4hcMHGd3flJCkLlLVM0R3HxINTpbMyhbwINxRwAhQP2yZmhZZv4jT8zLor71Wkt
         6Qc7ZELySJDzGKColnCG27rD+9tDtzCloGUtoSGShL2BJyVYabFAl53CHxD3dkLjOCEm
         Q4NvzrgWEbpGhB5LEAigAr77XwDg+PNFehg5+QvT//etT4Fd9seSi5XMRRnhhbHlov31
         ji61RuecPnpMjaJNwJAANAqqPPqhVdaO2JAoaibA2Vrq6jcRtLAWac2FnPYL6JR+wzRP
         bV8oFbWJ/0L67bOBhOe3khVeSQPHvPLWjkv1lAfIXKndnbzI3a9ILgG9S8Ih0ieMskDr
         Bwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739472386; x=1740077186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=Rzv+rchPk+58wK4W4BGwiEMmFp6DZxA4WAdL2j7nAK/xZxO5aSR+xAJiMPDESIuBM8
         Qpc7b++dbU9qxkiggAgVBT1C2ROlwYgMxEbKEiISzc3+7hikUUWPW5cFp/G/ep7PyxGN
         +DQCcOC4j1vuAvLnQ0q38QekVGzUSMZ/3LxUjro61fOPjI0n75qjtzpoWNVmmQZokG4U
         Fmae5uyBSxJZXeU64+2zG1bl5zSM4/e5ZVrGmsuwZIFDV6TCf2wHW/UFfzIDDLxRG9gt
         7oQ6cSXsB7XQpha3bnohKIwCVtj2Q+E0KXFrGZbi2gyUcv2Ih4Jx+Z/REcjbQUal0R1h
         /U/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgdMSViBqZzoh0F2r7ma3iJ0r5QNtg6e3okU7f9PXLl6yZgwJMK5Pd/ynI8IcTK5Bf5TFPrqBVqHTIuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpAJxNoNkRCVJxbwOxSQe+KztCFTo1vibRz9xcpyXQIwfou8+U
	AcJCm5MFmZkRxVeoUGHWbzYVhcmmyTKK0WvTDHF3ZgMgc3eSV9x6
X-Gm-Gg: ASbGnctGpWCmQFvtQXXiRNNGjn/yu/jX48pHugmtTqYZz7LFneA2797RFuUFK0fqxTz
	WcEg7Ths+d1QascW9qi56xGp5VIown0QLxQpFBVwpAoPfTo1VJLtoQ+/xeqjNnjAvBrWHcEANP9
	fmCeZZsRh21iGuBAJW7jRah4KUw7JMWpiPqsog9ozwZoeuuJdPK7QY1VcKGyhQyK+60Ws/KtZwZ
	+cGK7XqzRnVq0hurvUhSAfW3b9w/xhdNfQ6i+P306IJ1bHq8BGjgzM6WRFqHm3FuMd7N/MZ+93S
	c0f47fQF0pxVQcOQZZQqsaZb3ZIT
X-Google-Smtp-Source: AGHT+IFbOtRzeOCQ06GmMjbJRsv9zpsGZKNOgatw0C8hFYhEdBQ55E0H38YVmlbZVJyjoft+DGsobQ==
X-Received: by 2002:a05:6402:5202:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5dec9e99913mr9052563a12.22.1739472386351;
        Thu, 13 Feb 2025 10:46:26 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533998e2sm181360466b.134.2025.02.13.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:46:26 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v10 1/2] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Thu, 13 Feb 2025 19:46:14 +0100
Message-ID: <20250213184622.2099324-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
References: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_104628_254531_FC875A28 
X-CRM114-Status: GOOD (  12.35  )
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

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
new file mode 100644
index 000000000000..b36b51a69166
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
+
+description:
+  Real Time Clock (RTC) is an independently powered module
+  within the chip, which includes a 32KHz oscillator and a
+  Power On Reset/POR submodule. It can be used for time display
+  and timed alarm generation. In addition, the hardware state
+  machine provides triggering and timing control for chip
+  power on, off, and reset.
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800-rtc";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
