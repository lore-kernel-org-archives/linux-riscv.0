Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D57606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnYvBfSi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lIUaBbrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kGEuqK2fc99+HcdJLXhXUYjcD1Y9KxVfKmXq0i9pMiQ=; b=GnYvBfSik9zPQOsGzNQVH+vDjs
	OvhIAjid3rKdHukcq2+l5GrDrBS/VPPW+joJEPcbesWyrHGShTJOLHFa2RtCa3e2MpMLlxJuYACaq
	k+jwJGFiuYHRzCsAIPLH/f2RqdIcs3QMJIjHGU90iTsRuUcIaqlyd6MpQvlVG0dU3N1j/DQdLqrCL
	j0Kwcovmn12n7Jp0LQBf5lantcDJFjLTm0QK4yikNqQvLMRp2cFhWNUnFK8rcj7GQehcuN9dN7ARN
	3/KWeLwM1+EzHiB+1Dn/4s12FOKnvpPYlLotdU40DaAbI93ueDHqsWWJqtTUigd0GnkVLrpKJlNlK
	82GKTlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Q9-0000000FHfX-445H;
	Fri, 23 Oct 2026 01:50:13 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Q6-0000000FHdr-2xBg
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:50:12 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-353804b591eso743090eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 18:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720210; x=1793325010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5VOHmm+k0IBj8x+32bgCpnZFpHRZVbIyYT6tTI+jX8=;
        b=lIUaBbrcaN01gttAbHEVksORcee3ezIqtZ/TkJj/Sy8IQ5jBHeRVxWuCDCPPclD8aI
         dg2yvhc6n9+VOu+MIWAKAWzUdBJiyFVf1mC92wEJwjyJIj08NxVSL37O0v2mWWAguSr0
         1mDepdV7j/RjBRH9X5Ly1Z8j7ZBDhZ9mpTeo5JO9tyGPhhqKL/CDAP9glGyXO6evLNZ1
         9iPqF5MNf+0fpRMZ4lKGiHcvXR3ZOi4PtZ1ZV4cqG+V+/5MYC0Z1WZDSZRN0UAZuzNs2
         yaC35uUi/ouUQe9hZKnD9Bk4HnYg/dYTei0XFfG1Y3ODdNFxQHaI625g0wttWLu6PVkE
         rT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720210; x=1793325010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5VOHmm+k0IBj8x+32bgCpnZFpHRZVbIyYT6tTI+jX8=;
        b=NS+GUUPvgjVJgV8+GUbp8FxAv93noa93I1/WqZCGJkEijuB5ZSTB/UTLYkPnt4VY0X
         WyOXDPCt1sM6JnIcCZY4HELWrM3BuB7ewun825wD7ZatV+UlMJIhVOZ7sLCJ15EFRhOM
         D8PAu+YjBc8yh/qL2Wk4LMg0xKagYDf5x0KmH5WtET1paZpYL5jsgH8qpWTNz3+9VBDn
         H8ck6+qEoK3GKxGepKXUZzOLzoAa0UVVRhv5vBdXpdEoiN1c8f6UBd5PFK785optxOqW
         8VNPqdjpFsqtEtbsgRqgo6hC0JWc7APyehD+5+SLIJtmcI7owVwhFZSPKW3D0W8i2Hva
         4mOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGrvbP/PUzS75P0Zd9gmzv81VYJMYo/JQs4UdKd8YvHqsJmpvMoeh44LRgBopyiXe9GXJidUPmWVA4pw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJxY2aHM+VqSfIulMiYd87MVBkU/WTGzGSYfPR7Kk735+L7xf6E
	tB3Fwd2TSBPI3uhegU03ooZkgfZvxTgvCAogQXlraV/obwBC6ggK9Z6C
X-Gm-Gg: AYBFou3owxrBbgoAEr+6DTmDpB7R045YuQJY7isYE2r3VQAOFy1rgcNkZ5HiOKh8Kvr
	BdBia3ThpGGZv0dZ5+4S7y8wG+Q78tx0uG31aR9ERzgr6GRC3dF9TYIevJfFOSg+hdf7xificqg
	xn+jNZfJ3020syQxitYd11mLyHcgWNKA/pE/p10xstAnOf/EI8yGd2FjPWXcA1U3cg4nyPa+kMm
	Aia86WCwEB8ULuMpwBV4l1lmiAniESZ05BbGDvwSFQyNn2oVvkpZXPOUkj5nLk3bSkRYvhKaWxE
	pNtH6G4VGmfQ1Bg8hmyJhvgYzCy9qPrha2OeTzI0bTM9Rthcz1N6ocE2qtc0Xk1rvEJfGjgoRgr
	20+pjt52vS69aXhplH0ldUJIe/EXdsRxeR7XorrecB1SI9w7DR8tRbFHOYRjV59zE4REFWn48F5
	2SwGir+jnhza9K1O3NauR7OPu0U3KuO1GVIzXmhCd0ELriX3qJnYnMwCLw40JTmzsZf91+IHV/b
	Vxor7kTX6G72vvnAz7Di4we+R1K6f7lfuwvYOtzzbPKKA7vDEcy
X-Received: by 2002:a05:7300:fe81:b0:33c:e74:4624 with SMTP id 5a478bee46e88-369d977beeamr1247908eec.27.1792720209507;
        Thu, 22 Oct 2026 18:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:50:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 23 Oct 2026 09:49:48 +0800
Subject: [PATCH v2 1/2] word-at-a-time: check the first byte in
 load_unaligned_zeropad()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_185010_767549_6D9F9DEE 
X-CRM114-Status: GOOD (  19.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

load_unaligned_zeropad() reads a word that may run into an unmapped
page and recovers through an exception fixup. It does the word loads of
sized_strscpy() and of the name compare in dentry_string_cmp(), path
components in hash_name() and hashlen_string(), and the trailing bytes
in x86's csum_partial().

It is inline assembly on every architecture that implements it, so
KASAN and KCSAN never see these loads, while read_word_at_a_time() at
least checks the first byte of each word. A use-after-free or
out-of-bounds read of a name handed to path lookup goes unreported, and
so does strscpy() reading from a bad source, which the kasan_strings
KUnit case expects to be reported. On x86_64 with generic KASAN:

  KASAN and string KUnit suites      failures
                                  before    after
  CONFIG_FORTIFY_SOURCE=n              1        0
  CONFIG_FORTIFY_SOURCE=y              1        0

Check the first byte with instrument_read() at the start of
load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
does. All callers only load a word whose first byte belongs to the
string or buffer they read, so the check does not flag their intended
reads past the end. Add a no-op instrument_read() for the powerpc
selftest that builds the header in user space.

Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Marco Elver <elver@google.com>
---
 arch/arm/include/asm/word-at-a-time.h                           | 5 +++++
 arch/arm64/include/asm/word-at-a-time.h                         | 4 ++++
 arch/powerpc/include/asm/word-at-a-time.h                       | 4 ++++
 arch/riscv/include/asm/word-at-a-time.h                         | 4 ++++
 arch/s390/include/asm/word-at-a-time.h                          | 4 ++++
 arch/x86/include/asm/word-at-a-time.h                           | 4 ++++
 tools/testing/selftests/powerpc/primitives/linux/instrumented.h | 3 +++
 7 files changed, 28 insertions(+)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293d..361771f178699 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -56,6 +56,8 @@ static inline unsigned long find_zero(unsigned long mask)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/instrumented.h>
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
@@ -69,6 +71,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, [%2]\n"
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index d7a3b69dc8c6f..37d45e716c11a 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -8,6 +8,7 @@
 #include <linux/uaccess.h>
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -45,6 +46,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	__mte_enable_tco_async();
 
 	/* Load word from unaligned pointer addr */
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 54653a8634149..1660b2e3e3a8f 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -5,6 +5,7 @@
  * Word-at-a-time interfaces for PowerPC.
  */
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
@@ -168,6 +169,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, offset, tmp;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm(
 	"1:	" PPC_LL "%[ret], 0(%[addr])\n"
 	"2:\n"
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7e..761fa2734b7f5 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -11,6 +11,7 @@
 
 #include <asm/asm-extable.h>
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -60,6 +61,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	" REG_L " %0, %2\n"
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index 0b7779c8d5a4e..f3caa4959cc87 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
@@ -52,6 +53,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long data;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm_inline volatile(
 		"0:	lg	%[data],0(%[addr])\n"
 		"1:\n"
diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 422a47746657a..5374e08372253 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -71,6 +72,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm volatile(
 		"1:	mov %[mem], %[ret]\n"
 		"2:\n"
diff --git a/tools/testing/selftests/powerpc/primitives/linux/instrumented.h b/tools/testing/selftests/powerpc/primitives/linux/instrumented.h
new file mode 100644
index 0000000000000..114ef9284f69b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/instrumented.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KASAN or KCSAN to check in user space. */
+#define instrument_read(p, size)	((void)(p), (void)(size))

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
