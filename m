Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D4BC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Acg4WdqFM5h51RRgpTKgooD5QQmt4UQwfgPl+mRW9xg=; b=NmzF+Jcf24oSHt
	hjjcX6/kf+d1E58TCz2Nva3wDjKuZ0ytqlPJxKvsViEwsCzNOLZ2BaDHECBCREYXttKeEXCM5Fq9u
	bNHS2D1e3q8Zh1+e6ULs2MJbgv2DOs+DNuPUCa3ObkJIxKRCIWC+rGFCnDXHlUGeKBYr/qW313vY1
	HQEc/s5xeQ+0KXvB4i9Jil0rth2tSs3kI5ttgShh04CjNKwbfyda9I3pRMEg2rvyVBAjNSmzCnqP9
	7Cl/dTGjHdHSFISjD6vNw9RS/T8nFaoHY5vyhE0GaDFkGXPknwO7O2NG2LlHVhC3aTYsaLnUHzK1J
	dyfr5f3RU2wPk4DXSYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhSJ-0000000E3jd-09oX;
	Tue, 30 Jul 2024 07:39:35 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhSD-0000000E3ha-2sVJ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 07:39:33 +0000
Received: from qiao.. (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowABHTEijmKhmfLARAg--.42862S2;
	Tue, 30 Jul 2024 15:39:15 +0800 (CST)
From: Zhe Qiao <qiaozhe@iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	surenb@google.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	wangkefeng.wang@huawei.com,
	willy@infradead.org,
	qiaozhe@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
Date: Tue, 30 Jul 2024 15:38:22 +0800
Message-ID: <20240730073822.27732-1-qiaozhe@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowABHTEijmKhmfLARAg--.42862S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1fGw45Gr1DArWDKw48WFg_yoW8CFW3pF
	Wak3y3ZrsagrnayFZ7Ar1UXa1rCa4rtanrur9rKas0kr47ur15Kws5Z3Z5X34jyr18WFyr
	Ar4YkFyrZFyDuwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF
	4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0Xo7DUUUU
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_003930_130070_C33660D3 
X-CRM114-Status: GOOD (  12.50  )
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

Hello everyone, recently while learning about the Riscv architecture's
handling of page fault exceptions in the Linux kernel, I found that
there is no handling of VM_CAULT_SIGSEGV in mm_fault_erroneous (), but
rather a BUG() is executed directly. Therefore, I simultaneously analyzed
the processing procedures of arm64, powerpc, and sh architectures for
this area and found that all three architectures have processing for
VM_CAULT_SIGSEGV. Therefore, I added relevant processing methods for
VM_CAULT_SIGSEGV on the riscv architecture.

As a beginner, I am not sure if this processing method is correct and
would like to hear the opinions of my seniors.

Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
---
 arch/riscv/mm/fault.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 5224f3733802..868163b904e2 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -61,26 +61,27 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 
 static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_fault_t fault)
 {
+	if (!user_mode(regs)) {
+		no_context(regs, addr);
+		return;
+	}
+
 	if (fault & VM_FAULT_OOM) {
 		/*
 		 * We ran out of memory, call the OOM killer, and return the userspace
 		 * (which will retry the fault, or kill us if we got oom-killed).
 		 */
-		if (!user_mode(regs)) {
-			no_context(regs, addr);
-			return;
-		}
 		pagefault_out_of_memory();
 		return;
 	} else if (fault & (VM_FAULT_SIGBUS | VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE)) {
 		/* Kernel mode? Handle exceptions or die */
-		if (!user_mode(regs)) {
-			no_context(regs, addr);
-			return;
-		}
 		do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 		return;
+	} else if (fault & VM_FAULT_SIGSEGV) {
+		do_trap(regs, SIGSEGV, SEGV_MAPERR, addr);
+		return;
 	}
+
 	BUG();
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
