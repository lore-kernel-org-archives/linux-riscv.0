Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFBDC021BE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 02:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyCqoO21d3oZD1ZflW3BunS1p3rxD/OE785XfxIFZvc=; b=hKvxzuuq1iSp+6
	OLfo2iv9HvJyI5TKYswhEMvYERTCwa2OlU8SIVH+MxWFRUB1/U6/3KwJjRaEyAkCl4Jw52oiL4qA9
	8nMW8OdQUSQk3L8RoNPrueWZgGJIaLjsjnuf+Hap71pwXzhAwYGa7w5k7FDHXslMpcBbaQlKLLuIg
	q6zBvXchchWIH/lwrpHUc9QVEjkZoYmRGVlUS8ormHelJu3+62dHrmuKpOeuALidETgUAOOrq6dkv
	AgnQb/WHqmDTVrQnDTYFyJ7b3zgkqjIQBk+eN47RZN5PVkDxCgTmXWUb1g+9QHt/DtN3ZHABAaNZ6
	XXANXbTM03drv+ySFfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6x7-000000028bs-14CJ;
	Wed, 26 Feb 2025 02:15:13 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6x4-000000028ZE-2Tzx
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 02:15:12 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71e10e6a1ceso1665930a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 18:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740536109; x=1741140909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSwGNN0SIOhmXf5jKWogh0gmEP1MjDJlYVwfiVZRhNw=;
        b=ULPTsMDsUQJldHBIzNu4lQ7Yru0sR8FyGWHIuJ79NsE/Y9nXXZWp1TUHzCp2OBXhbx
         v34MSz+q575vvBuCAaQ2wA12ca2ZtL54uoNBdOzKCnKdzxJ+KiQJr97Yup5KOY2jfPdx
         aywG9VwApYb5ia3H2lyCDPAmEvpWES+eIxLQQ3LYxWeJjAKNMuWFsE/gccMGNgll0Sct
         eYadc9SgKIiqWc/4ciFok78ZHb7cL/S84FP8Mg90ltHTe+7FJvRiNjacoLuJZAH4pqEs
         jxJSPnmi70UEnsYnM2l/pNcLwQ+J0A2isKxuVjCNeIPVAomNPkJGxF4XCaah1LMUqgW7
         J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740536109; x=1741140909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSwGNN0SIOhmXf5jKWogh0gmEP1MjDJlYVwfiVZRhNw=;
        b=AUUR+o2FNumdR1Um14lMx5QfzjkT4sBdmTvWZlyEjvQYXFYqENVvluPxqjcDWFdrcZ
         /jkakT0kXEgnIKBw4/lTs7vrtswRo8hZSLXp1i9zG7h9d2CArcuiOFaugC3uNBMfZgX1
         3tgKG3cJy996UWCHmNPOTmpoEVA0rFrNJOiJxJK4IR91eIZ/q/EU3qyyOiF0y485w4O9
         o/BzZz+r9EHIhuXk8Hy3hy6QL5a+sU3ovL/vioRnIJAoVrmfcxA7lfUE+DJWS9/InxF6
         aUSyDzlN6HEDVMlErr/JP65+rPQyWKtFJT2nkZ42xmZP9Jj0Httty1mbCUOpehECcd/w
         kHsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBLm0bRKuu0XvG1wE7Dq742ISEEIkqSoAHD/Xhkk54KEzoot/Ru8i+v24oxP3TMRlEAzdFWJs/OXufmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPFV8cY7jftnDYgHAZYOxNwZABUHzimUmQzo3Pky3ug4uT05AJ
	tK+Ehu0mKaf+s22eM04+ljDcF336U3AYOisEp2PkIZJkyno4q+Gw
X-Gm-Gg: ASbGnctp7fzdilRQWv3aQxJEPvT8SS8vub6W5tQLI0KwkLYmGuCtw8S9UwDoYcrEJZq
	GzjA1xErEn5o8KVYlosArv4kVrvfHzUdLbnEmxC5jYlHHI7Rv7TnyG/gjv7ECcrmK/oMkUUwlsw
	uJbQaKkcYCf9M0EHPyp8cbp2aWYLDxFaw9IgZABmKGT5G8Vislq1jxFcHmiUjgn3WFEu7iB6AaK
	ZrbNE+lUw+WfN51JYgpRre2/X57RpJo8LdodOpS6SmJ43ts8It8NuDMHjgGjuPASY/2RbiQYZJP
	8xAbPo1Vzk6ySJE+dYO9XQaEXjfzF61KVPde
X-Google-Smtp-Source: AGHT+IHm1jbA3PRpFiPlRgdyJBzf/dyx+1/asA4Sg0xYUoO4ugWiSAPfuJPn+/X752gLUM1QYWGjFw==
X-Received: by 2002:a05:6830:6a90:b0:727:3380:66ce with SMTP id 46e09a7af769-7274c568347mr14173878a34.25.1740536109482;
        Tue, 25 Feb 2025 18:15:09 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289df4ec4fsm532272a34.46.2025.02.25.18.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:15:08 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
Date: Wed, 26 Feb 2025 10:15:01 +0800
Message-Id: <44de02977624be334ba6328acfdbb2a375f2071f.1740535748.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1740535748.git.unicorn_wang@outlook.com>
References: <cover.1740535748.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_181510_632526_51997C98 
X-CRM114-Status: GOOD (  12.17  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../sophgo,sg2042-msi.yaml                    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 000000000000..e1ffd55fa7bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,61 @@
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
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-msi
+
+  reg:
+    items:
+      - description: clear register
+      - description: msi doorbell address
+
+  reg-names:
+    items:
+      - const: clr
+      - const: doorbell
+
+  msi-controller: true
+
+  msi-ranges:
+    maxItems: 1
+
+  "#msi-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - msi-controller
+  - msi-ranges
+  - "#msi-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi-controller@30000000 {
+      compatible = "sophgo,sg2042-msi";
+      reg = <0x30000000 0x4>, <0x30000008 0x4>;
+      reg-names = "clr", "doorbell";
+      msi-controller;
+      #msi-cells = <0>;
+      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
