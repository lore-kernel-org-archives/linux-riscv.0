Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBBFCA0EFF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OOWZ3hv8F8ydNCmP9WhR27Q+F041cRfgBpG+GdOjAo=; b=fuhMIKj5ir7LtQ
	kfaCKYNTfkthJbsLHDbAgaWGQOaObzgEhRxbrMeuv8LZ5PE2vxVXaheMMq82U4IjlEikN/59nANwY
	iYLQCFTjtqPG0zUOAtZafNo6EzgEtjzOFppslyANpbyZODQlpw7N7rDtQHPdXl932nKv0YmS45Nwm
	RJSj+tHgZBP6k++AS9BP6aE2kh5+pJj2yydlj1Ndod0V1shdIHT26sb0LZncdAoEw6WY0oEpAGeXU
	5naqpS3wDWiBWYNeSQV5yQc+gq03r07+4s697XK48RsEZbW1OxKa4oh2xjmW5I1MLAS6E1kyb1zD+
	NM04BE+SiG3BdyNetwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScq-00000002mzn-0Q0Z;
	Fri, 22 Aug 2025 14:20:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN3e-00000001vgz-0biY
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 08:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755851012;
	bh=6J5PSXxqtGmjRoT5d0cfiijsJ6CAzjFznigi7LNiQE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vqqzialm4g5wrtv4tvyw9MWWk2aTcdXQRG/VnvvvKbnIolO8f8llGOC4Oc6EVk4BN
	 XM9SJgbGlENhJR55OH6sBWy3cuyX5s//oWsx8t4qNIo7DDmccDvzX8FWuyEJ/SvIX/
	 UIRQzy1GoYwa/2d2Exavog6avBcMun0Tslwrn1CX64BdpOyMfGQxgMefXXVlRkSiTu
	 GvO0r4vVX028IQWvhrdiPZ0keGQKh6Zk9+NVXJdH4TC3LXdbdTs6pcIpcdc/vSZ48S
	 bTYiBDOB4vR9KrDQOnhiRVV/SbnAU/+HiIG9x7/AqJPe6wrPSuqJpoLqJT5o3wOlgJ
	 Nv1Ox3SSXTWhw==
Received: from mt.tail9873f4.ts.net (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA4FC17E12DF;
	Fri, 22 Aug 2025 10:23:26 +0200 (CEST)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	kevin.brodsky@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v3 6/8] selftests/mm: Fix unused parameter warnings for different architectures
Date: Fri, 22 Aug 2025 13:21:03 +0500
Message-ID: <20250822082145.4145617-7-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822082145.4145617-1-usama.anjum@collabora.com>
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012334_327085_515A5F8D 
X-CRM114-Status: GOOD (  11.24  )
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

There are functions which have unused arguments for different
architectures. Separate the code for each architecture and move #ifdef
arch outside these functions.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/mm/mseal_test.c       |  8 +++++--
 .../selftests/mm/pkey_sighandler_tests.c      | 21 ++++++++++++++++---
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 005f29c86484e..4c2a232796866 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -131,17 +131,21 @@ static unsigned int __read_pkey_reg(void)
 	return pkey_reg;
 }
 
+#if defined(__i386__) || defined(__x86_64__) /* arch */
 static void __write_pkey_reg(u64 pkey_reg)
 {
-#if defined(__i386__) || defined(__x86_64__) /* arch */
 	unsigned int eax = pkey_reg;
 	unsigned int ecx = 0;
 	unsigned int edx = 0;
 
 	asm volatile(".byte 0x0f,0x01,0xef\n\t"
 			: : "a" (eax), "c" (ecx), "d" (edx));
-#endif
 }
+#else
+static void __write_pkey_reg(u64 __always_unused pkey_reg)
+{
+}
+#endif
 
 static unsigned long pkey_bit_position(int pkey)
 {
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index eb4ef8532c0bf..bfa88fe188f66 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -41,11 +41,12 @@ static siginfo_t siginfo = {0};
  * syscall will attempt to access the PLT in order to call a library function
  * which is protected by MPK 0 which we don't have access to.
  */
+#ifdef __x86_64__
 static __always_inline
 long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
 {
 	unsigned long ret;
-#ifdef __x86_64__
+
 	register long r10 asm("r10") = a4;
 	register long r8 asm("r8") = a5;
 	register long r9 asm("r9") = a6;
@@ -53,12 +54,26 @@ long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
 		      : "=a"(ret)
 		      : "a"(n), "D"(a1), "S"(a2), "d"(a3), "r"(r10), "r"(r8), "r"(r9)
 		      : "rcx", "r11", "memory");
+	return ret;
+}
 #elif defined __i386__
+static __always_inline
+long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long __always_unused a6)
+{
+	unsigned long ret;
+
 	asm volatile ("int $0x80"
 		      : "=a"(ret)
 		      : "a"(n), "b"(a1), "c"(a2), "d"(a3), "S"(a4), "D"(a5)
 		      : "memory");
+	return ret;
+}
 #elif defined __aarch64__
+static __always_inline
+long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
+{
+	unsigned long ret;
+
 	register long x0 asm("x0") = a1;
 	register long x1 asm("x1") = a2;
 	register long x2 asm("x2") = a3;
@@ -71,11 +86,11 @@ long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
 		      : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5), "r"(x8)
 		      : "memory");
 	ret = x0;
+	return ret;
+}
 #else
 # error syscall_raw() not implemented
 #endif
-	return ret;
-}
 
 static inline long clone_raw(unsigned long flags, void *stack,
 			     int *parent_tid, int *child_tid)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
