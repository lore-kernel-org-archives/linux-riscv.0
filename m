Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30E4C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQ3fM+9FZ7+e0ewFFYX9bZEGxqQaN83OhexW8NZMJH0=; b=bxRvU1hoXMu5DC
	lueCdcd994F7LZNcSnphxk/Aq8nxuWC1PTJsG86p84yJQbELibuVO+92e6/i9lE9/jPATs77Ak0cc
	lCzIPOxQZGKJC0JiZM+g/haPrb5Hwyg1pM0/tMprXa7MCFDYqEnUOucwfKZ4KD0/QGXBEyjE/s4zg
	1ecK65dmSlHAYnOQhUPo21mMbsiS42E3tty0P43nMyuXTOlYUaaOrMhLhE24nOmKlbiRztwDINjwz
	6Wtz3Rc+R244fxlP13JQpdAQBM2Jl57R2bykCSd4WnZfHEwv8rrsm0w3ayagEeBnv2CTqPbYHTX4g
	YGWEy6xUn2i2/81ALp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cwy-00CDRS-VL; Wed, 30 Nov 2022 02:35:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cwu-00CDOp-CM
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:35:49 +0000
Received: by mail-pj1-x102a.google.com with SMTP id cm20so678032pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK41owb8xQar3YPAMlOv6Q9IlVxICe86b2kCZ83CjmI=;
        b=NYaY1njFT+Iv04FROrsPA9asr8bF0H1T04E0ghH8zlytybXdGXaucom+/NQFSJL3iN
         efDS5zB46j0rOji8pcj485H1bPAwEnbMedmSqSEmf9B0wOaK9y7b1cF2ad77M3muEnbi
         qstWPWEJs/VJ5jCtWTtcb7YUXNolbQ28uZPsHenqV73ygMFTNij1XXA1rKcB0p91dDSg
         +bpgfhsHSzWV1Tyhw4e43BlxsTlU2cGT7GoXFBSE8FPrEOI9hkNdf7a2KEI+vkMrrO1l
         AJvx8bfKnp+cn/ARJvoFo0ELvjUsXydRIUgT9uh8J5GQOc3rLSUsST/k+m1AtfbnbM4a
         FzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WK41owb8xQar3YPAMlOv6Q9IlVxICe86b2kCZ83CjmI=;
        b=rU4e8mktFdTSN0dip/fpT24WvpHSw8NQhZuhNGKmc3UX5ts/4+CmbUk5vLpRLfkVtC
         +Lod/U3YNtNfKiU0QnPrS7SjO2HSPq7LX+HbabdnX+/DWKAI6Sb6rEXuWsvYPFI+U3lx
         VP3LRsbZK9bdGhPUBTBRY1wkYgv+knnlkREWhoui3Gy6LeKpayD7cZKLec9PM+RoSvcw
         5Sw28bAvVpqOPydnbpRXlrqnoMJcLDtff40nHBllrjmiY3dXbUi11XK5vKomQjynlFnZ
         NGLFSHkB4qWLBTXzqPRC7dyW9vsGBme8DNWVgCVak7qeHf/XCRLZ7eI989vbI4fmVE/K
         UbHg==
X-Gm-Message-State: ANoB5plkzazLlke3tB6r+bbyDGAKJRBXFnK3bs4XffRmM8FSseHgIMzu
	WF6qgDN0Jyy+cn0Jug8Alr2x0g==
X-Google-Smtp-Source: AA0mqf5bUTnWIeZUMTYfWzcYyQ2Ayw75862olJovnwQkgFAZMu4TKHAv/LhckeZcuq6IEBmsNETSfA==
X-Received: by 2002:a17:903:120c:b0:188:fc5f:84f3 with SMTP id l12-20020a170903120c00b00188fc5f84f3mr51970782plh.2.1669775747099;
        Tue, 29 Nov 2022 18:35:47 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v11-20020a63464b000000b00476b165ff8bsm15069pgk.57.2022.11.29.18.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 18:35:46 -0800 (PST)
Subject: [PATCH 2/2] RISC-V: Add some comments about the shadow and overflow stacks
Date: Tue, 29 Nov 2022 18:35:15 -0800
Message-Id: <20221130023515.20217-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130023515.20217-1-palmer@rivosinc.com>
References: <20221130023515.20217-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_183548_434291_F2C174DA 
X-CRM114-Status: GOOD (  12.53  )
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

It took me a while to page all this back in when trying to review the
recent spin_shadow_stack, so I figured I'd just write up some comments.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index acdfcacd7e57..336d4aadadb1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -200,18 +200,18 @@ void __init trap_init(void)
 }
 
 #ifdef CONFIG_VMAP_STACK
+/*
+ * Extra stack space that allows us to provide panic messages when the kernel
+ * has overflowed its stack.
+ */
 static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
 		overflow_stack)__aligned(16);
 /*
- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
- * to get per-cpu overflow stack(get_overflow_stack).
+ * A temporary stack for use by handle_kernel_stack_overflow.  This is used so
+ * we can call into C code to get the per-hart overflow stack.  Usage of this
+ * stack must be protected by spin_shadow_stack.
  */
 long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
-asmlinkage unsigned long get_overflow_stack(void)
-{
-	return (unsigned long)this_cpu_ptr(overflow_stack) +
-		OVERFLOW_STACK_SIZE;
-}
 
 /*
  * A pseudo spinlock to protect the shadow stack from being used by multiple
@@ -222,6 +222,12 @@ asmlinkage unsigned long get_overflow_stack(void)
  */
 unsigned long spin_shadow_stack;
 
+asmlinkage unsigned long get_overflow_stack(void)
+{
+	return (unsigned long)this_cpu_ptr(overflow_stack) +
+		OVERFLOW_STACK_SIZE;
+}
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
