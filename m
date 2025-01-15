Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5912C02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJAsfcxBi9xXOwKjeXROkkuNLRzw5Hj8ZS5thnXt63A=; b=VgzQaHXtw0ym9Y
	Wo2BJidCvlbSPVkSFcg8Rslg16OCfQd02hQeBE7IMqQXZnyAlgaXW5NAzBuwpIKk8qaMb0i/DkyBl
	hrlJmYiII9uZb9y2Al1X7tq/x3QhWSbE4L9IBAEuV8OVVNiCaKmFumoB23lNmTX/BPg+CkQ+Pyc9a
	/Vh2aH82gQJPRhwjOqDSY3lLNJe0y0+QfPT7fILWsV6oC29Pl6bXRvG34ioDM3AuUfjk0B5YsBr0I
	04QE9tH+PFw3MSoJXG0itQ0C5BXNShUJkWDUNz96d9eS+t2qaxqgt+gK4DRhq6425JcsBRqjFvLXp
	6fdX1HnsoF/o2kfQe8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwyA-0000000Ao7p-1E27;
	Wed, 15 Jan 2025 06:33:38 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwy7-0000000Ao5y-2SID
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 06:33:36 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71e287897ceso4289121a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 22:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736922814; x=1737527614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjPLS+87c164zvN8uut+ZV6gycKxJWoni1PwVPwNYxc=;
        b=gYozak/geK2iNYulPwbgOO+gKNrYB13ufn5R7rYzk+opSEsRAq+v4BcVKn5SRqta0B
         DkKHWf1DdaK4HueCCOU9m99vqQ2r8mOe3TzfwHysb/BZWCi2ICPI70OMf8uRES389eTe
         dz/DjoqMrjoKi/F020W1HLYzm2ev56lHWW0UndNopihQettNGrkcGEJVe89xQMRD1vNL
         NZxBAaH6VnJypagbUDHl0hyNp2VhynlC3Zwj6YX6Xv0nEbRhsw9/A09kNIngJBvqcRkj
         7s9B6lGwvXgZ4Gj7j8zTJc/O0lSsVXHkBXlSRFSfzNvOBME5I+m49F8HUWMQkuyy+idQ
         9Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922814; x=1737527614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjPLS+87c164zvN8uut+ZV6gycKxJWoni1PwVPwNYxc=;
        b=wmjAwoJm6l/5CYxez/2nzWgVhMh7Ks5TeAd+i+EVf8zDJ34Tj8PaQLz6Tzrwvs5N00
         SdlQg9VKpxipd7231zGRXLBLi6RyfeCipFEb4sDHFZuAUpqGVrWs9h+tI5EhGo/YngR3
         ip1CDnTsjvHlHNLDcXM9PUIC/eHE9fTQF+1whuvdTCFNoszxM5iJQfJncp4eti7X4rWm
         TpRFezv4b5bFfresRNb26gPapRA5AA4d0WkscyE257YawmiiUWWpz/oqe5csIzscV6tM
         CXqhwCDYUMvE4U2VqBgCg8Sl+mQm9RN5Gr0Vi5Xu1Muz1m0O8qzqNchqrq40GgHZsLPO
         z08A==
X-Forwarded-Encrypted: i=1; AJvYcCWUOKJremJ7QdxeoOobD3UBM4aBiflBlnKK/zjj72wze+QOiIHjJITucSwmZqzbhYJb49+AXwv0CBnE4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1D2tcj8RXti/PzpnpGsZA1u8DziLAzsrPcMid9lpJ+sigUYaM
	OKFff9Y/bzNiwMaF0GWX5Aa49DmnN4da89JCzZD/Zx7YKGeb5BFC
X-Gm-Gg: ASbGncuEK7pgqiCk5orKVp6gMawJ2V7BZBYDEPuoFSNqagz1Lzb9a6YV9hFpwG5TUU/
	B828mqj3uoeoAkWqnRqPC0FmKtXw7kkeyGyn2AZ5g2NPwHPKTYes53EzCdQE50gWcKquAl7+brw
	FAtnnEcr4lSWHchdWrsqOsQ72iGw9bWaNNM0TYqxSGnvf3scsMcjwqaIi0iJtGDtki9bM3WwumL
	S8X2F4CQwTIqrgTk90gN0diVQ8LQCrvYHzSb+UvozrqgXKMWgB8zxRglAOslCH7HTE=
X-Google-Smtp-Source: AGHT+IHJ0fRsrZOJ5WCpP1mUvMfEhSmwHHeo2V+axn7r2mLfWnYK4N8MJqFEaFRilpt3uQk+aUC6oA==
X-Received: by 2002:a05:6830:630e:b0:71e:240a:4828 with SMTP id 46e09a7af769-721e2e59135mr19635685a34.16.1736922814398;
        Tue, 14 Jan 2025 22:33:34 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7231861bfebsm5394941a34.51.2025.01.14.22.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:33:33 -0800 (PST)
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
	fengchun.li@sophgo.com,
	samuel.holland@sifive.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v3 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
Date: Wed, 15 Jan 2025 14:33:23 +0800
Message-Id: <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736921549.git.unicorn_wang@outlook.com>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_223335_635164_9CF73C31 
X-CRM114-Status: GOOD (  11.67  )
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
 .../sophgo,sg2042-msi.yaml                    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
new file mode 100644
index 000000000000..f641df191787
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -0,0 +1,58 @@
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
+      - description: msi doorbell address
+      - description: clear register
+
+  reg-names:
+    items:
+      - const: doorbell
+      - const: clr
+
+  msi-controller: true
+
+  msi-ranges:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - msi-controller
+  - msi-ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi-controller@30000000 {
+      compatible = "sophgo,sg2042-msi";
+      reg = <0x30000000 0x4>, <0x30000008 0x4>;
+      reg-names = "doorbell", "clr";
+      msi-controller;
+      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
+      interrupt-parent = <&plic>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
