Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8B9C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Cc:Message-Id:Subject:
	Mime-Version:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yy53CpgOxAAKxxr8CNhmnAGROJo3u0CgH57dSKWbwjk=; b=rI5
	EfqPiwHErgJc5PhyzgBUMLx6rDFfRPFBpeiUusC1pwVsIuScXeLhUCAUaeDAyODXo9SF50gxiWpKO
	RTXJ2vEIi9rSEDD78Ou1mdsTUyCGu1NaJ2jCM4SmmR7mDcNJLSp3+Hrmfv3mVlBJqZu0Dr2a3hbY0
	I6xhdS4VAVG1leFosbgl22188kI8Y7ljtl3vAGJnC/eHOpMNhfViE97b4FLBl2qupNUgZmFKGnHif
	F97YRUaZ/SWG/U9j9L1eaFrQscLZOzJ2qB2K4x8SZFIZxfc6QGlpFcdksrleJLxwhp8I67i8jv5HF
	Sak902i7pxqksJlNfxnaaKp9uavPaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4fd-0000000Evft-0Bo3;
	Tue, 07 Jul 2026 12:13:01 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4fZ-0000000EveF-31Ap
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 12:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783426371; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WUCot7/K7DvmbTXO2aDp1/r+7gn1NIAyCFsZSusXrB8=;
 b=qbz4j2yoKqjCaocxE32aFItWOAxRvP0QTmvv4udmAldvRXJ2ehNoRwnSoFz6CU+I9IKjCv
 dDQaj5fCPjoyzE5Jp01AnoVJr8Iydtb1vhLNNdTqlhzhzpSgFWYzgPM7S9kzZKaqrLlpZh
 7CjuI521xEIY/GHKOj+t8qNEeLIdQm3OjfBuZH+HgGlg8htLbNf6tSGE4j6pvoat2Sj4nw
 9w02pq/3QPwDoaUT1fc8PwWsP6BuCP5YneLDi3JGwl0Ow45gZSShg49IRH8HuucEkkgQ26
 Swp+ro/2Qaci+/pLQeyp2CiscASSIyiNi+6Do8f0J9wL4W8qxqM0s2FM31PHfw==
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
Subject: [PATCH] riscv: ftrace: reject out-of-range non-direct targets
Message-Id: <20260707121235.759104-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: <mark.rutland@arm.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<linux-trace-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Tue,  7 Jul 2026 20:12:35 +0800
X-Lms-Return-Path: <lba+26a4ced41+d5684b+lists.infradead.org+qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_051258_591631_D1887A02 
X-CRM114-Status: GOOD (  15.62  )
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

RISC-V initializes the AUIPC half of each ftrace callsite to reach
ftrace_caller and later only patches the JALR instruction. The old
ftrace_make_call() code redirected any requested target outside the
JALR immediate range back to FTRACE_ADDR.

That fallback is only valid for direct-call targets, where
ftrace_caller can still dispatch through op->direct_call. For an
ops-specific trampoline, the generic ftrace core requested a call to
ops->trampoline. Redirecting the site to FTRACE_ADDR instead enters
ftrace_caller and invokes op->func, bypassing that trampoline.

ftrace_modify_call() had the same issue more directly: it ignored
old_addr and addr and always validated and updated the site as
FTRACE_ADDR.

Add a helper to resolve call targets consistently. Keep targets that
fit in the existing AUIPC/JALR window, redirect only out-of-range
direct-call targets through FTRACE_ADDR, and reject other out-of-range
targets. Use the resolved old and new targets in ftrace_modify_call()
so the architecture implementation follows the generic contract.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/ftrace.c | 79 +++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index b430edfb83f4..26604bbc4bb5 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -46,16 +46,19 @@ void arch_ftrace_update_code(int command)
 	flush_icache_all();
 }
 
-static int __ftrace_modify_call(unsigned long source, unsigned long target, bool validate)
+static int __ftrace_modify_call(unsigned long source, unsigned long old,
+				unsigned long target, bool validate)
 {
-	unsigned int call[2], offset;
+	unsigned int call[2], old_call[2], offset;
 	unsigned int replaced[2];
 
 	offset = target - source;
 	call[1] = to_jalr_t0(offset);
 
 	if (validate) {
-		call[0] = to_auipc_t0(offset);
+		offset = old - source;
+		old_call[0] = to_auipc_t0(offset);
+		old_call[1] = to_jalr_t0(offset);
 		/*
 		 * Read the text we want to modify;
 		 * return must be -EFAULT on read error
@@ -63,9 +66,10 @@ static int __ftrace_modify_call(unsigned long source, unsigned long target, bool
 		if (copy_from_kernel_nofault(replaced, (void *)source, 2 * MCOUNT_INSN_SIZE))
 			return -EFAULT;
 
-		if (replaced[0] != call[0]) {
-			pr_err("%p: expected (%08x) but got (%08x)\n",
-			       (void *)source, call[0], replaced[0]);
+		if (replaced[0] != old_call[0] || replaced[1] != old_call[1]) {
+			pr_err("%p: expected (%08x %08x) but got (%08x %08x)\n",
+			       (void *)source, old_call[0], old_call[1],
+			       replaced[0], replaced[1]);
 			return -EINVAL;
 		}
 	}
@@ -77,6 +81,46 @@ static int __ftrace_modify_call(unsigned long source, unsigned long target, bool
 	return 0;
 }
 
+static bool ftrace_call_target_in_range(unsigned long addr)
+{
+	unsigned long ftrace_addr = FTRACE_ADDR;
+	unsigned long distance;
+
+	distance = addr > ftrace_addr ? addr - ftrace_addr : ftrace_addr - addr;
+
+	return distance <= JALR_RANGE;
+}
+
+static int ftrace_resolve_call_addr(struct dyn_ftrace *rec, unsigned long addr,
+				    unsigned long *target)
+{
+	unsigned long direct;
+
+	/*
+	 * The AUIPC instruction is initialized for ftrace_caller and this
+	 * implementation only patches the JALR instruction afterwards. Targets
+	 * that fit in the existing AUIPC/JALR window can be called as-is.
+	 */
+	if (ftrace_call_target_in_range(addr)) {
+		*target = addr;
+		return 0;
+	}
+
+	/*
+	 * Out-of-range direct-call targets can still be reached through the
+	 * ftrace_caller path, which dispatches via op->direct_call. Do not use
+	 * this fallback for ops-specific trampolines, because ftrace_caller
+	 * invokes op->func and would not preserve the requested trampoline.
+	 */
+	direct = ftrace_find_rec_direct(rec->ip);
+	if (direct && addr == direct) {
+		*target = FTRACE_ADDR;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
 static const struct ftrace_ops *riscv64_rec_get_ops(struct dyn_ftrace *rec)
 {
@@ -116,19 +160,18 @@ static int ftrace_rec_update_ops(struct dyn_ftrace *rec) { return 0; }
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned long distance, orig_addr, pc = rec->ip - MCOUNT_AUIPC_SIZE;
+	unsigned long pc = rec->ip - MCOUNT_AUIPC_SIZE;
 	int ret;
 
-	ret = ftrace_rec_update_ops(rec);
+	ret = ftrace_resolve_call_addr(rec, addr, &addr);
 	if (ret)
 		return ret;
 
-	orig_addr = (unsigned long)&ftrace_caller;
-	distance = addr > orig_addr ? addr - orig_addr : orig_addr - addr;
-	if (distance > JALR_RANGE)
-		addr = FTRACE_ADDR;
+	ret = ftrace_rec_update_ops(rec);
+	if (ret)
+		return ret;
 
-	return __ftrace_modify_call(pc, addr, false);
+	return __ftrace_modify_call(pc, 0, addr, false);
 }
 
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
@@ -215,11 +258,19 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	unsigned long caller = rec->ip - MCOUNT_AUIPC_SIZE;
 	int ret;
 
+	ret = ftrace_resolve_call_addr(rec, old_addr, &old_addr);
+	if (ret)
+		return ret;
+
+	ret = ftrace_resolve_call_addr(rec, addr, &addr);
+	if (ret)
+		return ret;
+
 	ret = ftrace_rec_update_ops(rec);
 	if (ret)
 		return ret;
 
-	return __ftrace_modify_call(caller, FTRACE_ADDR, true);
+	return __ftrace_modify_call(caller, old_addr, addr, true);
 }
 #endif
 
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
