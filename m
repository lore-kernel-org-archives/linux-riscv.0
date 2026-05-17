Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F85CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5rQvfhvI3b3hZCj7NoIUCKn6HTJHEWDj8J39W5L020=; b=fSvnAflwJzScLA
	maHIC2DAsjlrvMzZ3UPe/GjtwS9jUyzbXl4L6oQQPvTll3KOldeu+6Oj6fcKdoOErunYIo6P16Jqn
	RY/Gy2Hl580hj6+4nmchc4xW/isk1O9OkCCVWrIF3wfd+b9uvrioscIR/Tawf+XOFzV2ATt8wRQpF
	x4U9Ct7uBmPLiTjklAPVsgXLHyqnvurEhpQUTel4O1Bsf+KcBYeFDUcCHgT4F+egTBOb0EIEzTAMW
	l9hM904CnT12/yPWNtGOwSWYKllohkeiGHEMBCtIJiT3yWJBJJbFAsmCEsIGl2k8SNDCFxkBd9Qdr
	TSaQ585oamn4vbRE9lGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFy-0000000CpQN-1zsi;
	Sun, 17 May 2026 14:14:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFv-0000000CpPP-3wvz
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 14:14:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-83ef1d17904so1373266b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027251; x=1779632051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=ajjKXp3QP/OE3DF0MP8XfaO/TB0DGPHkFqN9lYieL2GMi1SjYc2D7xiKVyGJv5EOJV
         pU2/aVUwukp3faTMK/yLVMD2ZwKZwlEmmIVHKV6nDOvOQ86wUqZp8NqJzAoBs484X6VE
         M8Db+ZCSBsTVZ48xkoTDt0K48DbzH2gHlpPStwR80Z/3E58UZ7Uxf4xB1+0CSuEgYLAs
         xiQRrM3iWzt+I8qEcfoTpuU5CqAWBlHzLAhRDyGigul5qXwLt8PWxDMHk3Y/q2QOz7DU
         guaBsqLPLfBK5Z29D+5IFVCfsjhV2E4GZRgrPBQ2HFfyL7JTSU/gSTGiWregT/bWfCM+
         WEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027251; x=1779632051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=CCMaUITSs67CKSyTBM+9ty4obeHHX65ao01+N/5/PSp/jNGzq7FiNDaOBiHD4Pb64Z
         19Dm2LayIN1mhOWJMdYZGJL0oL5FKTdZHmEZAsN3CDOvAF6av3fdYbYIjQ+3qX+iNw+p
         q7iq8AAne90QVwlSSsxZhatUEzx0ro4BJLqaLaAxfQB8EqEUSZwCLKe1edVXlTF/GD44
         RoxwUu28MAqTbnEOQTqeXmzCEvADKOScgWjW7O4lzOms5QdfUfI1lQPwTcuOPfd5Y9rV
         MnehxcT/D/AZlu+wK1Ld170q5qcrmzYvEv9x9qKf/1pr2Qy1fntnwWsSdRpW+vgqeSVB
         5lZw==
X-Gm-Message-State: AOJu0Yzxv7cOuLT1/l+U5DNkdkwBUjSZYFj27tWyjSvYrD+CBRbzDFzf
	Fh4osM0gaK7/JyL1UmG0C7gs5FqJ6lc1SLprhLusxdfuqO22k0N3OuUa
X-Gm-Gg: Acq92OGpAr+KhKdpVwG61RaI+LlI2rRWMQDX052qTdBTrqFjfq0kbVDL3uURRGkbbUm
	0ruK5wyz/7tQ5Z0DPeopgdB6TzL59Z0EPs4xhsUsvKwPQmnnpFuAZBQmHUYhvVzP6CguJh+biu6
	yfnn0ULtqBUDc0G+zSn4Cl2NhBS/waonNPzvGgcqN/WSZ914mWQprVF2T03UJsAzPqLSyyUGMSJ
	l3TPAwryInmLV4RUTchbXo0jrIibDNbdq/7N7YPO2PtLXR8nTAEiCICCwohT/vuEaJgKONSmRUO
	2GZRLCLjJQet7w7ljvkBhVPGpq/PcDaljGiUPVZAwTXWq7YUrcgZxueu0gU3HRjNFsxQD/15lsc
	2GxYz/ht/McNsslLmW70J5Q8joG0q9pTwWWsfY/lm9Fn1cRWUuTmzwdMguMQp0B/ZnS5lOLOAg0
	SVftrrz3rDf/DUwu4xQoPBwweulmOc
X-Received: by 2002:a05:6a00:a221:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83f33d9dc56mr11055934b3a.30.1779027251056;
        Sun, 17 May 2026 07:14:11 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:57 +0800
Subject: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
MIME-Version: 1.0
Message-Id: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_071411_989121_E950B272 
X-CRM114-Status: GOOD (  11.17  )
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

Add a binding doc for the top clock and reset module found on Siflower
SF21 SoCs. This block provides the main PLLs, high-level clock
controls, and some reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..a013d48841f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks and resets are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin25m
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    / {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        xin25m: clock-25000000 {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&xin25m>;
+            clock-names = "xin25m";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
