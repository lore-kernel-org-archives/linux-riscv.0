Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F7EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysaosMFDqWRpy0OOUy5eFywBLqqxEjy7g/95MQui0MI=; b=ZiMBR9yfD6p+la
	nquqgzwUQjXcREGQvJPcNla9lf1OOvMrEq2yO09QOLknwb05qdKjeHNIexDKgX2FvjghCwjzFfATY
	6KO0dO9f89vBM2XJEfD5C5BHzqaAG0u0nXmP3qt7TYprMZYM9BzWo1Q6dZYUC0MrAZmeH1gem5r9I
	xfbwR+im9ah7ljHEdtTQRdAnZQHGb9u7xdpBoujKmXrDfMH2FAR0B9iuGvPi7MkfmBC161KTanQOK
	2w5EIVe4XEYVKhN6/U9aqqI5V80PjAcOTztN1dtAI6wcbLVVnkjAVMBXuHvQZyE5TMcwTGTlUkkjO
	S92q+y2qsQMZHf1nvOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbe-005Dx3-0y;
	Wed, 19 Jul 2023 05:20:10 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbJ-005Dg5-2c
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZGXSnNz9o61Nw72V9XtLKU+I8mKv7z4NMyFHcn8MEno=; b=dc5EXqGGuCaw1RBFz2l2PTKq3b
	lgOM2+Pig4Uo3mzuJ95AbtZjvXgYBxwttHUxLKiTAWQZGDR7Z+KVzd4wDSHAn4CBIReir3+Kahpzz
	eHdJHrkniHWIv7xhI3xHVKqP7ywsQRF76KusLD3PXoL3z4LacY7WSVd19jt0wOjpfn1NQ4sV+pSMh
	HhlF3L/shwi7wKVq08b0W6NLGpys6oxCE7wPNXWvy/ScMQt9/k+qvRD+XDWPwAT3X2UHkuV/TWBCr
	Tx0GR4z/YMmyzAPlmyjUX/l7s2xfhBIYLRhnXC+WBxB33EktpR2v8Dl3TOkBAAXzt//x2mRzO8s4e
	LRwRYo+Q==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuSc-005R0P-5I
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c850943cf9aso5386191276.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724165; x=1692316165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGXSnNz9o61Nw72V9XtLKU+I8mKv7z4NMyFHcn8MEno=;
        b=GviMnBBwU8oJFlQ10qq8pyNxF7L9mJcuxalCPWoh/bF9ok9oEX2NUjJa9KKrHhYi87
         XvlFcjanaIMk8EerhhIcwP5vtcQhJw/XsBuHfBW7ujLq/QBtekbPZhEy0L3zssjX4Os4
         HCkDWaXzBMGWrEbehtYy6wCVBKkJl3f6UoLTxyqF6qjG/S5GIRtbBPwaqMWsXI2EE2Ex
         NTvB3XEVI69qVZ02zJuKcraIox6wsBhFnvj0wE9fUxuTn7iTtsBzcdr5PGVMvlBBbZgO
         uGQ5KBwtnA8Asre36kaUD4NkR+B+Hy37JeEBxvmqP4a9xALjBPGXbUZlkCkQaErZ6C1E
         xXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724165; x=1692316165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGXSnNz9o61Nw72V9XtLKU+I8mKv7z4NMyFHcn8MEno=;
        b=BbGXaDrH8xFWcWy7460yTluuEBqHucxNZdjX9qQ+7tvAWQuJ1pxEh+GbuLH+FQ/aFU
         Rwzz4p/XbW/zmDvfp1fGQULk9r9gz9Q12rXfd6kkl1fcB/YiumgoVLD3zZOqdHwoGD1g
         RoN++Dpfi2rHpRL5/LuZ6WdXRjJYVqRg6UQYo7K3HUMjekd3t9kFyhqjgbN7/dqfyj2Y
         VzfXZTWhYeC4KDhx22u6wu7zykLFGm/BHBc0f9L9F7p1xJiozXLihKxA4uJ7VrvTVl36
         e26XgeSJAKntl/L44saBcZbxrV4U70zidb1uyttb6hY/iIWCI/QFVIjAiQ3DBf59QgOC
         kvAQ==
X-Gm-Message-State: ABy/qLa2ex3fAuF3EG39k2NWLdhfoJU8rhd/3vMZwaXpmVI53eom+Shn
	cZA7JpixmEbxqLGg2rGT7mE6qbV8pMg=
X-Google-Smtp-Source: APBJJlGDd5tbMIE4K9RYtlnEKXGejfF7CjNXrlXhKKgJKz78WoWlRr188h2THM+j/ruWPDM9LNr5r2ORq68=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:378a:0:b0:c6e:269e:953a with SMTP id
 e132-20020a25378a000000b00c6e269e953amr12921yba.3.1689724165651; Tue, 18 Jul
 2023 16:49:25 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:11 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-29-seanjc@google.com>
Subject: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
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
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005030_231177_A26A8811 
X-CRM114-Status: GOOD (  13.68  )
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

Add a selftest to verify the basic functionality of guest_memfd():

+ file descriptor created with the guest_memfd() ioctl does not allow
  read/write/mmap operations
+ file size and block size as returned from fstat are as expected
+ fallocate on the fd checks that offset/length on
  fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index fdc7dff8d6ae..18c43336ede3 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -123,6 +123,7 @@ TEST_GEN_PROGS_x86_64 += access_tracking_perf_test
 TEST_GEN_PROGS_x86_64 += demand_paging_test
 TEST_GEN_PROGS_x86_64 += dirty_log_test
 TEST_GEN_PROGS_x86_64 += dirty_log_perf_test
+TEST_GEN_PROGS_x86_64 += guest_memfd_test
 TEST_GEN_PROGS_x86_64 += hardware_disable_test
 TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86_64 += kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
new file mode 100644
index 000000000000..d698f9fde987
--- /dev/null
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -0,0 +1,114 @@
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
+	ASSERT_EQ(mem, MAP_FAILED);
+}
+
+static void test_file_size(int fd, size_t page_size, size_t total_size)
+{
+	struct stat sb;
+	int ret;
+
+	ret = fstat(fd, &sb);
+	TEST_ASSERT(!ret, "fstat should succeed");
+	ASSERT_EQ(sb.st_size, total_size);
+	ASSERT_EQ(sb.st_blksize, page_size);
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
+	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
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
+
+int main(int argc, char *argv[])
+{
+	size_t page_size;
+	size_t total_size;
+	int fd;
+	struct kvm_vm *vm;
+
+	page_size = getpagesize();
+	total_size = page_size * 4;
+
+	vm = vm_create_barebones();
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
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
