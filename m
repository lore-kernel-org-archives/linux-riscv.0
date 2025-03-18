Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AE0C35FF8
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SkCb4ZGDjqLh2dsg3oxP5de9jqXmwGj2CWSh2CeTIE=; b=3tRVx+VxIEbHg1
	NF+EIRvRzTGgQOQBZqGmDtJp6u4jMxEtzPwbEhYdlqlGJV/pBk2SCnC1B94eDQBfWHGYUr41oYyHY
	x2rMmWTWqI+XKaPOZo4xtqUtbj72mBqNQ+fMsDq1RhNveFuuL0PEU7sutcQDeFuyql6i3GI06m4Cg
	Ol3IBNv/TNHaJxRjgnwhUq3WAFF4KaSjumACB1N75zmMha8YPpeGk12La67zc1w9oL416QBR2TseW
	Q0axs/43dqKSU6BRdQbAnIA2S+WXDPGVd3cWsPeUA4G6EWx4mm3rWiMBK16sMke4ugp8wVqJvkWbt
	lxH2Ba9McAVwJ0wIklqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEU-00000004ngz-0qbr;
	Tue, 18 Mar 2025 06:15:22 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEQ-00000004nfJ-3qGn
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:20 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72bbd3a3928so1999694a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278518; x=1742883318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMSpj4Pv/tuKqFfvndPeG7a41TGSXjAKvjZxbUe88U8=;
        b=dFGa2kto1kHs9lIXOtJtQ/Cx/JbxIB4v8QEEe+ilNCPht1Fo81T92xi8RLo/YWwf7a
         BEGNGPphdwQRJa0StQH9aMRVP/Gm2MJuYFcN+9qIgS+d5AY+qe3VjWi6RBpuxg8KSa2t
         /nSSfRvSTm1UA8ou4yVeW1V/8kusJF7PPaKr7JfLCrd2KJrR/JNMgVbv+uwgY+5j0KJj
         5AbvOEoVSjgsVyQ1wYUCVvELxzVj06c52NjcPzQAACEYqIx1ScVnLHQh0oAYZHqYAa6Y
         xab50fVi1cD5MJJolWdwH3Ikj5ZS55LV3Cutqrjv/uMq3SkrIuZyoizV6UAl6o3CN3ms
         pzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278518; x=1742883318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMSpj4Pv/tuKqFfvndPeG7a41TGSXjAKvjZxbUe88U8=;
        b=T9g3G8GiRsWUKyqx/xWyTnlqpZTfpmfAUNJPLOopNi7kmDD+vNXqaIfdW6TAOd+DDr
         zxy5M5R8kpKz6vShH4cAht3+QF+t0Z38WhTAU7Rvdhy2h9+4l6JoGFMnXvlWTgJFc7Zk
         TACuAaOPNAXS6sJPP67eESx2Kr8FHSiKQhARNYult+AUfTIh6K3EV7vtCs28PmJV4Ww5
         eLgJ2c7+wUUlAyqY0dNhI4t8ivK5KIn+ZwwYAdIRjt9GGldEbVwk0Y/XCYGzGZTRUt5Y
         SXaWm8hw//GGtSPlKjkg1vx+qsPl4bJ59MAr/69Hy9F/3fY7X5hHDQQGqu11/zHpLFv6
         N2EA==
X-Gm-Message-State: AOJu0Ywojn/3Ysqm6IFEHCl1fjNa/UlCPBo2bqAnFbzOYqCYZ+oZoFP/
	ivBA93ukyFxF56S0R3vmJ4/Rq7Hm6Q1pzmTSFz6zq9tuJ5M271GA469v7QrYNw==
X-Gm-Gg: ASbGncvScAAXqA126gvnyl33sjyUJu5LETdUQu+GoMUOU2CeZnxG3+W8qncrYtsUR2j
	1PjnIRRtece03jd0WeHfGRz95dsB1LbmwKOK/kqb1GDtwQqxpvZ98lBTwOFDRfzKvO7VfQz3fu0
	1xP6gPFS4Q3lYXdyaXtEa5imhDCWyuTxuzrcIB+ZKvaxWGZTmxX7j2TC5yPuBZAPZYSn/5NY2b9
	jyuwiUJT6qDzQ1UscXoccG+stTQ/MrnafT1jnNnAkXxqMYOR5iZQG7NhsiWoZnVZcK+/ao1m2ww
	8EVXrqmAzRJApYuozfFqzAZciITC49Ch+Zdl68MTres1Zf2jjJGW5VVtZ5cw6ZFJJwFybtJbDg=
	=
X-Google-Smtp-Source: AGHT+IE9dCEHhNSEUdS36yalwDgnQ6lSUtajzuROrLjALRXZFS2tcFhxjwVecmB7upfnJriqyJFUDw==
X-Received: by 2002:a05:6830:6516:b0:72b:87bd:ad5b with SMTP id 46e09a7af769-72bbc247edcmr8104772a34.4.1742278517914;
        Mon, 17 Mar 2025 23:15:17 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:17 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: [PATCH v4 1/5] riscv: save the SR_SUM status over switches
Date: Tue, 18 Mar 2025 06:15:10 +0000
Message-Id: <20250318061514.1223111-2-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231518_982192_AF6E54B7 
X-CRM114-Status: GOOD (  19.52  )
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

From: Ben Dooks <ben.dooks@codethink.co.uk>

When threads/tasks are switched we need to ensure the old execution's
SR_SUM state is saved and the new thread has the old SR_SUM state
restored.

The issue is seen under heavy load especially with the syz-stress tool
running, with crashes as follows in schedule_tail:

Unable to handle kernel access to user memory without uaccess routines
at virtual address 000000002749f0d0
Oops [#1]
Modules linked in:
CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
Hardware name: riscv-virtio,qemu (DT)
epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
 ra : task_pid_vnr include/linux/sched.h:1421 [inline]
 ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
 gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
 t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
 s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
 a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
 s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
 s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
 s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
 s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
 t5 : ffffffc4043cafba t6 : 0000000000040000
status: 0000000000000120 badaddr: 000000002749f0d0 cause:
000000000000000f
Call Trace:
[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
[<ffffffe000005570>] ret_from_exception+0x0/0x14
Dumping ftrace buffer:
   (ftrace buffer empty)
---[ end trace b5f8f9231dc87dda ]---

The issue comes from the put_user() in schedule_tail
(kernel/sched/core.c)
doing the following:

asmlinkage __visible void schedule_tail(struct task_struct *prev)
{
...
        if (current->set_child_tid)
                put_user(task_pid_vnr(current), current->set_child_tid);
...
}

the put_user() macro causes the code sequence to come out as follows:

1:	__enable_user_access()
2:	reg = task_pid_vnr(current);
3:	*current->set_child_tid = reg;
4:	__disable_user_access()

This means the task_pid_vnr() is being called with user-access enabled
which itself is not a good idea, but that is a separate issue. Here we
have a function that /might/ sleep being called with the SR_SUM and if
it does, then it returns with the SR_SUM flag possibly cleared thus
causing the above abort.

To try and deal with this, and stop the SR_SUM leaking out into other
threads (this has also been tested and see under stress. It can rarely
happen but it /does/ under load) make sure the __switch_to() will save
and restore the SR_SUM flag, and clear it possibly for the next thread
if it does not need it.

Note, test code to be supplied once other checks have been finished.

There may be further issues with the mstatus flags with this, this
can be discussed further once some initial testing has been done.

Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/kernel/asm-offsets.c    | 5 +++++
 arch/riscv/kernel/entry.S          | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..0de05d652e0f 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -103,6 +103,7 @@ struct thread_struct {
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
 	unsigned long envcfg;
+	unsigned long flags;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index e89455a6a0e5..556ebcbb7e22 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -34,6 +34,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+	OFFSET(TASK_THREAD_FLAGS, task_struct, thread.flags);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
@@ -347,6 +348,10 @@ void asm_offsets(void)
 		  offsetof(struct task_struct, thread.s[11])
 		- offsetof(struct task_struct, thread.ra)
 	);
+	DEFINE(TASK_THREAD_FLAGS_RA,
+		  offsetof(struct task_struct, thread.flags)
+		- offsetof(struct task_struct, thread.ra)
+	);
 
 	DEFINE(TASK_THREAD_F0_F0,
 		  offsetof(struct task_struct, thread.fstate.f[0])
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4..c278b3ac37b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
 	REG_S s9,  TASK_THREAD_S9_RA(a3)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
+
+	/* save (and disable the user space access flag) */
+	li    s0, SR_SUM
+	csrrc s1, CSR_STATUS, s0
+	REG_S s1, TASK_THREAD_FLAGS_RA(a3)
+
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
+	REG_L s0,  TASK_THREAD_FLAGS_RA(a4)
+	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
 	REG_L s0,  TASK_THREAD_S0_RA(a4)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
