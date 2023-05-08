Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBD2C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MoyZ2Xy+Xyy6+9TmHm5vAJLSA3vzy2K15Qb9+4Ffqk=; b=LII/nvPNA9ipBq
	jhZdrCIJ8h9Zru08b0ok2bVd54HjlCz9i4nEGQSe76qJcTvGKjt7FOzbkleGtUefhRtheUMCh6/41
	/pByWSMoRnbo/FYTSLL1zqkLE2Dy4kZyFHV2emzQUhc7kto6/vhln5N7JXjHXTjNsMx7qt5kbNXjL
	oAoXF+2voRuXMMVorLWNljQwmtno/ZGj1BTeojiEiuk8yGVn16fk+SORW0bHw0NjafxvYKFm5ZRv9
	ut52KV4y5TnIThNMc/G9G+c9kkIlRjzstO0BEZej4MZNNRA09z9CiCnYs6WK4P43Dbgkc4TpCOJ+E
	s0/ZAIKh3rQjOgnSgDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0Tp-000Zqt-0E;
	Mon, 08 May 2023 13:00:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzQf-000RyW-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:53:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aaf706768cso33123015ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546800; x=1686138800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd6PQ1vE/SZdiXRk2V4YVd/9ukw5PfEy62nQ6sf0Uk0=;
        b=Wj+BdFY08go+Klnkl9ikMjatb5QJpTO2cewG54fs1b3lW77HcXNjgQTN2vzRD/j8ke
         U3yyKNS6ssEcggGMDfAXgwZPVb+FBmqfOr+Em+1ArsfHhZf2wSJZfgC6VkUq+JwWgyLn
         g+RLMWOOtmon/m7EVa2DCP+ETl1ECCK4M3nMIjFho7LKvb2yNVDCezwfPiVlDcs9QJCj
         8LW7073DSm3mdChDFXxsHRRaDLUKp6u28cqpHj2tCtL9vO7xzRypFejOqMQyJUAGg7RB
         COx5W+bUevsvQur/1Cp+1+YUYxa7JkuqnS6OOhyy6oxt/zn2DyhnlYWkHpifR+QPUO6n
         siaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546800; x=1686138800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd6PQ1vE/SZdiXRk2V4YVd/9ukw5PfEy62nQ6sf0Uk0=;
        b=XcnDeYR4inUUdmIlsUrr19YZDVRi4rsNAIhdP2wvpDozGs8ZV/1TR8+Q6mnWgfF0vv
         Bh/SrnC8cJIhKa+KV/9eUScQ9FT9CYGHswiUYviz4lLo1HKR23QxHe/oUKk0APQkcCgr
         z2OCslRW4D83EEsox+Fvfz/mohFXAzZ6sJ2XG5sE2dT0SIu0stqkS4SOj4G/L3iIJOrp
         Nd/sysV098OoWd4iBZdFKKimntlpksV3l+6eWmWKPS5OhH7FXyVqGI/SnAyPLVQN/QUh
         OC4ZLNI0L9MbWuuTbkNNDeGs2yW/MwEp5ji0reT4L6nYeU0mClMbetH7IvX6sYOpv1nF
         eXKQ==
X-Gm-Message-State: AC+VfDxW8Dn6xwHXCv7pWdmUs3CD/W6iwrjQEr9yAOMn6iwevG0LMn9X
	otJHzzx24du/Vxt+eC8dqp0liQ==
X-Google-Smtp-Source: ACHHUZ44JOKf09v8SpLqQAPymUJYFxrBhM0oK44TrPeFKd+o5n6tK/8ozBu8m8cH4Q+O9X7/qncP4w==
X-Received: by 2002:a17:903:1252:b0:1aa:f0a7:933 with SMTP id u18-20020a170903125200b001aaf0a70933mr12699535plh.25.1683546800261;
        Mon, 08 May 2023 04:53:20 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 03/21] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
Date: Mon,  8 May 2023 17:22:19 +0530
Message-Id: <20230508115237.216337-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045321_479545_26ED9AE6 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
allmodconfig build. However, build fails with clang and below
error is seen.

drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
                       "+Q" (*((char __iomem *)fun_base))
                       ^
This is expected error with clang due to the way it is designed.

To fix this issue, move arm64 assembly code under #if.

Link: https://github.com/ClangBuiltLinux/linux/issues/999
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
[sunilvl@ventanamicro.com: Moved tmp0 and tmp1 into the #if]
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/crypto/hisilicon/qm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index ad0c042b5e66..2eaeaac2e246 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -610,13 +610,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
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
@@ -626,6 +622,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
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
