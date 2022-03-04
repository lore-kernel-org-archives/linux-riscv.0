Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518FDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12KHvbwWD2e+BTmKw6U7Bp0tjrUS8vrmOwAJkCo9W6Y=; b=Ei0RonAPLyFxnW
	j/8EA/VRGARAaEwZgefB+1ZAGtuD3TKh/MXveIBzFIHKWdWI7PJcj0y8gU2ECnilmumy44B99GHG3
	/4wietcaBFhJipo4FlpFyfXKvKSPT4UnUUqdwWwqRT3KolWs6RNkTTieA6oXx1eKCg1r6t9hrwlRb
	7XEHbFWFlT/HjMAZ1gizC8pB1FBzzteVi+li285fkChCbbcmuM5BcTzO0+R+i1VzQQozhZgpreUg9
	8DXUmfZEWH7HqGMMnNynzUh3npEMNtRjVyr/GWjN+vTbud1WdvIGUwkkhkAb83d2Oj5iXXtNTgKHu
	epeX7tzSEylHEwBnhQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4mk-009TLw-Tl; Fri, 04 Mar 2022 10:03:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4mb-009TGP-6R
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 10:03:34 +0000
Received: by mail-pf1-x436.google.com with SMTP id d187so7202023pfa.10
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJQeczGCyde6fs+sGcXvqejtqL/oWjg9SsCj9ixzkS8=;
 b=h2zhJkz4ejNA9UZn2qKXICuQVZ5crdHCD3aL0FrHrgAipBUZruvyGxutNpSmGwvz4h
 q2FYeIflyxi4WjnT1UHwy9sb7CPF0FWUfW2O1BijSPjrnOD1yVt7ojVuUP/v0+2TCfAL
 rs1N2rEApj2CSLe+gsoapMAQO4EkBHtlllYjOEFKYvfb/NDrscO1HTxxTeVEix4iUUa8
 3h6v4pv7OGj36rQJ/IikLWbPoEHIc9Vk4xXIapdKiWk3BTZEVK92IhGdRfShRPWFcngL
 +qGv/J6YvIILTX4Ob/dGgmHl/zUSRENL5K3ZB7dRlHITceMzo3AJ0CfM+HNbSbyHDjsL
 aBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJQeczGCyde6fs+sGcXvqejtqL/oWjg9SsCj9ixzkS8=;
 b=1SJ5yN6d8G2uoNg8tjNHAY9uH5Dtq0XreoJLq4Vjc8JJycbDbKSJstRUdK1lNqi52c
 DN/XkMSrxGDTOKGRwqqjnmWB32gP3AovUqzO7c+CsSkpRQsqh4+AzxmzqwNRvSurdGYc
 d1zlccHXqHz+gDJkiLsgqmyXcqztCpcU2zwgt0rxte9Qpi1ZK/vaqkByffoaAg67tKjg
 YrRYk/R8UKi4iMFh2ziRdiEqdPdwHMNuD7oFPs/Jg8sRSstWwAM0QvvPwRtRMw1b8ojk
 T27psN7OV+akGZ+XvmleB9uByTuJBU8lRlwYyDlGJOHT3W50Pc8M7c/cud9G4LqOUIxa
 QxLg==
X-Gm-Message-State: AOAM532xYCxnny+eVNBjMqbC2tzx3+ueCCCObCwwXH/nnL8XKTbsXVZi
 kTI7BVqyAYprB71ecRL+Br5p1kz7D1W0JA==
X-Google-Smtp-Source: ABdhPJw8Wc3eKaZofkKh8W3VECbyxA6H4ZwEDiEWFzFFuLSB0crgYHjPTZ+vrcmF6tTgikJwX+lEtw==
X-Received: by 2002:a63:85c6:0:b0:37e:61ff:863e with SMTP id
 u189-20020a6385c6000000b0037e61ff863emr602220pgd.412.1646388212452; 
 Fri, 04 Mar 2022 02:03:32 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00174800b004f26d3f5b03sm5461605pfc.39.2022.03.04.02.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:03:31 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 2/5] dt-bindings: change the macro name of prci in header
 files and example
Date: Fri,  4 Mar 2022 18:03:18 +0800
Message-Id: <f9284873c2993a9952d9fe4f8dd5e89f20daab75.1646388139.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020333_277014_9EF7E300 
X-CRM114-Status: GOOD (  10.18  )
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

We currently change the macro name for fu540 and fu740 by adding the
prefix respectively, the dt-bindings should be modified as well.

Signed-off-by: Zong Li <zong.li@sifive.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml  |  2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml        |  2 +-
 .../bindings/serial/sifive-serial.yaml         |  2 +-
 include/dt-bindings/clock/sifive-fu540-prci.h  |  8 ++++----
 include/dt-bindings/clock/sifive-fu740-prci.h  | 18 +++++++++---------
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index 427c5873f96a..939e31c48081 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -79,7 +79,7 @@ examples:
         interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
                      <17>, <18>, <19>, <20>, <21>, <22>;
         reg = <0x10060000 0x1000>;
-        clocks = <&tlclk PRCI_CLK_TLCLK>;
+        clocks = <&tlclk FU540_PRCI_CLK_TLCLK>;
         gpio-controller;
         #gpio-cells = <2>;
         interrupt-controller;
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 392f0ab488c2..195e6afeb169 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -104,7 +104,7 @@ examples:
                             <0x0 0x0 0x0 0x2 &plic0 58>,
                             <0x0 0x0 0x0 0x3 &plic0 59>,
                             <0x0 0x0 0x0 0x4 &plic0 60>;
-            clocks = <&prci PRCI_CLK_PCIE_AUX>;
+            clocks = <&prci FU740_PRCI_CLK_PCIE_AUX>;
             resets = <&prci 4>;
             pwren-gpios = <&gpio 5 0>;
             reset-gpios = <&gpio 8 0>;
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 09aae43f65a7..b0a8871e3641 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -59,7 +59,7 @@ examples:
         interrupt-parent = <&plic0>;
         interrupts = <80>;
         reg = <0x10010000 0x1000>;
-        clocks = <&prci PRCI_CLK_TLCLK>;
+        clocks = <&prci FU540_PRCI_CLK_TLCLK>;
       };
 
 ...
diff --git a/include/dt-bindings/clock/sifive-fu540-prci.h b/include/dt-bindings/clock/sifive-fu540-prci.h
index 3b21d0522c91..5af372e8385f 100644
--- a/include/dt-bindings/clock/sifive-fu540-prci.h
+++ b/include/dt-bindings/clock/sifive-fu540-prci.h
@@ -10,9 +10,9 @@
 
 /* Clock indexes for use by Device Tree data and the PRCI driver */
 
-#define PRCI_CLK_COREPLL	       0
-#define PRCI_CLK_DDRPLL		       1
-#define PRCI_CLK_GEMGXLPLL	       2
-#define PRCI_CLK_TLCLK		       3
+#define FU540_PRCI_CLK_COREPLL		0
+#define FU540_PRCI_CLK_DDRPLL		1
+#define FU540_PRCI_CLK_GEMGXLPLL	2
+#define FU540_PRCI_CLK_TLCLK		3
 
 #endif
diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
index 7899b7fee7db..672bdadbf6c0 100644
--- a/include/dt-bindings/clock/sifive-fu740-prci.h
+++ b/include/dt-bindings/clock/sifive-fu740-prci.h
@@ -11,14 +11,14 @@
 
 /* Clock indexes for use by Device Tree data and the PRCI driver */
 
-#define PRCI_CLK_COREPLL	       0
-#define PRCI_CLK_DDRPLL		       1
-#define PRCI_CLK_GEMGXLPLL	       2
-#define PRCI_CLK_DVFSCOREPLL	       3
-#define PRCI_CLK_HFPCLKPLL	       4
-#define PRCI_CLK_CLTXPLL	       5
-#define PRCI_CLK_TLCLK		       6
-#define PRCI_CLK_PCLK		       7
-#define PRCI_CLK_PCIE_AUX	       8
+#define FU740_PRCI_CLK_COREPLL		0
+#define FU740_PRCI_CLK_DDRPLL		1
+#define FU740_PRCI_CLK_GEMGXLPLL	2
+#define FU740_PRCI_CLK_DVFSCOREPLL	3
+#define FU740_PRCI_CLK_HFPCLKPLL	4
+#define FU740_PRCI_CLK_CLTXPLL		5
+#define FU740_PRCI_CLK_TLCLK		6
+#define FU740_PRCI_CLK_PCLK		7
+#define FU740_PRCI_CLK_PCIE_AUX		8
 
 #endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
