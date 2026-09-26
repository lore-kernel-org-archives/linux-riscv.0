Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1139C98332
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+2UbjvCO9t+aQkCMcp1QIU7eiqegh9scByYK6ldnqM=; b=zJEFrw4xeGHSlS
	yfCE8H3TkyM95GCl5uKlg8nLbpR5lMjsReEX2qCLkwzLc2uobNYy8c4cULoPYJmYwKc7i2iCDCPEv
	3x/8qn0987civkTa27mBevT1H3pZKEyv5Z3C2e+P7UanXC1rX3DeS7Zss5lHVtE3GMIxoXXwnBHmZ
	7SHy8FLeWD+RYLKQNwFqh25KmqUjI5O/7RC1uU6GK6TCaJ/lvxl/2scND4phyQYz7G5p2KBXAmCyY
	/I2hRJYU4VLLYbinHseQlQ0jja4/FKngRMVBopmT8f9114Ck1Fb1MwulztaIjUEW4tUH1emFY43SX
	nsn6kftz+O4ln5nC9NIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAStH-0000000FUMx-3vaZ;
	Sat, 26 Sep 2026 13:56:35 +0000
Received: from out-215.mta0.migadu.com ([2001:41d0:1004:224b::d7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAStD-0000000FULC-1p4s
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 13:56:34 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wt+Sf4/K44D18qxUhVMcBpJ43zRH/d2pWQpmucexby4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790430989; v=1; x=1791035789;
 b=cPeG/4zmqFLcOi4A1x/KxtKSK+dQVw6fLL5TRuKAg+WOGjoEmhYnrnjCRiflHKbXLi9r+gU2
 MNO0qcj9sRUVn1tDqz5CVd3mIQs1NX78SY8HnE2Gl36bsHotZOjfexZ7USW5KrKrLLHBF/hcsAR
 LNw9N5qDgPxLhfQropU+ahoc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 173538b95d96974b;
	Sat, 26 Sep 2026 13:56:28 +0000
X-Mizu-Trace-ID: 173538b95d96974b
X-Migadu-Flow: FLOW_OUT
From: "Florent Revest (Anthropic)" <florent.revest@linux.dev>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: "Florent Revest (Anthropic)" <florent.revest@linux.dev>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Junseo Lim <zirajs7@gmail.com>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH bpf v5 1/3] bpf: Wait for an RCU tasks grace period before freeing trampoline progs
Date: Sat, 26 Sep 2026 13:55:58 +0000
Message-ID: <20260926135605.1217928-2-florent.revest@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926135605.1217928-1-florent.revest@linux.dev>
References: <20260926135605.1217928-1-florent.revest@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_065631_632295_9123655E 
X-CRM114-Status: GOOD (  17.59  )
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

When a prog is detached from a trampoline, it is freed after an RCU
grace period, or an RCU tasks trace one if it is sleepable. This covers
the tasks that are running the prog, since the prog's enter helper takes
the matching read lock before the prog is called. On a preemptible
kernel, it doesn't cover a task that was preempted in the trampoline
just before the enter helper. That task holds no lock yet, and it calls
the prog after it was freed:

  BUG: KASAN: vmalloc-out-of-bounds in __bpf_prog_enter_recur+0x3a5/0x3f0
  Read of size 8 at addr ffffc90000055040 by task candidate/110
  CPU: 1 UID: 0 PID: 110 Comm: candidate Not tainted 7.3.0-rc2-00014-g15071f2a1263-dirty #2 PREEMPT(full)
  Call Trace:
   <TASK>
   __bpf_prog_enter_recur+0x3a5/0x3f0
   bpf_trampoline_6442509193+0x37/0xf1
   __x64_sys_futex+0x9/0x410
   do_syscall_64+0xb0/0x530
   ...

Wait for an RCU tasks grace period before the existing one when freeing
a prog that was linked to a trampoline. An RCU tasks grace period only
ends once the tasks that were preempted have run again, and
bpf_tramp_image_put() already relies on it to free the image. It doesn't
wait for tasks that sleep in the trampoline, the next commit takes care
of those.

Only progs that were linked to a trampoline can be called this way, so
bpf_trampoline_add_prog() marks them and other progs are still freed as
before.

Fixes: e21aa341785c ("bpf: Fix fexit trampoline.")
Reported-by: Junseo Lim <zirajs7@gmail.com>
Closes: https://lore.kernel.org/bpf/aqdrwVpanH3WGurX@omen-arch/
Assisted-by: Claude:unspecified
Signed-off-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
---
 include/linux/bpf.h     |  1 +
 kernel/bpf/syscall.c    | 19 ++++++++++++++++++-
 kernel/bpf/trampoline.c |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 1d2676782d70..a8ec85127571 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1770,6 +1770,7 @@ struct bpf_prog_aux {
 	bool offload_requested; /* Program is bound and offloaded to the netdev. */
 	bool attach_btf_trace; /* true if attaching to BTF-enabled raw tp */
 	bool attach_tracing_prog; /* true if tracing another tracing program */
+	bool tramp_linked; /* true if it was ever linked to a trampoline */
 	bool func_proto_unreliable;
 	bool tail_call_reachable;
 	bool xdp_has_frags;
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 244a939b9d2d..96217b99399d 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -2448,6 +2448,21 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu)
 	bpf_prog_free(aux->prog);
 }
 
+/*
+ * Progs called from a trampoline can also be reached by a task that was
+ * preempted in the trampoline before the prog's enter helper took its RCU
+ * read lock, wait for those first.
+ */
+static void __bpf_prog_put_rcu_tasks(struct rcu_head *rcu)
+{
+	struct bpf_prog *prog = container_of(rcu, struct bpf_prog_aux, rcu)->prog;
+
+	if (prog->sleepable)
+		call_rcu_tasks_trace(rcu, __bpf_prog_put_rcu);
+	else
+		call_rcu(rcu, __bpf_prog_put_rcu);
+}
+
 static void __bpf_prog_put_noref(struct bpf_prog *prog, bool deferred)
 {
 	bpf_prog_kallsyms_del_all(prog);
@@ -2461,7 +2476,9 @@ static void __bpf_prog_put_noref(struct bpf_prog *prog, bool deferred)
 		btf_put(prog->aux->attach_btf);
 
 	if (deferred) {
-		if (prog->sleepable)
+		if (IS_ENABLED(CONFIG_TASKS_RCU) && prog->aux->tramp_linked)
+			call_rcu_tasks(&prog->aux->rcu, __bpf_prog_put_rcu_tasks);
+		else if (prog->sleepable)
 			call_rcu_tasks_trace(&prog->aux->rcu, __bpf_prog_put_rcu);
 		else
 			call_rcu(&prog->aux->rcu, __bpf_prog_put_rcu);
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 90b70ea0d370..9d69c066a817 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -907,6 +907,7 @@ static int bpf_trampoline_add_prog(struct bpf_trampoline *tr,
 	}
 
 	hlist_add_head(&node->tramp_hlist, prog_list);
+	node->link->prog->aux->tramp_linked = true;
 	if (kind == BPF_TRAMP_FSESSION) {
 		tr->progs_cnt[BPF_TRAMP_FENTRY]++;
 		fexit = fsession_exit(node);
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
