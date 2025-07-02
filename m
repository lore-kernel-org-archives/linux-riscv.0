Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE67C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+jADhwFAJCXgp84YX9lmLxgLzjIWapwmE3swqvZRQs=; b=L3+p00S4IoUlfI
	JA7l+JplXW+X/dvHv0bCz6J8wZxmsmtEoiP+RhPHQ2LHDSkblli5tba9du+NgC5F8pkZi8DT/im1n
	pyWbf8bnPh8YdxZrdTfQ53a1zg4MKD+PqZ3vqQW2UmMrAtwL4o4AQfjhdlAfNmTsI/IxNqZNDBISg
	gh0S39xpeB4H4/4j63QybJxQaPMWI30zKMNk7U+VWfQshmVDIcZau/KdT0EvDNpJMlfga36VyL39M
	uNAuVwCcL8xljfY/IhlHy1Tu1eSPPSoTuwsAQW+FY1a+jwJ1NLxm7bmCW+47yTmpcfJih5swnUtx0
	jA0+M6jBKsGeEtrBFdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtqe-00000007mMe-3eNL;
	Wed, 02 Jul 2025 09:33:48 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtWZ-00000007iox-1arC
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 09:13:04 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7d38b84984dso1088755785a.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447582; x=1752052382; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=05oSeZnKkOuwHRWSxX5BsGUyoGxJgB1j6SCGcyk/mG8=;
        b=S35EeZFC4kTOrn/zrjV6vPuPtxFbqviBm4To09c3Xrs3IMv4iJfcGLE3h30rGY6q+O
         49Qj5CXB1/jZgkQo/OQ7fgFY0KtXuEzcOTIXr11LEzQ8flW4eFKcBw2QjVfvywFJS/hw
         6kuMCjJ/XBGmBwRMk/DoHiZaqQo8rcYEpwemjWVwTsIH3DvLsjbXyGyQcGXqE8Z9tibG
         LtQKjCGY478Pd+Gp4n+7dGGT6EyQyIf6dJJ/urSpgukFP0ZCX0BXf6qHGD9o2waPVNM/
         H3eJlpRa/sDIliyGtBXtjKkwCoxSVdIQ2LmU0Rd9t741wyfFG2JSf6J2wS1APtYAGMiR
         IBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447582; x=1752052382;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05oSeZnKkOuwHRWSxX5BsGUyoGxJgB1j6SCGcyk/mG8=;
        b=upw7zZ6CPbbXMguSkdjijzH2xeIdVvHvZGiF+oF74d5eyqFSLTgz7CxINBBoTMejOY
         Os4c3YqO+N9nZ1FsggKhPVv6xWTAzESFox+KbMoLh32pZVDtvi2J3/O6nuFIVc7347rx
         5Y4Df6AIZLXEhISyyJsibpOJcO+05XlT68YS90Nka0M9NNn8aCkOk/EQ/5+hIS7ebdJ/
         ZgwaBHZVy2G6hzWAU7EB+iMbw54gUwsk3xXNnIe2Ht0PmllRYiY7M1202nw5YnK8Laf/
         k0pCR3gdPy8XvN6AGbA1/yXgEx714/mGj+gKqK4ZO7MOeXichl4PuDQ99Ft7OmjQdCN0
         K2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWcPk+DiRZy4HAhDVAXPIbq2/wqtbXl6URJjwVL53nfn69GRBEZQVGx9mdD2zbBV10QQCpZ1GAYpLhKZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZtz/WDuFNpIagBOTtq7vaCAlqxrH5aaTsGSgnKbJ2JgSVnIm
	txLCi1y/dunIXX7hIT7a0ZsEBrawkHGknYkJqoJyn7rnGdD6C/uWlJ1tBSk9szTU5dE=
X-Gm-Gg: ASbGncurIyVvOXRRnFBiOQQ/QGfbKIBidunpj3GXX5HZJSaZbnWgPLTTVQb3pz0pR3i
	eGhnlxEvBV+RAh6ZcUWtrcC0+lAkzOhGbYVcq8Fv1++hiAqW6WkRL6vhsRgfCuH/VwthpXPqwes
	cfQg3qedBrNsWYX2dP7qy15gbNkmAg+myoT+6SLruR/4VooBRlIbHh9d2Vuacv7BXxo8TuxrwB5
	smdbbV6QaKRdMgCr+PRzCSo/veXUk//A2j/Fbl/AILOqwGyoC8ciDibbyNmMJGyxlLYCftqSXVp
	c2Y6xp+MEsaTGg0ucQ1DLPg8siECfABo3OT/uoqqfPXFenRQRLjkPMp2oFj/JkEUspw5na5LYkq
	4Zm3AaFh/
X-Google-Smtp-Source: AGHT+IFJq/oyXbT34XXbgyZs+VaHr9wzfkSMmLdoDz1YCb55z55iK/HwDroOxqnoVByLo9PegJxBuQ==
X-Received: by 2002:a05:620a:439c:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d5c4718eccmr335297885a.32.1751447582153;
        Wed, 02 Jul 2025 02:13:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:13:01 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 1/3] dt-bindings: power: Add SiFive Domain Management controllers
Date: Wed,  2 Jul 2025 17:12:34 +0800
Message-Id: <20250702091236.5281-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702091236.5281-1-nick.hu@sifive.com>
References: <20250702091236.5281-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021303_416992_A8309853 
X-CRM114-Status: GOOD (  12.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

Add `- {}` for the first entry [1][2]. Once the SoCs are ready, we will
add the SoC compatible string at that time.

Links:
- [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
- [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..4ab2b94785f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  SiFive Domain Management Controllers includes the following components
+    - Tile Management Controller (TMC)
+    - Cluster Management Controller (CMC)
+    - Subsystem Management Controller (SMC)
+  These controllers manage both the clock and power domains of the
+  associated components. They support the SiFive Quiet Interface Protocol
+  (SQIP) starting from Version 1. The control method differs from Version
+  0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,cmc2
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc1
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+# The example will be added once the SoCs are ready
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
