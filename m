Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C140CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fXIgMunU2CcxgS7fVFYYYHSTO/HOWdx4cW/xZMCIhs=; b=Kmi5DMXvHOnMZD
	xZw/QoQStsQMBgU81deZcSFdde0oPw5P8D8+p8ysRHUijat6Tbjn9Q9QcxXgMWTetn4d5AYi96Zgw
	lvbGEkv77kQIEiGG0g2nw4uvfciGh6J8x5ckalrzi3Hugata4QAefylQCv2DMp0HGqtzaQOqdF/m+
	KgdOrif41xed0ov2xSce8tylopG/4z7FzZWwY4m8rlrl/l3nc5YcIfiS8+q9ONGl2yKJG3tun0/oF
	enCatEjpiorVIsfi6pwydP4Tk8Qa/osSdyPggUMbPtcZ+7OT7nhamzvEgEstq3DDlRC0i5Dm0RGXS
	DZ1VC7OLHTIHlR9yAaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEc-00000006Rfo-3KR6;
	Mon, 18 Aug 2025 04:12:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEa-00000006Red-0CU2
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=; b=AOs328tbNcL60EEkOAgz/sq8G1
	GvvN3EZ/Hx/P7xSQICML2FJKQbPN1y6zgNLZlzbl37rPqiQM+P8xdUbuZme1ubK1TuHCE1gDazbRZ
	95DPEfqcddy4KZ0V12rvjZUwXXvgfQPKo7Rx1Saln/8N4nLM0n6blbnCXZE+2URI+vZ53uqVV+j7V
	D7oN6lrZSiiYKyXE+B3G9nxYcrYBJRxpTNbTZ/7XrohGMwrahaf+3H8bRmNYfq13lHN/QtVTA0z/D
	JeA8ctl33D4mJwevA3Qv8pftcYVDytiR4phIrbaiWK8bwvDpofa676oAZ4Skal/HJlR2y+EsBB5zn
	FGgy7JQA==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrDV-0000000HE7Q-3HPJ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:32 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b472fd93ad1so1446318a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490282; x=1756095082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=Aa2rB+Yo3qvhMLEOmLFPKYLqPrUhvomBU8Y8FAbPxzvQ9dcGGFaSRwqakIG8b7z+Ej
         gp9MaJZppG7AuRT2f3NgfR0xMzthrLmkK1aQQj8RHSHRuYtm0we50pTz3UMvQACH4YIe
         q+mQiOHc4LGL3mrODAvapsl6bFAmoa0OxGNk6f8foVvrU39W9W6rnmzLv3oU4xUNT+tU
         ergn40B56U7cMPSKSgJUA/hNrJNutqh6h4x7pgushNg59wVarO0EqZnW/ghO8Y9/XJUN
         FdphZ/CjB+jYOx+vLq3yw4Hycc3f2EGurUQv/hWBSBexJGreXD/rqIkp1lixtX8liYuQ
         rjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490282; x=1756095082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=ATEHVkdo80JbPOyTAgghS8mIhQvmguAd/On7oNydnnO4PgLIZin69W1TlxPLNXJ8z4
         8l2BZ5ASdq+nZYDHwrqDfvnRqUbdoxvwwtRRMiY8JeVTy1a7RTWA/OlMI3/VLKJ+BhWo
         xlm0mjyDhx/BhMepmIDGgVfAY3O+mWRAM2PrrixFwFa5WhzYcXHV5BVqVehgT3v4Jpq2
         vR/sEvt0YtOEgxVA3Kerq4jm7WdcQtbtc2xWixQgpZ/K7hskonAJJR/tgxf1G38gFOlN
         WuLp1DrRqoULKBsHexx95Oph7Eg41erEB8ABzqdsxYqEYFoqyTygQcFQRQIOr/4kYpPG
         OdkA==
X-Forwarded-Encrypted: i=1; AJvYcCX/4brrdhdz7mQIfS19C3ZUId8EJ/oUMG+myP5kb03rOeIuUQxZbsK/eVyCpHrW2Ud4yfgsbmKtTmFEBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YydcWNXoM4MOnFO6P2ug1jChRRtZstYkpI75VoZr48Js+SYaLI/
	ZZN1u4WfVa4wAoHByCtcywK4K+Qq8grkpGlLQ7Gqx8yfZYRvIiAOUlkJkaO0kQaetUk=
X-Gm-Gg: ASbGncv6KshxTszR6Z0P+DLZH6T8U39lRGKX9vEJCY0088xgeyrG3AN04q/3ZGQunxb
	QdbfBF4Z+p6pKuw/cfsotFJdN1N8wgTel30qdId66m+RPjF0N8yyDD2XzbHXx9SXmbnZRg98ucC
	iJUNEc9g1vMG1UU2bJFXVQ4C9I1/9RvQPXnlA/PtPg1OxL6nOaI1GNo0z2CFOoWilZkmc4js0op
	WAgqCjZ+9PQwTbahLs8YOshbGtXumAboAKxQEy/f2dijKK2e1vyOAqX7+56bIjSRsPVBEt0a3MG
	O7CkOXwo0CFHH3jveVcWekSzcxblh+VpFRz+16amPGclimhqh3nmDgWt+guTjvw17R08wSj5jPv
	9R9Pn2lE/E+hcrANJgMMS11CdUDvlyAlghKhJs+eqNYn16WXA0R6zjw==
X-Google-Smtp-Source: AGHT+IHP6UbREeetpnCWOLmWDeaEVguVbF9ClSYn1V6am/aKBqluAMuYoaNtdrC+UjrhiXEkm5ie1w==
X-Received: by 2002:a17:90b:180d:b0:315:c77b:37d6 with SMTP id 98e67ed59e1d1-3234dc7ba5fmr10093522a91.23.1755490282031;
        Sun, 17 Aug 2025 21:11:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:21 -0700 (PDT)
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
Subject: [PATCH v10 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Mon, 18 Aug 2025 09:39:05 +0530
Message-ID: <20250818040920.272664-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051137_161518_6AD8A5C3 
X-CRM114-Status: GOOD (  13.18  )
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
