Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B4BC46CC5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=eYfyiIu3kI7u8maOFVDnKD5whcebnA95F4/zYxVQMC0=; b=EpqXyCbtREa+Gx
	d5euDXEpBP6GFikrvoj6TMpro4KHnkcUeeYVW3aALtgBK1XjVHRrCYzUBY0zobHcIi/gxzEN3my9I
	l0oku67MKW0REg6TB1WZYkvGmxeIdBPbp5KnsahshMV/fE+7zWyow8XK9KgRwwF+DGBojChC1A41K
	68xzKP0rMZMTYoo4pyPqCyWhtxDVWnllUc/hVNZdQRKIEVV1+xL2n16yN/uYbBbcgUU1lRrALQCKo
	DlRNkGRPaf3vwtJcqA55UGrBoE882J0Lb1Y37sbBooIpcMLH/ooo7Pdej9DZb8ZJKiYDvrjlnx8O6
	ijny0OC0bX/WZTiNuRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZP-002dZT-0T;
	Fri, 15 Dec 2023 09:33:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZM-002dYe-22
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 09:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=78VUp4ekMeaCQuFyW0sC3Rbbj/THiYo4c7UXzXOpUYU=; b=bnPrR5+CXr7BBoaFWXx1hwtAwH
	2F2PEBm7YfZ8Z+ek5E6sU2NggQXV8mH21iJOx8IuUUKojL8nl8piu1SVhyFdQehQqPX2euFT8vltW
	gihZz2bb9gv+VspJ5CUh/WjJz42XFPueBSyn/WRVvdtzjuELfVeUcwPUpxitCH1rPHzI5cnsWn6R6
	OA71iWY86Q5Duna4NQFs5qEO9r76fyhbsZt9MW8nobXMxoFO5xvrRTH57KxULwxHYWII82RLcrG8u
	0xuFVu5NdLh7F6MnKASZQN+xq+AblZov9qntQ2dc8J39R9EsSjSbj7uUsPN6ddau0FzX8ZUSPYnLe
	HmXCrtSg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rE4ZE-00FSOc-4Z; Fri, 15 Dec 2023 09:33:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DB5FA301157; Fri, 15 Dec 2023 10:33:11 +0100 (CET)
Message-Id: <20231215092707.799451071@infradead.org>
User-Agent: quilt/0.65
Date: Fri, 15 Dec 2023 10:12:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 davem@davemloft.net,
 dsahern@kernel.org,
 daniel@iogearbox.net,
 andrii@kernel.org,
 martin.lau@linux.dev,
 song@kernel.org,
 yonghong.song@linux.dev,
 john.fastabend@gmail.com,
 kpsingh@kernel.org,
 sdf@google.com,
 haoluo@google.com,
 jolsa@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 samitolvanen@google.com,
 keescook@chromium.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 jpoimboe@kernel.org,
 joao@overdrivepizza.com,
 mark.rutland@arm.com,
 peterz@infradead.org
Subject: [PATCH v3 6/7] bpf: Fix dtor CFI
References: <20231215091216.135791411@infradead.org>
MIME-Version: 1.0
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

Ensure the various dtor functions match their prototype and retain
their CFI signatures, since they don't have their address taken, they
are prone to not getting CFI, making them impossible to call
indirectly.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/bpf/cpumask.c |    8 +++++++-
 kernel/bpf/helpers.c |   16 ++++++++++++++--
 net/bpf/test_run.c   |   15 +++++++++++++--
 3 files changed, 34 insertions(+), 5 deletions(-)

--- a/kernel/bpf/cpumask.c
+++ b/kernel/bpf/cpumask.c
@@ -96,6 +96,12 @@ __bpf_kfunc void bpf_cpumask_release(str
 	migrate_enable();
 }
 
+__bpf_kfunc void bpf_cpumask_release_dtor(void *cpumask)
+{
+	bpf_cpumask_release(cpumask);
+}
+CFI_NOSEAL(bpf_cpumask_release_dtor);
+
 /**
  * bpf_cpumask_first() - Get the index of the first nonzero bit in the cpumask.
  * @cpumask: The cpumask being queried.
@@ -441,7 +447,7 @@ static const struct btf_kfunc_id_set cpu
 
 BTF_ID_LIST(cpumask_dtor_ids)
 BTF_ID(struct, bpf_cpumask)
-BTF_ID(func, bpf_cpumask_release)
+BTF_ID(func, bpf_cpumask_release_dtor)
 
 static int __init cpumask_kfunc_init(void)
 {
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2150,6 +2150,12 @@ __bpf_kfunc void bpf_task_release(struct
 	put_task_struct_rcu_user(p);
 }
 
+__bpf_kfunc void bpf_task_release_dtor(void *p)
+{
+	put_task_struct_rcu_user(p);
+}
+CFI_NOSEAL(bpf_task_release_dtor);
+
 #ifdef CONFIG_CGROUPS
 /**
  * bpf_cgroup_acquire - Acquire a reference to a cgroup. A cgroup acquired by
@@ -2174,6 +2180,12 @@ __bpf_kfunc void bpf_cgroup_release(stru
 	cgroup_put(cgrp);
 }
 
+__bpf_kfunc void bpf_cgroup_release_dtor(void *cgrp)
+{
+	cgroup_put(cgrp);
+}
+CFI_NOSEAL(bpf_cgroup_release_dtor);
+
 /**
  * bpf_cgroup_ancestor - Perform a lookup on an entry in a cgroup's ancestor
  * array. A cgroup returned by this kfunc which is not subsequently stored in a
@@ -2570,10 +2582,10 @@ static const struct btf_kfunc_id_set gen
 
 BTF_ID_LIST(generic_dtor_ids)
 BTF_ID(struct, task_struct)
-BTF_ID(func, bpf_task_release)
+BTF_ID(func, bpf_task_release_dtor)
 #ifdef CONFIG_CGROUPS
 BTF_ID(struct, cgroup)
-BTF_ID(func, bpf_cgroup_release)
+BTF_ID(func, bpf_cgroup_release_dtor)
 #endif
 
 BTF_SET8_START(common_btf_ids)
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -600,10 +600,21 @@ __bpf_kfunc void bpf_kfunc_call_test_rel
 	refcount_dec(&p->cnt);
 }
 
+__bpf_kfunc void bpf_kfunc_call_test_release_dtor(void *p)
+{
+	bpf_kfunc_call_test_release(p);
+}
+CFI_NOSEAL(bpf_kfunc_call_test_release_dtor);
+
 __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
 {
 }
 
+__bpf_kfunc void bpf_kfunc_call_memb_release_dtor(void *p)
+{
+}
+CFI_NOSEAL(bpf_kfunc_call_memb_release_dtor);
+
 __bpf_kfunc_end_defs();
 
 BTF_SET8_START(bpf_test_modify_return_ids)
@@ -1671,9 +1682,9 @@ static const struct btf_kfunc_id_set bpf
 
 BTF_ID_LIST(bpf_prog_test_dtor_kfunc_ids)
 BTF_ID(struct, prog_test_ref_kfunc)
-BTF_ID(func, bpf_kfunc_call_test_release)
+BTF_ID(func, bpf_kfunc_call_test_release_dtor)
 BTF_ID(struct, prog_test_member)
-BTF_ID(func, bpf_kfunc_call_memb_release)
+BTF_ID(func, bpf_kfunc_call_memb_release_dtor)
 
 static int __init bpf_prog_test_run_init(void)
 {



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
