Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237A0CCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbI8YxviN8BpQM+rXQKk2v6OBJRoO/SA7oAcIjrRxeI=; b=a0/U2Iw8P2G6mq
	rXkkqK46ZF7hZH2LMD6TNhqnkJ/2FLiuumfKx0FVJ7vFJ+/sGQ4s5BqPox4m9RXRkea2ob8N221EH
	7Y89ub+C460mK3RelouSA+9COTSkFLlAucEy3MRL3UuxLHKx3uYX+6vh1883ZNIRKGD4qxdWPE8Tq
	CcPOJqpP/lIcA2iNhL0rGy81e/mVexJ9IA+Yjz/2ckSx46C/cwTkVrfptvz848UgL4LEp58+rJ7rH
	BftWakYSWZHSnkYVClbGHCuY98XxNkkfpjJ8uYhK60U1J5cvHzuxYfidl8AiNW1TiHqz7RirCT0Ev
	uxz/cer7VeN7APmCL2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDl5-00000007sol-2heG;
	Sat, 01 Nov 2025 15:43:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDl0-00000007so1-2sz8
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-26d0fbe238bso25964715ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011790; x=1762616590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcA70PVwTnb4/jopyJB8UMf+ejoU1/qkR5vDiv7mLZA=;
        b=KnDGBqnyyHQyqtXJy1YPZBzT4oXfUln+1T6gAs+m7MKxP4rwYYuYF4d9ng4tnirG6U
         uayCB2EHcnvI4xhknxCQTSGkB/r9N028qp3B/rjUZjHWAHMEtUTZAV8N81chOuag7R3a
         uBkFFdGf14RLF7JXQuq++mLpJmrJ+v6XkDQem6LKnT2cYPsRL63ox9JG+wc6D6OalCzy
         UautLI3pcoT/ViK4mebDM6U8Gjqrwg+YCqM2zbbjPwUZcBaf/aduL/LP8EK7NRq4Dujn
         7drFGv85luOgRaW26P2KSOfAEM8upntRfp3T+V3WwwP+8n1LA9zDxlivumlcQcoqGv1Q
         Zh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011790; x=1762616590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcA70PVwTnb4/jopyJB8UMf+ejoU1/qkR5vDiv7mLZA=;
        b=jyCRJxTtpaEyEwLT0FULdfih4BID0s/L4W/rqpXtVHLOXydBmdl05QNBeSYA7T/RLl
         h8n/UdAnkil3pVQTH2E1hR7s8rWXHTFbD4vtNjRxwrMuRHjHUCwcC/WfcngWfbkuwylu
         aEoasJJnWfd3WolttVukVxzk3tDv5cbtMwMBv+HtOhh2ABFWBxa2Eltv20cfzXW9xmMg
         5sLBeVKiSob7g2AHpUJB1+KDhfUcFfh8vsakW14/Betp0EOjwLPdLyiOz5abjiion2bb
         hUBjXRqobQtqSDG82Qn+jP4SAjR6M+KLv/wlj4vA7cIf+SuuvzHiago4VAw0DWIu5arD
         +vSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHYkFe8Camlbful3+/y6ECHYCgI1zbQL62eRjY5QoNjkGM7jaLG6iV4h+S6i598byQD/aiFKSo38mGwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZOSjyBoZNoQXEE1RtDD5HSqRO0napGB64LX/gX0couzZSxyzY
	eulUqXZ/nVDMKlL1LahGdLBXGqRBUUcvHbsKfJ2iaZ0zG8MittpWYRXhIZJ9Dzgw/Gw=
X-Gm-Gg: ASbGncsz+GHzRapca7MrkLqS2Xi7sxYX2g9QNCUXB9TK9rjNWZ63MQbtbod19UhD9vw
	hd241EtU8o4q0GcB3lPMOpoJVAVrnnDphsLKBE+YQi2F7BnChL+iNZN2P92LJh2DGsxAfKsWV27
	X7Hj7BuL/5SzDliW+C04N4RTSPQ/zOxp764uuRkV+mkLFeMjR8ifIuyjoXIvHU0w7RbAMRl5Dqo
	MTncMwN4ZSC/t2EugPrZah7FTkfxEqizbomHxA+U675te5Wh15B4RX4zTQNAul0R37wYkTPK1zA
	9GlqGYS3dcXAm0YaLQYob5ExGQ/RXN36Jiz6c6qy+gTeSrZ2wYlyRQ5iUMne/Lpw8JRJ01XV4lg
	qkaTLP8K+TPotd7xYhSpxa9iaefEiTAtrSBCJKv0ldQiM7km4BwZ85xmahOa3VbDfkcJT5lmFPC
	kx3E1YLWGpsPNRl1ZJid2fECPIGU3cEkmQigMQEOX2WA==
X-Google-Smtp-Source: AGHT+IGpRBEwhgyZU04oRdc2JtlV77rsk0jCZD7dlM8oXxEemL+4JiYFTNnpMduG0pla8WCCicoqeg==
X-Received: by 2002:a17:903:38c7:b0:295:62d:503c with SMTP id d9443c01a7336-2951a3d281bmr96116035ad.16.1762011789776;
        Sat, 01 Nov 2025 08:43:09 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 01/12] dt-bindings: Add RISC-V trace component bindings
Date: Sat,  1 Nov 2025 21:12:34 +0530
Message-ID: <20251101154245.162492-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084310_756406_680FBD21 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/riscv/riscv,trace-component.yaml | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..7979af3d4174
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Component
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V trace control interface specification standard memory mapped
+  components (or devices) which support both the RISC-V efficient trace
+  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
+  The RISC-V trace components have implementation specific directed acyclic
+  graph style interdependency where output of one component serves as input
+  to another component and certain components (such as funnel) can take inputs
+  from multiple components. The type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register hence component
+  specific compatible strings are not needed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,trace-component
+      - const: riscv,trace-component
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    maxItems: 1
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Input connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Output connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Per-hart encoder and ramsink components):
+
+    encoder@c000000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc000000 0x1000>;
+      cpus = <&CPU0>;
+      out-ports {
+        port {
+          CPU0_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    ramsink@c001000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc001000 0x1000>;
+      cpus = <&CPU0>;
+      in-ports {
+        port {
+          CPU0_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+    encoder@c002000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc002000 0x1000>;
+      cpus = <&CPU1>;
+      out-ports {
+        port {
+          CPU1_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    ramsink@c003000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc003000 0x1000>;
+      cpus = <&CPU1>;
+      in-ports {
+        port {
+          CPU1_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
