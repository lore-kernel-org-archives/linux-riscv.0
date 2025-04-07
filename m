Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16209C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/c3CXOWD0vCODTIGEyD4XE85CTAFmae0pyKXf6X/Dk=; b=s62NIL2J/1O2xP
	2mYEgZ4IpS02fU1ZJLZJ2x/O16a2f3H130gRa7XjA2dDZyk3EfzoAD5ELtGkbeASaNODny/M5IQGL
	RZg6GkR8VHkrVSgb1/r2ttrewjPhn+v1bsIw1QEEwx5Fx29CAyUl3kw4PylUdIU83JlXdrv5tpx/N
	R1ARYUZmv5a8WoFSADZ9lAYni+8S9Gaonr8KpSHnDvFhscqyaWWXxZ+rmQTzF2Md6kCY2xWE3ukTF
	2qU9hwF6mDpUDviOSvYlEslgpAWnWOzZKvav7ooGmicenzU8k2zgqWrrlH54kNTPqwdG2Fn4TM/Qb
	SjSKyTt//NDeaeC/V3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raG-00000001gQ5-3k2f;
	Mon, 07 Apr 2025 18:52:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quQ-00000001TXf-2n7H
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22435603572so44179625ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049362; x=1744654162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNLP2WcbFnXWmhqiIcXTLGBaX0CpznpLnzRdD+AmWMw=;
        b=DalthndDJZ3jnDw01Yysz1+eMoePGZ1E6DAPmC7zg86Vbo6beZn15AKCQgoTvGnB6w
         tPduNCbYcR1BehFqVIQ1YSG9/LOeW26wrVmHY771rR3Wz0PIDd7SmzAWWffCDGK+6LEE
         TWEDjDNtfZwXgVm8LwMDP4UcU6qLGRVZPW0Z/8Vii0tjyydABkHhtz/JHRzgPAshBr+a
         R9EPQkX7ACM1f4rVo6lFuqnoRzGllKpFwMnw7usQWrK/lQ73px3NN9TFLR7/jsUuTiGQ
         7PW0fVb6MubGqS5LINsVIorkr0TJ8Vdgm8ieIBHoUNaHA9JSGoQXJ9O1BD5P1gkElncu
         VJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049362; x=1744654162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNLP2WcbFnXWmhqiIcXTLGBaX0CpznpLnzRdD+AmWMw=;
        b=VRErBXB9fKUSEpj2JGKVl2IOxxljAjKBH7Ag614gWVip1nkrN+T4uuoyauFMuEg8kS
         4gKiwdj2VG4h9Z5Du98S4JVY6IwQ/MAhX44OxQYH1COIEgEr12X8eAeqHWIEsSZik6aI
         R3my+y5fIadxYGIjvNG3z6FcssQsJ+cxmYTCO375iqdWrAhK78oMUlvqyYeOnpT0EB9r
         hOFrzzBqmJNtUZJ3BLMWyP9HBuhY3e4ftdq2Az2D0F9LYV89NTKPiDAVKPiE2rHcUeGQ
         f7mCeDU293c8Vtx5YjWYcCVBjiAIEnicEiGB2TvRKpIU0xA9FWu0gpqExHtCyLqJl7C4
         uQHQ==
X-Gm-Message-State: AOJu0Yz6ofH25FNr3REXHVLm6ten9UZkR5lCxq2EWG30gdWPvGz2+AbJ
	bYBwShPa0plXhOwMgfuXmlRrfJK/A2NpViJ+ZHeTcwMZhHPFMU6yfAmYfZGj
X-Gm-Gg: ASbGncvJfysDRugI01t9NKY6ZxBl6vIdGvxXrkZLaCrX3xEO97WFwjgIvJH/aVv9bLr
	nK/wBw7tfaGxS9H/0pt3tTKLhFs3jH0jjFwJF+4OcwyYidqfuot/CjmxmYXkBbUEeH7RkwewOQ3
	E8Y7lFrQsrIy76lV6QbKboJH+vgY8G4nJqKEgEzmJzBL0tBEPsehTrsp53bu2g7l8jl6qjB9eaL
	e+dljn+bbasdt9wUHYY5XUO9eq00WNrjUL6YAAa/4qmgWZdIVDNQ/Gd9h6d70R/Kut5tLvSfuLr
	DSO9vmXnAVmYzw+8IBaakwR5wNh+ASX6G650t3JEwNYENK/h7MsS6PZ9zKnMOzVLufEn6So4qx5
	97Ey7/lhD71On5V3TBbE1c1396bgoZ7XXCC5pOPhE/Eu7
X-Google-Smtp-Source: AGHT+IFwnBb03K/EWgGxHSZMUCeczsevSxPHhBr5Q9Nlteyu1sSQQHWfAssAlK/1aErAdZs0ChZmog==
X-Received: by 2002:a17:902:dac3:b0:224:256e:5e4e with SMTP id d9443c01a7336-22a8a86588cmr183418285ad.16.1744049361576;
        Mon, 07 Apr 2025 11:09:21 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:21 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 07/12] riscv: vector: Support calling schedule() for preemptible Vector
Date: Tue,  8 Apr 2025 02:08:31 +0800
Message-Id: <20250407180838.42877-7-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110922_703797_F0193CCD 
X-CRM114-Status: GOOD (  15.05  )
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

From: Andy Chiu <andy.chiu@sifive.com>

Each function entry implies a call to ftrace infrastructure. And it may
call into schedule in some cases. So, it is possible for preemptible
kernel-mode Vector to implicitly call into schedule. Since all V-regs
are caller-saved, it is possible to drop all V context when a thread
voluntarily call schedule(). Besides, we currently don't pass argument
through vector register, so we don't have to save/restore V-regs in
ftrace trampoline.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h |  5 +++++
 arch/riscv/include/asm/vector.h    | 22 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..9c1cc716b891 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -79,6 +79,10 @@ struct pt_regs;
  *       Thus, the task does not own preempt_v. Any use of Vector will have to
  *       save preempt_v, if dirty, and fallback to non-preemptible kernel-mode
  *       Vector.
+ *  - bit 29: The thread voluntarily calls schedule() while holding an active
+ *    preempt_v. All preempt_v context should be dropped in such case because
+ *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
+ *    schedule() call.
  *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
@@ -93,6 +97,7 @@ struct pt_regs;
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
+#define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
 
 /* CPU-specific state of a task */
 struct thread_struct {
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..45c9b426fcc5 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -120,6 +120,11 @@ static __always_inline void riscv_v_disable(void)
 		csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline bool riscv_v_is_on(void)
+{
+	return !!(csr_read(CSR_SSTATUS) & SR_VS);
+}
+
 static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 {
 	asm volatile (
@@ -366,6 +371,11 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
+		if (riscv_v_is_on()) {
+			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+			riscv_v_disable();
+			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
+		}
 		if (riscv_preempt_v_dirty(prev)) {
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
@@ -376,10 +386,16 @@ static inline void __switch_to_vector(struct task_struct *prev,
 		riscv_v_vstate_save(&prev->thread.vstate, regs);
 	}
 
-	if (riscv_preempt_v_started(next))
-		riscv_preempt_v_set_restore(next);
-	else
+	if (riscv_preempt_v_started(next)) {
+		if (next->thread.riscv_v_flags & RISCV_PREEMPT_V_IN_SCHEDULE) {
+			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
+			riscv_v_enable();
+		} else {
+			riscv_preempt_v_set_restore(next);
+		}
+	} else {
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
