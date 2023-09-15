Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E07EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h/OovWphAPIRCPQCdExM+qht8dyrxTA4EuVLA7bDnKk=; b=btFogHzMNz0cuJ
	zTBJE71q/udDVGDiuZ43TbB0/eX9pIbJ0RcFnSeuuBvTqlOpJRXIOKbjq4qRwbcTxCyRCkh+HHTyY
	SORbZWXjX51OoW/iHSn/lnUxOB/5+CVZLi0EoquqqVv+x1m53h97C5BOrH9T++58VNPEDpT3qC/YS
	ViInFeQPYTl2A5wQtZnk670dFSMPe2/0Eee3NrKkY5DS+c/HLPlkPnSaih3ezUkSDxHYxvxfQYLci
	vn6jiGIC+GivAlZ2ZvjP2He9k5rWpRrk78SpBCrT6CJxd8gQsunLQhZJePBcHP1R/xB/xKxchl5+C
	IiilfqNJ6etULPG+XLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Bm-00A1LY-26;
	Fri, 15 Sep 2023 07:24:30 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Bk-00A1K9-23
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:24:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso1444228a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762665; x=1695367465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJzMSRsFGWXl1x3CI8KZnuJ0K/8zXSh3L5yWA+KvyC4=;
        b=DMustf5COsYKsOsO7ZlndXnjz0tkTcHI56oiTNrN2X/yMajRGWJkc6Hl5MyZCJzmC5
         ScIFiN4uDb0fGK7SuLYXB+rsW28grNjuNMHnv8XpIF29R00IQEfHPQjnIYTE7DnM45a0
         RNCk3LlKqfIJ0E7r/q0gQ9HCwxywMHJWFy7mgNQgolC30I5V7OR3xQhRKThQogRUAZ6L
         tiyWLbdUt+xh2YljnGfHkx/vyEvBsEUJjr97FMcqeQplC87qvQOK/xPR2f+Ha8xw2zmI
         Gs45MUHw9mfqZAQhDG4LDNSf9skBAp7no2KtgzUzb0FuwvIqMyw1MRxrPJ6G8oZI8bXU
         gUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762665; x=1695367465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJzMSRsFGWXl1x3CI8KZnuJ0K/8zXSh3L5yWA+KvyC4=;
        b=IkaN5RpoP67AxdpkqvkKorSm/Ts4+4IlcVfLzzw2sRlvltO7pHBuHUeFX/LOdCirtS
         ji5st9bgNziooewNtP5+xJSuleJeMa0+bHg7UJtBDb36NFONs9iF63e2f+bh43OOPJaX
         ozZ/PBwYcvji5kCWgCoQBcMAx6LENpywT815CWoRwNztZ3snhgUroSopMfhYYzRY6D9N
         a6ufWNWp6vhwM9NGPwU/9oJiJ87QLLbjibtBaeAEtIVjQGi8aACznrD4h0IYku5ua4av
         4Xrj6Zu2QzZWbtKo7Moqu5fh/26Xfq5tCwIqeDMnDbTJZEuMIwk34nP0/s8n/s/hQ3Hc
         QKCg==
X-Gm-Message-State: AOJu0YwCfrIjrNd0VTWPTE+b7LuMwY/VBU1/KQ4Pth9FRds/dccb87Wo
	mOoFgws6F6thfDzEPmq++y4TY7zqMWy42A==
X-Google-Smtp-Source: AGHT+IGcjDGq/pgBeaCYUPSCvCko2Srj453SkMBJJGtrdJ8Q+8SCbaXebokzJrDTdZf7vscyLfhB/Q==
X-Received: by 2002:a17:90b:4a0d:b0:274:862f:3433 with SMTP id kk13-20020a17090b4a0d00b00274862f3433mr656664pjb.18.1694762665416;
        Fri, 15 Sep 2023 00:24:25 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b0026b420ae167sm4590589pjb.17.2023.09.15.00.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:24:25 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH 06/12] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Fri, 15 Sep 2023 15:24:15 +0800
Message-Id: <20230915072415.118100-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002428_677673_E8F1C9F4 
X-CRM114-Status: GOOD (  10.30  )
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

From: Inochi Amaoto <inochiama@outlook.com>

The timer and ipi(mswi) of sg2042 are on different addresses. With the
same compatible string, this will cause a mismatch when is processed by
SBI.

Add two new compatible string formatted like `C9xx-clint-xxx` to identify
the timer and ipi device separately, and do not allow c900-clint as the
fallback to avoid conflict.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../bindings/timer/sifive,clint.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a0185e15a42f..2a86b80c3f1e 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -39,6 +39,14 @@ properties:
               - allwinner,sun20i-d1-clint
               - thead,th1520-clint
           - const: thead,c900-clint
+      - items:
+          - enum:
+              - sophgo,sg2042-clint-mtimer
+          - const: thead,c900-clint-mtimer
+      - items:
+          - enum:
+              - sophgo,sg2042-clint-mswi
+          - const: thead,c900-clint-mswi
       - items:
           - const: sifive,clint0
           - const: riscv,clint0
@@ -74,4 +82,22 @@ examples:
                             <&cpu4intc 3>, <&cpu4intc 7>;
        reg = <0x2000000 0x10000>;
     };
+  - |
+    clint-mtimer@ac010000 {
+      compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac010000 0x00007ff8>;
+    };
+  - |
+    clint-mswi@94000000 {
+      compatible = "sophgo,sg2042-clint-mswi", "thead,c900-clint-mswi";
+      interrupts-extended = <&cpu1intc 3>,
+                            <&cpu2intc 3>,
+                            <&cpu3intc 3>,
+                            <&cpu4intc 3>;
+      reg = <0x94000000 0x00004000>;
+    };
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
