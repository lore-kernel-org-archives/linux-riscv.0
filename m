Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733B9C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeBu5m+ajYd9JcdUQbw1/Y1ZuCiSK3XsaGM5p3wvzqM=; b=zpiJyHW6seON2G
	hA1wLuJdVNHqzD4Ssd4Ay5XWPRP5dofb+wmf3obcg6fPLKbfmtiWId7hozjpgSelRpMbSYZuBEnc+
	DjrrTyltUZcWcfCYLxNpBSae89F1ZEB3Wmh5XW1cge7EFSejaOnR9WlFaEehMOZYlOHFxuL8j47PS
	/U68AqfnGjBoNPJguBFytNG4WAYNeDMRd/W5QnAp9c3bKAXPgqKoilN2yJcFL5d9E8Tr8CbHoAb6P
	LZq0pe5TeVuBd0ssHyeXCnQSOx8bYiqrGmiLpr9GzbmKb5YLfYVchull958RkAyfJ2HpK9irHYgMf
	bDXv7OWIqLSb2fJU0JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01DB-00939X-Et; Tue, 29 Nov 2022 14:03:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Cw-0092zN-VB
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:03:36 +0000
Received: by mail-pj1-x1034.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so12048866pjd.5
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBnRn3HsiMQKAOivFFQlQImQ7gVQuSe6GDXaOHch/qk=;
        b=SdAecOq/4TzlwSvwgp6xy/aimh7kAafCkzi9TimrB1Iua0Ohq4cGKMbU1/v6U3X/v3
         gi1X+nkDc9XNapVheUoQ6MkkEu36/vjaGwpXr6EzpI3wg0R+v+5oDYK3OThVU1F+Gpmr
         7NqAPqXCOvkar4MHdHWh4t8+hDlZHpMnzK1PEuNxAUq1FBAu2zUd1n2v3b0G9SPuJg1i
         x69dq/FDbXbogJnGr6Y63W1nSc49YdnlJqx7DAfespl/CW2c+Uter4eWV4oe2SrJrojb
         l4vrDcOF7w5BvnAz1CWbybwr90Wp4YiX19WR0RVj5tefk+TyX+mq7If5mSnxzx3x0wuL
         jQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBnRn3HsiMQKAOivFFQlQImQ7gVQuSe6GDXaOHch/qk=;
        b=vi0WPjdtfJvTjbm273rMM5qrAdhRRnR+VH8nNeYDGtF3JNin7fId7k4V2FZJAbF43x
         9ZWV9Q7woZtLFKavY76iULrMfIEQ80YwUVPIqZbi8ysBoe4ApXMlOeRp7R6rwWrUIRwH
         ykwAWiNGOZhhWlUshYZWEb1zpDiepVSL1jBVSlrojf+p01X/e9PNPDYag0uD97zsNvLb
         87IxSR/IAeYU9MV+HvZiNG0i4H+02PFqoLYdTTHcu9K1c0azNVnmo9bnExadlTn9E0Ef
         opO7dBmb1xk99/WjvG+FL9A8aQR37wZSy79+d9q9d0ju5MrAixvvy4Iikcsqcw0fpd5U
         5hGA==
X-Gm-Message-State: ANoB5pnXA/Ko7tF1FOnk6iJnhLDK4tEiyDZH4x9vrHtV7cZzil47d/tD
	bUe+kKNVRXO42SreyPOHeA2MLg==
X-Google-Smtp-Source: AA0mqf7CQVolTDUJkjEMu07T8K35tmf5zeTTZTWgV8kSGmu71WQUDzrK2OaCLMTAid4dLV/7s2SwPA==
X-Received: by 2002:a17:90a:b703:b0:20d:7716:b05f with SMTP id l3-20020a17090ab70300b0020d7716b05fmr20514081pjr.104.1669730613158;
        Tue, 29 Nov 2022 06:03:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b00574f83c5d51sm6013747pfp.198.2022.11.29.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:03:32 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 2/3] dt-bindings: timer: Add bindings for the RISC-V timer device
Date: Tue, 29 Nov 2022 19:33:12 +0530
Message-Id: <20221129140313.886192-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129140313.886192-1-apatel@ventanamicro.com>
References: <20221129140313.886192-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_060335_045761_DA3FA83C 
X-CRM114-Status: GOOD (  14.13  )
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
---
 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/riscv,timer.yaml b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
new file mode 100644
index 000000000000..cf53dfff90bc
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
+  riscv,timer-cant-wake-cpu:
+    type: boolean
+    description:
+      If present, the timer interrupt can't wake up the CPU from
+      suspend/idle state.
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
