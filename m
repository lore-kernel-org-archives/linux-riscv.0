Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B1C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SkCb4ZGDjqLh2dsg3oxP5de9jqXmwGj2CWSh2CeTIE=; b=ZtDFkOM8hrxHKJ
	YwjRhzlPqpapnBTh7XdZnOG1v7BYFVl80nN5YYlyF324mix0k2yzQG01kXaaV8fr+NyldmobSIHcJ
	pOdw5XhFEBaZHcho7K2dltOCNK1c8d5UJZgOSrsOxwqEyJQd8keURt3KwUkjEUiQXI6ornTqPROww
	YOdUSWLoYh7BDMS4j7MExDfe38uwaytCc8eA5yAQfuasuFF7czIz246lHeu5xcs6IllYM63LOZaq/
	+z+QHAbcdY+OekGAEvx4mhb/rb7fbv/FEL6Qf0Tcvy9t8IjQHVqoMdhmsWGtrfgK84bzDLNPQJo7e
	oyCrSzHiHZj6nkDET/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcp-0000000DPH9-1U20;
	Thu, 20 Mar 2025 22:44:31 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcm-0000000DPFu-0N0d
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:29 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so354518b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510667; x=1743115467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMSpj4Pv/tuKqFfvndPeG7a41TGSXjAKvjZxbUe88U8=;
        b=FRCKs1QOPApNJUIMNTa6STGLNQwLbbbMYiKFktcS02SAI5YFxzfuq2mIIDBde9aX5x
         6i4J6f8ZjcLXHdfzUZs/0GdpBwDQGWeIgw91tS3YHCoqznQl7LcUWMPIU2ZFdJN1OT83
         7keTPIQTQSfsSJ6rJoGb6SfH8aFBnxORxTPHxLR9D8hg/HtFOAFwteBBe9d1smNT8UhB
         qN8b8rYj5UpmbcVSQ7SaY4MwS99dIlNdEyPcvUFsONKJMBrFKi5G1gk3Bue9qUL6bRSM
         rbMP3grdJT0ymgQcCaEC+1P4FP+DY2khfJfCn2SznYAi9Mn2S9HPhb7+Fds1O85NL9Lm
         4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510667; x=1743115467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMSpj4Pv/tuKqFfvndPeG7a41TGSXjAKvjZxbUe88U8=;
        b=uKsvdz/Vg8oDzSyK0sxqVHPFwmlpA9xrv1VUQNH/Spq3G/3BKXdGA8RplNw7flFSeG
         wIvp8l4DLMUerShZUUBIrVdTgsBdXyhYi1/qLV1ub3UasaEhADVtQc5TwBdEPlnUaVM8
         QP4qjWOrzK7Ay6GRPWQ6+v4ZhCGfsZt0QLrODOyEvRFZNY/PXRvrW+fmZNTcadb/MNIP
         fRpBs9M95+lU9UmYOMDo8EoKoxW3l9+8PKfXIDwav2zlCwBG3T7HrNKmhyLLqBj705rc
         VNaJ9DSOINSSdUQTudOWNVz9DNrvOq9YCgFgAL0FBkzyLEmMDHKrFKRNsPvBStFTcUBb
         9Y4w==
X-Gm-Message-State: AOJu0YxFZ/Lacp6A9GHpkklXYq4xCKAk7TDU4B1dNtMpXUOYko4KgvZh
	5i6UXgwZroKZU/wZc/0QK89fke2uMiVDapGKuJvNBlloESWnnh7u0Sgz854g4g==
X-Gm-Gg: ASbGncsbt4s3og9pJr8bItGdlRbOK95QJsu4QyMF8Kwgctopv+plRyE3ZcW8c5MElSB
	NFnb0KCDslhtEi28CqPQe0w98FXPLCNW0D9L4nA0cH/3RjoEJPEyD7Su98sZJnmwO11Jjg3XHg2
	f4A71CcXYJnAFgQF4GhqosusMV1a4FjVwpgEwzNrJbmQDt18YgCljdV0+C+qEtUTPg1bug9XZK/
	GWZLMBYWEyvUjPHIEW7omLMBjvtaNTaLdI7nrSr1susge2StRtJRR3b6vOH1Pa6ouJeU/8UB0KP
	Se/km6G7ZH86ISeOdtuhJTdTMDRAJax3EtEl8u37A7s1v+K3jgpI0VvBHJ8o/9k=
X-Google-Smtp-Source: AGHT+IFd0nlvhAJDq2aqQ1KFOkNVEh4rXpWJJkMBcG9z9sJUjee94QYnGOMRYiHTi9qWadmuKL5cPg==
X-Received: by 2002:a05:6808:250d:b0:3fe:b1fd:527f with SMTP id 5614622812f47-3febf70fc7amr619142b6e.1.1742510667005;
        Thu, 20 Mar 2025 15:44:27 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:26 -0700 (PDT)
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
Subject: [PATCH v5 1/5] riscv: save the SR_SUM status over switches
Date: Thu, 20 Mar 2025 22:44:19 +0000
Message-Id: <20250320224423.1838493-2-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154428_128132_D9405BFA 
X-CRM114-Status: GOOD (  19.53  )
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
