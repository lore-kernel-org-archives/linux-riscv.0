Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69FFCD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7fycVXj6E9kgeRD3Bd7gfwbqaP6LqIut30DKB4YVR0=; b=xn4RgmWC7dOOj+
	j/vuOc8cTtUlalCaZI/lNqD7crMKjN+aNPIahVZgZjhzH3gjtPTeRVaUyKmxSz4v8kmYgQh+8cpgA
	2nJD1XhZSCkjcWmjXBZF+XipLy9ABBX/S/IK9jPkFMPxaTxawco0LxlbXn1/FeE20e443ofXiq+aW
	8pypOBV2mM3fLYwaPDvJRckuYN/K0bqgae4dt3UhtIfofveyy5AhwHMuzMxvwAOhd566oI9rWki2p
	3LNFNrHwM4VsI9EcYfyxlTuyid2OqJJOVSAhzRsotL9fMGjwxMv2WKZ2sWCMiDLm9TPXM6O2naCQE
	5rg9eY6aWSjvSTwgoDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPwn-0000000DZf7-2B8v;
	Mon, 11 May 2026 12:41:21 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPwk-0000000DZd0-0qln
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 12:41:19 +0000
Received: from yzs (unknown [183.156.89.125])
	by APP-01 (Coremail) with SMTP id qwCowADXf2tfzgFqB9bmDw--.5197S2;
	Mon, 11 May 2026 20:41:04 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Andreas Schwab <schwab@suse.de>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH v3] riscv: misaligned: Restore epc in error path
Date: Mon, 11 May 2026 20:41:01 +0800
Message-ID: <20260511124101.3202094-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <mvmh5oe1ixn.fsf@suse.de>
References: <mvmh5oe1ixn.fsf@suse.de>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXf2tfzgFqB9bmDw--.5197S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxCr1rZFyDKFy8ZF1DZFb_yoW5Zr1rpF
	4UJ3s09rW2y3Z2gFWS9F4qgFyrZwn3JryxGrsrG34SkFWjqryFqFyft3WYqFy5XrWkXr48
	KFW2qrs8W3ZxAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-Originating-IP: [183.156.89.125]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoEA2oBuvNICQABso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_054118_615296_7011C454 
X-CRM114-Status: GOOD (  11.62  )
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

In handle_scalar_misaligned_store/load, regs->epc is temporarily set to
0. And be restored in the first error path.  But it not restore for the
rest of the error path. This cause the epc corrupted.

Fix this by restore epc in fp error and copy_from_user error.

Fixes: 7c586a555a48 ("riscv: add floating point insn support to misaligned access emulation")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
Change in v3:
- Refactored error handling to use a centralized common error exit (goto
  out_restore_epc).

Change in v2:
- add Assisted-by tag

 arch/riscv/kernel/traps_misaligned.c | 32 +++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 2a27d3ff4ac6..21a3ceb1fae8 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -224,6 +224,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	unsigned long insn;
 	unsigned long addr = regs->badaddr;
 	int fp = 0, shift = 0, len = 0;
+	int ret = -1;
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
@@ -303,17 +304,18 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		shift = 8 * (sizeof(ulong) - len);
 		insn = RVC_RS2S(insn) << SH_RD;
 	} else {
-		regs->epc = epc;
-		return -1;
+		goto out_restore_epc;
 	}
 
-	if (!IS_ENABLED(CONFIG_FPU) && fp)
-		return -EOPNOTSUPP;
+	if (!IS_ENABLED(CONFIG_FPU) && fp) {
+		ret = -EOPNOTSUPP;
+		goto out_restore_epc;
+	}
 
 	val.data_u64 = 0;
 	if (user_mode(regs)) {
 		if (copy_from_user(&val, (u8 __user *)addr, len))
-			return -1;
+			goto out_restore_epc;
 	} else {
 		memcpy(&val, (u8 *)addr, len);
 	}
@@ -328,6 +330,10 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	regs->epc = epc + INSN_LEN(insn);
 
 	return 0;
+
+out_restore_epc:
+	regs->epc = epc;
+	return ret;
 }
 
 static int handle_scalar_misaligned_store(struct pt_regs *regs)
@@ -337,6 +343,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	unsigned long insn;
 	unsigned long addr = regs->badaddr;
 	int len = 0, fp = 0;
+	int ret = -1;
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
@@ -405,16 +412,17 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		len = 2;
 		val.data_ulong = GET_RS2S(insn, regs);
 	} else {
-		regs->epc = epc;
-		return -1;
+		goto out_restore_epc;
 	}
 
-	if (!IS_ENABLED(CONFIG_FPU) && fp)
-		return -EOPNOTSUPP;
+	if (!IS_ENABLED(CONFIG_FPU) && fp) {
+		ret = -EOPNOTSUPP;
+		goto out_restore_epc;
+	}
 
 	if (user_mode(regs)) {
 		if (copy_to_user((u8 __user *)addr, &val, len))
-			return -1;
+			goto out_restore_epc;
 	} else {
 		memcpy((u8 *)addr, &val, len);
 	}
@@ -422,6 +430,10 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	regs->epc = epc + INSN_LEN(insn);
 
 	return 0;
+
+out_restore_epc:
+	regs->epc = epc;
+	return ret;
 }
 
 int handle_misaligned_load(struct pt_regs *regs)
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
