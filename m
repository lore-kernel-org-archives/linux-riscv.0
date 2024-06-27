Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509DDC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 03:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ojj8ex/xR2dWDPGb/msv6EXm0iHCXq8uPPszWO659LU=; b=OCrkesSkHJf0af
	VXeyZVJggQCFEpqD7NEGJKlbVBYItFHNJFWrVz05DcvAuBCv5pAnPLLlTFDK6V+kLwiEGTMxyeucH
	VZSBcTkfbbzua6awb+eaGdMBYv9U+x45fejeznxNkc3FQVLNWcIEVi/VIWgdS6kTs0bMqN+G6m/ut
	fI1jaYSKefOr0TD4hiqOFUfY0ePrQYEtzrEF9y901Bep0nR3pBCN0Hc3ABHccwjbyAE2ckaiJtEAa
	1GPy0OyLq/5+6M1B3GUUR9r/oUuNPC9ewXKrLGqm0lJUCKWshlYMZ0siltKxUYvbcZmRLQif1HSIC
	rU2UG21BLkDOXvRzmy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfPT-000000093cz-2Ut4;
	Thu, 27 Jun 2024 03:02:55 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfPQ-000000093cH-1vn5
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 03:02:54 +0000
Received: from ThinkPad-T480s.. (unknown [180.110.114.157])
	by APP-05 (Coremail) with SMTP id zQCowAA3IyBW1nxmJwUiAA--.8628S2;
	Thu, 27 Jun 2024 11:02:46 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: oleg@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	shuah@kernel.org,
	charlie@rivosinc.com,
	zhouquan@iscas.ac.cn
Subject: [PATCH v1 1/2] riscv: Expose orig_a0 in the user_regs_struct structure
Date: Thu, 27 Jun 2024 11:02:46 +0800
Message-Id: <a424caf3072d12ef6ba0c56c411789fb3282e844.1719408040.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719408040.git.zhouquan@iscas.ac.cn>
References: <cover.1719408040.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3IyBW1nxmJwUiAA--.8628S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWxGry5tFWxXrWfAFyrJFb_yoW8tr15pF
	ZakwnrKrWrurWkKry7ZayUWr47twnxG347KrWxt343Za4rtF45Zrn7Cw1qyr1fJFWvqFyI
	ga4ayrn8Aa1DZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUYManUUUUU
X-Originating-IP: [180.110.114.157]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAgBBmZ8ofedqQAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_200252_919120_DB6D5ED7 
X-CRM114-Status: GOOD (  10.28  )
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

Expose orig_a0 to userspace to ensure that users can modify
the actual value of `a0` in the traced process through the
ptrace(PTRACE_SETREGSET, ...) path.

The addition of orig_a0 also requires the following adjustments:
1) Adjust the position of orig_a0 in pt_regs to ensure correct copying.
2) MAX_REG_OFFSET should match the new bottom of pt_regs.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/ptrace.h      | 7 ++++---
 arch/riscv/include/uapi/asm/ptrace.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..380cf54c1f3d 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -12,6 +12,7 @@
 
 #ifndef __ASSEMBLY__
 
+/* MAX_REG_OFFSET should match the bottom of pt_regs */
 struct pt_regs {
 	unsigned long epc;
 	unsigned long ra;
@@ -45,12 +46,12 @@ struct pt_regs {
 	unsigned long t4;
 	unsigned long t5;
 	unsigned long t6;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 	/* Supervisor/Machine CSRs */
 	unsigned long status;
 	unsigned long badaddr;
 	unsigned long cause;
-	/* a0 value before the syscall */
-	unsigned long orig_a0;
 };
 
 #define PTRACE_SYSEMU			0x1f
@@ -64,7 +65,7 @@ struct pt_regs {
 
 #define user_mode(regs) (((regs)->status & SR_PP) == 0)
 
-#define MAX_REG_OFFSET offsetof(struct pt_regs, orig_a0)
+#define MAX_REG_OFFSET offsetof(struct pt_regs, cause)
 
 /* Helpers for working with the instruction pointer */
 static inline unsigned long instruction_pointer(struct pt_regs *regs)
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d..3e37f80cb3e8 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -54,6 +54,8 @@ struct user_regs_struct {
 	unsigned long t4;
 	unsigned long t5;
 	unsigned long t6;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 };
 
 struct __riscv_f_ext_state {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
