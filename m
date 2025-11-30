Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A897CFD376
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v678b/b7TyJUNRe5KKJ+qyBXfP25bulzlOQjESs4VeM=; b=plGHLdQs9YIxMq
	tVcAfASMlBwTrAoP8MwtWhobXro6kJIu4ApU69H87bcRGhQ6d/217yE9/x/nFNF/BkOsuFfhVOlKj
	KnaejJIDluQ/S7HEnPy6544K+cNpjxIQiq3TXIsiomJqIfPO/rVCfB4CNq/wWlSM5m6bCYHVLD0Qx
	7tJDYJAWMOIWfoyioxLxIqRiQDtMxP/xXmHWDZpaCBtVUcpa5LP6co+u+i1mOOudGQDFKXzQKnrjW
	vqEfSG/TvyQ264KSKnXzTKAD58yxhs3Qf+8V5nhNhzyMJ3gJgfIbCoPwKaHkM5kUmWLY7tvW888cx
	7NgWQ62jsJQhCmTdNguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPedw-00000002DGR-1kVw;
	Sun, 30 Nov 2025 10:27:00 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPedt-00000002DFt-1eVS
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 10:26:59 +0000
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowAAn72_YGyxp+SC3Ag--.48966S2;
	Sun, 30 Nov 2025 18:26:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sun, 30 Nov 2025 18:23:50 +0800
Subject: [PATCH] lib/crypto: riscv/chacha: Maintain a frame pointer
MIME-Version: 1.0
Message-Id: <20251130-riscv-chacha_zvkb-fp-v1-1-68ef7a6d477a@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIADUbLGkC/yWM2wrCMBBEfyXssytNbEvor0iVJN3qIr0lNYgh/
 26wMC9nhjkJAnmmAJ1I4Cly4GUuIE8C3NPMD0IeCoOqVCPlpULPwUUsW8n9G18WxxWbtq5p0Np
 Ko6BcV08jf/7aa3+wp+1d7PtRgjWB0C3TxHsnYnuWGr2Tt5Shz/kH4XDFGpYAAAA=
X-Change-ID: 20251130-riscv-chacha_zvkb-fp-5644ed88b1a2
To: Jerry Shih <jerry.shih@sifive.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowAAn72_YGyxp+SC3Ag--.48966S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ktF1DKw1fJw1rKry7Awb_yoW8ZrWDpF
	yrXF92krW8tFZxCa9FkFy8trZ3AryIyFWfWa42qw15t3ykJr18AF9rZ3yfXF1fXFy8GF1D
	Crn8C3Z5uryDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_022657_814098_A77C0147 
X-CRM114-Status: UNSURE (   8.70  )
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

crypto_zvkb doesn't maintain a frame pointer and also uses s0, which
means that if it crashes we don't get a stack trace. Modify prologue and
epilogue to maintain a frame pointer as -fno-omit-frame-pointer would.
Also reallocate registers to match.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Found while diagnosing a crypto_zvkb "load address misaligned" crash [1]

[1]: https://lore.kernel.org/r/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/
---
 lib/crypto/riscv/chacha-riscv64-zvkb.S | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/crypto/riscv/chacha-riscv64-zvkb.S b/lib/crypto/riscv/chacha-riscv64-zvkb.S
index b777d0b4e379..dc4e45759d14 100644
--- a/lib/crypto/riscv/chacha-riscv64-zvkb.S
+++ b/lib/crypto/riscv/chacha-riscv64-zvkb.S
@@ -60,7 +60,7 @@
 #define VL		t2
 #define STRIDE		t3
 #define ROUND_CTR	t4
-#define KEY0		s0
+#define KEY0		t5
 #define KEY1		s1
 #define KEY2		s2
 #define KEY3		s3
@@ -142,8 +142,7 @@
 // the original Salsa20 paper which uses a 64-bit counter in state->x[12..13].
 // The updated 32-bit counter is written back to state->x[12] before returning.
 SYM_FUNC_START(chacha_zvkb)
-	addi		sp, sp, -96
-	sd		s0, 0(sp)
+	addi		sp, sp, -112
 	sd		s1, 8(sp)
 	sd		s2, 16(sp)
 	sd		s3, 24(sp)
@@ -155,6 +154,10 @@ SYM_FUNC_START(chacha_zvkb)
 	sd		s9, 72(sp)
 	sd		s10, 80(sp)
 	sd		s11, 88(sp)
+	sd		fp, 96(sp)
+	sd		ra, 104(sp)
+
+	addi		fp, sp, 112
 
 	li		STRIDE, 64
 
@@ -280,7 +283,6 @@ SYM_FUNC_START(chacha_zvkb)
 	bnez		NBLOCKS, .Lblock_loop
 
 	sw		COUNTER, 48(STATEP)
-	ld		s0, 0(sp)
 	ld		s1, 8(sp)
 	ld		s2, 16(sp)
 	ld		s3, 24(sp)
@@ -292,6 +294,7 @@ SYM_FUNC_START(chacha_zvkb)
 	ld		s9, 72(sp)
 	ld		s10, 80(sp)
 	ld		s11, 88(sp)
-	addi		sp, sp, 96
+	ld		fp, 96(sp)
+	addi		sp, sp, 112
 	ret
 SYM_FUNC_END(chacha_zvkb)

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251130-riscv-chacha_zvkb-fp-5644ed88b1a2

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
