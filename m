Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99019C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=20pKAnxq+BPO6lWIvCobk6bRxK70PijVLAdre5Vqrb4=; b=xQ2LnigLAZlrgj/XLH2ZhmJbbk
	pz/kOTB+eoDkMktq4huUnFxonqf1sLsE+GXhkDyJnxftQIilQa1bZKIHYHgKKXMQ0JX4BVYq7SllN
	gzi+qQQBuzhPXdGj6FDhVXD0aurF+afyKoog3UFHtLkOBp4/+nTWfYh6c9RenL1NrEIfuPvZBL5MD
	q2ostaF4SfCr4+jkSy6sVQARAvonzgDmn1LxBsGrxQwi0iGMq9rPzao/Y0Nxp5Uoy53SpeWoWQyB8
	5Sttjw+5ebK2ZtPTR8/Jxi19nbrJ8LkDMsEeJ4iDWfsP5Bgz6tKl2XShb0as0VFLn8vevVgwBtmje
	LrHFBC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4D-00BYw8-2y;
	Fri, 21 Apr 2023 18:01:05 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0Y-00BR5Y-2j
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:16 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-24763adb145so2206484a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095992; x=1684687992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dM0sknYnz5Tr9YshwaHjySCVB3V9EWCXlRX5uFgEya8=;
        b=cKoOxJh4k5Df809KvDrC16SHpyyANbnD88ODpXNOuka0EEfmMXb9/GGZHQjZmiaSGC
         PHXwzp6oJJCuBjtwH55J3xqdIM10HnXCfOmj/GRFwtdNPqo3g+mBSidFvw86YFvbU0sY
         QFH5aE4DJ8NgYwN0BX1m2H/84CVYfPBQlivAZjfI0w0gbJssCQFPLo6dhrf9i30gQDYK
         RVT9NmA3RwkhJ9wGFaj9EOO7LpEIdOpFNM2q37g3x6fVQdiBTnwi7UMa2h5IS92inTkJ
         5XzKSeq94NI91RbwFfXmAf2d+oezqCbzgzE8MFn7zbTcJm/Y08tOtjCRc2EpRU8GmuIw
         Joug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095992; x=1684687992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM0sknYnz5Tr9YshwaHjySCVB3V9EWCXlRX5uFgEya8=;
        b=ivr/sOAx0yN7V/kw6vMUOkWsx52NXmqC4IdUds66KLTyYqzH69bWozf1eMP35mQLSV
         ZXj6gv1O0SJWiuOoV/JaAbnkRVImLhQlNMwAYdkL5ViSBcRYSqs+UAAWIVwMQmUDyBh7
         z+gtlpOGLrkblrKpIlqvkEcmJWGorbEp9eQd9bV6IrQvmKaSWA1jBdR6FlZhGiedMuEn
         xJa/nRERXErXI6BKiNb8/qQwgbCsA5c7uB3nVq/b1CdAs7XCqblADCWn2esU90fYGcUj
         kFL2+SMsb5xkL3C+i/uXrLgVMuuBo0M2D5s2dECEDnjiyK6zkv8osmbzJsM57C7zW++3
         CyhQ==
X-Gm-Message-State: AAQBX9f/VfxsJhKqGrkxWaLoR1XiQE4PiPx0OmH6ZcJSnCtUuSRDwkoZ
	DvL2TQ9YgS21fD6rehcuHa++YcmavWOE
X-Google-Smtp-Source: AKy350YMrLXAhkSUtVuYqUb/z6RwX7RpSjICLEgXjDkxf6HBxqanxF3VIJFd0FfCazAdAkwHsavol8ftYq4a
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:90a:740d:b0:244:8f24:783d with SMTP id
 a13-20020a17090a740d00b002448f24783dmr1553862pjg.4.1682095992639; Fri, 21 Apr
 2023 09:53:12 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:52:58 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-3-vipinsh@google.com>
Subject: [PATCH 2/9] KVM: selftests: Add optional delay between consecutive
 Clear-Dirty-Log calls
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_095314_902540_07813918 
X-CRM114-Status: GOOD (  13.87  )
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

In dirty_log_perf_test, add option "-l" to wait between consecutive
Clear-Dirty-Log calls. Accept delay in milliseconds.

This allows dirty_log_perf_test to mimic real world use where after
clearing dirty memory, some time is spent in transferring memory before
making a subsequeunt Clear-Dirty-Log call.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/dirty_log_perf_test.c | 17 +++++++++++++++--
 tools/testing/selftests/kvm/include/memstress.h |  5 +++--
 tools/testing/selftests/kvm/lib/memstress.c     | 10 +++++++++-
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 0852a7ba42e1..338f03a4a550 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -135,6 +135,7 @@ struct test_params {
 	uint32_t random_seed;
 	bool random_access;
 	uint64_t clear_chunk_size;
+	int clear_chunk_wait_time_ms
 };
 
 static void run_test(enum vm_guest_mode mode, void *arg)
@@ -249,7 +250,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			clock_gettime(CLOCK_MONOTONIC, &start);
 			memstress_clear_dirty_log_in_chunks(vm, bitmaps, p->slots,
 							    pages_per_slot,
-							    pages_per_clear);
+							    pages_per_clear,
+							    p->clear_chunk_wait_time_ms);
 			ts_diff = timespec_elapsed(start);
 			clear_dirty_log_total = timespec_add(clear_dirty_log_total,
 							     ts_diff);
@@ -352,6 +354,11 @@ static void help(char *name)
 	       "     the memslot size then whole memslot is cleared in one call.\n"
 	       "     Size must be aligned to the host page size. e.g. 10M or 3G\n"
 	       "     (default: UINT64_MAX, clears whole memslot in one call)\n");
+	printf(" -l: Specify time in milliseconds to wait after Clear-Dirty-Log\n"
+	       "     call. This allows to mimic use cases where flow is to get\n"
+	       "     dirty log followed by multiple clear dirty log calls and\n"
+	       "     sending corresponding memory to destination (in this test\n"
+	       "     sending will be just idle waiting)\n");
 	puts("");
 	exit(0);
 }
@@ -368,6 +375,7 @@ int main(int argc, char *argv[])
 		.random_seed = 1,
 		.write_percent = 100,
 		.clear_chunk_size = UINT64_MAX,
+		.clear_chunk_wait_time_ms = 0,
 	};
 	int opt;
 
@@ -378,7 +386,7 @@ int main(int argc, char *argv[])
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "ab:c:eghi:k:m:nop:r:s:v:x:w:")) != -1) {
+	while ((opt = getopt(argc, argv, "ab:c:eghi:k:l:m:nop:r:s:v:x:w:")) != -1) {
 		switch (opt) {
 		case 'a':
 			p.random_access = true;
@@ -405,6 +413,11 @@ int main(int argc, char *argv[])
 		case 'k':
 			p.clear_chunk_size = parse_size(optarg);
 			break;
+		case 'l':
+			p.clear_chunk_wait_time_ms =
+					atoi_non_negative("Clear dirty log chunks wait time",
+							  optarg);
+			break;
 		case 'm':
 			guest_modes_cmdline(optarg);
 			break;
diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 2acc93f76fc3..01fdcea80360 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -78,12 +78,13 @@ void memstress_get_dirty_log(struct kvm_vm *vm, unsigned long *bitmaps[], int sl
 void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 					 unsigned long *bitmaps[], int slots,
 					 uint64_t pages_per_slot,
-					 uint64_t pages_per_clear);
+					 uint64_t pages_per_clear,
+					 int wait_ms);
 static inline void memstress_clear_dirty_log(struct kvm_vm *vm,
 					     unsigned long *bitmaps[], int slots,
 					     uint64_t pages_per_slot) {
 	memstress_clear_dirty_log_in_chunks(vm, bitmaps, slots, pages_per_slot,
-					    pages_per_slot);
+					    pages_per_slot, 0);
 }
 unsigned long **memstress_alloc_bitmaps(int slots, uint64_t pages_per_slot);
 void memstress_free_bitmaps(unsigned long *bitmaps[], int slots);
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index e0c701ab4e9a..483ecbc53a5b 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -358,10 +358,15 @@ void memstress_get_dirty_log(struct kvm_vm *vm, unsigned long *bitmaps[], int sl
 void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 					 unsigned long *bitmaps[], int slots,
 					 uint64_t pages_per_slot,
-					 uint64_t pages_per_clear)
+					 uint64_t pages_per_clear,
+					 int wait_ms)
 {
 	int i, slot;
 	uint64_t from, clear_pages_count;
+	struct timespec wait = {
+		.tv_sec = wait_ms / 1000,
+		.tv_nsec = (wait_ms % 1000) * 1000000ull,
+	};
 
 	for (i = 0; i < slots; i++) {
 		slot = MEMSTRESS_MEM_SLOT_INDEX + i;
@@ -374,6 +379,9 @@ void memstress_clear_dirty_log_in_chunks(struct kvm_vm *vm,
 			kvm_vm_clear_dirty_log(vm, slot, bitmaps[i], from,
 					       clear_pages_count);
 			from += clear_pages_count;
+			if (wait_ms)
+				nanosleep(&wait, NULL);
+
 		}
 	}
 
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
