Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D0DEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 02:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2dvGGVSHXbiVqOXZPZb3GwDsxDfNBmiKjcsjhQvvqQ=; b=h4dcUI+MtoROy5
	guBUUbE6OdZt1TdnkgknHRe3DiiJ5bzRRiSPYHYsHGvlqIRDqZoI1a50BDUF2KZFc2r4YzmpZTG/S
	OfWQhai9F11HreZQQ41ZRMgMmQRSk1HFAVz9uQqKLHqY0o5qR6LxOiQh3x6Dn1Tv51piDogtBKcB2
	RhHlzIdIoWBE1myWXMBz4UyoqM+00lYU69Ah1GWBrMgNGMuScCx91zHzMWhdiAjmtLh4Mr7LZh23o
	k7q3gnS+cv8gNLSXLQMgssQbHjLsuJuLZpY36NTW/Ee9EuZtFo9onMXL6KL/MpN+jq2Q1uFH+q8GJ
	ExJbj7RwlxfVhy57zfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbeV-0077Pg-0W;
	Thu, 14 Sep 2023 02:00:19 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbb0-0073mS-2v
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:49 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58fb8933e18so6415197b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656600; x=1695261400; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=i91JvGzfQg7A4MbSmUGyo4+8+JqUux5ifD59BoUsadA=;
        b=ocWYAL74qpjaeiqLf8nhIIWb3QSMuMBdyBn0XAVXmdItQSMr4a8daTZuXVjdzJmg8f
         BIxzElg1zsDRPRYe6kDIHzHdEgMMByLHrqwhyBXdzo/gZfh6Wo48K6v8WJZnv/6GcsBf
         LfrkafLJxRH33VJ6J02guKHoE01H/ilwyWkNMNUKCffO0UL7ddaP3qLM9PjhOBb05veT
         KcsLCeHb00VW9/nnFhp6rP5amGr+RnxroIfL3TBSFZ43Z0E8rOP9WreycyEhEtw+RzpA
         gG9mJLQ5KId/V8Pq8JVOyTiXitoXsm4uU1DSj//vcwMbuuI1pWU1c0qndKXbbi1jrl50
         v62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656600; x=1695261400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i91JvGzfQg7A4MbSmUGyo4+8+JqUux5ifD59BoUsadA=;
        b=BvDryo1gReySUWoeaDZcSYBwCLbM0rCxo6NOcNh1WVREZnP0i0crxeVKwCg32HUn6M
         ZDyhvD81R58+Oz7VkKKkppvs6WrlYpoTWTYF+BLp4/f6k80fe6NFTG69TJHVJIQ8tDQx
         X8H3M29zJHc/hveZtBkJ1gZpTC3kHSSOODjLt+iEWKvranvSQki03wwFxQ0yta6WDet/
         SYauYxh+2cdUrXu7EPVrzNQI+UESe84kTWkUHUh06egjvWGyajlfoXt9k+TiNiZiZ0rE
         Aki5EvbgAd293zhshM68S7ZhlI0X1qMkCeWYX/vIBgDIQAsYhissdvaqUtv0+x0x6WjJ
         iE5g==
X-Gm-Message-State: AOJu0YwVyPNe9ybJjNgXb2Mj37HYzhKq4/sSJ/LhgIDO0JqLjGhmoFNg
	AuZ046S7VvAQXwNnN3C8ukf9qLyBBXI=
X-Google-Smtp-Source: AGHT+IEvLzTJgrzr2NLiV8Z9En5+JUJxc1EswgYLaEL3Jr6eWhED9/CQgA0jS1j6Htu+3uQxxbNwCvj4oqA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:400c:0:b0:589:a855:7af with SMTP id
 l12-20020a81400c000000b00589a85507afmr107432ywn.7.1694656599914; Wed, 13 Sep
 2023 18:56:39 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:30 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-33-seanjc@google.com>
Subject: [RFC PATCH v12 32/33] KVM: selftests: Add basic selftest for guest_memfd()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_185643_012402_F254E4F4 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Chao Peng <chao.p.peng@linux.intel.com>

Add a selftest to verify the basic functionality of guest_memfd():

+ file descriptor created with the guest_memfd() ioctl does not allow
  read/write/mmap operations
+ file size and block size as returned from fstat are as expected
+ fallocate on the fd checks that offset/length on
  fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned
+ invalid inputs (misaligned size, invalid flags) are rejected

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index b709a52d5cdb..2b1ef809d73a 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -124,6 +124,7 @@ TEST_GEN_PROGS_x86_64 += access_tracking_perf_test
 TEST_GEN_PROGS_x86_64 += demand_paging_test
 TEST_GEN_PROGS_x86_64 += dirty_log_test
 TEST_GEN_PROGS_x86_64 += dirty_log_perf_test
+TEST_GEN_PROGS_x86_64 += guest_memfd_test
 TEST_GEN_PROGS_x86_64 += guest_print_test
 TEST_GEN_PROGS_x86_64 += hardware_disable_test
 TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
new file mode 100644
index 000000000000..75073645aaa1
--- /dev/null
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright Intel Corporation, 2023
+ *
+ * Author: Chao Peng <chao.p.peng@linux.intel.com>
+ */
+
+#define _GNU_SOURCE
+#include "test_util.h"
+#include "kvm_util_base.h"
+#include <linux/bitmap.h>
+#include <linux/falloc.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <stdio.h>
+#include <fcntl.h>
+
+static void test_file_read_write(int fd)
+{
+	char buf[64];
+
+	TEST_ASSERT(read(fd, buf, sizeof(buf)) < 0,
+		    "read on a guest_mem fd should fail");
+	TEST_ASSERT(write(fd, buf, sizeof(buf)) < 0,
+		    "write on a guest_mem fd should fail");
+	TEST_ASSERT(pread(fd, buf, sizeof(buf), 0) < 0,
+		    "pread on a guest_mem fd should fail");
+	TEST_ASSERT(pwrite(fd, buf, sizeof(buf), 0) < 0,
+		    "pwrite on a guest_mem fd should fail");
+}
+
+static void test_mmap(int fd, size_t page_size)
+{
+	char *mem;
+
+	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT_EQ(mem, MAP_FAILED);
+}
+
+static void test_file_size(int fd, size_t page_size, size_t total_size)
+{
+	struct stat sb;
+	int ret;
+
+	ret = fstat(fd, &sb);
+	TEST_ASSERT(!ret, "fstat should succeed");
+	TEST_ASSERT_EQ(sb.st_size, total_size);
+	TEST_ASSERT_EQ(sb.st_blksize, page_size);
+}
+
+static void test_fallocate(int fd, size_t page_size, size_t total_size)
+{
+	int ret;
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
+	TEST_ASSERT(!ret, "fallocate with aligned offset and size should succeed");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			page_size - 1, page_size);
+	TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size);
+	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
+	TEST_ASSERT(ret, "fallocate beginning after total_size should fail");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			total_size, page_size);
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should succeed");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			total_size + page_size, page_size);
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should succeed");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			page_size, page_size - 1);
+	TEST_ASSERT(ret, "fallocate with unaligned size should fail");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
+			page_size, page_size);
+	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and size should succeed");
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
+	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
+}
+
+static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
+{
+	uint64_t valid_flags = 0;
+	size_t page_size = getpagesize();
+	uint64_t flag;
+	size_t size;
+	int fd;
+
+	for (size = 1; size < page_size; size++) {
+		fd = __vm_create_guest_memfd(vm, size, 0);
+		TEST_ASSERT(fd == -1 && errno == EINVAL,
+			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
+			    size);
+	}
+
+	if (thp_configured()) {
+		for (size = page_size * 2; size < get_trans_hugepagesz(); size += page_size) {
+			fd = __vm_create_guest_memfd(vm, size, KVM_GUEST_MEMFD_ALLOW_HUGEPAGE);
+			TEST_ASSERT(fd == -1 && errno == EINVAL,
+				    "guest_memfd() with non-hugepage-aligned page size '0x%lx' should fail with EINVAL",
+				    size);
+		}
+
+		valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+	}
+
+	for (flag = 1; flag; flag <<= 1) {
+		uint64_t bit;
+
+		if (flag & valid_flags)
+			continue;
+
+		fd = __vm_create_guest_memfd(vm, page_size, flag);
+		TEST_ASSERT(fd == -1 && errno == EINVAL,
+			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
+			    flag);
+
+		for_each_set_bit(bit, &valid_flags, 64) {
+			fd = __vm_create_guest_memfd(vm, page_size, flag | BIT_ULL(bit));
+			TEST_ASSERT(fd == -1 && errno == EINVAL,
+				    "guest_memfd() with flags '0x%llx' should fail with EINVAL",
+				    flag | BIT_ULL(bit));
+		}
+	}
+}
+
+
+int main(int argc, char *argv[])
+{
+	size_t page_size;
+	size_t total_size;
+	int fd;
+	struct kvm_vm *vm;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+
+	page_size = getpagesize();
+	total_size = page_size * 4;
+
+	vm = vm_create_barebones();
+
+	test_create_guest_memfd_invalid(vm);
+
+	fd = vm_create_guest_memfd(vm, total_size, 0);
+
+	test_file_read_write(fd);
+	test_mmap(fd, page_size);
+	test_file_size(fd, page_size, total_size);
+	test_fallocate(fd, page_size, total_size);
+
+	close(fd);
+}
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
