Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8972AC87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLPP3PQB0RzX9SQZFf3hdOsGid+HgeZpWsDO9UGgfEo=; b=rl3saC38juGXGP
	REZiAo+HVuQvuK9+het+bA3F03DFHtm75m8/CRoHW6I/NsczCA7V/hRY3qGf+CS/7xgj3tmS6NT7r
	PtjfUAOyWSOAJzLzXSpu7L6s9VUMTqo0ZYlL6Hy+cYFWQtIXM6slECAcw4CJvvUcB00UT4o0qdUNj
	aU6h+XMXmVebHTpsOpd3q8lIO7VI9iRpmAgcRmbGprEYugc8ipm4q/OFxCBx5r7TKOqjPp0uIY0WY
	hvMbnvBXBYBzpMJ59xJDhGraYlqo+JwgrQkUKOOMWf33CyzcDiRwFsptRqURIWabPWlH59HSDJ1Z5
	mce/y5AzqLhRuyno4jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVl5-000000042GN-08PG;
	Thu, 31 Jul 2025 16:03:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVl2-000000042Ev-1asj
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753977804; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iEVfjkrhIlNGAugbgFyCabDELVet8GzqTY2X6nWM90rubx0LHgFlnh6/IohJGrywKzD8VKMl/eXABP/+cUP1q3imNAwURRm6jAD3NkwpZn53TWIuO7b1+dh23V2P+K3nxYE1rXOrIBQD9DK/V2jsbTX5J7b6wFebmCZBrz+bYxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753977804; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nNsfnv5oOEoHrVu8M1Ul0UCXOUQx26YVPJa+Wwgspps=; 
	b=cz37pqdSHlICiZWOPkv6Gy+lqmKdFmOvcy3i7ESUm4jWnfebkMT9ajcGt8HxnvpXbnnlfxzgrQyls0vYbT4cujWpiZLa0zEk1bK07/blkK++6WN3TgxftRDAKQNvcZfpqKJbdQYSGmLSob1tm3mw46U9WAQc3BkxFtA1M6sVDSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753977804;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=nNsfnv5oOEoHrVu8M1Ul0UCXOUQx26YVPJa+Wwgspps=;
	b=XTlO2AfhdGBuUf01q109R44FA2Ye3p1dZraw5yjGh/xsp6aWi43kSFycH9CpGIw8
	SKuV5dyfAL9vvs1ffJHq4uPgaNxrj8OG1G2lZ3c3kn1rmchCIHjQcC9QOWsFcoiDUhP
	eO3qd+etbhxquw7LjvNK+rJ3TXTN21JvijGgJO24=
Received: by mx.zohomail.com with SMTPS id 1753977802350358.12218677283863;
	Thu, 31 Jul 2025 09:03:22 -0700 (PDT)
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
Subject: [PATCH v2 7/8] selftests/mm: Mark unused arguments with __unused
Date: Thu, 31 Jul 2025 21:01:31 +0500
Message-Id: <20250731160132.1795351-8-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731160132.1795351-1-usama.anjum@collabora.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_090352_475261_9E09E50E 
X-CRM114-Status: GOOD (  14.58  )
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

Mark the arguments which cannot be removed with __unused attribute.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 .../selftests/mm/hugetlb_fault_after_madv.c    |  4 ++--
 .../testing/selftests/mm/hugetlb_madv_vs_map.c |  6 +++---
 tools/testing/selftests/mm/pkey-arm64.h        |  5 +++--
 tools/testing/selftests/mm/pkey-powerpc.h      |  2 +-
 tools/testing/selftests/mm/pkey-x86.h          |  3 ++-
 .../selftests/mm/pkey_sighandler_tests.c       | 10 +++++-----
 tools/testing/selftests/mm/protection_keys.c   | 18 +++++++++---------
 7 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
index e2640529dbb29..72706c64fe57c 100644
--- a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
+++ b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
@@ -28,7 +28,7 @@ static void signal_handler(int signal)
 }
 
 /* Touch the memory while it is being madvised() */
-void *touch(void *unused)
+void *touch(void __unused *unused)
 {
 	char *ptr = (char *)huge_ptr;
 
@@ -41,7 +41,7 @@ void *touch(void *unused)
 	return NULL;
 }
 
-void *madv(void *unused)
+void *madv(void __unused *unused)
 {
 	usleep(rand() % 10);
 
diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index 8f122a0f08281..64a1455940394 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -33,7 +33,7 @@ size_t mmap_size;
 char *huge_ptr;
 
 /* Touch the memory while it is being madvised() */
-void *touch(void *unused)
+void *touch(void __unused *unused)
 {
 	for (int i = 0; i < INLOOP_ITER; i++)
 		huge_ptr[0] = '.';
@@ -41,7 +41,7 @@ void *touch(void *unused)
 	return NULL;
 }
 
-void *madv(void *unused)
+void *madv(void __unused *unused)
 {
 	for (int i = 0; i < INLOOP_ITER; i++)
 		madvise(huge_ptr, mmap_size, MADV_DONTNEED);
@@ -54,7 +54,7 @@ void *madv(void *unused)
  * The other hugepage should be flipping from used <-> reserved, because
  * of madvise(DONTNEED).
  */
-void *map_extra(void *unused)
+void *map_extra(void __unused *unused)
 {
 	void *ptr;
 
diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index 8e9685e03c441..a9cacf3732f60 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -81,11 +81,12 @@ static inline int get_arch_reserved_keys(void)
 	return NR_RESERVED_PKEYS;
 }
 
-static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
+static inline void expect_fault_on_read_execonly_key(void __unused *p1, int __unused pkey)
 {
 }
 
-static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
+static inline void *malloc_pkey_with_mprotect_subpage(long __unused size, int __unused prot,
+						      u16 __unused pkey)
 {
 	return PTR_ERR_ENOTSUP;
 }
diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
index 17bf2d1b0192e..8a367c32a9dd6 100644
--- a/tools/testing/selftests/mm/pkey-powerpc.h
+++ b/tools/testing/selftests/mm/pkey-powerpc.h
@@ -93,7 +93,7 @@ static inline int get_arch_reserved_keys(void)
 			return NR_RESERVED_PKEYS_64K_3KEYS;
 }
 
-static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
+static inline void expect_fault_on_read_execonly_key(void __unused *p1, int __unused pkey)
 {
 	/*
 	 * powerpc does not allow userspace to change permissions of exec-only
diff --git a/tools/testing/selftests/mm/pkey-x86.h b/tools/testing/selftests/mm/pkey-x86.h
index f7ecd335df1e6..27688c04abd35 100644
--- a/tools/testing/selftests/mm/pkey-x86.h
+++ b/tools/testing/selftests/mm/pkey-x86.h
@@ -157,7 +157,8 @@ static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
 	expected_pkey_fault(pkey);
 }
 
-static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
+static inline void *malloc_pkey_with_mprotect_subpage(long __unused size, int __unused prot,
+						      u16 __unused pkey)
 {
 	return PTR_ERR_ENOTSUP;
 }
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index eb4ef8532c0bf..638477494ff3a 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -110,7 +110,7 @@ static inline u64 pkey_reg_restrictive_default(void)
 	return set_pkey_bits(PKEY_REG_ALLOW_NONE, 0, PKEY_DISABLE_ACCESS);
 }
 
-static void sigsegv_handler(int signo, siginfo_t *info, void *ucontext)
+static void sigsegv_handler(int __unused signo, siginfo_t *info, void __unused *ucontext)
 {
 	pthread_mutex_lock(&mutex);
 
@@ -122,7 +122,7 @@ static void sigsegv_handler(int signo, siginfo_t *info, void *ucontext)
 	syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
 }
 
-static void sigusr1_handler(int signo, siginfo_t *info, void *ucontext)
+static void sigusr1_handler(int __unused signo, siginfo_t *info, void __unused *ucontext)
 {
 	pthread_mutex_lock(&mutex);
 
@@ -132,7 +132,7 @@ static void sigusr1_handler(int signo, siginfo_t *info, void *ucontext)
 	pthread_mutex_unlock(&mutex);
 }
 
-static void sigusr2_handler(int signo, siginfo_t *info, void *ucontext)
+static void sigusr2_handler(int __unused signo, siginfo_t __unused *info, void __unused *ucontext)
 {
 	/*
 	 * pkru should be the init_pkru value which enabled MPK 0 so
@@ -155,7 +155,7 @@ static void raise_sigusr2(void)
 	 */
 }
 
-static void *thread_segv_with_pkey0_disabled(void *ptr)
+static void *thread_segv_with_pkey0_disabled(void __unused *ptr)
 {
 	/* Disable MPK 0 (and all others too) */
 	__write_pkey_reg(pkey_reg_restrictive_default());
@@ -165,7 +165,7 @@ static void *thread_segv_with_pkey0_disabled(void *ptr)
 	return NULL;
 }
 
-static void *thread_segv_pkuerr_stack(void *ptr)
+static void *thread_segv_pkuerr_stack(void __unused *ptr)
 {
 	/* Disable MPK 0 (and all others too) */
 	__write_pkey_reg(pkey_reg_restrictive_default());
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 6281d4c61b50e..65bc9ba59f72b 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -309,7 +309,7 @@ static char *si_code_str(int si_code)
 
 static int pkey_faults;
 static int last_si_pkey = -1;
-static void signal_handler(int signum, siginfo_t *si, void *vucontext)
+static void signal_handler(int __unused signum, siginfo_t *si, void *vucontext)
 {
 	ucontext_t *uctxt = vucontext;
 	int trapno;
@@ -889,7 +889,7 @@ static void close_test_fds(void)
 	nr_test_fds = 0;
 }
 
-static void test_pkey_alloc_free_attach_pkey0(int *ptr, u16 pkey)
+static void test_pkey_alloc_free_attach_pkey0(int *ptr, u16 __unused pkey)
 {
 	int i, err;
 	int max_nr_pkey_allocs;
@@ -1106,7 +1106,7 @@ static void test_pkey_syscalls_on_non_allocated_pkey(int *ptr, u16 pkey)
 }
 
 /* Assumes that all pkeys other than 'pkey' are unallocated */
-static void test_pkey_syscalls_bad_args(int *ptr, u16 pkey)
+static void test_pkey_syscalls_bad_args(int *ptr, u16 __unused pkey)
 {
 	int err;
 	int bad_pkey = NR_PKEYS+99;
@@ -1132,7 +1132,7 @@ static void become_child(void)
 }
 
 /* Assumes that all pkeys other than 'pkey' are unallocated */
-static void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
+static void test_pkey_alloc_exhaust(int __unused *ptr, u16 __unused pkey)
 {
 	int err;
 	int allocated_pkeys[NR_PKEYS] = {0};
@@ -1238,7 +1238,7 @@ static void arch_force_pkey_reg_init(void)
  * a long-running test that continually checks the pkey
  * register.
  */
-static void test_pkey_init_state(int *ptr, u16 pkey)
+static void test_pkey_init_state(int __unused *ptr, u16 __unused pkey)
 {
 	int err;
 	int allocated_pkeys[NR_PKEYS] = {0};
@@ -1397,7 +1397,7 @@ static void *get_pointer_to_instructions(void)
 	return p1;
 }
 
-static void test_executing_on_unreadable_memory(int *ptr, u16 pkey)
+static void test_executing_on_unreadable_memory(int __unused *ptr, u16 pkey)
 {
 	void *p1;
 	int scratch;
@@ -1429,7 +1429,7 @@ static void test_executing_on_unreadable_memory(int *ptr, u16 pkey)
 	pkey_assert(!ret);
 }
 
-static void test_implicit_mprotect_exec_only_memory(int *ptr, u16 pkey)
+static void test_implicit_mprotect_exec_only_memory(int __unused *ptr, u16 __unused pkey)
 {
 	void *p1;
 	int scratch;
@@ -1478,7 +1478,7 @@ static void test_implicit_mprotect_exec_only_memory(int *ptr, u16 pkey)
 }
 
 #if defined(__i386__) || defined(__x86_64__)
-static void test_ptrace_modifies_pkru(int *ptr, u16 pkey)
+static void test_ptrace_modifies_pkru(int __unused *ptr, u16 __unused pkey)
 {
 	u32 new_pkru;
 	pid_t child;
@@ -1601,7 +1601,7 @@ static void test_ptrace_modifies_pkru(int *ptr, u16 pkey)
 #endif
 
 #if defined(__aarch64__)
-static void test_ptrace_modifies_pkru(int *ptr, u16 pkey)
+static void test_ptrace_modifies_pkru(int __unused *ptr, u16 __unused pkey)
 {
 	pid_t child;
 	int status, ret;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
