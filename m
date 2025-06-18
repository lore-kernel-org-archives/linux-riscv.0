Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF0C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tx1joVQv5DHtGma5MlB0exKVQp984e/weT3hC7gOusQ=; b=JOF8+dxW7TjENc
	ub4gO7BjT9ySBtx3G2ujqYTFlxp/N+PP8FRpUpKxKQtpKKFT6PYbFriOAhhVCSlVZ92Mc1Vj3jIOc
	/hbcWM01JDnqV0hT8sawpS6z5AA0wPJx1uZXPE8egWM5SUbwNqnWf1Ut7c+QSqDkbnNmJU+9pni8J
	YDsqM5ar2Jf757rqyFo/YkEU8nze+by+02U6p1jNIj2nE66vI+r0YKeDY3ZmXf0yqYulY4YskKEjk
	cC0XvyumXtlfkt95+iPS489+Q4W+CxUaIdPoDYzDJr8LEF127+CNLaxJjlj/RqY1Tjk9yR6XgT1vq
	Ue7p54awzPdTfEcwGZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoO-0000000AHcc-2uF2;
	Wed, 18 Jun 2025 13:26:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhL-0000000A5PA-31mm
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748764d8540so5900736b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248923; x=1750853723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=Q/pX/l1U5lgj4l81TawIDue3SIaP42NwVO2+kbs4dNCi1jVnupqIeYzWy5vDxRHRce
         9N0dQo5OCnTemlNiz9q6epsJFqKB4K3gFLwLp3smJTUbGUrW8luEC9fGJpiT3svbaEiD
         QizfbueBM/maoPr3PXz8B7/aXi3NHRyCFAWy2JVUUM5nEFxOfg3EkjJYQ9V9VJY7fQ+5
         rE/4aQbDIiFWpIhwFpjsBss0Vs/2tu6nJMvIzIXd9TTbBQcskwJTa1KkgR3Z0I0J75cb
         9T6yWwMvXykdWilT+pXq41mj28Ui9oH0A/O1IPD5HO+KKwdd3ZDnMIar0hfe4j1TbG28
         PiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248923; x=1750853723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=YwbxSlvF9eer3OWjjqXNJTAlx2CQo7rN3nI6ZjQcKo2RzbFwLDvIkywu+H2h8QFlZe
         npN19K8tFatrWTstoF+C51MaDbw6m64633NM4iuYuI+1yUONdSEiVgBNtI9NsKc7Y7PF
         bETwryuGRI+zQua9sfpbIS4CVmZ6+A/nWaQV4+l+jPUGgaXz68JPIxoqkTg6dK89tBrv
         pn6+5Z7mEt6xrUIfWab6noDk0h7iIRseg2GgxJoi8goCyg4aDa2WsGmm1n9UkAfEZz2H
         aAnwjITznzeCTfGr9yyO/F7fgtaKgu5HD9+La/sDyKP8koiobwGSAJO8A2PRvkV/M/p/
         FCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/cIUpULosgtZXYchZVhSwyS2vMkdHT65JF5IOZ2sdQkaVXccIJiMipgk1Z2xnt4GTb95ZYNUjDhfyyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxaJSnJpeWqi4N/n96M2U1nGiZ8+w3noXN+g1/pBpw8Wmh7evt
	0AnP6ibawGlrTQN+RUDH3ihX4cUvuEWVYYZTCMaqE4c7G3WusSBnxvu/M1eTa5pk5LY=
X-Gm-Gg: ASbGncsbpBOpv+b7Z2cT1MpU9urI27qSYsF/yqpVlZng0tfqc/WEF0Hp+D2i14IecbF
	YKLGeq53BY7esCEs1PooA12VeLWXaxuN1MjkOB/jqMxi5my1G36ELhLL50BsCxjc0Nk45vMgeOQ
	EV4nW+OJNhkGZ2yHxWXHBRq3Sg9nj08antcpemBRcQEwUxD1rMDzSni/sMItvEMjNn4QQJ5sY+P
	tgxiZwN4XWKXuvLoHQJsYvVTN4R0JCpYCs4d08Em4qq/rKhfmnKAqCszUZJox1QfhhHAfrICUuN
	FKw3vKBZuSEuJj8weQowYahu/FNpoLG4m0Dys2cEavY55S5mzlpwaa8Ttf2MaMQ9VI6LkMjMwHr
	khFnuqoH54Iir0lUxt5hgn1A5450u
X-Google-Smtp-Source: AGHT+IFMKwBOWWxohctdj1ZfYXunjODSapma1HKAoKx1zL6qjMZuHVAg90lx4/8R5CLCW9migGeDbg==
X-Received: by 2002:a05:6a00:b4b:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7489cffc1d9mr21468139b3a.13.1750248922660;
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
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
Subject: [PATCH v6 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 18 Jun 2025 17:43:43 +0530
Message-ID: <20250618121358.503781-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051523_759464_C4A77F79 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
