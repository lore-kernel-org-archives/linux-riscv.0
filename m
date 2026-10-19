Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AFACCA490
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3W97Ft+dbMHDkPgKw7Sl8k/z/XqOGGgXU3ORKUcOwRs=; b=22wymrZJ+IyVuW
	05e4dY2n/HLZadg/bhxJOMBBRwXf6kjE4r882bXEMDqbQ9NiUZCx0SRRenI1nS4qftl7Mm3Ap0Zew
	vNgXky90msGgD7uVcp35VVvOL7N2cR3p1wwXIE1SEPFpqusk9gggw8mJlbMDyS9L0GOk2eT/i1Bv+
	4pbX5yeB27WbAuyL1iQ4ALuQZEji1GTvhZLkC8caOp+FoBQeTYVVThBgka3DwQOEfvYmdR86pVs2o
	rJI6cZX/n18e7fuLC2H8e35foA35k6N7nEvfmBww76e8e8L63Exqd+lGsLDvyK0XWJI/7X5eF6lai
	NFM7+FZ3DW4LnEENEPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIceB-00000006Q0Z-1ZJ3;
	Mon, 19 Oct 2026 01:58:43 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIce8-00000006Pyi-34gh
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 01:58:41 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3275648eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Oct 2026 18:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375120; x=1792979920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX3gFXGtK0qFC1+jmqNQ0ZBmFVgyc6CU75RzS6mT9B0=;
        b=GsKc3xXCmd6cdDS/Dd61JBBNB1B6tqBot4fOokv2grQxkmKJiXOrcw11FvsgpKvfYS
         m3CczwM+uLwRG2PwSr44/fLlIt34zVV1nP9EE+v/tOmYZ/z30DWjAs6b1F+uczXh1cjr
         J7mIFE0M5Hkyn9dZ6DDByiE2PngaSuBpr1FwEh9SWaLWGnigM6wYQ5DyFc9Wu85WXZvM
         gi1057V6IcCBa/Oue97diYxFn+h6ttQSHoC2+Sw9nT2pjJQaSVEsTCanw5bNlEnORm//
         jqgZBAjdYs2MlRnjtx4uWz74xZ23htVqgfM4spDte6PdbzxBQugfNXNVc1Rbm/22Rp76
         QKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375120; x=1792979920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX3gFXGtK0qFC1+jmqNQ0ZBmFVgyc6CU75RzS6mT9B0=;
        b=gLj526lduaNdFw/sgUFo9KDFUsBfywNBJSLIjlaCDr1xa6CdkBDXOCxaEvqDVkos6K
         N9Zzj7a1uCg6PNyS+GWOaaaKenJk8GUOAQE1TGgkop5+01aRGZviuy+hHK6L8l87EfQX
         wLAYRzmiwdUvVxB6kr7w3wn3I1CjfsqJxcakFxWO6HchNTTbMjFju36hZAj+8OZ1O7j0
         uo4LcxvGwgB0xsWwdJHajrtj8daJeEoOaJZGO7nNtw6u2t3aw/49BdmaHVAW16A9/HK+
         7LCyvROb0CW5u0SvSXvYXqbCXlVYU9PrccgGIq4UWKvmk63/qx2gPIUH0ATz+d9UWBGU
         w1tw==
X-Forwarded-Encrypted: i=1; AKwUvBzog9yfrEEctRZEv9QtIuCAWgc9VsWu1CZGGlDj+7Du2v5Tdcv2lWLlwmMD/Bm3rW+jfySDlIHzd9Vw/g==@lists.infradead.org
X-Gm-Message-State: AFq9FYL/lTtY7AyqwnusVTL0KHx9dEeNu3LJ6L0FeQ87X2zXbywB1ORK
	NWVcVpus6E2Pqj/AAcdTBHV77MZCA0Zk2rqMoyUFvhI7NAoUfuAVe12t
X-Gm-Gg: AYBFou129akEpY4w3ZBynPtL2Elvnm9whhVDdP2sLOsTotweYeriYBE4KG0YkkvkYOS
	4xw2sCdAbve8J6ANswEBxRdrX5ED27gLsK+Q2rQUYHbsko7vxafcojG0lrlHrdvtZyyD5D3Ltn1
	7VdTJBtMipj8fBVQKQz03z3f5+tiunKmQpW3iUqLPos1nWNf6/bMtBWQRnB0hMc+QOLLJd+rSFm
	carJnQzKnTQHrgbReTgUTxQZkLFgC9DLltdFm3TSi+yUMmctZvYGnfRlXHrKQNKjZLu8IuwyVLm
	dcPD77c0g5p7lWjNtFmnBibs2KJ23wCN2QQxqJhsvE+i0XAU7cu6XMwj3NPcAI7Js36jwN/tHSr
	3u5Gj2sT9bMV6rpG2VPzFmAhkWmN1mjBXBeIsGXZQ0TfYLfqqNFPCV1BLovD6jKXPTB75Q2XCoL
	GWyJzJXOCJYNt57jzFOOYhkE9ldghIbfASpGkaBOaQ3Sta0MXwc4/wBnqeTr3g42bgjg==
X-Received: by 2002:a05:7022:b057:20b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-18ad0b5ffc8mr1432273c88.19.1792375119985;
        Sun, 18 Oct 2026 18:58:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:39 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 09:58:10 +0800
Subject: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
MIME-Version: 1.0
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
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
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_185840_783197_4AC3542E 
X-CRM114-Status: GOOD (  12.28  )
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

On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
does the word loads of the dcache name compare and of path name
hashing.

None of the KASAN test cases reads memory through it, so nothing
noticed that KASAN did not check these loads at all.

Add a case that reads a freed object through load_unaligned_zeropad()
and expects a report. Skip it with hardware tag-based KASAN, since
arm64 turns tag checking off for this load:

  kasan_load_unaligned_zeropad, x86_64, generic KASAN
  without "word-at-a-time: check the first byte in
  load_unaligned_zeropad()"                                 FAILED
  with it                                                   PASSED

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/kasan/kasan_test_c.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index b9e167ed5be32..c791512f6fc49 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -28,6 +28,9 @@
 #include <trace/events/printk.h>
 
 #include <asm/page.h>
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+#include <asm/word-at-a-time.h>
+#endif
 
 #include "kasan.h"
 
@@ -1673,6 +1676,26 @@ static void kasan_memcmp(struct kunit *test)
 	kfree(ptr);
 }
 
+static void kasan_load_unaligned_zeropad(struct kunit *test)
+{
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+	char *ptr;
+
+	/* The tag check is turned off for this load on arm64 with MTE. */
+	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_HW_TAGS);
+
+	ptr = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
+	kfree(ptr);
+
+	OPTIMIZER_HIDE_VAR(ptr);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test,
+		kasan_int_result = load_unaligned_zeropad(ptr));
+#else
+	kunit_skip(test, "Test requires CONFIG_DCACHE_WORD_ACCESS=y");
+#endif
+}
+
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
@@ -2264,6 +2287,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kasan_alloca_oob_right),
 	KUNIT_CASE(kasan_memchr),
 	KUNIT_CASE(kasan_memcmp),
+	KUNIT_CASE(kasan_load_unaligned_zeropad),
 	KUNIT_CASE(kasan_strings),
 	KUNIT_CASE(kasan_bitops_generic),
 	KUNIT_CASE(kasan_bitops_tags),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
