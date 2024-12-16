Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E2E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yNgN21VsZieywgx7cgOIjRmCRIYzZ8bonz6vWsO99k=; b=fZZifbSZXsPrqG
	4lj4PoQSHKefOFS4as7bxFlAtdPfCMnQvunIIMFGWw4D+YlTREl8AOSvcnjsyX4Sga2C7Es9+ZNv3
	OFzD3UGW1im4kkXdPdUZ+3bfLlzb9tEiOogVcbwyXsGUINWqaVOpz5YHD8vbpAZjr62tiShz4XEoF
	b806AxNQ5WaLz4yCh2qrfFSDpP93C2dZ8nnRJGMHWjsAgDnMspVqk6yBmu6U0Fttc2e4ScgtjwPDJ
	Lg9sirKzZEaUKrKAv9RcBYVn/8hMg8ymSXE7sqvhCKNSiJ9EFzpXx2J+NXZEtlg+ngqcfbdd1YQIk
	Dc/QszzKhWuNbftUeeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6my-00000009RXx-0pbY;
	Mon, 16 Dec 2024 08:49:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mv-00000009RVh-2O8G
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:49:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21680814d42so31058935ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338953; x=1734943753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTD9xjQhkwZ+fm306dP2P3Gi4nTgLSlKokzAF6+8eeg=;
        b=luHeMQVq2LKvOw9BnyASmTDm+hVTPHOL+3AUGTqrkp0NqO7Zj2ij+KBDXaUqBVV6u4
         Wfx72GffNzdleaqDXtZsuRqZuCrYZsdOkxTnb840ziVs0AVyq4SskHZ67dRmJytVIoVF
         Us7Zger4vpb8ViAmyq+E/cxAZJUsztLNiF5P6gMIVSsHS4dran0e4O4ZJHehe/vHqfX7
         OCRQHFNUouiUm5APMEnVqFme/lCerM340v1WxNt2CVAU+3j1y9MicoCBwgQCBPz4qDoU
         MPOk6iavJW+uD6KRinNBBDckTg30s6yp/lDbj6F22p3k4VOAmfOFblMsTEUKSLsgAA/F
         YcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338953; x=1734943753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTD9xjQhkwZ+fm306dP2P3Gi4nTgLSlKokzAF6+8eeg=;
        b=ZtIhZSYA/qwLWViyMBZiJE5x1GsQupchuMlDZMVOPv8NDXoGponANXOgc/qtKb07AO
         dli+pQiK4yquu+BiLNqvQEfnNbpz3VGsGIIQth7jeLn23aSChuunbhxFTHa6sOzlO523
         CxAOQqfHNV/kJqzwW3+wY5OGE2QRyR0JjnG4hH9If0KP1n8VJ0hVysZIVTz6R+Ux0Xap
         mO1nJ1U8oIhnLWanNs1RojgwEk6JL7u7glavm4s6QyozS9xfCB/SqDII3kmKz2qc+vJ4
         mDb1Wx69czHlUqIX3Kb2rMrf2krz9+7b+npgOgrXyR/6RrIK/HXZuzeE3zsne2KC1ZNF
         ooOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+tDSYP2AlwRUUoofblMlOj82jkILqtb8XKUzuCiHATrej/pCV9FCGYy+0nwHGkgxgsRLvaQJPfaLdyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz75rckkBcyczAwHuzJIGYTrUMlO2BKhoBdkUA5vfrVKk8rAkD
	V81y/Zqj1P37GhIsY9ipYlXSsoTI9vGwksdIGCAZ323V1f0xfzZy//v8hhL4VZo=
X-Gm-Gg: ASbGnctGvEPi/nCCalGsr6oSwtjNG9eh7+jA60S/ZCwWeFe2GlNa2kkSDmpndsWhk1L
	UvbEmtrmQ9JPMN+LvHhkys7KDd6ULNwbcSIEFH5EY0ifsCD/w5UEWPUteAi3n/O2+nDzelTu/2Y
	JzuAfbqtrNvqd3pTXDVxUiFDzLX13jfcA7T62hS4hvbL/bWL2kZbFJrJc4nYYTWfCNvhD5tnEtT
	VLTEugJuuKn2RDSxuHVi/jZQryggi1aGIxjEeGtK2Z6NSCIjtaRjNFtELqAynonjl7ailKW87Fu
	CRRntB+Kex18F7A=
X-Google-Smtp-Source: AGHT+IFZAXk9i2QTSa1ARsAF//7P/a/eyeUKUtrq2KyDoH6hHl6V/6vbY1bhBC88LnxU0+wlfpf9Tg==
X-Received: by 2002:a17:902:db0f:b0:212:fa3:f627 with SMTP id d9443c01a7336-218929b78admr165235345ad.16.1734338952799;
        Mon, 16 Dec 2024 00:49:12 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:49:12 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 7/8] dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
Date: Mon, 16 Dec 2024 14:18:16 +0530
Message-ID: <20241216084817.373131-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004913_608372_81712028 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the clock service group defined by the
RISC-V platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9dd98e390708
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,78 @@
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
+    minItems: 1
+    maxItems: 1
+    description: |
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
