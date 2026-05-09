Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB92CD3447
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rawlz8ZVHJ51d4DtMTHxeLwO+eUVx4qseAJ+/M1J9SE=; b=2jIPudkZmHlOsh
	XBj4LN19p6JsTU1iofKuKtf0PrBNfBk+79aCaXp3eoRqOwseKXkgNIqIHdUv5aSe8T5QCfzrxFvvm
	+RS2XlBQbirRwGTYkHqMIQjBpVnz5icxT1wkRy/yyspIhRfMwwmGjyiqOAE/mSk5kCT57orWBcSOY
	VGtZRPm60lUw/JxkeTndRuq+oHMHCzBJpzSSjkqoj3nRANILKfgLVqdVSD0SmbUI3I7fJjdQM9Yup
	XeCiDyFoCs5X7kmd1snywm+6+vrIz9qq71xOYdCLkYKfqsHvDyN5fjWRkZaVy1JHH2kkpjRbGxUbt
	M5WURv71+VOA/mNSaJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcJ6-00000008Vbj-0qzb;
	Sat, 09 May 2026 07:41:04 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcJ3-00000008VZi-1X7z
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:41:03 +0000
Received: from yzs (unknown [115.199.218.204])
	by APP-01 (Coremail) with SMTP id qwCowACnTWkF5f5pdu2vDw--.14398S2;
	Sat, 09 May 2026 15:40:54 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alex@ghiti.fr,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	schwab@suse.de,
	namcao@linutronix.de,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH v2] riscv: misaligned: Restore epc in error path
Date: Sat,  9 May 2026 15:40:53 +0800
Message-ID: <20260509074053.1748061-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowACnTWkF5f5pdu2vDw--.14398S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rJr4kXr48Zw48GF4rKrg_yoW8Cry8pF
	47G3sayrWxtF12qFWavFn0gFWrXwn3CryxJrsrG34FkFW3XryrX395Ww1YqFy0gFykWr40
	kFWaqry3WF4DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-Originating-IP: [115.199.218.204]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwCA2n+2TEoPgAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_004101_771671_9259F8FF 
X-CRM114-Status: UNSURE (   8.95  )
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

In handle_scalar_misaligned_store/load, regs->epc is temporarily set to
0. And be restored in the first error path.  But it not restore for the
rest of the error path. This cause the epc corrupted.

Fix this by restore epc in fp error and copy_from_user error.

Fixes: 7c586a555a48 ("riscv: add floating point insn support to misaligned access emulation")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
Changes in v2:
- Added 'Assisted-by' tag.

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
