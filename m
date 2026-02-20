Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040EAC531F8
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 00:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TfFZnr0NXJBTe4pa3RAEZlHJSgH9smmBFU8wmZJ7KqA=; b=I8hLEfQxyh1Z+ZLXqjz7YTj6C7
	1MJKZHg4lgRiYcAfhR0/fb7yeVIOs8uTvL5Y2fO8G225X6rWl3XUhULh1DW2xKa0xg7NqaBsI5n7+
	WUSGKkRlxqwhgC4TwP1AoOlEDM5V1urtxjBBmkWSj2jtW3L8p7/FT/mI13HUTwARuezz3UmvYgAdt
	Vo47C9h+LzJd0LRlfjw5aGSe4FS0fC38s0YgMzNJdG3MX583F9dFXtrQ86QgkvW64/8byl0kAIWZI
	PhzqbhuufL+x6ATeviFwkvFuHcG1ehaADQNeVmXz/VpYgDrb448x6ChrRYulb+qKUL1NNoo1WHgLO
	qC6sUy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbc-0000000Cm4r-3NUq;
	Fri, 20 Feb 2026 00:42:52 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbU-0000000CltG-1P3P
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a75ed2f89dso15232135ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Feb 2026 16:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548163; x=1772152963; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi3zoi6MjjV0Hs43Xpr7yQXYkYqYcEbMxP5Vqzg+1oE=;
        b=OwiOhtT5U+sCkB3uB4hFlh6Osm6YOYnFCCUoUY64pe1IlrRjg3JyjJaoxWvjS4PUbc
         q1MtGKS6Wd2eQqB1gYYVDfqlXUgCZKByLp4I699mha7ixQ/zczPGUXYPeu7q5IopEfOu
         h4BZ7sN6HN06LQ7t0wsb9kRArzIPp2A2Bxajt3RrGHkb3UQTkoSkx2RsmgkzTwiSrNl4
         aotsruXewgq1jiFZ/SONUhQiA6O35xl3d2KrORRl95ZqlJ8sv2QIkftO0Hn0VQ/kbn/8
         UuCOf/fVbRwcPG3g6Wiwzp9fNUJDsIVzB7awc6PgXZR3ZDaFQMtoJ9gAjO7dCQap74Gt
         VxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548163; x=1772152963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi3zoi6MjjV0Hs43Xpr7yQXYkYqYcEbMxP5Vqzg+1oE=;
        b=SFzX1mONwnb/U5GWAHfnU+8cUIyt3xsCHNqnRWM3W/HBemsxRnb0uZEbQMCnZZlpN3
         EC1pRa+OJQgug/ydMFh00X8eN659p5g5aHSD2amTCfl0G8ijFwq3EuPUtBiN7WyP/ymF
         BOYaUs2qGLsXatufpC1kFPvdIhHe/+fzZfKbujiA6s1gIgx7DLIG8tB+0YlFbRNxB3C/
         qYivuP8yn/tz8s1HuSmiTfQ4RjTqHtrblmby4Rhg03wYO+3HUKIvzVx1b/6F2X1Y9yzD
         G8EBv+2vF1536baqersa/QIkmE5kCu/0CcPtkX7P4m3YA5SawbjimosQiT7F9i4jI04s
         hRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDyBcIX0m8hcLNe/EQm9GoaDlXP+NOvIi2g2LKTH1YIYUkTHu/BAYrjnvIOwyc/YZpOJ5NNJbY5aaSFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuB2ZvLu4oNeq+Caq2627CRjyc9OyL1o/qTnfBoOKPpeidWE1Q
	F+ErXlYnAgsskg4QvXCTRLiWkL8mXh1c5OhgCuazXv09GLTFm3GNwENk1K/qMO/G98nkMyvK8iO
	WSN4wa+bituaKiQ==
X-Received: from plrt9.prod.google.com ([2002:a17:902:b209:b0:2a9:5ed9:f590])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec82:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2ad1752516amr180602525ad.47.1771548162506;
 Thu, 19 Feb 2026 16:42:42 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:18 +0000
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-6-dmatlack@google.com>
Subject: [PATCH v2 05/10] KVM: selftests: Use s64 instead of int64_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164244_398877_E092B1B3 
X-CRM114-Status: GOOD (  17.38  )
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

Use s64 instead of int64_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int64_t/s64/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c  |  2 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c  |  2 +-
 tools/testing/selftests/kvm/guest_print_test.c   |  2 +-
 tools/testing/selftests/kvm/include/test_util.h  |  4 ++--
 tools/testing/selftests/kvm/lib/test_util.c      | 16 ++++++++--------
 .../testing/selftests/kvm/lib/userfaultfd_util.c |  2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c  |  2 +-
 tools/testing/selftests/kvm/memslot_perf_test.c  |  2 +-
 tools/testing/selftests/kvm/steal_time.c         |  4 ++--
 tools/testing/selftests/kvm/x86/kvm_clock_test.c |  2 +-
 .../selftests/kvm/x86/nested_tsc_adjust_test.c   |  6 +++---
 11 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 61954f2221e4..7285eade4acf 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -59,7 +59,7 @@ static bool far_invalid;
 static u64 translate_to_host_paddr(unsigned long vaddr)
 {
 	u64 pinfo;
-	int64_t offset = vaddr / getpagesize() * sizeof(pinfo);
+	s64 offset = vaddr / getpagesize() * sizeof(pinfo);
 	int fd;
 	u64 page_addr;
 	u64 paddr;
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index b88fddd71fa1..19f4a612137f 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -36,7 +36,7 @@ struct reg_ftr_bits {
 	 * For FTR_EXACT, safe_val is used as the exact safe value.
 	 * For FTR_LOWER_SAFE, safe_val is used as the minimal safe value.
 	 */
-	int64_t safe_val;
+	s64 safe_val;
 };
 
 struct test_feature_reg {
diff --git a/tools/testing/selftests/kvm/guest_print_test.c b/tools/testing/selftests/kvm/guest_print_test.c
index 894ef7d2481e..b059abcf1a5b 100644
--- a/tools/testing/selftests/kvm/guest_print_test.c
+++ b/tools/testing/selftests/kvm/guest_print_test.c
@@ -25,7 +25,7 @@ static struct guest_vals vals;
 
 /* GUEST_PRINTF()/GUEST_ASSERT_FMT() does not support float or double. */
 #define TYPE_LIST					\
-TYPE(test_type_i64,  I64,  "%ld",   int64_t)		\
+TYPE(test_type_i64,  I64,  "%ld",   s64)		\
 TYPE(test_type_u64,  U64u, "%lu",   u64)		\
 TYPE(test_type_x64,  U64x, "0x%lx", u64)		\
 TYPE(test_type_X64,  U64X, "0x%lX", u64)		\
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 62fe83763021..d7489db738bf 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -101,8 +101,8 @@ do {										\
 
 size_t parse_size(const char *size);
 
-int64_t timespec_to_ns(struct timespec ts);
-struct timespec timespec_add_ns(struct timespec ts, int64_t ns);
+s64 timespec_to_ns(struct timespec ts);
+struct timespec timespec_add_ns(struct timespec ts, s64 ns);
 struct timespec timespec_add(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_sub(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_elapsed(struct timespec start);
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index d863705f6795..f5b460c445be 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -83,12 +83,12 @@ size_t parse_size(const char *size)
 	return base << shift;
 }
 
-int64_t timespec_to_ns(struct timespec ts)
+s64 timespec_to_ns(struct timespec ts)
 {
-	return (int64_t)ts.tv_nsec + 1000000000LL * (int64_t)ts.tv_sec;
+	return (s64)ts.tv_nsec + 1000000000LL * (s64)ts.tv_sec;
 }
 
-struct timespec timespec_add_ns(struct timespec ts, int64_t ns)
+struct timespec timespec_add_ns(struct timespec ts, s64 ns)
 {
 	struct timespec res;
 
@@ -101,15 +101,15 @@ struct timespec timespec_add_ns(struct timespec ts, int64_t ns)
 
 struct timespec timespec_add(struct timespec ts1, struct timespec ts2)
 {
-	int64_t ns1 = timespec_to_ns(ts1);
-	int64_t ns2 = timespec_to_ns(ts2);
+	s64 ns1 = timespec_to_ns(ts1);
+	s64 ns2 = timespec_to_ns(ts2);
 	return timespec_add_ns((struct timespec){0}, ns1 + ns2);
 }
 
 struct timespec timespec_sub(struct timespec ts1, struct timespec ts2)
 {
-	int64_t ns1 = timespec_to_ns(ts1);
-	int64_t ns2 = timespec_to_ns(ts2);
+	s64 ns1 = timespec_to_ns(ts1);
+	s64 ns2 = timespec_to_ns(ts2);
 	return timespec_add_ns((struct timespec){0}, ns1 - ns2);
 }
 
@@ -123,7 +123,7 @@ struct timespec timespec_elapsed(struct timespec start)
 
 struct timespec timespec_div(struct timespec ts, int divisor)
 {
-	int64_t ns = timespec_to_ns(ts) / divisor;
+	s64 ns = timespec_to_ns(ts) / divisor;
 
 	return timespec_add_ns((struct timespec){0}, ns);
 }
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 2f069ce6a446..ef8d76f71f83 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -27,7 +27,7 @@ static void *uffd_handler_thread_fn(void *arg)
 {
 	struct uffd_reader_args *reader_args = (struct uffd_reader_args *)arg;
 	int uffd = reader_args->uffd;
-	int64_t pages = 0;
+	s64 pages = 0;
 	struct timespec start;
 	struct timespec ts_diff;
 	struct epoll_event evt;
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 1dfcbe6e55ee..d4c6d9e24b7e 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -376,7 +376,7 @@ static u64 *__vm_get_page_table_entry(struct kvm_vm *vm,
 	 * Check that the vaddr is a sign-extended va_width value.
 	 */
 	TEST_ASSERT(vaddr ==
-		    (((int64_t)vaddr << (64 - va_width) >> (64 - va_width))),
+		    (((s64)vaddr << (64 - va_width) >> (64 - va_width))),
 		    "Canonical check failed.  The virtual address is invalid.");
 
 	for (current_level = mmu->pgtable_levels;
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index d5161e8aee14..bf62b522d32e 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -1040,7 +1040,7 @@ static bool parse_args(int argc, char *argv[],
 
 struct test_result {
 	struct timespec slot_runtime, guest_runtime, iter_runtime;
-	int64_t slottimens, runtimens;
+	s64 slottimens, runtimens;
 	u64 nloops;
 };
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 27ff9e0890c5..0777ef2b5399 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -114,7 +114,7 @@ struct st_time {
 	u64 st_time;
 };
 
-static int64_t smccc(uint32_t func, u64 arg)
+static s64 smccc(uint32_t func, u64 arg)
 {
 	struct arm_smccc_res res;
 
@@ -131,7 +131,7 @@ static void check_status(struct st_time *st)
 static void guest_code(int cpu)
 {
 	struct st_time *st;
-	int64_t status;
+	s64 status;
 
 	status = smccc(SMCCC_ARCH_FEATURES, PV_TIME_FEATURES);
 	GUEST_ASSERT_EQ(status, 0);
diff --git a/tools/testing/selftests/kvm/x86/kvm_clock_test.c b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
index e986d289e19b..d885926c578d 100644
--- a/tools/testing/selftests/kvm/x86/kvm_clock_test.c
+++ b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
@@ -18,7 +18,7 @@
 
 struct test_case {
 	u64 kvmclock_base;
-	int64_t realtime_offset;
+	s64 realtime_offset;
 };
 
 static struct test_case test_cases[] = {
diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
index db0d44b8fbd6..a18b0cfd42e2 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
@@ -53,9 +53,9 @@ enum {
 /* The virtual machine object. */
 static struct kvm_vm *vm;
 
-static void check_ia32_tsc_adjust(int64_t max)
+static void check_ia32_tsc_adjust(s64 max)
 {
-	int64_t adjust;
+	s64 adjust;
 
 	adjust = rdmsr(MSR_IA32_TSC_ADJUST);
 	GUEST_SYNC(adjust);
@@ -117,7 +117,7 @@ static void l1_guest_code(void *data)
 	GUEST_DONE();
 }
 
-static void report(int64_t val)
+static void report(s64 val)
 {
 	pr_info("IA32_TSC_ADJUST is %ld (%lld * TSC_ADJUST_VALUE + %lld).\n",
 		val, val / TSC_ADJUST_VALUE, val % TSC_ADJUST_VALUE);
-- 
2.53.0.414.gf7e9f6c205-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
