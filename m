Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A240CFC274
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2haktRICm2IMtx7k+0WMNrdOnN0TzEZ4vDQO/XCuNIo=; b=z86Njs8EEPIURm
	TYIOWSn6KMHFiJp76kPkyhdZx3LQSQkLu1d0J9t8etIPvXd9Q/cXY+0/D1iBJpsmxc72NKpnhvBhT
	0cLs/K4tYIFsdMrfF091Z4erkAAe3QK4XUPnANsrPxcRw0PXfctJpUQi1Q+bAPPw0Wh+HzMB1ozPM
	K4QsX4fulmmkwcYqj7lJrgYP9zzPknpt5o+ye5CmVAdZKGpxYap0JRMv4xWQeIrMT8txwWGn05Cq9
	gjHT++8TS+AtmOXGvZ7ds5SchT+YAoCvtvcc2h/dJcapoAWEyKkfl4cSRiCkOAIc9sSyGl9MK6b1G
	IyxAeBwsGWiz3ksjI+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d9a-00000007YGh-0nSn;
	Tue, 15 Oct 2024 08:43:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d9X-00000007YEh-2V0D;
	Tue, 15 Oct 2024 08:43:41 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.44.89])
	by APP-01 (Coremail) with SMTP id qwCowAAXAH8xKw5n0vitBw--.48480S2;
	Tue, 15 Oct 2024 16:43:31 +0800 (CST)
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
Subject: [PATCH v5 1/2] riscv: perf: add guest vs host distinction
Date: Tue, 15 Oct 2024 16:42:50 +0800
Message-Id: <a67d527dc1b11493fe11f7f53584772fdd983744.1728980031.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728980031.git.zhouquan@iscas.ac.cn>
References: <cover.1728980031.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAXAH8xKw5n0vitBw--.48480S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4rAw18Aw43Xw17JrykAFb_yoW5Wr1UpF
	4DCFn3KrWUWrs2934ayF4Uuw15ur1rX3y7ZryIk345CrsFqF98JFn7Ka1UAryFyrykWa48
	J3WYvF45Cws8taUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwV
	W8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRkHUkUUUUU
	=
X-Originating-IP: [121.237.44.89]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAcLBmcOAQGnBQAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_014340_029672_B937F99B 
X-CRM114-Status: UNSURE (   9.32  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/perf_event.h |  6 +++++
 arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index 665bbc9b2f84..38926b4a902d 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -8,7 +8,11 @@
 #ifndef _ASM_RISCV_PERF_EVENT_H
 #define _ASM_RISCV_PERF_EVENT_H
 
+#ifdef CONFIG_PERF_EVENTS
 #include <linux/perf_event.h>
+extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_misc_flags(struct pt_regs *regs);
+#define perf_misc_flags(regs) perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
@@ -17,4 +21,6 @@
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+#endif
+
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index c7468af77c66..c2c81a80f816 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -28,11 +28,49 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
+	if (perf_guest_state()) {
+		/* TODO: We don't support guest os callchain now */
+		return;
+	}
+
 	arch_stack_walk_user(fill_callchain, entry, regs);
 }
 
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
