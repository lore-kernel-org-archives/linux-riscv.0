Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE5D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BNdLuGSVpLQHzDF5hlHVxQ62QfbQ1IjCHZQ0M0xtH8=; b=fLszjCNt/0ODHU
	Tb0+KUVbk69TMFMiZbHWvVW5vlE5jytnNuAy4nHbBlnIlvnzxkieratMgaSfPrBB46H4s0R3WR9e7
	wCNA6rojinZUWLUiz6g3y3z2H54FfOj/K+5X9piDup5IHbFtAjNPW6rfXKVIyH85l+mS3QP412/M0
	dkfjVuI8Jwrv8JddXv5ZPyEWOCHPG/O4daxGqecCejHaxtfBFifJl9FSGUl4xlhvE95vFum8vTt8O
	qat3qFD0QZwCAin52HjRlWDl+07HIVDHqCrHTajnadfT+n0uQyi/qwIWjelx5MC9YGw6b01mMUXbq
	w3CKcQR91E6JVI+yZM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buG-00000005MrV-1PlI;
	Sun, 20 Oct 2024 19:48:04 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu4-00000005MgP-2ave
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so2731252a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453672; x=1730058472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfThf6WSDtXeJLGF9IIFos3c8UFbvclgKv7arl05kb4=;
        b=noz8kbRB+LU4E+CNd5B+PyEioDI78arVgYpnLExtXHgueekXTp7Kzm+0rULNCzjr3E
         eyBrpUrttl0o9vS2kM0RfaH5wIfd2lod3/37tNhAtgLKPMaO9litbmxMZRjretOqabY6
         l0kDW0FjqsqS2l4dWEWXpGlOW79YMbcGYfUViURBspBh0zA6mnf2H0yhqn260W1Q3RQF
         Yefe4mIT8RkqdWY1+IrYjgKH9szO/5xSsvLKmGtqDn2Z8DH8Gt6As++QDNxFo930sAQ4
         uxXu61iBT74Zt6CYFhrTs0iy6EKJqNh+5W01CNISqYCySP57qxL768l9bkUeW6mPeD/f
         2uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453672; x=1730058472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfThf6WSDtXeJLGF9IIFos3c8UFbvclgKv7arl05kb4=;
        b=Tg1SG/+LPrDEDJeCgkW0MtffK0UfHtFCOB9Wpsq3fl5gjB8lUhdr6vGpKSv61tBNi2
         R9ougNlQ9wt8Pw/EhcRIYkFHe+g8ao3qkXEFfCKfHW2j/+ah2LoPbTTDke3Vi/zmhaPq
         yFEykdKvEeKjgcyA7h7i1z7xcUSF6wu25LgS9WxiLQu+CllMFOsXkFmJxakKFrVz1/NY
         o7qeVNNxAXBLsIknzQ/dQzxI9+cAVymka0NGalPtMqylt15U+y0RFggTWYVOEe4qIFnK
         oWWsJv7ItFx7uD7j0y8adwUDhEF00g7lcEDOYgTIchvWqbIyE8zBw/w1DTuvdD8TfVZZ
         TMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+SWWZbXh4Kzmjy8LYsHEgQNzAQTvMjxemh5fQnk6Hn5h/C1zib5i05pBthzvUocIargslsLpb5Z9Pag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY5xThFk6QOaYg03EfeK+e4/unaEFlwoMvTkyf9TEjaRJjIH1D
	CvUeGioUuJZ7gtMd0TXPtUc5fCHJzgMrYlpYbcMccUzG4IlUSMTGkuaXdMWzoOw=
X-Google-Smtp-Source: AGHT+IHJeZE9HrX0oYl24Mbcflj7S1QWZQW1xGijDT99BYjkFVqjYvyBRxHehmfkCt5Hnq51re8yqA==
X-Received: by 2002:a17:90b:4a0c:b0:2e2:b3f8:b549 with SMTP id 98e67ed59e1d1-2e561650b59mr11476427a91.23.1729453671610;
        Sun, 20 Oct 2024 12:47:51 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 04/13] RISC-V: KVM: Break down the __kvm_riscv_switch_to() into macros
Date: Mon, 21 Oct 2024 01:17:25 +0530
Message-ID: <20241020194734.58686-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124752_718029_F0266293 
X-CRM114-Status: UNSURE (   8.53  )
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

Break down the __kvm_riscv_switch_to() function into macros so that
these macros can be later re-used by SBI NACL extension based low-level
switch function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_switch.S | 52 +++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 3f8cbc21a644..9f13e5ce6a18 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -11,11 +11,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/csr.h>
 
-	.text
-	.altmacro
-	.option norelax
-
-SYM_FUNC_START(__kvm_riscv_switch_to)
+.macro SAVE_HOST_GPRS
 	/* Save Host GPRs (except A0 and T0-T6) */
 	REG_S	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_S	sp, (KVM_ARCH_HOST_SP)(a0)
@@ -40,10 +36,12 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
+.endm
 
+.macro SAVE_HOST_AND_RESTORE_GUEST_CSRS __resume_addr
 	/* Load Guest CSR values */
 	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
-	la	t1, .Lkvm_switch_return
+	la	t1, \__resume_addr
 	REG_L	t2, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
@@ -62,7 +60,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
 	REG_S	t1, (KVM_ARCH_HOST_STVEC)(a0)
 	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+.endm
 
+.macro RESTORE_GUEST_GPRS
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_GUEST_SP)(a0)
@@ -97,13 +97,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 
 	/* Restore Guest A0 */
 	REG_L	a0, (KVM_ARCH_GUEST_A0)(a0)
+.endm
 
-	/* Resume Guest */
-	sret
-
-	/* Back to Host */
-	.align 2
-.Lkvm_switch_return:
+.macro SAVE_GUEST_GPRS
 	/* Swap Guest A0 with SSCRATCH */
 	csrrw	a0, CSR_SSCRATCH, a0
 
@@ -138,7 +134,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t4, (KVM_ARCH_GUEST_T4)(a0)
 	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
+.endm
 
+.macro SAVE_GUEST_AND_RESTORE_HOST_CSRS
 	/* Load Host CSR values */
 	REG_L	t0, (KVM_ARCH_HOST_STVEC)(a0)
 	REG_L	t1, (KVM_ARCH_HOST_SSCRATCH)(a0)
@@ -160,7 +158,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t1, (KVM_ARCH_GUEST_A0)(a0)
 	REG_S	t2, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	REG_S	t3, (KVM_ARCH_GUEST_SEPC)(a0)
+.endm
 
+.macro RESTORE_HOST_GPRS
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_HOST_SP)(a0)
@@ -185,6 +185,34 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_L	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_L	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_L	s11, (KVM_ARCH_HOST_S11)(a0)
+.endm
+
+	.text
+	.altmacro
+	.option norelax
+
+	/*
+	 * Parameters:
+	 * A0 <= Pointer to struct kvm_vcpu_arch
+	 */
+SYM_FUNC_START(__kvm_riscv_switch_to)
+	SAVE_HOST_GPRS
+
+	SAVE_HOST_AND_RESTORE_GUEST_CSRS .Lkvm_switch_return
+
+	RESTORE_GUEST_GPRS
+
+	/* Resume Guest using SRET */
+	sret
+
+	/* Back to Host */
+	.align 2
+.Lkvm_switch_return:
+	SAVE_GUEST_GPRS
+
+	SAVE_GUEST_AND_RESTORE_HOST_CSRS
+
+	RESTORE_HOST_GPRS
 
 	/* Return to C code */
 	ret
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
