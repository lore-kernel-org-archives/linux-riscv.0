Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDD7EE645D
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2aLDhNai/w0HZBdIN+OQ1UL4X8CyQwixwszGPY/XR4=; b=Msibo03/fr8Lum
	GpGM0X2voe/Wekx5qCwrMSa76sW/kS21ArNsN8hLdIAstbds6k1udbDnBAxkmS7RPY1VUe23f9XKF
	VM6vOJjaHo00I1Y22IAjtbfXzSfd+5ZEI811t7Kgh6A6seso1YSI7AtXIJsT92zwkJb0RcpU8AyE9
	9gFFY0EGkxf+nO53YELT2hvPvkqyySOC92U6U+ApfvUzdQXysUZsKF8BNpG4uqO/rBozZd8DIdHU1
	UxEtXVXzXuqLlanmc77SBIPFROzad0YVlZPWBT7N9GRUig+YvLxwOA/B3M9GVq0A5/xzbUVO4RkOg
	pxgQBtnupDoMjf6aQAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soelN-0000000CHpp-4B4h;
	Thu, 12 Sep 2024 08:01:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeku-0000000CHep-1kPU;
	Thu, 12 Sep 2024 08:00:48 +0000
Received: from zq-Legion-Y7000.. (unknown [180.111.103.6])
	by APP-01 (Coremail) with SMTP id qwCowAAHDx+fn+JmKl39Ag--.56032S2;
	Thu, 12 Sep 2024 16:00:32 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 1/2] riscv: perf: add guest vs host distinction
Date: Thu, 12 Sep 2024 16:00:29 +0800
Message-Id: <c62057d587f075a64442df1038fe27b52b89c997.1726126795.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726126795.git.zhouquan@iscas.ac.cn>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHDx+fn+JmKl39Ag--.56032S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw45tF18Xw45CFy7tF43Wrg_yoW5WryfpF
	4DCwn3KrWDWr4I934ayF1Uuw15ur1rX3y7ZryI93y5ursFqF98JFn7Kw1UAryFyrykXFy8
	J3WYvr45Cwn8taUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUCYLPUUUUU=
X-Originating-IP: [180.111.103.6]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0SBmbifRSFRwAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_010045_019731_2A9A5A99 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Introduce basic guest support in perf, enabling it to distinguish
between PMU interrupts in the host or guest, and collect
fundamental information.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/perf_event.h |  7 ++++++
 arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index 665bbc9b2f84..c2b73c3aefe4 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -8,13 +8,20 @@
 #ifndef _ASM_RISCV_PERF_EVENT_H
 #define _ASM_RISCV_PERF_EVENT_H
 
+#ifdef CONFIG_PERF_EVENTS
 #include <linux/perf_event.h>
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
+extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_misc_flags(struct pt_regs *regs);
+#define perf_misc_flags(regs) perf_misc_flags(regs)
+
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->epc = (__ip); \
 	(regs)->s0 = (unsigned long) __builtin_frame_address(0); \
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+#endif
+
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 3348a61de7d9..d68271ac7434 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -58,6 +58,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	unsigned long fp = 0;
 
+	if (perf_guest_state()) {
+		/* TODO: We don't support guest os callchain now */
+		return;
+	}
+
 	fp = regs->s0;
 	perf_callchain_store(entry, regs->epc);
 
@@ -74,5 +79,38 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+	if (perf_guest_state()) {
+		/* TODO: We don't support guest os callchain now */
+		return;
+	}
+
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
+
+unsigned long perf_instruction_pointer(struct pt_regs *regs)
+{
+	if (perf_guest_state())
+		return perf_guest_get_ip();
+
+	return instruction_pointer(regs);
+}
+
+unsigned long perf_misc_flags(struct pt_regs *regs)
+{
+	unsigned int guest_state = perf_guest_state();
+	unsigned long misc = 0;
+
+	if (guest_state) {
+		if (guest_state & PERF_GUEST_USER)
+			misc |= PERF_RECORD_MISC_GUEST_USER;
+		else
+			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+	} else {
+		if (user_mode(regs))
+			misc |= PERF_RECORD_MISC_USER;
+		else
+			misc |= PERF_RECORD_MISC_KERNEL;
+	}
+
+	return misc;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
