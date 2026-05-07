Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6632ECD342C
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 02:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9RcEJ4Ut4Y4Km8BdJpK2evOTOQ/PwEAVaYYtJlB0DgU=; b=xSyJ7MA6LhIGZk
	DiLnuoBXrROEfWwAj35Jrx9rkPOhFi4esL3THelOn9yZ5MfrAly8O8ILfSTkDTQIVSeWIV+NNje3Z
	q6wPhPverq8u9rJsCk27hiKJFcPKXpbpWycRmp+xd6g4XiWF3F4zyi3FvAk32mVbF8gKWlZEmDLYI
	svA7q1zzFrMXwA1IOp0zwqA61t7I5FcYZK4LZ/r0enRVMRIKZj/66ia5qS3wiNO4qyvIYIa/5v/rm
	NDKcgGS4KMIDlWRtEBfcH/EVkAsEEiByoCBr2kRQYCrjXcxII6OXEmlT6tz2OORDrsOaldGi4pI1v
	TEUiDcZyRtrSktz1VXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKo93-00000002USj-3gDl;
	Thu, 07 May 2026 02:07:21 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKo92-00000002URV-2TeD
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 02:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yd
	UBtmd50CdROuu/UoerWWZ1tatkzSQabwi60nogiSM=; b=YrCIFvQN4ra4eK5Ozy
	zbF/rk0Dc7bEL/9ZWole6vD+icFs9KNogoI6fYzda8zortw4i3HJ1+DkYkBVbEjf
	pr37Q/qpHHWazWupDd+0BdF/p/1yIRYQYXE28VnM97Vjyn4fb+RecaYlcxscEjv6
	Hs/mXHqqjnj2/GSR06Dgm7dCk=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wB3rdue8_tpuD26Dg--.8877S2;
	Thu, 07 May 2026 10:06:23 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: lib: optimize strchr() with Zbb extension
Date: Thu,  7 May 2026 10:06:20 +0800
Message-Id: <20260507020620.134225-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wB3rdue8_tpuD26Dg--.8877S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4fGr1DJFWxXFWUZw4kCrg_yoWrXr4xpF
	4akwnxKw1vy34xur4aya1I9rs8Xrn5JFy5K3sIqFyrGa4qyr1jqr93t3WrX3yDArW5Jry2
	vF4UG3sruF17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXZ2hUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0R99KWn785-s+AAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_190721_081742_A6D33E5B 
X-CRM114-Status: GOOD (  11.73  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Add a Zbb-powered optimization to the existing strchr() implementation
using the 'orc.b' instruction, following the same pattern established
by strnlen().

The Zbb variant processes data in word-sized chunks using orc.b to
detect both NUL terminators and target characters in parallel. On
systems without Zbb support, the original byte-by-byte implementation
is used as a fallback via the alternatives mechanism.

Benchmark results (QEMU TCG, rv64):
  Length | zbb=off (MB/s) | zbb=on (MB/s) | Improvement
  -------|----------------|---------------|------------
  1 B    | 27             | 25            | -7.4%
  7 B    | 147            | 128           | -12.9%
  16 B   | 216            | 372           | +72.2%
  64 B   | 378            | 958           | +153.4%
  512 B  | 480            | 1990          | +314.6%
  4096 B | 501            | 2269          | +352.9%

The regression on very short strings (1-7 bytes) is due to the fixed
overhead of the word-level path: broadcasting the target character to
all byte lanes via multiplication and checking pointer alignment before
entering the main loop. For strings shorter than one machine word, this
setup cost outweighs the benefit of parallel comparison. As string
length increases beyond 16 bytes, the word-at-a-time processing shows
significant gains.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/lib/strchr.S | 115 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/riscv/lib/strchr.S b/arch/riscv/lib/strchr.S
index 48c3a9da53e3..600b19452bc2 100644
--- a/arch/riscv/lib/strchr.S
+++ b/arch/riscv/lib/strchr.S
@@ -6,9 +6,15 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
 
 /* char *strchr(const char *s, int c) */
 SYM_FUNC_START(strchr)
+
+	__ALTERNATIVE_CFG("nop", "j strchr_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
+
 	/*
 	 * Parameters
 	 *   a0 - The string to be searched
@@ -29,6 +35,115 @@ SYM_FUNC_START(strchr)
 	li	a0, 0
 2:
 	ret
+
+/*
+ * Variant of strchr using the ZBB extension if available
+ *
+ * This implementation uses orc.b to detect both NUL terminators and target
+ * characters in parallel, processing word-sized chunks for efficiency.
+ */
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+strchr_zbb:
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+# define CZ	clz
+#else
+# define CZ	ctz
+#endif
+
+.option push
+.option arch,+zbb
+
+	/*
+	 * Returns
+	 *   a0 - Address of first occurrence of 'c' or NULL
+	 *
+	 * Parameters
+	 *   a0 - String to search
+	 *   a1 - Character to find
+	 *
+	 * Clobbers
+	 *   t0, t1, t2, t3, t4
+	 */
+
+	/*
+	 * Prepare target character mask.
+	 * Broadcast target character to all bytes using multiply.
+	 */
+	andi	a1, a1, 0xff
+	li	t1, 0x01010101
+#if __riscv_xlen == 64
+	slli	t2, t1, 32
+	or	t1, t1, t2
+#endif
+	mul	t2, a1, t1
+
+	/* All-ones mask for orc.b comparisons. */
+	li	t4, -1
+
+	/* Check alignment. */
+	andi	t0, a0, SZREG-1
+	beqz	t0, 2f
+
+	/* Handle misaligned portion byte-by-byte. */
+1:
+	lbu	t1, 0(a0)
+	beq	t1, a1, 9f
+	beqz	t1, 8f
+	addi	a0, a0, 1
+	andi	t0, a0, SZREG-1
+	bnez	t0, 1b
+
+	/* Main loop: process word-sized chunks. */
+2:
+	REG_L	t0, 0(a0)
+
+	/* Check for NUL terminator. */
+	orc.b	t1, t0
+	bne	t1, t4, 3f
+
+	/* Check for target character. */
+	xor	t1, t0, t2
+	orc.b	t1, t1
+	bne	t1, t4, 4f
+
+	addi	a0, a0, SZREG
+	j	2b
+
+3:
+	/* NUL found in current chunk. Check if target appears before NUL. */
+	not	t1, t1
+
+	xor	t3, t0, t2
+	orc.b	t3, t3
+	not	t3, t3
+
+	CZ	t3, t3
+	CZ	t1, t1
+
+	/* If NUL appears before target, character not found. */
+	bltu	t1, t3, 8f
+
+	srli	t3, t3, 3
+	add	a0, a0, t3
+	ret
+
+4:
+	/* Target found in chunk without NUL. */
+	not	t1, t1
+	CZ	t1, t1
+	srli	t1, t1, 3
+	add	a0, a0, t1
+	ret
+
+8:
+	/* Character not found, return NULL. */
+	li	a0, 0
+9:
+	ret
+
+.option pop
+#endif
 SYM_FUNC_END(strchr)
 
 SYM_FUNC_ALIAS_WEAK(__pi_strchr, strchr)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
