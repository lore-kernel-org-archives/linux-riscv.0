Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD38C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maqdqWNNp9+MGuB453l8it+gQyI0S9EDy655HHNSWMM=; b=LWGlYgXHwrQg5I
	EkEA80BBfv/3uoPHvMe6In14F58JS3fDkJW98rPfXl0vffSuPPvX1mFmpT7X94B+qj2zAeS5I+27v
	cr/VTZe55rN+JHGaUQBPbOeUDyB21CN7BHORmdfAr/NouS9SfFBfiH5oXUtofqYL+D33vHalHYHRw
	58NClHpQfijEZYhGUHj/yyAQ4EThsdTd7YjgRpreFN7O18KsqMZ213ufTjzL0eEjOw2RUCpi0+8Fv
	L19v+gDCPnfy007fA4Nb10rwPrx6KkYK3o+DQXifgXU/6SbGkXz/j4xn6AxYGlmb6HXY9Cb43XX3V
	eyfpZkzFizfPDlyA0TTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5t-000zfm-1N;
	Mon, 15 May 2023 05:50:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR5q-000zeB-2E
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ab13da70a3so119189975ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129797; x=1686721797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CWREIVCWjShI+1eEDBl6O/SQK7CU6Z/SOibOv3uDSU=;
        b=LaizqtRgx/46L7XZEEzAvGKk4DNL3cxT+KIJNCUnMf1yMdp2SUe33zOAN2WuA/4Nqa
         /LAFe6wDAvy8FAPxcIeoG6pPGKyP6nl643DNNFL+KPrNAFuDHIzEULjjVMBFtvhXZzUU
         pClnyaZQBT8RE1o5wOtGg7i+edZHRt2vGxLDwpWY4uqkjm3mPWxvLn7PvAmlO976y4M0
         SSdEWmIR2ddEnCrxb+0vrKy8bmwG0oqJe+I2DEh54a35nyzrEg+fQkaZPlfSFerS15iE
         iEhZ5R5TSoza6gkAxEX9fBXrJ2cae0PtGLkCNNS86q654yu8Vd7Utmk9+mrWq4i6JeA9
         Nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129797; x=1686721797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CWREIVCWjShI+1eEDBl6O/SQK7CU6Z/SOibOv3uDSU=;
        b=U3u67VfIumrkQ8vcgTornyd5lutmAmj3Dg3fnE6bwJrLnvp4/gO6opKhI1Z1UxpxT9
         smNpVXdq6wBG3bSyRDflvpCAe+T8KS+SOsGeRBXCawHIHZQslW1oUqun9vCfjU0bhYWq
         jO1/ujD0azfWx7jBpGIaBN7kM7v+YJZK8SU4ljFWce5sg+6mXcPCMHwoND57CYJO1u18
         GDDTvQX8g0D0rJAT4b1qlk5oq62dr/KCArcrOR3z6e0g2NtBuQPmGKBlIgJVyHWryDdg
         2CS9+QcMeN15GPn6/WoASODdlSDVsthMYafUx5kobniDcrM7f0t5MMnNHzntLMM038id
         XifQ==
X-Gm-Message-State: AC+VfDxoj7rR6U2S0/4lo3jLUDyurjNk6W+PjQfMFsRTN6asITwKDaRd
	2vNeLXEMztyGVlohZNEaohN3lw==
X-Google-Smtp-Source: ACHHUZ5SBnZH4w/8kTkRxhSGgZWYJARyq6N8PLdcSNQB6VCfLcCyIRX0eY9eHJdSC6V7hPlOF0bM/g==
X-Received: by 2002:a17:902:ab89:b0:1ad:1c22:1b53 with SMTP id f9-20020a170902ab8900b001ad1c221b53mr16090936plr.40.1684129797303;
        Sun, 14 May 2023 22:49:57 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 03/21] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
Date: Mon, 15 May 2023 11:19:10 +0530
Message-Id: <20230515054928.2079268-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_224958_726311_BA191463 
X-CRM114-Status: GOOD (  10.56  )
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
 drivers/crypto/hisilicon/qm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index ad0c042b5e66..edc6fd44e7ca 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -610,7 +610,10 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
 static void qm_mb_write(struct hisi_qm *qm, const void *src)
 {
 	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
+
+#if IS_ENABLED(CONFIG_ARM64)
 	unsigned long tmp0 = 0, tmp1 = 0;
+#endif
 
 	if (!IS_ENABLED(CONFIG_ARM64)) {
 		memcpy_toio(fun_base, src, 16);
@@ -618,6 +621,7 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		return;
 	}
 
+#if IS_ENABLED(CONFIG_ARM64)
 	asm volatile("ldp %0, %1, %3\n"
 		     "stp %0, %1, %2\n"
 		     "dmb oshst\n"
@@ -626,6 +630,7 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		       "+Q" (*((char __iomem *)fun_base))
 		     : "Q" (*((char *)src))
 		     : "memory");
+#endif
 }
 
 static int qm_mb_nolock(struct hisi_qm *qm, struct qm_mailbox *mailbox)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
