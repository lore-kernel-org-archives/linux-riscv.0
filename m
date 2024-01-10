Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CCCC4725D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/k87pRRCgpAhal8PUTzkt7u2dEr0/Om76vUWHQGMfhA=; b=0y6t4QUXSwK/bR
	5RiPkG8FSOmshqAGjf7wds18RR65+Xsdi90grHWwzyGnwRdd7bbyVRoqOIo+uWWEKNFxpg+CE4Vle
	rFvi4KyVtQm/Fi7Gxo8QCwub/0KKT8di6XOxgUlFF5A2EK4w+lr1tpHr93dmJyjgMFU7TnJXhi8XY
	PmZOlYAPXdZLClK0WxNC3Gj73sDzrmh0DZN1ymLMOdBHGrZBnktj6wMowLttT90cTDR6+LWEmgxse
	U8bpU1YsrfNXtZu7ByteopQvBHtrreOI2THigIEf8zQaWwkhMSjH/jjgdj28Fb34YKxz9WIfNoi4W
	L/OjwkzHGGGfiygOJroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbYk-00CwNi-2A;
	Wed, 10 Jan 2024 16:36:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbYi-00CwLl-00
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 16:36:05 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1d427518d52so31894215ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 08:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1704904561; x=1705509361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV4VviNybAyJrbJYiFxfyVRSktZd+2itH3SH5tA+DwI=;
        b=C/m6uj9l3Mm8sFYlQZldelpe9HCMSqd657I4yg39QJml4fwVsxqe4JvtF6uO+oPhcO
         PzOcSkrwp0abANOyKipXPb6l6xMrgta4M7Su4yykb8LodCZK7NU4SmD5zml49OQIrK7I
         xu2+jVrVfnJKZ/ZU2xy98jS6hrRyQZ6f+RXvq1dnNGM6Y2W4Ab292Jr4pPJTEMBCdyI1
         aLLbAwyh+GpnD0RLX9UWliPjCtw/aRwHcprDON475/iPgsjYhfgl7XpVQM2MIRYmtMZU
         6Pvig1QWF4ThDC0/lm+aaMJe+IKtKRyWzK/Lw0c1iHpK2+G+ZK60i+Tlbdbo+HPL166D
         +/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904561; x=1705509361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV4VviNybAyJrbJYiFxfyVRSktZd+2itH3SH5tA+DwI=;
        b=Xfi3IcOQMeHn2w4LDwg6P9WmsC0beB7Vps9U1Shkkx33QTi9PDQVaP2IqGae8fFaKF
         6BF8TDcYrANZNaG9SyyFfkyLvR7H+Lyj2XD1F8ib9+vy8uKGkC45CbPnqiljxiTGvIas
         hC1rXyJ8YPb3tI5UCGiND+/nzbsxjj8xo3JLJhBU1AKdLCoKwzEwLGJIoTlA8m9bMwLB
         Eun5jwAPkiCfHrid5KxdRvVsNlKChYdpoqPNaoWQbxao/Kf5nWqw9NQM6anqDrUZswCL
         xhieehL9rhGBLONviYitQpLxwKDtiC5krGRpzxQuvZqfhzcrl9t2b/e40dq7x/wkLVE4
         cSzA==
X-Gm-Message-State: AOJu0YyBKuFRzZHNLv7Sv2z5IDty2NCqMzqH5JoYPXtko6mPEyu8/3Fj
	gb6ldDfjIZza+361P6F5UAlup4IIDHeULQ==
X-Google-Smtp-Source: AGHT+IFr2FFXH1tHkcmvts5zPq5Xs6NJU6JAKAieMzlBbWvjuk3lHw4ghOJ3q0yGDq0qMDjrW9Zlzg==
X-Received: by 2002:a17:902:680d:b0:1cf:e9b5:90ee with SMTP id h13-20020a170902680d00b001cfe9b590eemr256182plk.24.1704904560880;
        Wed, 10 Jan 2024 08:36:00 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:858a:4f95:cb29:907c])
        by smtp.gmail.com with ESMTPSA id p20-20020a170903249400b001d4b5e444d2sm3872265plw.48.2024.01.10.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:35:59 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Wed, 10 Jan 2024 08:35:16 -0800
Subject: [PATCH RFC 2/3] dt-bindings: clock: Document T-Head TH1520 AP
 clock controller
MIME-Version: 1.0
Message-Id: <20240110-clk-th1520-v1-2-8b0682567984@tenstorrent.com>
References: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
In-Reply-To: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Xi Ruoyao <xry111@xry111.site>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704904555; l=2723;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=XQC8E91B1tHAiQL1JvSAmvew8theXOsFefzGYD4oHj8=;
 b=D6T8YeF2X73hPXm6YEdEYCJdL9qgsHM1/jphSVLyFTtebWsFxlb7hFhtvGGEA+22LTR29dZpk
 1Trjkwbhx0KBQHXG6RsBS514zrGzG5oT6ciC5gipEXS6/QZwgTLr5pb
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_083604_046463_DE6F7732 
X-CRM114-Status: GOOD (  12.19  )
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

From: Yangtao Li <frank.li@vivo.com>

Document devicetree bindings for the T-HEAD TH1520 AP sub-system
clock controller.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
[add link to reference manual]
[fixed dt_binding_check warnings]
[revised commit description]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml        | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
new file mode 100644
index 000000000000..53e7802a4ad7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/thead,th1520-clk-ap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AP sub-system clock controller
+
+description: |
+  The T-HEAD TH1520 AP sub-system clock controller configures the
+  CPU, DPU, GMAC and TEE PLLs.
+
+  SoC reference manual
+  https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+  - Wei Fu <wefu@redhat.com>
+  - Yangtao Li <frank.li@vivo.com>
+
+properties:
+  compatible:
+    const: thead,th1520-clk-ap
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: main oscillator (24MHz)
+
+  clock-names:
+    items:
+      - const: osc
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/thead,th1520-clk.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk.h>
+    soc {
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clk: clock-controller@ffef010000 {
+        compatible = "thead,th1520-clk-ap";
+        reg = <0xff 0xef010000 0x0 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a52dbf3c5606..dd2398512fc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18856,6 +18856,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk.h
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
