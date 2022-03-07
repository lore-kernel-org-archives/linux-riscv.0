Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC440C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyNri3uHRGotlqSZAYECQ3u8sAbJaxCS7jRO27VMtrg=; b=jFNaCbL0RJ4AMK
	lpoBqvxL2eJROfDyj7Z8p1N5rmt+4ngmX2jdcpJulVa0d1O/yif7T142FKZYz3nF3mx7BRCe/fH9W
	81RRuT91Fb6QmlVIUfvsgYpuu6Ur9zPddsnGIODYJzE0bPU+ALZSsypfixDnXfhdSh10lGp5TMJeQ
	awmiW6lNhaXAC1B78EXf9FNbFiy5NuRfVw3BoAFPnkNSxwdjWetkZuFX7cUF3xzWgNUJZnQS91thM
	09wPmszDPXhq1UZnwPfDmC591vNZdawQbGdOPeHi79GG+DpmRFrjmloJoxwsYnR2QsfuU2R2q/THP
	q7S+I+O5a/xnHUJHxsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR6Ag-00Fwnv-BD; Mon, 07 Mar 2022 05:44:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR6Ae-00FwnV-6w
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 05:44:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id k92so3201924pjh.5
 for <linux-riscv@lists.infradead.org>; Sun, 06 Mar 2022 21:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBjY8RLSr4Wf/RqUjGw1XSvLuEMUT8Kxzt7XGrbbTA4=;
 b=lAIL2WxrAiBazAGJWqjUTrqx5il2WIviCluimAC8nzelpPqBr/fFyB0UwfzXwAL4My
 qSBZbEpYxq1IMDHdPb8L17LXv6GHdnT4Dr9u1+hE/mspifd4KxifeLe8Yq619itW3q6s
 4A3GNykAGj2/dcfQ+9RyzD0Rc5gQiBU9yrDLzdDglsTk3oGFxBPdGKkSqfNe6sdzZkd7
 HjK1N8J8ZkzD3YyzWtGJl9ltWtt7FvKPJtJFJWxYwYBq5Cm+Vw6+5KatCLZu/D3zL2OA
 Ig0VCxU4YELlJ9oowPlOCY6MhCU/cvHLbgVRGHymaOQ60JsCKegvKYNZrqTLHS1rmwcX
 4daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBjY8RLSr4Wf/RqUjGw1XSvLuEMUT8Kxzt7XGrbbTA4=;
 b=Is3w0JKmc0zAJF4rtuYXpC3A4HyZGq2th9YJdL/D8qJhoAkewMklboapSLdSsGTzTS
 4hQRNfxwRw2J5HkWtaGh5ftyab8QyBXzGWOt+loQIOzh8T5GSYyUDQtpQLOH1qF14PFt
 dXOdEQHqJFlFPhMXyY1WOUmMyOwmEN9a+pYjO43mskvU4M2DfWUnK9C9HhUUHVZ3u8WM
 zzs+BwZvh6mjWTiAEHiMhYeJ5DVcQdl6I76F2kQeO3n5aT5fHuqDA5ovqkIxseCyHsWw
 MlOUg7Jyl9MYXVuUaXSthM9S9r7IyWsWWpnebGPgSm4GFQLf6OY9mpMk4gnKWgJwTxT4
 zAEA==
X-Gm-Message-State: AOAM530nO3MnjclxoqlJQ4HdB7meKF6Tc53SChugddejxy9m+D0VtBKJ
 tAceZyLjn63eJJXpLdKu+m46rA==
X-Google-Smtp-Source: ABdhPJxVlNJdV8XimvQFNcl99mDUTWcRveCL2gfbpROyNetl5A3n1pSHAfO43mCGHS6p1SKXEyj0XQ==
X-Received: by 2002:a17:903:2346:b0:151:60f4:84ee with SMTP id
 c6-20020a170903234600b0015160f484eemr10817143plh.27.1646631875488; 
 Sun, 06 Mar 2022 21:44:35 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00168100b004e0e45a39c6sm14447385pfc.181.2022.03.06.21.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 21:44:34 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: dma-engine: sifive,
 fu540: Add dma-channels property and modify compatible
Date: Mon,  7 Mar 2022 13:44:24 +0800
Message-Id: <1e75ad35b7d1fb6156781bf9c545e1f084c43a1e.1646631717.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646631717.git.zong.li@sifive.com>
References: <cover.1646631717.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_214436_272537_9A411752 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Add dma-channels property, then we can determine how many channels there
by device tree, rather than statically defining it in PDMA driver.
In addition, we also modify the compatible for PDMA versioning scheme.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index 75ad898c59bc..92f410f54d72 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -25,7 +25,15 @@ description: |
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-pdma
+      - enum:
+          - sifive,fu540-c000-pdma
+      - const: sifive,pdma0
+    description:
+      Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
+      Supported compatible strings are -
+      "sifive,fu540-c000-pdma" for the SiFive PDMA v0 as integrated onto the
+      SiFive FU540 chip resp and "sifive,pdma0" for the SiFive PDMA v0 IP block
+      with no chip integration tweaks.
 
   reg:
     maxItems: 1
@@ -34,6 +42,12 @@ properties:
     minItems: 1
     maxItems: 8
 
+  dma-channels:
+    description: For backwards-compatibility, the default value is 4
+    minimum: 1
+    maximum: 4
+    default: 4
+
   '#dma-cells':
     const: 1
 
@@ -48,8 +62,9 @@ additionalProperties: false
 examples:
   - |
     dma@3000000 {
-      compatible = "sifive,fu540-c000-pdma";
+      compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
       reg = <0x3000000 0x8000>;
+      dma-channels = <4>;
       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
       #dma-cells = <1>;
     };
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
