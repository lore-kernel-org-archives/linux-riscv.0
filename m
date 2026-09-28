Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF143C9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGBlwJILR4WaBSs/Ctf9aLUXyJnoFZnKhC8LqCTL3s4=; b=zyKn3F/Dhx1gWD
	PKEZGrQRuMv83FrtTZGGVqSfA5Qt2gxwjpIbXX6yE0P5PZLEYORM17ZS+YPLXVRJVfmRA/cBfTWYf
	Clfj8XtqvVD6kOWNcFi/wVude1w6yE4kENpGt8bEGWeWDBMPVIsUdxQApI5F3VlXlCXdLzIj5Rylq
	OM01lay8p0lUtjG7lgND9b64YbtCeYGAlJQ2iWs/gQYP24lY2/1/ByVw4oduYyotVg5ZePqlbRGcz
	Ef9/li9l4cnnOpy0xtEO1SbHzu8izbmw/M24qWbPsoXWshnR8EyRDW8UtYzyWQWbj262UVJLqX7jk
	kMFAWb9TCG/38nmrcc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Fg-00000000AHj-1SCF;
	Mon, 28 Sep 2026 09:02:24 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7Fe-00000000AHK-0eEr
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 09:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=by
	nvqUvi7ZvHMOfmQxc2l/YnI5j0vDTfWUTS7y+yRh0=; b=kg/cZdFrczmYAtaU0h
	hPHugj9lJAKrpOVIHJjdiQvsiC/VfS/lta7xC1mQgV51Qs7SPmqsYsLqrXCqXLSV
	Bb4EzPvZCRKLT7TGBbYUPoxezo3P4ZsUervS0CO8LotJxdlW6RxuWHH1ZQOuZIBJ
	ca6cbjuL3aFPVjVGG0/N6WI54=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnL5v0LLpqbpJxBQ--.14765S2;
	Mon, 28 Sep 2026 17:01:40 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [RESEND PATCH v2] riscv: lib: optimize strchr() with Zbb extension
Date: Mon, 28 Sep 2026 17:01:23 +0800
Message-Id: <20260928090123.43899-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512073006.363434-1-min_halo@163.com>
References: <20260512073006.363434-1-min_halo@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnL5v0LLpqbpJxBQ--.14765S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4fGr1DJw4UtF43ZFWUurg_yoWrZrWDpF
	4Skwnxt3ykKw1xursIyF409rs8Xrn5KFW3K3sxtFyrAa4jkr1Fqr93t3WrXrWDArWrGryS
	vFWUK3srur17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlYLPUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9BSRPWq6LPSboQAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_020222_563902_6B124314 
X-CRM114-Status: GOOD (  12.98  )
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
  1 B    | 27             | 24            | -11.1%
  7 B    | 148            | 125           | -15.5%
  16 B   | 218            | 363           | +66.5%
  64 B   | 384            | 1044          | +171.9%
  512 B  | 424            | 2081          | +390.8%
  4096 B | 498            | 2636          | +429.3%

The regression on very short strings (1-7 bytes) is due to the fixed
overhead of the word-level path: broadcasting the target character to
all byte lanes via multiplication and checking pointer alignment before
entering the main loop. For strings shorter than one machine word, this
setup cost outweighs the benefit of parallel comparison. As string
length increases beyond 16 bytes, the word-at-a-time processing shows
significant gains.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
Changes in v2:
- Move alignment handling out-of-line (optimize hot path).
- Hide load latency by reordering REG_L and addi.
- Simplify loop branching.

 arch/riscv/lib/strchr.S | 119 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/riscv/lib/strchr.S b/arch/riscv/lib/strchr.S
index 48c3a9da53e3..b7abf8b609b6 100644
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
@@ -29,6 +35,119 @@ SYM_FUNC_START(strchr)
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
+	/* Check alignment: jump out-of-line if misaligned. */
+	andi	t0, a0, SZREG-1
+	bnez	t0, 10f
+
+	/* Entry Path A: Directly aligned. Pre-bias for the loop. */
+	addi	a0, a0, -SZREG
+
+2:
+	/* Main loop: process word-sized chunks. */
+	REG_L	t0, SZREG(a0)
+	addi	a0, a0, SZREG
+
+	/* Check for NUL terminator. */
+	orc.b	t1, t0
+	bne	t1, t4, 3f
+
+	/* Check for target character. */
+	xor	t1, t0, t2
+	orc.b	t1, t1
+	beq	t1, t4, 2b
+
+	/* Target found in chunk without NUL. */
+	not	t1, t1
+	CZ	t1, t1
+	srli	t1, t1, 3
+	add	a0, a0, t1
+	ret
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
+8:
+	/* Character not found, return NULL. */
+	li	a0, 0
+9:
+	ret
+
+	/* --- Out-of-line: Handle misaligned portion byte-by-byte --- */
+10:
+	lbu	t1, 0(a0)
+	beq	t1, a1, 9b
+	beqz	t1, 8b
+	addi	a0, a0, 1
+	andi	t0, a0, SZREG-1
+	bnez	t0, 10b
+
+	/* Entry Path B: Misalignment fixed. Pre-bias and enter main loop. */
+	addi	a0, a0, -SZREG
+	j	2b
+
+.option pop
+#endif
 SYM_FUNC_END(strchr)
 
 SYM_FUNC_ALIAS_WEAK(__pi_strchr, strchr)
-- 
2.43.0


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
