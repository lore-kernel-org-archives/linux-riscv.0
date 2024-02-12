Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FBEC4829F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcZbcIkIJH1lFBvdGdyECj2Kr23P44Qj4WKaArPJPUk=; b=BkWoRWXW6z35kZ
	y5Kt00eF3kYzavM3NY69cFI96a7KaSEY+I8zXY2DNPEr/5rJKSOGEuSWO+pBJPkKkCzE6U9XWBm5k
	HcNFABdGPzZ7jI127ZnY5lAJSpoD3MRSTU6LL/0s4iAC7l2wt0QI0B8Dc6FEDUQJ4850YKcjlNHW2
	V/WQovMxV24k1Sactd2uIRqdhzInJNn2tgice/DXeUqs3oeQqVcTZwF+B+qU+8XPH64Ei4nelMRHQ
	w7DGEg67xonVSNU5oM1J0mWXJ3NZXWOfX7bffMHASK/dCZYkWVUIXz8sx5XvC+1Fh4whb7vmXXamG
	aiXWYoJXObSOX5xbq14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTs-00000004DDD-1bjn;
	Mon, 12 Feb 2024 02:55:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTo-00000004DA6-2Wcx
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d746ce7d13so23678355ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706535; x=1708311335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J8NdLE0ucNiNKFND0rK4zdkXC5jx9zUaL7zwsJdJPc=;
        b=f4bx8fKi8cDBAhx90/gljsUUqNbQpt525w4dp6Ux9xl3ps4Y9vy3Tf6ej9kH5eMg+u
         LlQGYvGOCJ7EPog/g2J616v2eh14HZOgn5DS8XBMPv27AWAXJjbNQ4DMQOAiAPFqzGRr
         9B2vYa1BVvmG1TcAFH6Mj007n0RNGBXJyMXy0Qk0N4KC71aT1Rvizt0qeNVo6aDopYX7
         IXXVIeLFCg7jE4XxHxQp6j4PeDawgSebjIvaIYkrEd46c5zPjrtjTLX1LPYNwownYhuU
         xUpshvkELp622z4640HuhcO4IUORhukhg5C98YWdZUx/VwQriOkmel2IZkC+b+XG80TI
         rztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706535; x=1708311335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6J8NdLE0ucNiNKFND0rK4zdkXC5jx9zUaL7zwsJdJPc=;
        b=n6D4AfkS14toWvbiqKgq79mcdNp2mbt8QZch4ln5bwTwMrUUsaZetu04MS2NkrRhmJ
         P0ergaAiWdjqN+A/2r6w4l7UX5MasAi6+qPRYMbBjPs0qPgADkuyztqqmmI2urSRpe8T
         adajgU/qOnl0CqKo8RKPfmymKciauNHIoWoazppBbPN3S/wyeIAxTWSXjp9hy0MaKGNt
         dz3YT1JTMC0WB8Mjsn14BZdmGNZN0NZ335y6YHBKAVuXmzpel/Tdm+Ft1qfQGsSFMQL/
         6bQctD+NWweuWVP0rqUDrJAFFg2SaT6SVPe5m/eRrT3tWzxKFVHm1crRwKAfJY968pr2
         6b6w==
X-Gm-Message-State: AOJu0YxaOAEurhJMNLMjzHC8hCQWnogLyVU3jY0+z+tgEmLbnksBS4EV
	4nUvWM4+2lkddqhGdkjFCu1CE97SBoVOXqZ/qT9PMtKNUHOfXIIjTJZy0D8MFr4=
X-Google-Smtp-Source: AGHT+IFUXXjAhYh8fPaDzJdt/6c0qL5uB2s4002mQVmQJYBv4oZI2UnLxM9T/HLUqj7hh7tlkNZOxg==
X-Received: by 2002:a17:903:25d2:b0:1d9:ed80:607f with SMTP id jc18-20020a17090325d200b001d9ed80607fmr5933876plb.41.1707706535523;
        Sun, 11 Feb 2024 18:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMVP8J2/uywWjIa8v+LtUBwTbCg6k4nUS11lldS4d4SPpgOkiUESJKifpQiePYf+5sb5RPwR8/2RD7ppjseWiDMb+tH3c47JIEhVd/KYoxUfEzqxLbMUoa1Z6QGicm0wv/0P7m6Mt2up3tJ9kh5+AfUU29Up1ThFadmZrNYH3Ghb/6ZESNPzpIMTLZVkLg6+08WA==
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:35 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org
Subject: [PATCH 5/7] riscv: Pass patch_text() the length in bytes
Date: Sun, 11 Feb 2024 18:55:16 -0800
Message-ID: <20240212025529.1971876-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185536_666293_4EEBDDCC 
X-CRM114-Status: GOOD (  14.71  )
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

patch_text_nosync() already handles an arbitrary length of code, so this
removes a superfluous loop and reduces the number of icache flushes.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/patch.h     |  2 +-
 arch/riscv/kernel/patch.c          | 15 +++++----------
 arch/riscv/kernel/probes/kprobes.c | 20 +++++++++++---------
 arch/riscv/net/bpf_jit_comp64.c    |  7 ++++---
 4 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9f5d6e14c405..7228e266b9a1 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -9,7 +9,7 @@
 int patch_insn_write(void *addr, const void *insn, size_t len);
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text_set_nosync(void *addr, u8 c, size_t len);
-int patch_text(void *addr, u32 *insns, int ninsns);
+int patch_text(void *addr, u32 *insns, size_t len);
 
 extern int riscv_patch_in_stop_machine;
 
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 7f030b46eae5..9aa0050225c0 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -19,7 +19,7 @@
 struct patch_insn {
 	void *addr;
 	u32 *insns;
-	int ninsns;
+	size_t len;
 	atomic_t cpu_count;
 };
 
@@ -227,15 +227,10 @@ NOKPROBE_SYMBOL(patch_text_nosync);
 static int patch_text_cb(void *data)
 {
 	struct patch_insn *patch = data;
-	unsigned long len;
-	int i, ret = 0;
+	int ret = 0;
 
 	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
-		for (i = 0; ret == 0 && i < patch->ninsns; i++) {
-			len = GET_INSN_LENGTH(patch->insns[i]);
-			ret = patch_text_nosync(patch->addr + i * len,
-						&patch->insns[i], len);
-		}
+		ret = patch_text_nosync(patch->addr, patch->insns, patch->len);
 		atomic_inc(&patch->cpu_count);
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
@@ -247,13 +242,13 @@ static int patch_text_cb(void *data)
 }
 NOKPROBE_SYMBOL(patch_text_cb);
 
-int patch_text(void *addr, u32 *insns, int ninsns)
+int patch_text(void *addr, u32 *insns, size_t len)
 {
 	int ret;
 	struct patch_insn patch = {
 		.addr = addr,
 		.insns = insns,
-		.ninsns = ninsns,
+		.len = len,
 		.cpu_count = ATOMIC_INIT(0),
 	};
 
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index cbf8197072bf..a64461fa715c 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -23,14 +23,14 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
+	size_t len = GET_INSN_LENGTH(p->opcode);
 	u32 insn = __BUG_INSN_32;
-	unsigned long offset = GET_INSN_LENGTH(p->opcode);
 
-	p->ainsn.api.restore = (unsigned long)p->addr + offset;
+	p->ainsn.api.restore = (unsigned long)p->addr + len;
 
-	patch_text_nosync(p->ainsn.api.insn, &p->opcode, 1);
-	patch_text_nosync(p->ainsn.api.insn + offset,
-			  &insn, 1);
+	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
+	patch_text_nosync(p->ainsn.api.insn + len,
+			  &insn, GET_INSN_LENGTH(insn));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
@@ -117,16 +117,18 @@ void *alloc_insn_page(void)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	u32 insn = (p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32 ?
-		   __BUG_INSN_32 : __BUG_INSN_16;
+	size_t len = GET_INSN_LENGTH(p->opcode);
+	u32 insn = len == 4 ? __BUG_INSN_32 : __BUG_INSN_16;
 
-	patch_text(p->addr, &insn, 1);
+	patch_text(p->addr, &insn, len);
 }
 
 /* remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_text(p->addr, &p->opcode, 1);
+	size_t len = GET_INSN_LENGTH(p->opcode);
+
+	patch_text(p->addr, &p->opcode, len);
 }
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 719a97e7edb2..43be2585f0d4 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -14,6 +14,7 @@
 #include "bpf_jit.h"
 
 #define RV_FENTRY_NINSNS 2
+#define RV_FENTRY_NBYTES (RV_FENTRY_NINSNS * 4)
 
 #define RV_REG_TCC RV_REG_A6
 #define RV_REG_TCC_SAVED RV_REG_S6 /* Store A6 in S6 if program do calls */
@@ -681,7 +682,7 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 	if (ret)
 		return ret;
 
-	if (memcmp(ip, old_insns, RV_FENTRY_NINSNS * 4))
+	if (memcmp(ip, old_insns, RV_FENTRY_NBYTES))
 		return -EFAULT;
 
 	ret = gen_jump_or_nops(new_addr, ip, new_insns, is_call);
@@ -690,8 +691,8 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 
 	cpus_read_lock();
 	mutex_lock(&text_mutex);
-	if (memcmp(ip, new_insns, RV_FENTRY_NINSNS * 4))
-		ret = patch_text(ip, new_insns, RV_FENTRY_NINSNS);
+	if (memcmp(ip, new_insns, RV_FENTRY_NBYTES))
+		ret = patch_text(ip, new_insns, RV_FENTRY_NBYTES);
 	mutex_unlock(&text_mutex);
 	cpus_read_unlock();
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
