Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E60CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQalUF0E/dSL6SG72QuEXLgqodjGnX3bDVFjTIxvDsY=; b=NxTZKH8WcAzYSC
	gGMBtXPqNfEZ+OPqdNHr3+g04s+eb6DqquptioQIEcZa26OIHFYc1n1b6JSNVxf/UfmgC5kD1Hm39
	Hfv/+QVWlxNtQXWACRtdAAvaG9DdSptm4giBHiOjMufjWxmJ5hIR4gCyBdJBXjjiZHKRT277E5lbf
	E0uDkoZ8R6HNOZDCdzxxook752/9PSLVCIDpEt1pTZOE7IYdnPRKCr5IvjE9Bk5Cgz03ugyKVh4Tm
	SU3FAal+IaLzDTt+mnCfBp1youzLrY2rUqPiXRBN+jkwsyI+UQdh7Lc9sH3u3SLaWRkpOmHJ5D+VX
	QtHMPZhCCzvzSM/nhPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVEa-000F6t-1l;
	Thu, 19 Oct 2023 15:46:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVEU-000F3m-2r
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 15:46:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4025283b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697730405; x=1698335205; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kh65lo1LXJXGay1V3HODeOnnT1GmMz2a8XUuEYWsQLg=;
        b=HvrNnDZjDCdsb3BLBkjIOWyeX2a13Z8RNdtn6WrEJyNCULimwTVoWOvQfUyFh8sK5d
         BtY4R2GXaX95dRy7PIA9j2X9PO/zVq0/Ddc74fYapaBTe63uqt3QISm4I24Z34EdFYQX
         cY+o4PbUUxDq8qo1gywFrmkg2yQ2MeChQxqIjTZWZHWK9QhcDrC9G8uZGy11k7IwtkyR
         8+OunFYY1MG9R4y1Db7cE9SlHE9EffX/7QQ8oGCiuWm/z1KTdAaFf01gjrsz5EB7VGr3
         8lCz5EoY4ec004nFVOlNhGxjNoMofvBQcZPen7O8BZH8zsxZInzDZYk5ADqtizdgnyu7
         wkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697730405; x=1698335205;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh65lo1LXJXGay1V3HODeOnnT1GmMz2a8XUuEYWsQLg=;
        b=WNhSHBlReTzE1wkOcLX+7Fn/wdRlGTuam3UUY3dJg32zKtaFUkzcL5CtTm0WxQdjWC
         xi5Jn+XYpnlBuiVxWVkeirjtWtHuC0gyIdsH8abFqZ/fsbIskQi2CgTQ47VJ8I3raN1s
         zNRmvJoQ6bLngHW5D0xLwZAmw0X7Mi5OD+G1dKEHcElgw5wD9ehYBRPLycUBCQfIs04i
         k7yV9rJK3b/CLezqL9ifXIpjT5oK7HOhy9WMbDhxMwJj639SbExpc5wymEcKNfYAjWgF
         5SMDtvmdQ3pPF7zgucQYxUrfi3ub3VUBZZkyN3OQ2wHC/cgYR4o/2dCAoMv1is2aQXMa
         R/WA==
X-Gm-Message-State: AOJu0Yxq2psuJYOhyg9td9aaNdBqsQDZ4hI3A4Q/hijSLcpAmSNjIsFG
	5fDEPcuCZfmiZ8ZGEL6r8KjLyX86iMvuGOEaaMVypTgeWi3ry8sn6m9bs7q7r54H+FanNJor+JG
	DW/wctD2PUvOLpRIW+hlsY+TVxAgaOZYlPt1l/bPH3WbbI5daMLPQqoG86rqPhwdHvCHSEEhpWg
	qk3Et/0DoDkOk4etI=
X-Google-Smtp-Source: AGHT+IGXAAfBsQuJuAdklPWmUKJbAxMdjOrNTww95qhrLolhz/Kk+E75Vs6jBeTKg3Dd3tF+SPT1xg==
X-Received: by 2002:a05:6a21:a59e:b0:15c:b7ba:6a4d with SMTP id gd30-20020a056a21a59e00b0015cb7ba6a4dmr2494702pzc.50.1697730405502;
        Thu, 19 Oct 2023 08:46:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090282c800b001c75d7f2597sm2084710plz.141.2023.10.19.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:46:44 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Mathis Salmen <mathis.salmen@matsal.de>
Subject: [v3, 4/5] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
Date: Thu, 19 Oct 2023 15:45:51 +0000
Message-Id: <20231019154552.23351-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019154552.23351-1-andy.chiu@sifive.com>
References: <20231019154552.23351-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_084646_948053_72C1A7B2 
X-CRM114-Status: GOOD (  13.08  )
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

riscv_v_vstate_{save,restore}() can operate only on the knowlege of
struct __riscv_v_ext_state, and struct pt_regs. Let the caller decides
which should be passed into the function. Meanwhile, the kernel-mode
Vector is going to introduce another vstate, so this also makes functions
potentially able to be reused.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v3:
 - save V context after get_cpu_vector_context
Changelog v2:
 - fix build fail that get caught on this patch (Conor)
---
 arch/riscv/include/asm/entry-common.h  |  2 +-
 arch/riscv/include/asm/vector.h        | 14 +++++---------
 arch/riscv/kernel/kernel_mode_vector.c |  2 +-
 arch/riscv/kernel/ptrace.c             |  2 +-
 arch/riscv/kernel/signal.c             |  2 +-
 5 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 8d64f1c18169..fd78361bf301 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -16,7 +16,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 		 * We are already called with irq disabled, so go without
 		 * keepping track of vector_context_busy.
 		 */
-		riscv_v_vstate_restore(current, regs);
+		riscv_v_vstate_restore(&current->thread.vstate, regs);
 	}
 }
 
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 2f11c6f3ad96..d356eac8c0b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -166,23 +166,19 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 	__riscv_v_vstate_dirty(regs);
 }
 
-static inline void riscv_v_vstate_save(struct task_struct *task,
+static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
-		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
-
 		__riscv_v_vstate_save(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
 }
 
-static inline void riscv_v_vstate_restore(struct task_struct *task,
+static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if ((regs->status & SR_VS) != SR_VS_OFF) {
-		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
-
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -203,7 +199,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev, regs);
+	riscv_v_vstate_save(&prev->thread.vstate, regs);
 	riscv_v_vstate_set_restore(next, task_pt_regs(next));
 }
 
@@ -221,8 +217,8 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_discard(regs)		do {} while (0)
-#define riscv_v_vstate_save(task, regs)		do {} while (0)
-#define riscv_v_vstate_restore(task, regs)	do {} while (0)
+#define riscv_v_vstate_save(vstate, regs)	do {} while (0)
+#define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index fa01dc62256f..2344817f8640 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -70,7 +70,7 @@ void kernel_vector_begin(void)
 
 	get_cpu_vector_context();
 
-	riscv_v_vstate_save(current, task_pt_regs(current));
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 
 	riscv_v_enable();
 }
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 7b93bcbdf9fa..e8515aa9d80b 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -101,7 +101,7 @@ static int riscv_vr_get(struct task_struct *target,
 	 */
 	if (target == current) {
 		get_cpu_vector_context();
-		riscv_v_vstate_save(current, task_pt_regs(current));
+		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
 		put_cpu_vector_context();
 	}
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index d31d2c74d31f..13cb00cbcd58 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -87,7 +87,7 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
 
 	get_cpu_vector_context();
-	riscv_v_vstate_save(current, regs);
+	riscv_v_vstate_save(&current->thread.vstate, regs);
 	put_cpu_vector_context();
 
 	/* Copy everything of vstate but datap. */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
