Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351ECCA487
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKEpZ6PXCIIn/xfVSOOYu2Hf+Xt5gQXxKjfifTE64BY=; b=tWXBiEsedyCPJ9
	5WVdoUJ/9MZmzD+HEIfKP0qfoEWZMjiJlIrDjNTkRDa+BoEGf5dJhQv/psdDtcp1994YuTrKBByet
	Es957/2YAOSc0cSkbxnijuo1gnLiSYxvrMOvbuJqVVHH6QfxcPtAXujmkpq2bI3NKKChwluFWp66y
	mf98QMEnu5woo600DiLNfH3sEE0pcYv1F4wgY1zRE3X3YEhRnmR21rS+WoERr4trS2nOSrM0NNK5U
	p1+whNy2FJPqoAlgoU3GrGCI7QSzkWTE5Geq/8LbbA0/mhufWAw06wwepIzwuKPoS/CmL7B4li0r7
	E/8JF7I/mLJQz43nnlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIf-009oOu-LD; Wed, 20 Jul 2022 19:24:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIZ-009oDu-Nj
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 19:23:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id c6so15861762pla.6
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=iGs/G8Fk8ICWu/8fkztpMX5VcYaKBChHqfCs1g5Yp+fv5KwxH+DRPv+4Cn9Le5g9hq
         5g2I2tD2ixzrPbpgPQSJSEcBaa1BeEyrnJ+uyosHqPFaWgXDfL2YVrSv3v/NtEukLPuW
         RCVHM/eSjFmbUh1z9d2RCywE+GRiF6jYxX2Dv0ppyXm4qaCZ498dXsnvvt428KcKUzlg
         bnmpjbxCLgFb851k+iBmTb02jv5bwsI8tB1hKW24E867I8ebe4Sm1ETvxpJ01mDEQIJG
         R0Sbj2sgj5wCd2H6wstT6sWfqMUoXQ3UZlOVdFy3okYNSStxgxE4GEN5XOeIfpk4LsTD
         /M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=ka0afBUhtdQvtpZILxT56uySp/B0dxyD1ABDAk2x006xK9KPg1LCmrl45n5e19xPYn
         jCnhmKB8Qnn7ffs3hhdwhMweUDD++JDqTCaMX9ilretrwbicK8GwmdOaxLT2yDTmW6Ir
         MiU4yudRt7AtqowMZCD25AFKeReCVvnYDmrHQjUVlnAoYbOLKbu/P4DzBvwWeM2It3Pt
         KqHRdWS5uFUh7AQKzAXwssxoZLrY2bLRSKV4ASBSvoMigGaEZEKKAEeipZxixtjzMei3
         2Y0qHqYf2VglMGurrK+I9OklzEreTDE350Agag4qfPDf8DW//X9W5dntyuympgXdjQtE
         faIg==
X-Gm-Message-State: AJIora8UoozhrbWvtnmL8ZU/lkvW6n58fvXHD6x8xgVr+N1+qbQxjiN7
	RO2VyNqc7k21w+MIjc6h7p0ypA==
X-Google-Smtp-Source: AGRyM1uO6DuNqM2Sqju5yNtntBjmlH8f8n/3L/OrpS4Iy1m8+BKt/id8mOYe3xVwttvCP45QG4aMPw==
X-Received: by 2002:a17:902:d2d1:b0:16c:223e:a3db with SMTP id n17-20020a170902d2d100b0016c223ea3dbmr40728628plc.37.1658345032791;
        Wed, 20 Jul 2022 12:23:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b0016d2e772550sm219902pli.175.2022.07.20.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:23:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Liu Shaohua <liush@allwinnertech.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v5 1/4] RISC-V: Add SSTC extension CSR details
Date: Wed, 20 Jul 2022 12:23:39 -0700
Message-Id: <20220720192342.3428144-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720192342.3428144-1-atishp@rivosinc.com>
References: <20220720192342.3428144-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_122355_805251_C6CAFBFB 
X-CRM114-Status: UNSURE (   8.46  )
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

This patch just introduces the required CSR fields related to the
SSTC extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 17516afc389a..0e571f6483d9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -247,6 +247,9 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_STIMECMP		0x14D
+#define CSR_STIMECMPH		0x15D
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -256,6 +259,8 @@
 #define CSR_VSTVAL		0x243
 #define CSR_VSIP		0x244
 #define CSR_VSATP		0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 #define CSR_HSTATUS		0x600
 #define CSR_HEDELEG		0x602
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
