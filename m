Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854D8C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8iaH97f6VUbHhB4JqUWNf0yiQcB+an/7IzgcPnrPvI=; b=CXBuWbP9cUUjTG
	Og+REmSpKvhVRr3Mn1IDImKuiVTC24wvBh7S1g6Njz4gSfCUK1tXvSBLR8SJnnvdGkLSCG4d4QNu9
	Ki8628Py2iIiSY+E/Rk7UMBEDAtTD5AJ2RzyzwresfmNoCzLLcwk3HX8J1JsRcwVX3B27+2poZRSm
	h8IhHXNAFiLiXMX4REbQWZ555/l6jFQj6/RUzJSIDDTdYQMDe4uR/tssJOt9u1yyw5Aueo95n08wN
	G6fbwWH1F8fJ5rkwxyVBoEEmVwk4RWSC+aGFPvBktEMWivzAPlmSIB6yvqhOBQyp2nkc+WMyu1e7t
	7cmL1l7DIIAI+gf35Afg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFoh-000000095ab-3ToJ;
	Wed, 11 Jun 2025 07:24:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPErf-00000008yxd-11K1
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235f9e87f78so57718065ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622990; x=1750227790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hhJCf0S1HrMwLYRdGRFvzVPJDaWXTpl7/BKK1v8w+s=;
        b=VnWUs8ezM4gN4gFsXqVDAE+LhHvWeOqFDO6zauJcxuK6RkyvSIvrPmQsMVsh6rZ3rz
         8kZwBBmkto+Z8hdfbD0n5Lg3gt6tBzAaLAm2Bejd0en7rixNbgLbT+2yRecwl25aZPDV
         SUHACZx0wbJDUCKvq3fsGcNu1fbCeN7TOJbshFenJxw0cGnjxQMeiCIGTtDhFxdsvdJP
         WMgYJ7WxCLczw8dAPY4dVz4BTdtGjKWfevf44zbHGYu/vsnTylx6zRkHlv2n0qnSWL5Y
         Ud7rbtp2Yb1KRa8TBxXpmn1vrt0dUPjB3tm4Uq0SmHVqPvNAuhczfed4MB+ZIrfEER09
         v8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622990; x=1750227790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hhJCf0S1HrMwLYRdGRFvzVPJDaWXTpl7/BKK1v8w+s=;
        b=la2oTLmqAoe6wpEPNygCsyNMsHfheh9is+eCusiPyvuX3pKkhC2x97v8EnN65Hboz/
         Plg/ulIKAV3W1hninfePlNqQZ4+xwJL+YoDJcUIRV7pNTO6OeHk1bs1zqmuIt9oe960c
         Vha63m6JzKBNZkFbbPUseV0wUeV7tBKQSDSLruDFS/ZihKR+/C9BYnticMXkAQhbTYtz
         jnorhFsaMQcYDPpmHbxraQQSIHVYaqSUZJOo9XdOHAwCwbw3wgASXItlGfjszHHmBBZr
         yGUGbiKFBjnc1uhaUesDoTA/vhy9vWY4Yv+2S6VprhDukvFi12fNynInWCfQ6vaq9+eG
         M9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUYzwmK6FKMgAJpK8sRq8a3ahwnPh+NyBUHMKndmhG9kCiHcf+A8sSjS/v8najr4Uom348hSvx5piyPkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweMyGIaqinUErvflXR66KyYHBNKz5AA5bO+AeTFjbhyHBk7sZi
	6j2M9KHHxDdIZNZzhbaDHO8J1WFQ5DIITfgTimnqDfa4uvPXS1WuU1O3XRzdAPlfUCY=
X-Gm-Gg: ASbGncv9f/lgPwRyQEX+IKJRbgSn8kjLN2rD73heuwTK5+vPBieGtv34V/hBn+2CCPG
	vDtk6W064WdsH+37stJMSojk2wrM06T/cVtwJ/rHWNH5zsjGGT2o2F3GmuhIT5Wa+w4st00XRHD
	ugV/cbWmg4l0zhLuEMpUTULwJhw0/of+UVsNovFKUAiKxw2CU1IVZ6iqg03ZBaoln+6FExX73NH
	RMx0Sa8enafhkSyqLgAf6HEwMEFD4UgwjlkVg6UyNjp6P1AZYp0+DkFh6b7CC/Z9uDCdvAp29Py
	Sl+Rm7jqqN8xAuuhw+mWWkUb7Fr1IbNcYtN1oPZR4hZn7iS1f/NrPhhXTWBsH6y1FqBFbPg7Lw+
	AV7pghwCJ7n9LFYivwtcyXHNmyA==
X-Google-Smtp-Source: AGHT+IGYvPF8a0ieyfCcXWkb9basvXu1C61BkUa+573NYbGt/torEkQigxWEXo3WPB2gMuuh/gndlw==
X-Received: by 2002:a17:902:ccc8:b0:234:8eeb:d809 with SMTP id d9443c01a7336-236426b57a5mr26776185ad.43.1749622990453;
        Tue, 10 Jun 2025 23:23:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 02/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed, 11 Jun 2025 11:52:17 +0530
Message-ID: <20250611062238.636753-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232311_285882_FA48A75C 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
