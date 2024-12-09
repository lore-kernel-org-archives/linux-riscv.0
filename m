Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D44E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xQJMWjCN0OM+5uBnHV3T4XzVbW9fj3/dkSpL2FV1c4=; b=KCZgPMwSGH8AY/
	iSLzWGQ5Y4jD9QBo7nQqscg+0819TH31ki3y9Elva31/2YrV3hOS3wGREZ1G6p52jTNSdY/zaHs4a
	9K8QSPn40jut2XczHId8duwR8a9brVHrATD9S160te33Y1dVvxb8Yq896pJUiQvKVxP1S07vK2fhg
	6f5G0jJf0WX7+1sH/FCKti/aAivzGBxxjKmnNAdqxTlFco7VjzyBKOLZnWKc7acmPRVtqhbRTofFX
	uh5rc18O3t0SiswAk5w74BMVMRMREsQyvkHtZuP85l2PUlBIy51b8ogd5mtf+nfQDHW5V/wYGK0Ll
	dXr4GQCPsg+UbaBOMIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXvn-00000006fPY-0DAC;
	Mon, 09 Dec 2024 07:11:47 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXvk-00000006fO6-3MWs
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:11:46 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5f2c51478e5so39337eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728304; x=1734333104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klPRAQmrviFZDy2vInQr+pcPkAn+YtkoFZF3QW1QD8Y=;
        b=D1JCTj638hAbUU0dW0bL8ooVZuRQP5biiCs8VZCEAvGmVj5cZciYc9hdEtlXLJLJwF
         1dZW0/au9tVSc9O8gkVHm+3VY0FkUZj94lXLRoUfXgCQctJ1ww2pPh+djzBqZnFh2n+h
         /SBf9kvOL5Nzkl4tZBAzDWbtF9gsGU08LuGtzVBuacYZtN5QRROnRV+AXUM9mXioVuRv
         mcr9A2zhajeh2QVeQOtGnUHKJPYYfUf0Z4GUJXoBl38J5qpS2ZtzDKFm26bqpR1K0Evp
         ygmJ27eh1na6fvbN5Q36LOQNUPuPCulKAzy6klUBJhnrMjdDfCcQepiZ3h75L+jltSJS
         Q3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728304; x=1734333104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klPRAQmrviFZDy2vInQr+pcPkAn+YtkoFZF3QW1QD8Y=;
        b=u5bMbAG+QcotpG2/ja82GvWKLYZAfLcPwFdZxcyozvqDgtcutEjd2jJ90+V/w/CWe+
         UITQpMHQXvGU/FkMi4FqLQCDnETPQnbADTQXMNqCc6V9f0j42UMz6/0fkrXdo4gotKOO
         wTL3V0Tez+oNPEJh3TVxBW25+lp/83hOmtrNl52q/RByY2v6ukLUhhu5nrlcnLk+Ynb0
         3EdIieIpJsx1w5xrpy9SGYua7MDFhTNZ4W452+A2beerX51khMfF9BZBqWujC21pq+cQ
         DNNUWdFzaOSSBo7AYta3y1bUdba/4vpp/IVugmRKhHZv8HnK+KimLma8DJXNGMLm3D61
         EviA==
X-Forwarded-Encrypted: i=1; AJvYcCWnzXXSg3sc/xA/YrZGe+pr3MH1FxN2OUKjsyI6kGcsR7x6ldVY09z9DI6XEKj8uNa33td2lAJM+J5aiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5PnPsYtgrzSRY9ciFHCzFDArskSAafcnCatpx3Yrs9ImtcTKJ
	FC8nYdjmYO0zHiwbGQE/lldOGfb18iRtR5DndoN7WerXQRDhNoWm
X-Gm-Gg: ASbGncvqGOBwZSqb46myw6jU+UIBK9JChToHfajIDtZf4FnCo71G/7NnOd4Roe61wnb
	CpkOsn2VZuSRjXF7k0IwJE5J8BXu6dFsS0loDHwPFLitmJNU2YeD7u48o0O6UrNzDNBkuruPlQP
	dfeLJqtiIefkik4OMHBdwIeYP/jf0UEXgzr+x8zLs7wX/g41wNTp4sZLPgJCKK7OMspT98QYU0z
	tpNQisx5QCj8An5MHCFWC02BCBZj5PJ8TGDU7pgpVaNdA64Vtbkz/JsArkn
X-Google-Smtp-Source: AGHT+IGmImEDzFh8sIAAPI0/7eiLKaOccUhREzWI4+bMl5GKhrC4BuLz5gHeJhmGOaOCZkUsv0Go6g==
X-Received: by 2002:a05:6870:9571:b0:29f:b1d4:7710 with SMTP id 586e51a60fabf-29fb1d5172fmr2511485fac.24.1733728303752;
        Sun, 08 Dec 2024 23:11:43 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f56665801sm2532803fac.4.2024.12.08.23.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:11:43 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
Date: Mon,  9 Dec 2024 15:11:29 +0800
Message-Id: <8f857ba0d281010ddfb53d12b3dd66733ee6a810.1733726057.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733726057.git.unicorn_wang@outlook.com>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_231144_838789_0084F484 
X-CRM114-Status: GOOD (  11.90  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 MSI controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../sophgo,sg2042-msi.yaml                    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 000000000000..0c9e9d07e5ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 MSI Controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  This interrupt controller is in Sophgo SG2042 for transforming interrupts from
+  PCIe MSI to PLIC interrupts.
+
+allOf:
+  - $ref: /schemas/interrupts.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-msi
+
+  reg:
+    items:
+      - description: clear register
+
+  reg-names:
+    items:
+      - const: clr
+
+  msi-controller: true
+
+  msi-ranges:
+    maxItems: 1
+
+  sophgo,msi-doorbell-addr:
+    description:
+      u64 value of the MSI doorbell address
+    $ref: /schemas/types.yaml#/definitions/uint64
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - msi-controller
+  - msi-ranges
+  - sophgo,msi-doorbell-addr
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi: msi-controller@30000000 {
+      compatible = "sophgo,sg2042-msi";
+      reg = <0x30000000 0x4>;
+      reg-names = "clr";
+      msi-controller;
+      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
+      sophgo,msi-doorbell-addr = <0x00000070 0x30010300>;
+      interrupt-parent = <&plic>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
