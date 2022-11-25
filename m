Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuUSiJLeyx+vexGL44wyHYLY5Peliz3+3Kglmps4tfk=; b=YP0cH3nYFRMpQ/
	JxioQC4q012ddiS/R2TkfYSvjAmbfpM0JZDpMBTrrxVBsDQFnPXHbFWHSW+PCWXQMO8/FdPMFuD7T
	z4YLC+om5sRFMBB2bsyyVm6A7qmjDMTiX8C8cQpGe2XQ1QCwluwgam58XBJ3i+DwZ5mGMThHzBaaF
	7f/SYloawOpxct2E61hXjWuRcniPSVsFVC9inexZmiU4ET7JzQ41w6jTFBLRjcidvWVm6OD7Qo0WE
	KgtiTtude08n/SF/ycYXUXzrs0/7bPOQ34qqPW1ethyzrFXB0Y+t63xHctJsCrdF6LVroS3YLt8y3
	eculA/jv6XM7OdHg3Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWoF-00G3u4-Vu; Fri, 25 Nov 2022 11:23:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWm5-00G2Vl-QM
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:21:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d6so3726318pll.7
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0TnuhgNTurF6Ds7AQpDNaCEPKEhITVFc7KbMlz7Wws=;
        b=IUt6mjNqfvLPBWph0ZsbRARzlsokmk2fZM/PK9Ux17pbEufTSB0fdGB4L/1rUvGDyu
         8K+kp7ETHm0Czj0vmb/F47Q5JQupZzVyC1v22fnJNdFmiT5DBelkCQJM+jFPjGg+sRUt
         ghfUI1bWGsd5fmTblOzCs4hiquuXSB8hz8lrnQoKjYLyMowOrPvtDk23OL+4HVQsgwdf
         FUEQIaPeOPhoh1vMgMyNnhvgOcrjWBGwty/eeAYbcZjflbKDXoz9XEjF9ygyA933dGHn
         fvbRr9N3WRX7U6wCSaau9lmQDrDBzmUzo+qHJfEzdXXvwOZEHJLWLsySWnKIFS8y0ZdV
         N6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0TnuhgNTurF6Ds7AQpDNaCEPKEhITVFc7KbMlz7Wws=;
        b=mWFmzUIAgwZ9ZzPremPfqVL8usm1so27+O/5xLVFnzHiNhAu0xJDnVbyZMUIlmpjmk
         GU0RrP9Qa4CQdEbtCeCg9NpZD5ti2JWqI3i1s3pHVR8tCOYo2dizVFPV36MotvN+NfqF
         PAkX4CtilNp+ytPqPXBt96x/0fi1+cBxO7RukQ9+VOy1W6XgDQujcXjdjeCzSenbt3pF
         xdRvIO7csI0eN626JhUxWk97oNHOwu3kxyGaMS0NO709ilFOagKl4VGqBCWApjFgMeWe
         DCKbf5XwGaRQQ9Hy5vOSKnbQVRBvLPoc9eICCuTwezdPP5OPVG+NZG+j8AdqHZGpc8S1
         9U0A==
X-Gm-Message-State: ANoB5pmKHh3O2kti2W+QHXpNrs7LU4Z6wqkpSadYB+YMe6cMOdUp5AhH
	wrwxtD1cX5R/emYzb85zbe4Y7A==
X-Google-Smtp-Source: AA0mqf7p52syBNqlzAm7wndp9UugUcKufqi2DHynSY+p5jdvVgwvhqBcU1Sy5MGjIClDucx7bDROZg==
X-Received: by 2002:a17:90a:5d15:b0:213:e74b:b691 with SMTP id s21-20020a17090a5d1500b00213e74bb691mr46264890pji.81.1669375299079;
        Fri, 25 Nov 2022 03:21:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id e66-20020a621e45000000b0057488230704sm2834335pfe.219.2022.11.25.03.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:21:38 -0800 (PST)
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
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 2/3] dt-bindings: timer: Add bindings for the RISC-V timer device
Date: Fri, 25 Nov 2022 16:51:04 +0530
Message-Id: <20221125112105.427045-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125112105.427045-1-apatel@ventanamicro.com>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_032141_890447_EC6561CA 
X-CRM114-Status: GOOD (  14.02  )
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
