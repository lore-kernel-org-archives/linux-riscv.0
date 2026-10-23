Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BD606A319
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y4TTcr5w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hCKn24ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NBv6BKVYqmVHd1aIMPgC/yhbW3UB46PLsn7WKCjg3Bo=; b=Y4TTcr5w53eMD3uNhoxmZRB0kP
	Nl/LiN9hQBcl1AIXbO8Vqa5CUVtwCA0vedYLTN3n8fumzphWbasygRWxyHJTHt1nKlTNt9O46X1AJ
	dS7/ju29xTFSyWvv9UrTEBvMxanG2P9Xf93lqFgceZuLIdfi0Raheyn1pXuG5VvElprTWrK+J/Mu5
	Ubqyr49OaX25f0HB95pCHgZhQECqO8OdCsFgJF8jTg+qjyVzJ7huug/YHtrOv5aMksdQAN2lavxZp
	8Ym0WCWDdoDHBXuQqlpPm3fYBI4c39VNeqLD8rFzt2Dv3ayC56MnyFLlb+D2XYNhWfnuQIsdvZ1Uq
	1s/YJ77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4QH-0000000FHkG-0zQQ;
	Fri, 23 Oct 2026 01:50:21 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4QF-0000000FHiX-29tm
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:50:20 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-35943f55c06so452041eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 18:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720218; x=1793325018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=hCKn24chZGJGU/ONs32NDdD//e01PdI0HYphEPgXl66o0Kk2eMuKSm+aW8xA/TXdQ7
         QgAYp5/QMv4HKjjIj8ZPn/nOrrXxapln5y8A4NyNAgTR5GRWHxXbiNTTl7xRwBP9G5ez
         mkIISELxXlXfJuHi7HbvTWk2FzulHGhADSOztUc4ex5NuDF8HIIGEdRibkA7kPL1N60O
         /LzXcNiKhQJA/I4lrYfqUuFlKut77uy6pjIsuTw7KDd826I+gzslEi13kVyfbdJw6I4J
         m2XkL7E8oMgMBR3BlcUXelEFJ3UR77BpeDw4A16S3KfK7erA+6XthrWcmwZyfm6v27D+
         UdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720218; x=1793325018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=Rpqzw+YRKk5apnILGXn0UIlDR/c0fkOEQw6918HStMgXnQNziAXnoWVTFwfBFBthN1
         8fK7oZkbAQHPmo1B/0iNyG7sH36Yu5xRSAsAKxW4u9spk0cKqnJFhQY7chy0C/9EfvSU
         TGoCACm03I4Gplu9mRqiTvf3Di3oTPOdIELCLUf5ihvyCcEJkJxYQ6qIfsYN7dfjCICz
         3dpfItFQImKcMO5pOyEFmygukbBnVMKfnGGPTa7BO4Ti9UrHEkwGengY23In0wHVMiM4
         qznHPbZsp5eTsE3KX8g7ouOhmAFD3vV9kWeAYSP8t6ZCx4a0mTrxubRm6fwZwNbPHOrG
         7xlA==
X-Forwarded-Encrypted: i=1; AKwUvBwYllwh8eZ0A8vQNJ2qwoQcAZXJQ+ubbRE6s5NYuC6gvl0iVFncz+QAiIYvc5lk7RRAPqiMekAMec6UJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKLGBgHmBNs8tJITq+GGDY31GH+yMPcLmtSWXTzn0mIFmNUfFzA
	/xfLxzjrEnm3GAVLoJQFfBTFzgKIzRNsWZJ3MF+2UbIYVEjkQ8XPpNzd
X-Gm-Gg: AYBFou1nWnb5UdoffTvareXH196zkKrdzjt5HJ4rwGsSutxYRb3TXezB0zD81FjeTmj
	Yo4GSwZXpbfdV2VCKLRJGR2Bbb7U0N59AryQv9JL0aSywCIVqzflieEoabgorjDrVpDz35qbuU9
	efd4onKB4O3izE5Cei2RZ7/QSwN1jTy+FdnvVDVrcThsE4AO+hyOIyjCYc6FlHCb8AqiH4et+V9
	elg3/dSNOz/fr7PHDY1aoC4qk03UuP0R6qyN1emO51TiMczODNFufofU3NLOYSztRwIoOJm3Vyf
	brdmpo6YJHxJZm92Fe7E8l7UBNbXRM1W+gI1PrTfT/oU9k6kDKGdur6ydg5bafZVF2LOyTHGASE
	bXYvJC5B6KlFkJK+7sxGqrOcJa72QYcWTZxfZuLnrTz8ZN924ISGCvB0T59zY4CyI1rUDWLtb54
	wQqRrmIlIoBRJ7zmtkrjt1zuXOEc2VgqFJdZQvrQbA/hKvssXkbVYQQ4YiCAt9Ni3Ejr31k/n5t
	cLWxLv0A6qNfZku+cQEg8wsxd6aEcFv+xUnl8HRSslCvReXz5c=
X-Received: by 2002:a05:693c:69c3:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-368afd86765mr4796119eec.9.1792720218428;
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 23 Oct 2026 09:49:49 +0800
Subject: [PATCH v2 2/2] kasan/test: cover load_unaligned_zeropad()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-2-be0ecfbae847@gmail.com>
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
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_185019_564346_59781DCC 
X-CRM114-Status: GOOD (  11.88  )
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
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
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
