Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06626C02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G/bTZaDkYuRINbOOz1wUnrAzY8Uz3qAIJ47af3xA9I=; b=B3Llib7GgDGbdH
	odLrBomR6rVbkfOGqbD015u6SdJnsmzZVaPJecAD1S4BNQcOsNiB9kytdPLzgoEJeoeZxFrsfkrqI
	qLu0Wro6sbmXHgkanoFQx3k1MN47PZ37LIRTusNC+6HDkhrfIVckJDSbJ76/jehSqp5zZpC3LS6WL
	BsBpzzqBVUZwYW4vNWwGYFlu7XY3TiLnMzoaj2LL0CRqpH/A7zjbCBCjo99tTnwf95LOVvGqRLtFj
	mSAG52pQR8PQ4iH6PsRIgRLtZw5PQ51CPy4Ibn+/zrPFcZ421WeiyeYyRJHCj2quHInWLgmfLAB+B
	QRkQwcsT+gBXWU9uuptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG4-0000000F3uv-1nvH;
	Mon, 03 Feb 2025 10:00:48 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesAX-0000000EuKp-38KZ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:51:02 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-467725245a2so38296731cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572661; x=1739177461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=lpcD2Yqt0xkY1DRoIHlsUkxVk1btKzBWs8amxu5BuGCCbl5zBfNs/OOVfLm8fUYYNi
         55S+Wj4JKjn9RjJxBfnm1ooo51MV8gH3OnaNmew4Rf3LU/j/W96iuN4UBJ4XhUml5oLY
         0QI2PIyU9JrPRV4o+vGeXvArfQgm9EZZHvBgQb4E6c2V+n0iqDNKk5h7mO2LOZAUkDeZ
         ifB13N4nFW2pURIL7pfHJGya+nQJmJxR7fb4Z4aikiwQBbOhebLwrKsowqapzZeIVrsP
         WtGrcwiA61xkl2kirk5V5DM/Kx1zauMSAbWVHPvKui4F6eh5qKdw6tPZTkyrBRZOd9/z
         cd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572661; x=1739177461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=r3TlVcUre42qn2YwYESn1u6VprMRCvuuI/8EWDX9r1OFShBkYv15+xRwLWcuZpIPMR
         6uS1fQ+xaTwO/auu8HkwO3e2Q5SkCRgtj9r8d8FvaZJE2vTKb/dYzy5GyJXOkJSBj5zP
         PYIVapQ+vLW5F3un5aCfi9spxFZc3etvaRKkrABgJ3Y3Jg0ZN4rKng9bUQ8SUMWucRrb
         y3zAcKhGXBeJ5fX7R1kBdsn4xy2k5wjrlGx24kR/aBq97UOTgt40rzvyE0PdKqakfdkK
         ZJyEQ2WUU62L7n8k1K6r6Z2Qqpx4eAzdFaIt9o43uTaDfxs2tbIWKVbqhmxBPdk9kWGK
         ae4g==
X-Forwarded-Encrypted: i=1; AJvYcCVeSvycUsbfBUM4Ooma4irrovz14Bau7LjmBYezj79LqpjOTqxrscMPz0YIlHwXH65WOyglkkUsJxICsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiNLI9Dk2Jy33jfY10KFGmzPT07DgJu5mQUwZWb2hwDboXCrjr
	TAxJAJMo5JgTW1ZWQ7uVI0QXqSbtuEMotMJHBoA2efYXEbreTkG6ZruDb1362oo=
X-Gm-Gg: ASbGncvQtjTaO8N6loZOaPFrkGY/V8MR7ZrV/z6tzVHm6tm8vHO31pZRkROCqO2TYP0
	2PxHon+B4DzHZUDKllQZVLOSHrTaHafLhMjoNhjy5MNjlHuBeZjmQrB8lhjsOWF8ifpnNKAKUSc
	ofoXV7kEl+d+V2JfLEFPxncK3Y7D2BcEjJlSawZfroxgJDgBvus4ZfM/cfzmp9jxQ/Fp0vaBV5L
	1IV9L7UoljUV2kqrQqT7LnzDcHuEax/KusIw+VLSGF5SkeN1CBGxix0NXtH29+IcOBnSdUBE4xY
	t5wFbMgmRzBk011w3moTCgnAjEvayzKtWdwGL6SO4hplRqmajFhfMnw=
X-Google-Smtp-Source: AGHT+IHKSWjJnml9P2k8xe3WTZy7gZVOr3y2y3l5W1mAhUBR6IAIbnAkFVzcudNqB834buJx1oU/1w==
X-Received: by 2002:ac8:7d92:0:b0:45d:8513:f29a with SMTP id d75a77b69052e-46fd09e25c1mr202526631cf.9.1738572660838;
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
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
Subject: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
Date: Mon,  3 Feb 2025 14:18:57 +0530
Message-ID: <20250203084906.681418-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005101_786620_9735B5E5 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the clock service group defined by the
RISC-V platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..c08491c04926
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,77 @@
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
+  system clocks managed by a platform microcontroller.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Intended for use by the SBI implementation in machine mode or
+          software in supervisor mode.
+        const: riscv,rpmi-clock
+
+      - description:
+          Intended for use by the SBI implementation in machine mode.
+        const: riscv,rpmi-mpxy-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software. This property is mandatory when using
+      riscv,rpmi-mpxy-clock compatible string.
+
+  "#clock-cells":
+    const: 1
+    description:
+      This property is mandatory when using riscv,rpmi-clock compatible string.
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    mpxy_mbox: sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
+    rpmi-clk {
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
