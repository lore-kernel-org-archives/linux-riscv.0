Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6250BC87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fXIgMunU2CcxgS7fVFYYYHSTO/HOWdx4cW/xZMCIhs=; b=SPtjFWcdQBSF+b
	6Xgd5nnuuM7t3RUCih9zI/KT3qbWgPdFEAQFxWO6LekNNDnWK/NOh/8PgAjWkCp/kkQ0t/P7D8lan
	jBxVZ1fX3xcdSw26ysa/vktpTcc9hq/7Izsju209G9CRpkm6KGSOa9bE7xyNpSPFsYilXQEOMhh9V
	UKrGL4wfIl1ZadQgUaqJzPZqUOgZeOGThGMOjaMUCOh1iXrXXAjupB1S22hs4vt74sZmaFv3R3tNk
	9RvVOzWXS17YdmbbCAyHFHtE6LH+tEqfm81Ywt5ATFr9eH3ADSqsWJDis2OuTHzkMse9iq2uyAcfC
	iEWiOy/no0vgoqrMf64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKNJ-0000000E8Hi-3wBj;
	Mon, 28 Jul 2025 09:42:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKNH-0000000E8Fr-2pFE
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:42:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so3422048a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695747; x=1754300547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=HtAH54h30pXtKco3Eu+LK3hBfBlK0j1Hw02tH0lJpvisvy7cudRQqhUcSHeP8bjqyx
         NYj7859aNXDcU75DHOvEJCE519LZxhnMCI7obv0lIpFZVZWxlP9JOGDeos+BOAJuejCL
         jYfRnrv6aDKXKY4XvPBjSjzJu1l96ZvJM2cxzW8K5jfEGgFnE/A8NcLCY5SWFaUEbEO2
         UyzgXZfECzc2fuiqSE/PHFypBzdO9wPZITWn7+3S820ePshf6nxoX7MI5c0b3SZ/FjTt
         j6VBdWJCp+ypV/ah8ZeBLXw+3niwSy+NoU0UHJwBOj6zP9gSq3RCQwrGB6E59LDjUcsU
         aU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695747; x=1754300547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=v78hHvZdyMrep6RjlLET6bowf9OI+W1Jvt1rq38tMt2aiO7s8A3l7Wlrcy7im9bL7g
         YJVm0QLuw3g9tMM2s+UTaQF+/3hUpT2xX06s7E+FmsNBMqh1ZU1lKbKSB7+mO/M84BSw
         sQ6kA9o8hFeY1WqQjmBW9RWPmme1C5qoAmnixbv+ef/ujdjP/rqGE/YUZ2FU4CixDe+t
         /VPwg5GJTwGpwgL2/olj5vgKAEv+9Di02w624/dGPJUOkGin9+b4Zb17bwxDQxMot2wf
         9dDOf9qUbGtgwdWdPts16rOYtfM8AOmaaZTDJ7sFHYaA9y7/azH5JmQsztkaE7Lk38/d
         njRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX46G4kE5vWcdJwygZZo26I1UoPehemxum4vY8qYEF8IE/2x6IOjHycASo5CXlmcRNWOVC0NMuWtpJSWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVZ5nTmd35Z1J5zNESA2LVVGi1woaB4nR+vTjZ2/+ex9zElXmJ
	0YmapY2PeqXecfS4DbB35OGf632+gCtQH/f3spq3UHz4ovG48/9X6LxsIZN/fetenII=
X-Gm-Gg: ASbGncutH4w6E7pXWCwhumPJMLig3poXO/Al12BiDiKxEVhLAJ70p75auccgnafuW6e
	Yut7lBoxxdnH1z21oIM1UXNrDedqSWhilwtISn+afNVBgAIxFnuni484Ktwpp63NpS58XS0XT95
	nXfoiAY/edpeLMBK1ntZE6t/g4XwxMQo94IrnA6w7brJfOMkVyK0kSbHYjwbD8LlZ+uFjACaYf/
	pltTpAYGKO1azTaGvr+hZ0XXmHoHn+YU4ACDZZuIBnCveEdlrOI7zmIq7C/V2a4WfHvdMwcafQs
	Zyit5G/XuEMkssHtzz8aPZ7TjB3wxflTwnLbLBx7PussjrEriUMFh6wSry/vNFTmh4VCCZdwyQ2
	u+DVdPxTR1X51qb9+2OlTV68+cvPrVjK3AxwPx1AgXJgOOm5HN5cREiDlHFmj
X-Google-Smtp-Source: AGHT+IET1sWMZD/6AnfrHKkMC7OglTaiVF3qSrY2in0HUadzd58C0Shm9ghMuxb6ibvRVRWuWVfN2w==
X-Received: by 2002:a17:90a:d2c3:b0:31e:d643:6cb9 with SMTP id 98e67ed59e1d1-31ed6436e56mr3137835a91.1.1753695746628;
        Mon, 28 Jul 2025 02:42:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:26 -0700 (PDT)
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
Subject: [PATCH v9 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Mon, 28 Jul 2025 15:10:17 +0530
Message-ID: <20250728094032.63545-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024227_711360_0D610C53 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
