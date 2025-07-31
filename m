Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5352AC87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDBjRn84dEqHUmgklikLHR3x7GOAvVD8Zl3pUZtXjZI=; b=y/4B98k/kTiFm/
	ePWH6q4rZSkmBzWeHj0kxwr6QDUC26/0WvBQFm98V5LiS3BdXoxjj2SH0gEWCnuH6+X3i8LLwoDpl
	XskHBNwd7Xawk/CruUq/9uyBiZMz126BV0pSahJdjREvNkrWX8qEfB/QMz2z1P8E5Qx3fY/+I+kMa
	tJ2Ne+wZEuD/4F2Xx0tlxhIFBtBIqva3x444VxfzI6NgFQ6i6eLp4xWJTRr5viSVMk5J4TPZ7Ehmu
	dsP+U4CP5U4VefR5yamKddF1le5eG/vbhbyMq7HCF6o5p9CbpnPzz1SXQnXizcBYe9RS+BhzLxbpW
	yqY6wypqJe7aknGvx35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVlM-000000042P9-39Y4;
	Thu, 31 Jul 2025 16:04:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVlL-000000042OG-2jdv
	for linux-riscv@bombadil.infradead.org;
	Thu, 31 Jul 2025 16:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tFRUod1LETsg74Qkt/8QptMDoryWw/7mPsDdQJpyJMA=; b=YWr9rjYxKysHshX8pRpkSrVHnv
	rF/bQber47GQmbOjiDuoF9AvN9n4sVzzan324XNHi+Wx1hByGOK3AWMhfL58ilVWBJt2SK+0Yr9SP
	TWGzBkvbV37EUifCDrQINCxFzKdmpFQEl7vxeDblhrhjfedCIWvZMsa8kVam2IAFtQLa/wA0rSZGM
	7onpcJ4wCRi67Z6iAMR+9vTc4nKPD8SpDhtU8q+9NJ9UOmAzxoMzvvejfel/KpP1bNpjn28SgKPIB
	HNIQQxFL2n7+fEUJyl4zxiM3+0iXF+nX8FKNaS+hDDUNs6L6FEVX2aRo2oibKEZC8SKluv7wLXiGD
	Acd0JbdA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVlI-0000000D5lC-13dG
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753977814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C8v46k7DZVPWHrtdnDxx+B1H9e3oTQQKoEUlihOcuoykiizMGZ2DuqpH3we2WhGi7B06TVkV+KxBAn0Bf8Fj+ir6MoKr2VVwLoP0nh4MQoHE+4wSRmwlYaf0FZdGEAkWIks+x82voM8CpPcilzent9OSDf09xaBaOLXtx8D/AaE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753977814; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tFRUod1LETsg74Qkt/8QptMDoryWw/7mPsDdQJpyJMA=; 
	b=MSsRQc1CLGXH5lgzPf8W7exC2qpS0QWtdYvRRMzl9SAI2NYNP7n03MbgtFNyauldv7AD4ZhneCPEuAmAvo3lzb/I1Ffxzwq0uT+wJ5a8oWEPLS//I6jfg4xDJ8NndXxRJZMWZNjzy1uUcAzKeTW/2BeUuoVk97WBXCZBImcLqk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753977814;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=tFRUod1LETsg74Qkt/8QptMDoryWw/7mPsDdQJpyJMA=;
	b=ZsmT9zUa5eWfbbvDyMVVzPqiFsPJdSkNGak9DUUGi7MDW7luOQuACxcj91V2ZB10
	mcRtFG1ppOtRtNPjOd2+lfUbSqHSBT6vuXujVItCwKkDrSEy3NuoVgBpcfSL8v/ncVG
	HfPcQj2c8TIlbrD+kWPj1ezLf3vtU13lfwmTy0hg=
Received: by mx.zohomail.com with SMTPS id 1753977811994182.64658106567913;
	Thu, 31 Jul 2025 09:03:31 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
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
	Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v2 8/8] selftests/mm: Fix unused parameter warnings for different architectures
Date: Thu, 31 Jul 2025 21:01:32 +0500
Message-Id: <20250731160132.1795351-9-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731160132.1795351-1-usama.anjum@collabora.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_170408_730322_B0772F92 
X-CRM114-Status: GOOD (  11.12  )
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
index 34c042da4de27..af49f72e1f465 100644
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
+static void __write_pkey_reg(u64 __unused pkey_reg)
+{
+}
+#endif
 
 static unsigned long pkey_bit_position(int pkey)
 {
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 638477494ff3a..68f106d0876a7 100644
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
+long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long __unused a6)
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
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
