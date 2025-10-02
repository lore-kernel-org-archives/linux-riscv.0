Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C1CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDzWX3jYgnG3gQjDaJZC0tVWgDAMQvuFakpOsuJODiA=; b=tUKsi4EaPsKx7L
	i+nRz7RlFoxKFtUw6zbHwhe5EW3yFEx8F2DqoI3+sdLb3tHhoUvjnTry82XaLRCR34TabIIRvoA6n
	1+9uhNtfLPs1EHXiM1LcIRvmMLD7Gy35hayKLwcu0+4Wr89p/V5qWMXlFsnQV+WI6q6UpnxgBFXQ/
	s09S3QVpQXlFchMOEHpRav/pZznKGd3DZ+6GVEBnCb/Y5ywQHfsCCcttNqGNjGIo/AItv+52MZ7Ua
	7xOUvInGwO6I7mhMCHcwhpdIYvide6nAo8syqrGfY6U5f+Ke1ZbT34BiErql56q5L9uUs5VdFJ3oK
	3ulZOYrlguDkb71v95Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUS-00000009h45-10KI;
	Thu, 02 Oct 2025 06:08:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUQ-00000009h2l-02E0
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:08:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-78af743c232so704460b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385309; x=1759990109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj2c615CrUy8YOmyqKQouk0cNfHyOtyWOMbH+KweoEQ=;
        b=ZSEa9NC6Q1usMiv/ZjIZBJASp0P2YyAfbUbZuWvZJr44HaBVCsFmsBuvtQCwVks5qF
         4S/iRH910z/KFQ/z9B5hlT8jmJSoHtuySQPVBEGXLmYr4Ck7+eOrwn6mXauvBCUh8EXe
         7uJM8mJJOprYjnTnyC4jOEojnezFaPcZgy7Z5JUEq6CRW6HbPjFMHmkUI2E/6wzpL4UX
         jYM7WtmtgkpRViMCxtKimdR/dd8REDfiZ0Y2gKM8OJIQr8wNoZvoQkFQW9FCx1ow0ivr
         c4EvPqcewJzNAGV/Xz5TxhjZiTNhXPvtUQPHsoO5YldXGif5IPZB6FyZqaPQV68dXDwt
         Y+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385309; x=1759990109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hj2c615CrUy8YOmyqKQouk0cNfHyOtyWOMbH+KweoEQ=;
        b=bFj3+YeuakMvWOAClt4jfTpeJW/XP0MDivqoxj8qN5P5S8TQv3fHrwCwf+awBWQKEW
         YK5S5tXQ7sckV8dqp6TJs0hptMw5/dnd5p7ZQW8izyJMgrib2GqQIbY/WQKnVp5IjXqE
         jAiuCLHRNLa+iFaxuH7fL1v3Q0regTKVZo/iWA1HhO8sEayOn9Z700sukVvc+3suyhnL
         mKkyiDPdJ80rzsOAsmvN2I/BmlSPwlZ5D4IGlL+YPxR63O3tBFu5OeU7UlY1d23SEtV5
         lvDhsjyDHOKX+V4DqxPY130hqXsZFZyQ7v9Igd70boIPjF+NJP050ZRzwkIrObhuRv6W
         WhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDFuGj+PL2vGecxk1qfKzgQeF/7RT32iGza+/FgTRL6TIetbT3z8lb4VS1C+/x5cGSYJc/wjJwafESTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYUkIRhHjPdfPEvb1Mc56bV8Kr+AarhaIsVDmU28Jx31CA0DmG
	cslp4WeL03g2Hl6ITZEchebNHaSErBAzngjQEDxhcMr3eoSwCT5jbCI/5Pm/8toEJlc=
X-Gm-Gg: ASbGncsH+/nFnXAAk7Nw7dismE3lM03ZBkIbt5siW5XWW+ZaLJqprY4JkL6JPGjV4hA
	RRTwEaRZHVv9r7jq8L3Qt1W+JmlvC4l3GQ2zeZkcpTm6paM89XQDCzLl9Fcu0U/r85d7KGB906V
	c9R9iTXG1BeitUB4iu2GSSHt5lXO0H1+UNeW34zXeMHriKB2l57j7jAtl8WxDN/O9aR7tKtDwZ9
	rUFbIEYNMlPbbHsFPlBWX1OcxeftAUkBbBiDboe7jYjrENmFYqSL9+81Jm8qA6uOkeDCI8ks3OX
	cvF2LhW3Elh+o92xcqZWMCm/p8E7jr37DvKD3dHESurN3qlz6IYcbNmdA5zgJ84UQHlJ7EjVxOY
	d/oYfyxpa4QLu8ni5E8QJpiUZbkq9ddfrj8n8gdeI8FwJTnAwt32iZYGv3NBv4k53In29HElIHn
	xqiqAOLCNbe5oD8g==
X-Google-Smtp-Source: AGHT+IGyT87xXKU7t+8dsmisG5C9KDNLA6TvuaXRJOG8u8du93ihWhzMU5v4etOkFz1S4HPaXHTjzg==
X-Received: by 2002:a17:903:1b46:b0:275:27ab:f6c8 with SMTP id d9443c01a7336-28e7f2922bcmr64570775ad.20.1759385309029;
        Wed, 01 Oct 2025 23:08:29 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:08:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 01/11] dt-bindings: Add RISC-V trace component bindings
Date: Thu,  2 Oct 2025 11:37:22 +0530
Message-ID: <20251002060732.100213-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230830_054050_772CFB43 
X-CRM114-Status: GOOD (  14.79  )
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
 .../bindings/riscv/riscv,trace-component.yaml | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..78a70fe04dfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,110 @@
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
+  from multiple components.
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
+  cpu:
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+    $ref: /schemas/types.yaml#/definitions/phandle
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
+      cpu = <&CPU0>;
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
+      cpu = <&CPU0>;
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
+      cpu = <&CPU1>;
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
+      cpu = <&CPU1>;
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
