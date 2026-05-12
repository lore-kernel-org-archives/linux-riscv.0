Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD150CD4855
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxz3J3TMYCKZ/S3IN/AEZBXAl/T7FIElpV4URRIjb6I=; b=zOU+SZSBBZtbjK
	G0PuRRO1OPY/wF1E0S9HW0HXF9zarVQ0lD6JrWAC4rJfo5lkI+FiVWXOiWTfB3OBuBVYnT7Dbm/9y
	fSmbRuWm9XjarnR+4dJ67ttQ7BZrAHWzFbvmNpyj7Z6qR1Qy6jaQjChBpmqG+BLphUNi9S24kWBCX
	g78Raht7DPlu9NnxIzlcNt1DwEGZwAxJGXGn0+jnWJVCvNI0O0tYrKQBByWP7A5I1BS88lGH8Hp78
	GzuU/6RbZg7+TVDlfczX9/yTfgR95ut7Mz6FErCBg86ImKkp3F+T4Y3d0p0r0emwRVhWltKE4smy5
	2L1d+oBt3Kr00mxqzmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhbb-0000000Fw2w-0rTl;
	Tue, 12 May 2026 07:32:39 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhbY-0000000Fw1g-3QKL
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 07:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pB
	IBMXz36sssME+lKehR+5CjED5Xmd4twSn/mrxxIfY=; b=VctuolUxep88HKoZSI
	Aj/YyLbUVo37RHcbv0sg+0AqDpKiAOUbQaoL1LX5+siztbWyPISu87nKQDvZgNH9
	rU8gQy+pgMdzrBVdx2SVrppc3ptKIFcZ20mJHqBsIQRoVQV6LS+CdXCMqKYgwVgL
	Tl10uutG4g1NBP0nILPLiB0cQ=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3vz431wJq7ieNAw--.2537S2;
	Tue, 12 May 2026 15:31:04 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: david.laight.linux@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH v2] riscv: lib: optimize strchr() with Zbb extension
Date: Tue, 12 May 2026 15:30:07 +0800
Message-Id: <20260512073006.363434-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507112235.41e539fa@pumpkin>
References: <20260507112235.41e539fa@pumpkin>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3vz431wJq7ieNAw--.2537S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4fGr1DJw4UtF43ZFWUurg_yoWrCw45pF
	4Skwnxt3ykKw1xursIyF409rs8Xrn5KFW3K3sxtFyrAa4jyr1jqr93t3WrXrWDArWrGryS
	vFWUK347ur17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlFAXUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0hgfymoC1zi+bgAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_003237_221883_E517AA50 
X-CRM114-Status: GOOD (  12.99  )
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
