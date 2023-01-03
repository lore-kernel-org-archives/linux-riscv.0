Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D7FC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frwo1zSFyeBHIb8gd4DkCPgWY4bFm/wZMtpi4lAQaBk=; b=r81puF6y6zny2W
	xOfrDSswhPgw22Ak0Jg5xoHjzQdVTixHW79ncXXRAdBgyxZ6KhFEg4eQhLCqukNgBBFtIsoEeUVKg
	Ib7ZwEKLWQpQWJlc6SdRDlEu6sUC5N4CR/UsHk88Ad1wtl4NKjwqwO/b6pXj8lLGVKH6uOFG4t9MY
	7XocQJVJnb9rpYu349AqlsaOCcOJP2PjNXWm2bxVI3pGgLTnhPlDB6ixm1+/yZqQr+2EFsIL5tNqZ
	eL/KSrQBEkMx0PCRx0RqmcwEIVwu0pPFYSBF7YHr2SOz0Ta/JHHEawcQmJObYXwdzSXK4VBIPtuHv
	R8OjgbRx0Savn1LujIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkep-003BiL-Ol; Tue, 03 Jan 2023 17:01:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi0k-001q0v-0I
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:11:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id n12so20098132pjp.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R0kNYBBZe/vkuDeDkbiPp383r6amrw7KjZXH0xUkvc=;
        b=OFhaOPlfE7DOJpUuddUEZC3/8ATvvDpqLP84UGR/FTGAIOOXbQdC2OtwkjIJ/FfzSP
         L0O8+nbI4eQ0g5Rc3poeNfJzz7DefgAhnx0G7wZJoV2ZBgCVUCB5qfRKYAryEY5KpFX1
         8yWqid0CfGvwGzwKEddUl9sDrCVYB1Dk6/r67aU6fHGsRgsz/aUGXjh/Tkx7CO51T2xt
         GCoOf0kwgICFFwFoa4oPHJRGoI94dh1cpJXEGBt7uXgzqDpv3UWene5Gp7PlAItH+BE2
         ZWTIuE3Io70yJdYGQdNtxqWSOmJvwE0kWnZIhii8kQudwhwO+y3owx9FWgKDUaN8wwPU
         KEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R0kNYBBZe/vkuDeDkbiPp383r6amrw7KjZXH0xUkvc=;
        b=QeTLR9EaIolYVEXuOosZLgXUzo1+FDZiK0z20NVtTuXzBdFW3owTw8H7DL/aRft1XB
         03eDsnMqoaF3iINtJSj3sIXgXMbcPacgTE/o/oadC2eBRYj7cYSCLElzkQdBJLBTSTIg
         4GhAAVZXNAp6Yi5eKIafpYo1RJvJK7P7wFidVydRa0kM01So/gZglx1JwEqxJladAwzN
         N3mD7pRAT/aXXX4fKvSfuZZYyBiaUn2b4aiqeWNyaBNXPYOz1pDQq34NAIGJCY2VYMFc
         zBd9Tf7Dzy5dFtlOYDsdHRmhJd2xf7xWu2iGHKi1voJuC1A5IGomvztDLcdMBdhuHGE0
         mqDQ==
X-Gm-Message-State: AFqh2koRyPCCr0qmrHTvTNW7HitWQwGQOcMaw0Bar+401txUGwFh9rkB
	T+5sS+mFRZm0VlOPtV9Dj5z2bg==
X-Google-Smtp-Source: AMrXdXuRV8ZcjNhMqkH8Au42kuXt+5729hTGbGDYIadFDLBDrkWpQPK41bKXJpCfDqHUhfEzP5P4VQ==
X-Received: by 2002:a17:902:b68c:b0:192:4ed3:e919 with SMTP id c12-20020a170902b68c00b001924ed3e919mr44783370pls.34.1672755083615;
        Tue, 03 Jan 2023 06:11:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a170902e2c300b00192bf7eaf28sm6146117plc.286.2023.01.03.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:11:23 -0800 (PST)
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
	Rob Herring <robh@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 2/3] dt-bindings: timer: Add bindings for the RISC-V timer device
Date: Tue,  3 Jan 2023 19:41:01 +0530
Message-Id: <20230103141102.772228-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141102.772228-1-apatel@ventanamicro.com>
References: <20230103141102.772228-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061126_337126_798ACA15 
X-CRM114-Status: GOOD (  14.39  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
