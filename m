Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CFFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dJgW6mm8oin/8g8wfwZIKP0SyYD1T2l+PBhlsfj4BI=; b=iTotWDMZIn6q3L
	AFR8XHBojfJNXo2zPY2lr121/28mRP5RrfOObbesqPFO5cfD9hg4NsGxMRE5pPs5lgHpEErBQO8q3
	L9+MGoMha52CaDz/vIXalfewKZbrsGIdpllcjDaxxFXXLTgQ8RL7Mm8bnhyXMct3FuutY0JBpEQ+j
	uHhI1wKXHW9xzgIOaC8dQZHFzcmcpWXYOF6uGmw+1/Jwk64pvb4dYXPpow1sjJYj8bVSZaxu4mBqK
	d6EhcXPFgadN/i7OO5AP8/tXcCq+fA7JYs6soGLhH94Q6FJO5/lBq5xvT5pg6Ke32C/rEuQsROXV5
	V7uu78tgeseE/LfOLT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJl-002V13-1W;
	Tue, 04 Apr 2023 18:23:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJj-002Uze-2d
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Apr 2023 18:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Gqxa4spepTnsUwVbNTwSWIuFxwC658E+AuuPxXktYUk=; b=IzxIjqE5nJEx0HTBZ39cSBXNYz
	47BBYZ1ZP3HAVqMtCY1uc7y2dwJIgqI82HStwP8nCz9fDaWJo34p0V0dxSRQwNPrtDpFB+pvFjjf5
	vZ3E00z3SFtkbiCjysjuEVN442Y7fimfhneJpRSU9H7kzuL33bQ2Ek6MLX59+2Bo4Z3gCcpkor+a0
	R1PUy8WRz0SuERzZTSYq9Ja4GvA3ishzY5OWcREeTw+Lv7YO5AugXbIEoOb9yXSS7POgCCUlZWA01
	+UDvKjq/eDAAH4dqmrfqFQREwV6VOcpCs40z3LOFN/NkmWlrGyJFg0Ys+m1e9MJcKn5rs9HE0diPp
	B5qchqYg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJd-009LZG-2z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:23:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id n14so16285372plc.8
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqxa4spepTnsUwVbNTwSWIuFxwC658E+AuuPxXktYUk=;
        b=kAvoNYqdv/gD8yskD/3UsIZZx/i7x6fcbhJrbItIXOVXMaf2J/ZphfqXiq9a0kB1u6
         PmIxtinJIL/VK4LPrFwgURCxv3uMUJaXR8WupowGpRdbZYxe85vGf7ADA3kpdGLGAjbw
         doyBX/v48bQyNdsiTbpiqy+9xqhSQ/wjueeo3mWjHXI7j5kcoXr3GBMPSRO6QBlcfYJL
         R/rE84Q8SYe+o93Fsj2ITB9DYOXg1jXgXV57Lpo/XLRh+NBFQ/p1nNn9hZqy4KxK2o/2
         A9STBeEYXkETh3CnhrVKqaS3widasWrESAX5SSaNCUkVwZAhEOTn5+5CcS1XD6b614hV
         WsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqxa4spepTnsUwVbNTwSWIuFxwC658E+AuuPxXktYUk=;
        b=1wDmpZkxUA8gihlXDD9tj+SXxjP5Ow39LSvucctRTZJjzmot8/4iHVYRIsdusIOGrC
         6/ysoZ/z0//pjn6dYF7Wy/rqOp5/JGOPqhWlH7SEX00kYpixMUAYKK5vlr9scrk9XxwZ
         jWuZzX0tFzObYGVgnLIl12LrMg3YjGMS3/LAwDtG+BfXv0/XkArs5VaL15TdE+94VYi+
         GXlfro5CLsCI6tVb9V4YZr5OZeE43R2nDURXUXzTzZwY9gQB+H79CZ+iGEJAu8H36WsJ
         8k7ZiHYm43nYY8gMdRFPz5W3+WGGFOGMDF9Sg31XUyChA2Xgo/SeGpp4jJOzEOzB83zU
         IlOQ==
X-Gm-Message-State: AAQBX9fIChMns4q8fPBsuHtdALLiAZ77BRxaNoEGaFBsp8td/8wryjRY
	W1fvPyGri1PmvxqsdbZ1d4PjQw==
X-Google-Smtp-Source: AKy350bWUm4xmbDDUw2nmPYP8Z7MtcO7/jXhnD91vBLbrD3SWPHhJwbKHL30pf+O4r7dr/bP2clOAg==
X-Received: by 2002:a05:6a20:6687:b0:db:6a5a:3ce7 with SMTP id o7-20020a056a20668700b000db6a5a3ce7mr2798195pzh.12.1680632608339;
        Tue, 04 Apr 2023 11:23:28 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 23/23] crypto: hisilicon/qm: Workaround to enable build with RISC-V clang
Date: Tue,  4 Apr 2023 23:50:37 +0530
Message-Id: <20230404182037.863533-24-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_192334_221132_CB75673E 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
allmodconfig build. The gcc tool chain builds this driver removing the
inline arm64 assembly code. However, clang for RISC-V tries to build
the arm64 assembly and below error is seen.

drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
                       "+Q" (*((char __iomem *)fun_base))
                       ^
It appears that RISC-V clang is not smart enough to detect
IS_ENABLED(CONFIG_ARM64) and remove the dead code.

As a workaround, move this check to preprocessing stage which works
with the RISC-V clang tool chain.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/crypto/hisilicon/qm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index e4c84433a88a..a5f521529ab2 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -611,13 +611,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
 static void qm_mb_write(struct hisi_qm *qm, const void *src)
 {
 	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
-	unsigned long tmp0 = 0, tmp1 = 0;
 
-	if (!IS_ENABLED(CONFIG_ARM64)) {
-		memcpy_toio(fun_base, src, 16);
-		dma_wmb();
-		return;
-	}
+#if IS_ENABLED(CONFIG_ARM64)
+	unsigned long tmp0 = 0, tmp1 = 0;
 
 	asm volatile("ldp %0, %1, %3\n"
 		     "stp %0, %1, %2\n"
@@ -627,6 +623,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		       "+Q" (*((char __iomem *)fun_base))
 		     : "Q" (*((char *)src))
 		     : "memory");
+#else
+	memcpy_toio(fun_base, src, 16);
+	dma_wmb();
+#endif
+
 }
 
 static int qm_mb_nolock(struct hisi_qm *qm, struct qm_mailbox *mailbox)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
