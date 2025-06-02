Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A2AC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yaNG/XeWfz6dfClYjwHhYyuUtIXcsj/oZIYQbEBhceU=; b=hfE5DXomlBE9qz
	HCKgJXdQjJMJ7WKfdhH3xSdMQnZJ1yvjrt4iA9vhq6ywPMTrT4FvguJ3mrCWM2Ulh/xVygKvFiT8T
	+Dp1A6esPtTv3c2KuGaPtwg1RCgI+DNkd7sannmrhacOZsv1R/HBSk3x5Iu3ok8aGgTav+YI1yhLr
	ZXIXa4yqcYAkwMZqihUFq9dTyGechr21Kxa04vmd4gg1hii/2T62yZOIIEOFtDIxgbCXLCCx6bVxB
	oJ2Vd8LvFXmrNdeVlxZkQ3vNnHv61UBu9EKcepaEedSG+aoF/9V6EwF1P+oSY+EpTmO6EPzemsI+h
	78+jgirBJLqUBoTgiLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM454-00000007LJO-07zz;
	Mon, 02 Jun 2025 12:15:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM451-00000007LIg-0VXl
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 12:15:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c9563fd9so3468360b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748866549; x=1749471349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDaX+Ms/JxaHPiO5VVVHhufwbnzZiaWoNqvnoO02z4M=;
        b=sqffABrR4dyPNs9UJl0QRW+20LIF3FazBf+x5x5+yWkRgGPQKHqOwlMG9pFwqENqZL
         C6xA/J/XABviCRxkFOGLqwvNM8pJnL2cCqx2x+AyyrSCnIiJtXhpcp2DMg/+C3vY9lIv
         W9U6ZTao5QgM9Mwu9IFcaaZ3vHVIg3Acjj89FY62cOtEZP2qDOFlqUNf8TP4KDvx/LGB
         JmPRxIhLgjxOZPVF0Kvqit/py3BJ2fzkz42qLZn0f77rgUT4RONgfsjpqf9HqF+75cGU
         EfrJWY6ZH7AI3UQl6HB84Z4LJ5TQ1syAx8R7yp7wpWOCQI1ws0ug4SCWuXlIqjlF3jg0
         tkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748866549; x=1749471349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDaX+Ms/JxaHPiO5VVVHhufwbnzZiaWoNqvnoO02z4M=;
        b=j2hS5OIpsMF/fTVLw3EzlAZC0hGiT6oMfm2DwngMo1buXn9nC+sYXsCLctAZaHTdnQ
         01MfaJ9qySYe19Gybc5UsDWc//91Zfa19WlbI/umNNsLI3QcOCi7M1CHSx09/8r6HU95
         XgPGrAhuKWKfixin4is0QHakOHgoSIqtAd0+DoX/o0zVeH3N+5Bhn5vIx6VVCf+tzU7l
         bikkrgBZoPQh2TQqVL5WSu3XQFua2PfPB+Et7nNE2eABZheS/EoNjO8B2IKv4FaDtQDW
         VY/PWlana6ST9JqMELNRwpVqWdzs3UgQ+SJaBt7+dj7G+cuZrDpAI5m4bkwJgG9pwHTN
         KLtg==
X-Forwarded-Encrypted: i=1; AJvYcCUyGk0xYIVPfvD/v2lKYTLsFhp46LClf563RhXR1e2jkRskALuh58pO9HzmTmGAa2dr7RGnBt0N2I32uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyblxKAZW3VDYd3DFP84hj2pACxGW4vwmgEJVVZe3TWUMdDFp85
	5lBCw18uDDfa5iHM1rWG0guVug493MQpSg/+2mqiENustAoyouJz7YUlXWmYXf8E+0M=
X-Gm-Gg: ASbGncutjpI0Ih/b9UzCJ9VCcLX84mYH08fJrR24HNB8QwPgVF0Q9Hi90MA4a7M1AbD
	9nGbRR4VJbXqIxhqzE5j9eA/Talx/M4cVHG3/P/U1r5sVOAJzo++zeViHHbzezc0t+5sUcCh9av
	2Uc5Ou5njpY9HDE3zoW963dytVtJ0FqTNEfO4aNeRL+I4SDBFicI/ISq6lJYiI6rzxtv9sNmzBF
	yzLaf68NHcotgc+OhcT1ekOoYEMdBcQYAhGI5CmJB8xVGsKZQlHQg54ljWpKkNblAqW4VTIsQ2O
	76RRV7EnU34Rk2JiBsh+o/c62R8f4f/LoAD4p5B+gVUWAhmL6lWZXX8yhoQOxrm7D10jMuoG13d
	anLjwOeRUFoZrIy8BbI4BP9vsRrmPBnvVIA==
X-Google-Smtp-Source: AGHT+IE3ZZ9XZVrG6e5pbAOnOlFdHoHvNeeSOVeQA16FfBQLzHeudQW2FyoTDts8Gqcjz/FT+Fd4nw==
X-Received: by 2002:a05:6a20:6a21:b0:215:db66:2a33 with SMTP id adf61e73a8af0-21adff6bccfmr17082491637.16.1748866549492;
        Mon, 02 Jun 2025 05:15:49 -0700 (PDT)
Received: from alexghiti.ba.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabb13sm7717558b3a.62.2025.06.02.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:15:48 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: uaccess: Only restore the CSR_STATUS SUM bit
Date: Mon,  2 Jun 2025 12:15:43 +0000
Message-Id: <20250602121543.1544278-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3042; i=alexghiti@rivosinc.com; h=from:subject; bh=QR8/6bas1i5/uuucvXOTT2dS9uCkrhYuqeChIu397zo=; b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJsp+7xv/FpyfOAyAnx+5OMt+/98OSGzSqedU4xBxXyo 5Wby3k7OkpZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjARt7cM/9O2tifwbXyTkmtz 9+b3FbHNsYuPnG9dGuKhfeGWlMOdN74M/2Nk7k89Zhv07Zbim+9Lnxz4HH3p1Ub2nULFb+QzyyX 3ObMDAA==
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp; fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_051551_313121_4DE55D8B 
X-CRM114-Status: GOOD (  11.44  )
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

From: Cyril Bur <cyrilbur@tenstorrent.com>

During switch to csrs will OR the value of the register into the
corresponding csr. In this case we're only interested in restoring the
SUM bit not the entire register.

Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
Link: https://lore.kernel.org/r/20250522160954.429333-1-cyrilbur@tenstorrent.com
Co-developed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
 - Rename status field
 - Remove a comment
 - Fix Fixes tag

 arch/riscv/include/asm/processor.h | 2 +-
 arch/riscv/kernel/asm-offsets.c    | 6 +++---
 arch/riscv/kernel/entry.S          | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 7bcbb908798f2..05eb65fe95789 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -111,7 +111,7 @@ struct thread_struct {
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
 	unsigned long envcfg;
-	unsigned long status;
+	unsigned long sum;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 3aa5f56a84e9a..e4d55126dc3eb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -34,7 +34,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
-	OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
+	OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
@@ -351,8 +351,8 @@ void asm_offsets(void)
 		  offsetof(struct task_struct, thread.s[11])
 		- offsetof(struct task_struct, thread.ra)
 	);
-	DEFINE(TASK_THREAD_STATUS_RA,
-		  offsetof(struct task_struct, thread.status)
+	DEFINE(TASK_THREAD_SUM_RA,
+		  offsetof(struct task_struct, thread.sum)
 		- offsetof(struct task_struct, thread.ra)
 	);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d3cb515fb1596..77e334f7cbe4b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -427,14 +427,15 @@ SYM_FUNC_START(__switch_to)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
 	/* save the user space access flag */
-	li    s0, SR_SUM
-	csrr  s1, CSR_STATUS
-	REG_S s1, TASK_THREAD_STATUS_RA(a3)
+	csrr  s0, CSR_STATUS
+	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
-	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
+	REG_L s0,  TASK_THREAD_SUM_RA(a4)
+	li    s1,  SR_SUM
+	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
