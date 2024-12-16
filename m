Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B9E77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQ3s2YLlI1tcrBlcnenUY3rBKde2HZKFn9ZuP65dnGg=; b=416ARGxjlajMVH
	JGjBC3JVgqtvieBTt56csMtksgN6A3bgRu8OTGLEIQZXsuyR32ULdk9CyCuiDPHgYuuz/aXO1cqyH
	7BoWQiqAhArS2msHIFKwEAa58gFQ1XQZrQfoALeGfDG3MW5MozrBDjdt5CaPr0eqZbBPBT7u5c4bR
	Z8crRyksId1pMa/YK5IyNQS06/A8nmHPU/TWMwCwCR/HyGe4GoA5BBG1HpqckSNMYxoRUVX3uyTUZ
	hSShoxyJYRq82C8WzuqSyFUwRUIEOppExbUYpjTa9xle9grk4imXTDSMZiDGXIDhTGLSsBzVJjICp
	/54DJ9cLbHMYmP4Ho5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mb-00000009RKo-37OD;
	Mon, 16 Dec 2024 08:48:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6mZ-00000009RJv-2gPO
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 08:48:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2156e078563so28460035ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338931; x=1734943731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=exD4L56Q0f/4sFy9/OaPVVoov3EiSmaIzD6lvVaT+4/fi22m8ZY4f45sGHsqJquFnq
         EEVFX8kOCfN8zvk5UFW1HK6sgDFPGTa2IQs2CcmTcskgCPh5afwvUSTc5ZSVpNzKrjJe
         DUrj/ZsUMXTBpU/e+j02762jLWIDAmECPkEkEFHhfBUqeaGBB+T1g1GrFl6qC/qpzUl6
         Ky6lR88IdsGVjRTze6SXr/VoVsKRSgCrKlKMZhK9YDEO+W/FbgR0SSmg30feQw3pgvQq
         qJx2GrB2oDNtrgWcMPxkwgpRdp+YHg+b55LGH50tt0vpwQcXwS9q2Jrm0gBkG9TYRlmQ
         Mk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338931; x=1734943731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=unNGCf62Ld9n7D6SUTEPNfFcKJvq3IZYQZZ9P1MTaiXbg2SSiHqWkSoodWYnI/i2bq
         SiizF79LCfW0XZ9+ok/kDwLmWVGfWpOD11irkQNy1Z5IMun8+ch6lturUhT4I3NkuneS
         5aPtaJZFLr3a8bIPyUFufXmRRRrwliKpRems5eNs/X6RDOelfgGLUuZVGv/pbM7ZTZHE
         RwkrRiwqPQ/Uc0ngU0+Va6alipnunnWjQVqsru3kkkXVo9hNK2BwNpXX9AmXaapsUCjC
         W9mtTzbdVSKQLw2IX/Fl2SDnfRWA3fhX4YNKsQL9DfSxM18/txEGQtk4DM11SKHjdxLu
         193A==
X-Forwarded-Encrypted: i=1; AJvYcCVPtgdTDGuhj+JdvPu7MGfAAfGgoJeJzjIt0lO/IfaKbliH4+Xhvww1e4H+t2GiteMWbud9aUzYhhsFmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9fLn7XGNGmBQupp/lwsdS+ES4AoZ6koJSMiMt9Dj1tKV17iyv
	Yma1UtcP0tWztcIPB9M7v3cmSpby+Igx5vFNSOlQUGHA7950F5lsfJqgSfXalR4=
X-Gm-Gg: ASbGncvd7e1Cweu0ZClyQ5SZ9tn+fp7JLq0jQY19MYcHAg3F7W8U4RM2nI5m4sdZy4F
	1ccHSTMT/SUX5t+DyuTXEdctLKdx9LlU2cQWMyiTb1haFGw2vNNN+EsDx7+U8EnqLqmVepqlAKy
	L3enuy4Y9SmP6AssGFcVGMgCloLlp723Eq+m8RFNEDP1F+qedkutewf3n3L3/NTFNsxwjcq6Qoi
	4XRr+ERFDomWyTAjFUj6ZGMGyd2jR6L5Cu/yel9bjR3PCz566E2mATiz787wkOskvN0xG7/AbyY
	eIQDPlT7wJxN8sc=
X-Google-Smtp-Source: AGHT+IEjkG82UTaLNxVZ0a1jk6JfxX7g2yNmmqLUOhK1uOCG12kx8FsqZmcvvvLQulkpsVPnYWSQaw==
X-Received: by 2002:a17:902:ec89:b0:216:770e:f46 with SMTP id d9443c01a7336-21892a74611mr174024415ad.54.1734338930854;
        Mon, 16 Dec 2024 00:48:50 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:50 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [RFC PATCH 3/8] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon, 16 Dec 2024 14:18:12 +0530
Message-ID: <20241216084817.373131-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_004851_679093_7A5464C2 
X-CRM114-Status: GOOD (  13.13  )
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..8a05e089b710
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  $nodename:
+    const: sbi-mpxy-mbox
+
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
