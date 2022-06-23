Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21411C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXpl8cuyq8VBiqqKbpuQ+RJgg9fUbPuCUIIITGSB0u8=; b=kwBBMl+fA4/Qys
	5SoYIewWxEnlQzk0nz/GRM6+s2SeQaG+kAiBSnCdjV1aOFj4myyq0K4ebSTfq4yQN1IeJwmdXI3h8
	La8mGH1erMt1ILnlVaLHTUB6c22OnxUXvcBN0dT9E6ubPcfxrfj1QIY6GfPjp95wyrAI/JSUn+qKG
	TTTngL1NbWt5bDRq+Y1jnRE6l57HFsQEoMsmkM0dZ5cJo5AogGS3hSBsAE8INM6m7knqvbIWgg7qB
	pUaSTB5+uWdo06PWZyRbNS2+iQF5aynOT9y3GEISPBBLT4Xl5fELQmyuoQ+oc/59qQL/HLnrP0+C9
	hlFMmzumATF9G896PaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4L1T-00Ej7T-PK; Thu, 23 Jun 2022 11:29:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4L1M-00Ej2v-HE
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 11:29:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q6so3423573eji.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5PmuIo7mYW3CN+sFVEg61+n+8PCcK1fiGszLtqNBkE=;
        b=P3gPXxuZ6ksVlpTZiR36XjCGEeVdjZXDDLl4AQ/oh28NtYEm4DU9LantR/Dlct0XCl
         Z0w6zQCjHnnQ3mQ5xztonY9oSX9xHdgUmXlbzw6DyxVEQ9G3A7qPbfDy4i+zLek/np0V
         By4/BOrqGqbieW260s2Iq1bfkMoWkbzL8pWc+qxWFKZXDO2/Ug6Zqqd5f4Kf3G398Sn+
         ioQBmIUqacMOHM2JHrkc7s/vWXHFt+rOS/bW76vohiiXyhlWmY0zdemkVC/gO5xOJt0r
         kms8boIoKhlyOzgR+wY6NKkDzBXCohJPGA+ln3OpfZ3mtHgp1p485glfr4ZVtKWTU/ej
         VQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5PmuIo7mYW3CN+sFVEg61+n+8PCcK1fiGszLtqNBkE=;
        b=ujuyJZruAfz6rRCaR/RyEoxTistqTb6Ih3BFz/C7Gg3kMrXffRTJyafUwDSbptKbDH
         Pt+MUeGQCctQ/FB4S1T/FBtMIWpBt5YaJE7GC5YF3ySIvQX3b8QCORrc9GcwB+I9vfLK
         Ca1mvmN4hLmMcUMP24K06O4IRhJvALr+nEpnhBTthGCkkPnoYK8HcnehmflHoWIddx4L
         7SHgqBZUZ3TkcC11SNQRIKVyQpYzD6qqgYD5nVcwXx9bkIz8ePq5bFnc23hMae8KuY9x
         SP6W6uqV63AL6Mvv4gZxOzMFVeAe9qCLXo0opzRW0pxeEEOMOGQpCRtUml31L2nfW5cm
         5IZg==
X-Gm-Message-State: AJIora84TL4R1o+s6nxImVUyR4JQQjmOBQpw2ddkrD+VZ2UFg/89vieq
	aiSN5RXC6v61JbRfO0wKL7Xx+g==
X-Google-Smtp-Source: AGRyM1vlJNeyno6YRTMSYN5fCFkHIVRrt2/G/UFpHdTwakW1nLE5XtZkaNm9rgjUJE5W33x19uhZCw==
X-Received: by 2002:a17:907:da1:b0:722:bc0b:4f4c with SMTP id go33-20020a1709070da100b00722bc0b4f4cmr7761188ejc.761.1655983748760;
        Thu, 23 Jun 2022 04:29:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y11-20020a17090614cb00b00712057b037fsm10268110ejc.167.2022.06.23.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:29:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: traps_misaligned: do not duplicate stringify
Date: Thu, 23 Jun 2022 13:29:05 +0200
Message-Id: <20220623112905.253157-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042912_640799_0399D831 
X-CRM114-Status: UNSURE (   9.35  )
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

Use existing stringify macro from the kernel headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/riscv/kernel/traps_misaligned.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 46c4dafe3ba0..378f5b151443 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -7,6 +7,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/irq.h>
+#include <linux/stringify.h>
 
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -150,9 +151,6 @@
 #define PRECISION_S 0
 #define PRECISION_D 1
 
-#define STR(x) XSTR(x)
-#define XSTR(x) #x
-
 #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type, insn)			\
 static inline type load_##type(const type *addr)			\
 {									\
@@ -207,9 +205,9 @@ static inline ulong get_insn(ulong mepc)
 	asm ("and %[tmp], %[addr], 2\n"
 		"bnez %[tmp], 1f\n"
 #if defined(CONFIG_64BIT)
-		STR(LWU) " %[insn], (%[addr])\n"
+		__stringify(LWU) " %[insn], (%[addr])\n"
 #else
-		STR(LW) " %[insn], (%[addr])\n"
+		__stringify(LW) " %[insn], (%[addr])\n"
 #endif
 		"and %[tmp], %[insn], %[rvc_mask]\n"
 		"beq %[tmp], %[rvc_mask], 2f\n"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
