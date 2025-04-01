Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB59C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xymexOrVTgjaUMEbBs7wGl1qLt6S4GabgCxFzpXH2qo=; b=c+m2lXE1RX4LPW
	RgE2O+rIoQWZGg3kW3l33g9QsOefbo+7wOju6pCeSACcJ4qW/yF1QHoetJLV+73k+fkMXkMckWKPp
	TxjvcAMHxFqenwusNvqVo0dzahXiTWirmRA4ZLoB/FIMYievNjqezzy5lHEm5pFWgu5yUSai8CvvD
	dJRZIpJcbL5oGRZHEcyKBLF59jOZv3pK1pJ8OCnX216c2IAys8P91RoTa6XtcdUy/w6YBEDBu0VzR
	tgGcWKDSpmfKjwQk/03YdYPjiHiR/n+SeD9NqqsNFpBKwRF5BOoVAsrRpNE0sJWPh1TDWnE+8EMQY
	oTfbg/seGD1kiuY9wLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzisa-00000004PeX-2cuG;
	Tue, 01 Apr 2025 21:10:40 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVp-00000004LLj-383K
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:10 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22406ee0243so86285465ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540428; x=1744145228; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m2Nlc70kYoEVZE2tPVykbAae+uvb1zAI7sPIwdhW1oA=;
        b=pajm58H3z+Zzcee+E8+x0nCz5MIUd+X/485sj5goT8p0Bcv5YNnG6ABFba9Rl4YJ5N
         DzhGldUyGcO5N4zyi/KFeawEGVSV+vJ+tN33hPdHvxq6wOWD/tP4QKLm2wBBvauJND5f
         Y8tjTvZOzLH+pJtRlj6YlSL37EEXZbhZoT5LwYgDd2aa98nmOUGdbwrcxgHCLx4VSg3W
         yWvFkrGrpv/fcYzSqlhmE5CAT7ODAIfuMfEOznX8Bi86vTek2mMSACgzGYi7dsUqbaZf
         ngTutjekBebPK551Jq7ZgomsUiFkuITj0HQbWCMcijSLrpAlPjQ5mgWDdsrx5yH38yvJ
         1MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540428; x=1744145228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2Nlc70kYoEVZE2tPVykbAae+uvb1zAI7sPIwdhW1oA=;
        b=Yp26o2W13tImlfVYVSQkdrohj0WquU2NtjCveC8g3JpxGbW5BrWPJInw33utsWa2Fy
         r5dRPKH1rkNgF6RI7xvpF/2twzxDy/en97DVEGUoxnbntTrtYRG7TmgfyJjidFvoL7P3
         Mw3vWZJ+2WFzv1f3wew4XkdbvTwGUGra+lXsDKfmIBz0/uX3A0dS3QHYJbmRw7mwWbWL
         mVQz9CM2xZ/JvI8CKwHclW/OGZmcu6FWxH5l+Ux62jtfK3I1GicBXVxYgZECktXHgnuA
         EcVYPlaVQ28iD76WQbS9f6cAk6Aj1gmz1SwMOcuFOyy4HnasA8KsLK+8lU1dePVX3njQ
         dYLg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDVMrMr8tNzT8U8OGZ5RogP828ZorPLa2mtzZDmZ5VOA83UVR15l8Rh56qzwhjRWAFiK6d+Lt3f6bsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeUatotWVvH/wKV3yQelRgk3SzDhylKwodK35C7cY2YZj8wV38
	ezOaTFAEH/pI9O5JMxQCrLxHj2irequKr3W4V09KKIGf7FJ9k0f8iGsGGkhPk1X3rfexD3BfaKE
	wnQ==
X-Google-Smtp-Source: AGHT+IGsvgxu0cKjG5RuKP235RGuqLz8GTYqfRRM08+3tGkeZ2vVqfJM8i9w8mVMsttD6aUmHocD7/45nSY=
X-Received: from pfbdh1.prod.google.com ([2002:a05:6a00:4781:b0:730:8e17:ed13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1410:b0:725:96f2:9e63
 with SMTP id d2e1a72fcca58-73980477740mr24146728b3a.24.1743540428601; Tue, 01
 Apr 2025 13:47:08 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:24 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-13-seanjc@google.com>
Subject: [PATCH 12/12] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134709_825566_82D83C99 
X-CRM114-Status: GOOD (  19.05  )
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

Add a selftest to verify that eventfd+irqfd bindings are globally unique,
i.e. that KVM doesn't allow multiple irqfds to bind to a single eventfd,
even across VMs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm |   4 +
 tools/testing/selftests/kvm/irqfd_test.c | 130 +++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f773f8f99249..9e5128d9f22c 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -125,6 +125,7 @@ TEST_GEN_PROGS_x86 += dirty_log_perf_test
 TEST_GEN_PROGS_x86 += guest_memfd_test
 TEST_GEN_PROGS_x86 += guest_print_test
 TEST_GEN_PROGS_x86 += hardware_disable_test
+TEST_GEN_PROGS_x86 += irqfd_test
 TEST_GEN_PROGS_x86 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86 += kvm_page_table_test
 TEST_GEN_PROGS_x86 += memslot_modification_stress_test
@@ -163,6 +164,7 @@ TEST_GEN_PROGS_arm64 += dirty_log_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
 TEST_GEN_PROGS_arm64 += guest_print_test
 TEST_GEN_PROGS_arm64 += get-reg-list
+TEST_GEN_PROGS_arm64 += irqfd_test
 TEST_GEN_PROGS_arm64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_arm64 += kvm_page_table_test
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
@@ -185,6 +187,7 @@ TEST_GEN_PROGS_s390 += s390/ucontrol_test
 TEST_GEN_PROGS_s390 += demand_paging_test
 TEST_GEN_PROGS_s390 += dirty_log_test
 TEST_GEN_PROGS_s390 += guest_print_test
+TEST_GEN_PROGS_s390 += irqfd_test
 TEST_GEN_PROGS_s390 += kvm_create_max_vcpus
 TEST_GEN_PROGS_s390 += kvm_page_table_test
 TEST_GEN_PROGS_s390 += rseq_test
@@ -199,6 +202,7 @@ TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
 TEST_GEN_PROGS_riscv += get-reg-list
 TEST_GEN_PROGS_riscv += guest_print_test
+TEST_GEN_PROGS_riscv += irqfd_test
 TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
 TEST_GEN_PROGS_riscv += kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/irqfd_test.c b/tools/testing/selftests/kvm/irqfd_test.c
new file mode 100644
index 000000000000..286f2b15fde6
--- /dev/null
+++ b/tools/testing/selftests/kvm/irqfd_test.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+#include <stdint.h>
+#include <sys/sysinfo.h>
+
+#include "kvm_util.h"
+
+static struct kvm_vm *vm1;
+static struct kvm_vm *vm2;
+static int __eventfd;
+static bool done;
+
+/*
+ * KVM de-assigns based on eventfd *and* GSI, but requires unique eventfds when
+ * assigning (the API isn't symmetrical).  Abuse the oddity and use a per-task
+ * GSI base to avoid false failures due to cross-task de-assign, i.e. so that
+ * the secondary doesn't de-assign the primary's eventfd and cause assign to
+ * unexpectedly succeed on the primary.
+ */
+#define GSI_BASE_PRIMARY	0x20
+#define GSI_BASE_SECONDARY	0x30
+
+static void juggle_eventfd_secondary(struct kvm_vm *vm, int eventfd)
+{
+	int r, i;
+
+	/*
+	 * The secondary task can encounter EBADF since the primary can close
+	 * the eventfd at any time.  And because the primary can recreate the
+	 * eventfd, at the safe fd in the file table, the secondary can also
+	 * encounter "unexpected" success, e.g. if the close+recreate happens
+	 * between the first and second assignments.  The secondary's role is
+	 * mostly to antagonize KVM, not to detect bugs.
+	 */
+	for (i = 0; i < 2; i++) {
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY, eventfd, 0);
+		TEST_ASSERT(!r || errno == EBUSY || errno == EBADF,
+			    "Wanted success, EBUSY, or EBADF, r = %d, errno = %d",
+			    r, errno);
+
+		/* De-assign should succeed unless the eventfd was closed. */
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY + i, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+		TEST_ASSERT(!r || errno == EBADF,
+			    "De-assign should succeed unless the fd was closed");
+	}
+}
+
+static void *secondary_irqfd_juggler(void *ign)
+{
+	while (!READ_ONCE(done)) {
+		juggle_eventfd_secondary(vm1, READ_ONCE(__eventfd));
+		juggle_eventfd_secondary(vm2, READ_ONCE(__eventfd));
+	}
+
+	return NULL;
+}
+
+static void juggle_eventfd_primary(struct kvm_vm *vm, int eventfd)
+{
+	int r1, r2;
+
+	/*
+	 * At least one of the assigns should fail.  KVM disallows assigning a
+	 * single eventfd to multiple GSIs (or VMs), so it's possible that both
+	 * assignments can fail, too.
+	 */
+	r1 = __kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, 0);
+	TEST_ASSERT(!r1 || errno == EBUSY,
+		    "Wanted success or EBUSY, r = %d, errno = %d", r1, errno);
+
+	r2 = __kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, 0);
+	TEST_ASSERT(r1 || (r2 && errno == EBUSY),
+		    "Wanted failure (EBUSY), r1 = %d, r2 = %d, errno = %d",
+		    r1, r2, errno);
+
+	/*
+	 * De-assign should always succeed, even if the corresponding assign
+	 * failed.
+	 */
+	kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+}
+
+int main(int argc, char *argv[])
+{
+	pthread_t racing_thread;
+	int r, i;
+
+	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
+	vm1 = vm_create(1);
+	vm2 = vm_create(1);
+
+	WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+	kvm_irqfd(vm1, 10, __eventfd, 0);
+
+	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 10, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+
+	close(__eventfd);
+
+	pthread_create(&racing_thread, NULL, secondary_irqfd_juggler, vm2);
+
+	for (i = 0; i < 10000; i++) {
+		WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+		juggle_eventfd_primary(vm1, __eventfd);
+		juggle_eventfd_primary(vm2, __eventfd);
+		close(__eventfd);
+	}
+
+	WRITE_ONCE(done, true);
+	pthread_join(racing_thread, NULL);
+}
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
