Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CECCA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unshoPxrU1wVuOsYKWmF+h3VSA9MXNEMD9E7zkXsa38=; b=dHAewLkwQqLicZ
	QwrMyJ43cOcRZ4eBuM0Edfd06iJ6NKQHN+yrFY0fkDrs8Qkme8M1/ANRA6rvpxwaQSEYQUpl1zihl
	n8DwDGpP74QmlgN5kdm1biMeAKEbEkk0Ij5o370gE2EqgyHIiuDYXd0jmmIOhfaknwDuAPp2GUYlc
	FFiqH3UM9ZdwnwmVp4094Up6fUBiUPx5E2RfWzVhxses9p4uiefcd/CZcs3dbDgaNX5SCyEo2gj4a
	mTEFRwhjXKnljZFvNbEWONDCFGot8tIjQuKW/Yk2Y43MGzZnGL62k0AvrG3jwcQii/c4FrjcjU7FE
	06Cgo40cd52acuim2hOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHHt-00000009IHt-1ft2;
	Thu, 01 Oct 2026 13:57:29 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHHr-00000009IGQ-0uV3
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 13:57:28 +0000
Received: by mail-qk2-x11.google.com with SMTP id af79cd13be357-939ca12ab70so781022485a.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863045; x=1791467845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DYhRgdXSzDJVurFDLv4PHup3HFD+RVOANjvlBQkYgM=;
        b=EMD2vFgZONFtpUXktUCQ9eJ8tU0+o9B+0EQFpX0ZBlApmMTtuYpcjcoISRpkBNQVmz
         OzjLbB16AWoOCkPmmmbBlG0V5zNMJrJ1issjL1pdscViCKIQZxEanTJLCYlpbxkQ0i/u
         qhnTgEnyNy4SiwEad2tuV40uGNQTz1RC2TFxV+DO5Z8CBXy+j7gglwgz+hQQy6INrfee
         Hk6v93+QBdmEJB1HTV3oO7ENYUkOletzNLG3bpwouC2mfJ2icuvBVav1tS9HKWQZ6lO1
         qwP5Bp4VqGxBs2IHMt6dKUHFDvoF+sqfUZ9dS+i4USdhvk8uhQ2EMRyb87gNUxr+n8cY
         iNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863045; x=1791467845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DYhRgdXSzDJVurFDLv4PHup3HFD+RVOANjvlBQkYgM=;
        b=yYc6j9XzgDEVhFIzhLHeOdKmhgNV7I+1oiwmLqp3kZ7Z5A3QHmcicqBrEwzWUHtoDb
         Pxl1MKLrakoZVYX3QBzJRR6lOgyIykEMz9E/WcZTMrOIbOO91BFm2BNZnjBnEq+m5dHt
         smllyVgrKjE0JsO/QVXWiT65gDF7zpuwSakG2gvHdGD1M1RInjxxuLfBxMFLtAgSV/R9
         Brns35ftwWf9v0fFuvSDGzmf3vtonp28iH3JyQA3qnCtysS3F+yMBg7rjmD0NGSMCtoJ
         pzXfJV6l2c/iuikleq1yxjeEn+2qHRwenZjnD3yftZCddaEV/cwUSTpiVUbKSSpYDYe8
         vFFA==
X-Forwarded-Encrypted: i=1; AKwUvBwhzHAWzgFHRdgWZR+bVNERwiYD5qg8SFgfVC3HDHS3I2g93jES7T1CHikG3Nypnn9hrtIw0DxUuC9Fkg==@lists.infradead.org
X-Gm-Message-State: AFuF++ly9SBdzyq+AaM921qE7bmEZ680RJt8nTJESUFIxgxIBTfP5ypZ
	Kfeje4kUwXl7AGntvDAWQnBS8hF6JvZodGAaV/0pz1yPs3or+z245A/i
X-Gm-Gg: AYBFou2m4N2cGVWX2XKKd2FQFaWHRlGxDynaUBLCBmZNzlzin5PXUdC09/+9BjSB5/k
	csU5l8iEg7p4p+gzmwepzonpcY/rLsgwxqZ2X4jz2B7WlYRFvkll1npA3F3q3EUzs9aldUxr0ve
	mGf7XJy1+rZRL5Iu4GQH1JnoyqP1Wgb30M1Huh+O9VS3Ldk6xM4o/Cppfm/nLOdohFsz0hpOPYv
	6xqsyhuJuhtz2XktAMj0L2diQrYuxOx6iYtredOaT5IZa8um3BICn49gqZu9fJbAiitRm0SDt/u
	0OinkKaRiypcAcSeO5N6t5rKRI2nyFD4M0VhaGlgoAZ8Xol27JyoQzVtgH3PHbUBK7i3Zf5ncXD
	b1JjOdlx+2g609Mya+RTLeu1ti0XZBiTA6CLXkDlSGytVW8aozVd5xJKlienP18PYLAkD9HO7vK
	2CoN31eqtW2CXWgeBqFz/Ukm6/S5bdjbHKA6ZNZ6sXJbrlaC2QfwEqy85Qexek+SqAF2px6QbmM
	VIG5hKd0dnhLq1AAwb1S0yQiXHovVbpscXVNzGM/8UkhgU3bvp02q9gjNeRDpaV5DtL+Vq77EzO
	hxrtCxhm
X-Received: by 2002:a05:620a:2550:b0:93c:3d7e:6e90 with SMTP id af79cd13be357-93ca96e9ddemr839989885a.32.1790863043915;
        Thu, 01 Oct 2026 06:57:23 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89a52d2sm26940176d6.14.2026.10.01.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:57:23 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samitolvanen@google.com
Cc: wangruikang@iscas.ac.cn,
	debug@rivosinc.com,
	conor.dooley@microchip.com,
	namcao@linutronix.de,
	zong.li@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH] riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp
Date: Thu,  1 Oct 2026 13:57:11 +0000
Message-Id: <20261001135711.934152-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065727_267026_8B2F56D5 
X-CRM114-Status: GOOD (  12.26  )
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

Under CONFIG_SHADOW_CALL_STACK, handle_exception() reloads the kernel
shadow call stack pointer (gp) only when the trap came from userspace.
It made that decision with scs_load_current_if_task_changed, which
compares the trap-time tp (read back from sscratch into s5) against the
current tp:

	beq	\prev, tp, _skip_scs
	scs_load_current
_skip_scs:

tp is a user-writable register.  A user task that sets tp to the
linear-map address of its own task_struct (&current) before trapping
makes the comparison succeed (can achieve by brute force with KASLR 
enable under our test), so the kernel skips scs_load_current and
keeps running with the gp that userspace left in place.  Under
CONFIG_SHADOW_CALL_STACK gp is the shadow call stack pointer and
load_global_pointer is a no-op, so the compiler-emitted
"sd ra, -8(gp)" / "ld ra, -8(gp)" in every non-leaf function then write
to, and return through, an attacker-controlled address -- an
unprivileged kernel arbitrary-write and control-flow-hijack primitive.
The poisoned gp is saved to task_struct.scs_sp on return, so the reload
is skipped on every subsequent entry as well.

Decide "came from userspace" from the hardware sstatus.SPP bit (already
in s1 at this point) instead of from tp, mirroring the check that
ret_from_exception already uses a few instructions later.  SPP is
written by hardware on trap entry and cannot be forged from U-mode.
Legitimate behaviour is unchanged: user entries (SPP=0) reload the task
shadow call stack, nested kernel entries (SPP=1) skip it.

Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
 arch/riscv/include/asm/scs.h | 17 +++++++++++++----
 arch/riscv/kernel/entry.S    |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 023a412fe38d..49e40eef4ed7 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -4,6 +4,7 @@
 
 #ifdef __ASSEMBLER__
 #include <asm/asm-offsets.h>
+#include <asm/csr.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 
@@ -22,9 +23,17 @@
 	REG_L	gp, TASK_TI_SCS_SP(tp)
 .endm
 
-/* Load task_scs_sp(current) to gp, but only if tp has changed. */
-.macro scs_load_current_if_task_changed prev
-	beq	\prev, tp, _skip_scs
+/*
+ * Load task_scs_sp(current) to gp, but only when the trap came from U-mode.
+ * The source privilege level is taken from the saved sstatus.SPP bit (written
+ * by hardware on trap entry), not by comparing tp.  tp is a user-writable
+ * register, so gating the shadow call stack reload on it let a user task that
+ * set tp == &current skip the reload and run the kernel with an attacker
+ * controlled gp (the shadow call stack pointer).
+ */
+.macro scs_load_current_if_from_user status, tmp
+	andi	\tmp, \status, SR_SPP
+	bnez	\tmp, _skip_scs
 	scs_load_current
 _skip_scs:
 .endm
@@ -42,7 +51,7 @@
 .endm
 .macro scs_load_current
 .endm
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_from_user status, tmp
 .endm
 .macro scs_save_current
 .endm
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56f80..61b7a7716697 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -208,7 +208,7 @@ SYM_CODE_START(handle_exception)
 	load_global_pointer
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
-	scs_load_current_if_task_changed s5
+	scs_load_current_if_from_user s1, s5
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
