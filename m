Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE79C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xe+a6xIh7RPkiyLSF22q0SK4iiAREU1WlMcQlEEz3JQ=; b=wZrwf4dcrm1Y19
	+aX0Ly93JPQ4bbeOJx5zHP4YnTi7+ON2tx36V5yHnwaYrOkGul5q5EtMdUdVEcJWQgciVFIMWwOvA
	hRyren7tCpdyeikUgm4Ycjx18AeXIfPByp1QKV5Sg2kyvxaLUOnv2T5u2nUAqA2p1gDFKNoVAvVzG
	uy07+alHDMOCRb6vJaE+gGxw/54chefru0qpzKPmgp1aGB4N/dwSwMT+Bqv3vAPjVBgBHuZVHP+Zj
	NGg96NqeTASvQMb9VLrvV2sQTFttzAKwWBN9y8VHTeU2vswWGPRL3aXV49Fcci7ep4PPPYMNDYSYK
	wGW2DSfsi7oJLP+Mk/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglS-008zaY-2h;
	Sat, 15 Jul 2023 15:00:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglP-008zYu-1L
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:00:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666ecb21f86so2987310b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433249; x=1692025249;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/225EHRyI/wX2MBgvShULrHjoLuMo1tn59JTCRbcX8=;
        b=gGbPrH3KzePQ2Nmhu764l8Dhr1SLQ+z5D0bmfzFY7FiJXLlOqUSxJXuYckXBpvQncJ
         0DatUnqS9QSRG7kC8xLqkVscPlr3KTVfYAK1vxh6Z2epFFRd71AkAtfTbD5uGoW8lkkQ
         5YCv13Op9CW4c0GjLa5A9IsGCcRSiRwMc3gj1aXfKS5PxmOyUJmYpobSUajVt2Iomn0M
         XfbyhsFcZF4Q7e+vpGQis3JNMeDUEQ/Jz9JtI8wMKy0ajFiSPm2g+r0NqvlwHlUrV0lz
         1Kt4us7LZQDaKVw+FGWwPpT8ich6DwWN5L3UBWtjbS442Kf8brGPrTIVKD2CzWjr83gu
         iH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433249; x=1692025249;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/225EHRyI/wX2MBgvShULrHjoLuMo1tn59JTCRbcX8=;
        b=BjIRqyS06Lh7EMOJSZvHTmcVDHMT8cF+Q6PGgmZsDen+9jNkIcH/uClpY0LjeEim20
         dKmSUkOdnBfkuas7O6c1eU05qGSKUD77KQ4higM/nnBzaHVZzwc90PlFtqGcUVmgtzao
         wiBCr38H6H4pWS/GVyvxJb2SN6tdNU5n4kU1GKrKnQVbbOt6s1CqdKjVOTVkTh1+GhTA
         K5sOIq83+wCWpohRTrAL5+9BHPtic2/m628pEGzWTqCSTxSQiBiByfVDNTXb/73md5cG
         jUqtM3LfMZ6hx2fEgibFsUJBptvZNnpKFr9lkI157VoeiOrLzDu0WYrKQb7QB2jXoHuD
         4XLQ==
X-Gm-Message-State: ABy/qLavoJ0/0iQc6+9qzN2PKvzu51UP0WOZ2Sgf9k4pjOk0cHezHoNX
	t9ECkI36ABvG3x/lZ8OPM48106SYX69LmgvaHMAfu0RJEyZ3HfmUNJ/iV0m11Sjds6I2g+OkrR2
	1nBE3b9JmO3SFMexiQR8f4M/E+wNFosRyXjnja2E19C+6Sf64BOBWKpxcweKWC/KGaKS2zVT/ea
	rwFlNdBwr8y5Lj
X-Google-Smtp-Source: APBJJlGQgAjLg2F86dxXasGz2GONxfjtWW4ZSQeLxCJ5Z1Z0ajPI7fsg+Q59uzvjQctFmwOt57szew==
X-Received: by 2002:a05:6a20:3d1d:b0:132:bdba:5500 with SMTP id y29-20020a056a203d1d00b00132bdba5500mr9983066pzi.39.1689433249286;
        Sat, 15 Jul 2023 08:00:49 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:00:48 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [v1, 1/6] riscv: sched: defer restoring Vector context for user
Date: Sat, 15 Jul 2023 15:00:27 +0000
Message-Id: <20230715150032.6917-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080051_459367_B4949E23 
X-CRM114-Status: GOOD (  14.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

User's will use its Vector registers only after the kernel really
returns to the userspace. So we can delay restoring Vector registers as
long as we are still running in kernel mode. So, add a thread flag to
indicates the need of restoring Vector and do the restore at the last
arch-specific exit-to-user hook. This save the context restoring cost
when we switch over multiple processes that run V in kernel mode. For
example, if the kernel performs context swicth from A->B->C, and returns
to C's userspace, then there is no need for restoring B's V-register.

Besides, this also prevents us from repeatedly restoring V context when
executing kernel-mode Vector multiple times for the upcoming kenel-mode
Vector patches.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/entry-common.h | 13 +++++++++++++
 arch/riscv/include/asm/thread_info.h  |  2 ++
 arch/riscv/include/asm/vector.h       | 11 ++++++++++-
 arch/riscv/kernel/process.c           |  2 ++
 arch/riscv/kernel/signal.c            |  2 +-
 arch/riscv/kernel/vector.c            |  2 +-
 6 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 6e4dee49d84b..52926f4d8d7c 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -4,6 +4,19 @@
 #define _ASM_RISCV_ENTRY_COMMON_H
 
 #include <asm/stacktrace.h>
+#include <asm/thread_info.h>
+#include <asm/vector.h>
+
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
+		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
+		riscv_v_vstate_restore(current, regs);
+	}
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
 
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 97e6f65ec176..d83975efe866 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -101,12 +101,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
 #define TIF_32BIT		11	/* compat-mode 32bit process */
+#define TIF_RISCV_V_DEFER_RESTORE	12
 
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
+#define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3d78930cab51..a4f3705fd144 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -183,6 +183,15 @@ static inline void riscv_v_vstate_restore(struct task_struct *task,
 	}
 }
 
+static inline void riscv_v_vstate_set_restore(struct task_struct *task,
+					      struct pt_regs *regs)
+{
+	if ((regs->status & SR_VS) != SR_VS_OFF) {
+		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
+		riscv_v_vstate_on(regs);
+	}
+}
+
 static inline void __switch_to_vector(struct task_struct *prev,
 				      struct task_struct *next)
 {
@@ -190,7 +199,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 
 	regs = task_pt_regs(prev);
 	riscv_v_vstate_save(prev, regs);
-	riscv_v_vstate_restore(next, task_pt_regs(next));
+	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e32d737e039f..ec89e7edb6fd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -153,6 +153,7 @@ void flush_thread(void)
 	riscv_v_vstate_off(task_pt_regs(current));
 	kfree(current->thread.vstate.datap);
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
 #endif
 }
 
@@ -169,6 +170,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	*dst = *src;
 	/* clear entire V context, including datap for a new task */
 	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+	clear_tsk_thread_flag(dst, TIF_RISCV_V_DEFER_RESTORE);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 180d951d3624..0fca2c128b5f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -134,7 +134,7 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	if (unlikely(err))
 		return err;
 
-	riscv_v_vstate_restore(current, regs);
+	riscv_v_vstate_set_restore(current, regs);
 
 	return err;
 }
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 8d92fb6c522c..9d583b760db4 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -167,7 +167,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		return true;
 	}
 	riscv_v_vstate_on(regs);
-	riscv_v_vstate_restore(current, regs);
+	riscv_v_vstate_set_restore(current, regs);
 	return true;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
