Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D695F483DD
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ok0L9LLoZ091tngTpIi7KjZrXcuh95HSqrcAu/cMq+A=; b=mYrYKfdws6ENwg
	qql0HJNPUxClOWYO+Vq0q7lyaNIyLVz46+LE2nlIde13MeCaTV7W1jjKmejFTNPH7qoiWw5gIKwvY
	+C/KbzgDITWLOTiOquV8v/4QEzjtl9DoFXmx91C+pR2M2/mw9TyS/redDI3Uu9mxyyglrP5F29prk
	5+ykA++QI3u3ZyNMsrmJp8rbC7msMRwn7K+MI3VQbiZUythH9VT58KvCv8czTPmWRoOzCdzfdzXnb
	cnOODqdK0F3JIrr5eqIrTQ7gnJ1anaWim35f4ARpvTzjU/BC2WK7SqFPKxuh6HnI6DrNuFMT8hJhZ
	Mb/CTfgN4TD+7T8zTYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j5o-0000000HEKA-11Lz;
	Mon, 23 Mar 2026 17:29:32 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j5l-0000000HEJc-0Ds2
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 17:29:31 +0000
Received: from yzs (unknown [115.192.255.131])
	by APP-01 (Coremail) with SMTP id qwCowADnj2tueMFpkovqCg--.13525S2;
	Tue, 24 Mar 2026 01:29:18 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] riscv: misaligned: Restore epc in error path
Date: Tue, 24 Mar 2026 01:28:26 +0800
Message-ID: <20260323172826.69428-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnj2tueMFpkovqCg--.13525S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5ZFy8Kry3Kry7JF15XFb_yoW8ZF45pF
	47G39ayrWxt3W2qF4avr4vgFWfZwn3uryxJrsrG34rCF45XryrX395u3Z0vry0gFykWr48
	KFWYqF43WFs8A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [115.192.255.131]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwPA2nBLYtDnwABsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_102929_484800_7B074A83 
X-CRM114-Status: GOOD (  10.36  )
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

In handle_scalar_misaligned_{store, load}, regs->epc is temporarily set
to 0. While it is properly restored in the instruction decoding error
path, it is not restored in the subsequent error paths. This causes the
epc to be corrupted.

Fix this by restoring regs->epc in the unsupported fp and
copy_{from,to}_user error paths.

Fixes: 7c586a555a48 ("riscv: add floating point insn support to misaligned access emulation")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
To be honest, I am not entirely sure about the purpose of setting
regs->epc = 0 early in these functions. I suspect that simply removing
this line might be a better fix.

 arch/riscv/kernel/traps_misaligned.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 2a27d3ff4ac6..24f898853bba 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -307,13 +307,17 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		return -1;
 	}
 
-	if (!IS_ENABLED(CONFIG_FPU) && fp)
+	if (!IS_ENABLED(CONFIG_FPU) && fp) {
+		regs->epc = epc;
 		return -EOPNOTSUPP;
+	}
 
 	val.data_u64 = 0;
 	if (user_mode(regs)) {
-		if (copy_from_user(&val, (u8 __user *)addr, len))
+		if (copy_from_user(&val, (u8 __user *)addr, len)) {
+			regs->epc = epc;
 			return -1;
+		}
 	} else {
 		memcpy(&val, (u8 *)addr, len);
 	}
@@ -409,12 +413,16 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		return -1;
 	}
 
-	if (!IS_ENABLED(CONFIG_FPU) && fp)
+	if (!IS_ENABLED(CONFIG_FPU) && fp) {
+		regs->epc = epc;
 		return -EOPNOTSUPP;
+	}
 
 	if (user_mode(regs)) {
-		if (copy_to_user((u8 __user *)addr, &val, len))
+		if (copy_to_user((u8 __user *)addr, &val, len)) {
+			regs->epc = epc;
 			return -1;
+		}
 	} else {
 		memcpy((u8 *)addr, &val, len);
 	}
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
