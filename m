Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F7E93808
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 01:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2QUVOkl+LxQyBu5tYzCoHxh6F5Gobb4CtbgCh8u9TJk=; b=25hPMBvsp4lo+Q
	vzH1VECbKn4rarERaZGGqgKMvlyV631MlAx2ZNTfL53khukAbK1RK3f4q46F4H6WQOPKwFQvyFAZj
	8DRrpUNbf+hT/1P75NRom3yWE0GqY81PGuAsO6KSsYoiS6NfrJYyOc0XH6xv/4cFFd0ZEnje1BgNM
	rVzYKXsn9KwdE0uZZPFlB+OsYZjhoo5mEerN6IDeeOLvl1Ge2NH8tETzzJpqsCJL9K+VmcUKwKtC3
	EfqyLn3Yf3Ft70YwUWr5jAYusn2qInl6pJ976WPF6mz0SaXiGYQyWvqZKioL0bZ0KBZqDIpTsF2x8
	EVZ49vBsuGnINt/L+CKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5n3-0000000EpLr-3HjZ;
	Mon, 13 Apr 2026 01:08:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5n0-0000000EpLU-0hpH
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 01:08:35 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-464bc03efd8so2201316b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776042512; x=1776647312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bx/cx+/nSyPU4u4kSElxKqXthbDFkqX08J/TpBLSL1A=;
        b=lkRLACjZM3rB2+6+TUT6P7SnrWC34Z+/ndVGLhm8kZ51HXoTaA6QlpInHqwb47dvEm
         S6ReDTgcEmohUI83fngCmuJMJ1oySHZZOuVTgwZaqch1dXvNuDiSf2lzjrY8zw+E9/3x
         59uS1KasqYyNQ+H9TXvvJDqHGwsfSBIfm1Tj1Q6s0+fE0QrEl9wMlv2oz41LscGTP72b
         tq4GdFshkccKDSgzrWbzA41WQXQ2Vfysvsc8EoX1R1Iyh7UoOxAtD+Tbfpt8WmpZP81f
         3Yl9Kwsh26eyhZ9LacorVb/M+EW/2UasJ0D0hChyk+vk05walE9q1+43E1v2GTbhkQeK
         DOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776042512; x=1776647312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx/cx+/nSyPU4u4kSElxKqXthbDFkqX08J/TpBLSL1A=;
        b=szrssjatpXrBKpBqyL/fe9hFc8ZnYTfl41/QCAgMJLAtigHJGAcgQDuFwXzZCBsnQQ
         m9XVVNHdSnlsBkPCMXjsksNfxc+pQ2bknGaKAPaeIye7G2gXXtvA8/E+v4BhXzBg839J
         T5K23AGDeyiV7LOqZkpNYOSrMTub80bJArrzAGt2kjFdogPshPsmtng9VKs420EXhWVZ
         m0LHykoqGmNUcpGQODYfDzB+mdzpgANP2iHmkk+1h6gIPmKirhs3/hQ/OGRfZQeuSnR3
         LCt/aKI2FqYyM+JqG+0V2iqFh82WBg7Sji6oRrkgWjUSxJhoQK+Snx0MHkKWFUzuliA5
         k3FQ==
X-Gm-Message-State: AOJu0Yx6nOqpoNtvdL4kQAk+r7hzlHFzzRZcRdP22Hl5bcGWN4lms3Tc
	iYtBP5zwGDFDqvRsIlNkFQJngRwnj44rP2oo3r0Ra95A9rdoG4s3BpSR
X-Gm-Gg: AeBDievVHm1uSGq0rzFOA1d5i6pbfkfOzicCk8wAAen1tPE2qqJ3e53v/AffzhIJ6IO
	4wdJqg1AoRyT2bwmcs0Ji/KwkVJWOOHgLmoyzoejE6LTZlakbRUC4bwjUhIcaslrBT2gQRFK5k9
	xm1iZDsfyFPeN/9R5tebyILGByEYd9Xx6GH2BY49+KCJ9jxk5H7rJL8ubi+ouDpoXuFq4KlebJS
	ezj0vN1A3FHOiEnmidHHSo/ZKiBuvmeTzKhxQ0YK8DM/V6LtmY4QJ46hKVbgPtNrH58HRXoOOAu
	UYAyWcBhawENO51ibl44R7ciyxfqMraNHFDGSDGV5v+ViFpWONCj1BIdehn14kcsfHQCYGgMsAW
	/3i49NmIG4ze2V8OAP5cE5r4chWr6U4Dz/Ico7O79b0YL1SiU3zK4xslgKDbDaDIQ3JYmyPoCQ+
	PLLN/ThxFFQgkulgjOls6aQbrT30v3o5ybcXFUX1IhKKqU
X-Received: by 2002:a05:6808:4f0e:b0:467:1212:46fd with SMTP id 5614622812f47-4789ff0e572mr5642029b6e.33.1776042512098;
        Sun, 12 Apr 2026 18:08:32 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a2f557b5sm5556350b6e.11.2026.04.12.18.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 18:08:31 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: jiangfeng@kylinos.cn,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Neuling <mikey@neuling.org>
Subject: [PATCH] riscv: lib: Fix ZBB strnlen reading past count boundary
Date: Mon, 13 Apr 2026 01:07:38 +0000
Message-ID: <20260413010738.1622423-1-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_180834_241864_F60AAB6D 
X-CRM114-Status: GOOD (  19.33  )
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

The ZBB-optimized strnlen loop loads one word ahead before checking the
aligned boundary:

    REG_L   t1, SZREG(t0)       // load next word
    addi    t0, t0, SZREG       // advance
    orc.b   t1, t1
    bgeu    t0, t4, 4f          // boundary check AFTER load

where t4 = (s + count) & -SZREG.  When s is aligned and count is a
multiple of SZREG, t4 equals s + count and the loop loads a full word
starting at exactly s + count.  If s + count falls on a page boundary
with the next page unmapped, this faults.

Fix by computing the aligned boundary from the last valid byte
(s + count - 1) instead of s + count.  This makes the loop stop at the
word containing the last valid byte rather than potentially loading the
word after it.  The count == 0 case is already handled by the beqz
early exit.

Also add a pre-loop guard (bgeu t0, t4) for the case where all valid
bytes fit within the first word.  With the adjusted boundary, t4 can
equal t0, and entering the loop with stale register state from the
first-word processing would produce incorrect results.

The final minu clamp ensures the result is still correct when the last
loaded word extends past s + count - 1 within the same aligned word.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Claude Opus4.6 High Thinking
---

Here is a test case that demonstrates the bug. The kernel code is pulled out 
into a standalone file for testing.

 % cat test-strnlen-single.c
// SPDX-License-Identifier: GPL-2.0
/*
 * Minimal test: one strnlen call that triggers the ZBB over-read.
 * Run under GDB to single-step the fault.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

extern size_t kernel_strnlen(const char *s, size_t count);

int main(void)
{
	size_t page_size = sysconf(_SC_PAGESIZE);
	char *region, *start;
	size_t count = 16;  /* multiple of SZREG=8, triggers the bug */
	size_t ret;

	/* Map one page, guard page after it is unmapped */
	region = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	munmap(region + page_size, page_size);

	/* Fill with non-NUL, no terminator within count */
	memset(region, 'A', page_size);

	/* Aligned start, count reaches exactly to page end */
	start = region + page_size - count;

	printf("page=%p start=%p count=%zu end=%p (page_end=%p)\n",
	       region, start, count, start + count, region + page_size);
	printf("Calling kernel_strnlen...\n");

	/* This will fault on the buggy ZBB path */
	ret = kernel_strnlen(start, count);

	printf("Result: %zu (expected %zu)\n", ret, count);

	munmap(region, page_size);
	return 0;
}
% cat test-strnlen-zbb.S
/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Standalone copy of the kernel's ZBB strnlen for userspace testing.
 * Extracted from arch/riscv/lib/strnlen.S
 */

#define SZREG	8
#define REG_L	ld

.text
.global kernel_strnlen
.type kernel_strnlen, @function

kernel_strnlen:
	/* Jump straight to ZBB path (we know we have it) */
	j	strnlen_zbb

	/*
	 * Non-ZBB fallback (byte-at-a-time)
	 */
	addi	t1, a0, -1
	add	t2, a0, a1
1:
	addi	t1, t1, 1
	beq	t1, t2, 2f
	lbu	t0, 0(t1)
	bnez	t0, 1b
2:
	sub	a0, t1, a0
	ret


strnlen_zbb:

# define CZ	ctz
# define SHIFT	srl

.option push
.option arch,+zbb

	/* If maxlen is 0, return 0. */
	beqz	a1, 3f

	/* Number of irrelevant bytes in the first word. */
	andi	t2, a0, SZREG-1

	/* Align pointer. */
	andi	t0, a0, -SZREG

	li	t3, SZREG
	sub	t3, t3, t2
	slli	t2, t2, 3

	/* Aligned boundary. */
	add	t4, a0, a1
	andi	t4, t4, -SZREG

	/* Get the first word.  */
	ld	t1, 0(t0)

	/*
	 * Shift away the partial data we loaded to remove the irrelevant bytes
	 * preceding the string with the effect of adding NUL bytes at the
	 * end of the string's first word.
	 */
	srl	t1, t1, t2

	/* Convert non-NUL into 0xff and NUL into 0x00. */
	orc.b	t1, t1

	/* Convert non-NUL into 0x00 and NUL into 0xff. */
	not	t1, t1

	/*
	 * Search for the first set bit (corresponding to a NUL byte in the
	 * original chunk).
	 */
	ctz	t1, t1

	/*
	 * The first chunk is special: compare against the number
	 * of valid bytes in this chunk.
	 */
	srli	a0, t1, 3

	/* Limit the result by maxlen. */
	minu	a0, a0, a1

	bgtu	t3, a0, 2f

	/* Prepare for the word comparison loop. */
	addi	t2, t0, SZREG
	li	t3, -1

	/*
	 * Our critical loop is 4 instructions and processes data in
	 * 4 byte or 8 byte chunks.
	 */
	.p2align 3
1:
	ld	t1, SZREG(t0)
	addi	t0, t0, SZREG
	orc.b	t1, t1
	bgeu	t0, t4, 4f
	beq	t1, t3, 1b
4:
	not	t1, t1
	ctz	t1, t1
	srli	t1, t1, 3

	/* Get number of processed bytes. */
	sub	t2, t0, t2

	/* Add number of characters in the first word.  */
	add	a0, a0, t2

	/* Add number of characters in the last word.  */
	add	a0, a0, t1

	/* Ensure the final result does not exceed maxlen. */
	minu	a0, a0, a1
2:
	ret
3:
	mv	a0, a1
	ret

.option pop

.size kernel_strnlen, .-kernel_strnlen
% riscv64-linux-gnu-gcc -march=rv64gc_zbb -O0 -g -static -o test-strnlen-single-rv64 test-strnlen-single.c test-strnlen-zbb.S
% qemu-riscv64 -cpu rv64,zbb=true ./test-strnlen-single-rv64
page=0x7ff6d698c000 start=0x7ff6d698cff0 count=16 end=0x7ff6d698d000 (page_end=0x7ff6d698d000)
Calling kernel_strnlen...
Segmentation fault (core dumped)
%

 arch/riscv/lib/strnlen.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index 53afa7b5b3..a8911605c2 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -83,8 +83,13 @@ strnlen_zbb:
 	sub	t3, t3, t2
 	slli	t2, t2, 3
 
-	/* Aligned boundary. */
+	/*
+	 * Aligned boundary.  Use the address of the last valid byte
+	 * (s + count - 1) to avoid loading a word past the count
+	 * boundary in the loop below.  count == 0 is handled above.
+	 */
 	add	t4, a0, a1
+	addi	t4, t4, -1
 	andi	t4, t4, -SZREG
 
 	/* Get the first word.  */
@@ -120,6 +125,9 @@ strnlen_zbb:
 
 	bgtu	t3, a0, 2f
 
+	/* All remaining bytes are in the first word, no loop needed. */
+	bgeu	t0, t4, 2f
+
 	/* Prepare for the word comparison loop. */
 	addi	t2, t0, SZREG
 	li	t3, -1
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
