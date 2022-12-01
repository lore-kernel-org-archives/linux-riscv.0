Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E566BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCawDiKw78p2dwEovjnD6+adYdBqJm0VyQ7lB2eqig4=; b=uV2NTblNSvtyE5
	iOi4cM4jyONMP2QVBaZOdr1Z5ZpR3mwyFR/AkXh/O9fSqeFYrM5C9xzgGrTQ3kpqVOMx3eAT7lHVE
	VInfP/dlRiJ/Ed/cqWWHh33xb9MX0+5Sl7p1PLK2KaHWsuuKjK7W50KDHJasU7uEyYBFqV6Qv3MGR
	/RAFvHMR5SXf6wBsUS13UTCVQTImVrdkuil9gkxWDg1v15oTZjeVHtmbml7X1W15o6eId6SZq0i2z
	kqVmYONwmhq7oFIKZOuAbOXB9H1P5znlWwSQPIF+jiiyf0hVXtMqU96/hJWeM/W6kedtg+jN4mqWE
	iNjP1KZeJK7N/FgTvNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irY-007LSv-4Z; Thu, 01 Dec 2022 12:40:24 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irT-007LPn-S9
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:40:22 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r18so1541315pgr.12
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r4i7sehCVhu19Bc2ExDkPBptLSYwHn3imI/AjglwqI=;
        b=OKQFS1fCAeQkV/0BNjOSr7tN8zS4n/0V4wWf0AdMi8e09DAYc5IWzQHuZFK+kY/X4q
         NfjDOkQniMQzz2gFQw6cvEbkDkeHBgfS+5X4pMOedV75WW287m71fxe9Qt5521/zXhOi
         Ax3g9QtPEZav+7oAtHeWY3wpXnYqbr5M+2fQcCP/WHIIBpzYpqbRFMvBxSGnR1rdmVvE
         EdbGLwmJDnxzDBFfD5xVNOYib/ISLYRbXp165p8ouwG+v5FMreh3lXCtix6bZYUWpYP8
         8meR84QiDKcmKcvGdsoM6/xFApw3pO+orToFQ0/yXCPLpnI7cYVN35aO5cnlZf57dTpL
         ZVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r4i7sehCVhu19Bc2ExDkPBptLSYwHn3imI/AjglwqI=;
        b=AyuK5SzQev+SDtgspulxltEkRkHcs1o9CnXlBY/v4e/MUILtp9UBsI5w/Hx+NH7nPH
         lVGgcuk5RxUBZg8nhyQXplC6Gv6jRtGuPVMBeocbwO/rOxZTtqqVwpdBGBma0zR2HBZh
         6uc1a04STpMMklCWla0g6FV++LtKFviMG8++PrW2he37NxxorrDHoOI9CyXJhCh1S7iL
         WM2UVex+fASMqAhRN3FMkDGxA8lfjeRqBmAio6qI/o8PjrkWnB9nkfk4nItzKNIsHekl
         GSrn61qq+FxRyxMURiuvyk4xKKOUHoDUzj49k9L2mqREK9rZ4NQa+mSFcdliWhupGqgu
         MdSw==
X-Gm-Message-State: ANoB5pnspdLROeIHMOWpu8SnS8poLD/ot2iuehHIibh4JQ4hDOa4r7Ik
	kln3tbihyfxzMigQuXLtxHHwkw==
X-Google-Smtp-Source: AA0mqf4MumqWh9DWmlxp8wyZXkYw3o+T4+BNm+mqToROFXbEHsHF/JZa7gEnrjZmBT61BjEXq2BgwQ==
X-Received: by 2002:a63:f406:0:b0:477:cc1f:204 with SMTP id g6-20020a63f406000000b00477cc1f0204mr32700538pgi.592.1669898414932;
        Thu, 01 Dec 2022 04:40:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm3246981pfg.96.2022.12.01.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 04:40:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 2/3] dt-bindings: timer: Add bindings for the RISC-V timer device
Date: Thu,  1 Dec 2022 18:09:53 +0530
Message-Id: <20221201123954.1111603-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201123954.1111603-1-apatel@ventanamicro.com>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_044019_928107_254AB654 
X-CRM114-Status: GOOD (  13.78  )
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

We add DT bindings for a separate RISC-V timer DT node which can
be used to describe implementation specific behaviour (such as
timer interrupt not triggered during non-retentive suspend).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/riscv,timer.yaml b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
new file mode 100644
index 000000000000..38d67e1a5a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V timer
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |+
+  RISC-V platforms always have a RISC-V timer device for the supervisor-mode
+  based on the time CSR defined by the RISC-V privileged specification. The
+  timer interrupts of this device are configured using the RISC-V SBI Time
+  extension or the RISC-V Sstc extension.
+
+  The clock frequency of RISC-V timer device is specified via the
+  "timebase-frequency" DT property of "/cpus" DT node which is described
+  in Documentation/devicetree/bindings/riscv/cpus.yaml
+
+properties:
+  compatible:
+    enum:
+      - riscv,timer
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4096   # Should be enough?
+
+  riscv,timer-cannot-wake-cpu:
+    type: boolean
+    description:
+      If present, the timer interrupt cannot wake up the CPU from one or
+      more suspend/idle states.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts-extended
+
+examples:
+  - |
+    timer {
+      compatible = "riscv,timer";
+      interrupts-extended = <&cpu1intc 5>,
+                            <&cpu2intc 5>,
+                            <&cpu3intc 5>,
+                            <&cpu4intc 5>;
+    };
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
