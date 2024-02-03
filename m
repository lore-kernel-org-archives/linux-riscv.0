Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA62C48297
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKeCV0FOeYuLOnb5MH2KB4ohiHXriEyg5a77oVp3B4U=; b=bTge9w755xdHyP
	ogpxWComQkubSY7r+4ZppnG2YFYhCh/YgJqholWY6H8K4LgDJVa3hYHTUrDw3CSgHiFdhO72BPn8V
	XqlBtFfbZoLKs4okkzRKHFaQLuaCn0252awzeV4GV0RHjxx6NdajuXizuVbYsV/4odrBZYPfk0gST
	l0J29E3Y9/Ailx+qbMUnnbN+13OBdnIyQ9OLBAUYEo4YHZXHgH55adF50C9L8MlA1Pe2io6NnHlro
	Es9mheHgzuLSrUFAu+qSE/f0k+E1G/4Z6XamuIiUF9RdAsVm8FMYytdxI7VwgEufSiVx1UEzsr3SH
	LFFHiTmTsNdCRs50BDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bw-0000000DtKS-279R;
	Sat, 03 Feb 2024 00:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bn-0000000DtDU-3ucx
	for linux-riscv@bombadil.infradead.org;
	Sat, 03 Feb 2024 00:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XX/qPWiFzcrNc98rmsyPZwe0j7yaMHMPDZjofeW64Pk=; b=Z7qLkBoNZ4ApWyxIpk4b3LAvmk
	L1jGuWooqzSWC5WVR2g3NXcBEvI12TkGG5S7z/kmzBx+nlVQzwCn2CgUJ+QH/6jTsMO4R6HpZkaIk
	Nrx+dtrEVO6RUp546FSk2j0V+fuUN9y2mJb1b53K2hCa23gsBxyUYHpVn0Wc0s3er8nyB5TVujSSG
	MHynVqsYzXjkGObT4ADIO5tcD3RGcSC/J+GSBseu9etdtg3VZfTZGlJUrp3aOXwJpLFiHyfQGF/9N
	yoYlVBcKm7Uv0MckYJnuWMh26pC83ORzhmrvWQ2rVjSaYYvF7S4Trg8JszXhLRuGZNA2V3nWO3QjP
	/goLnUAw==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bV-0000000AL1V-3bxU
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:10:06 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6b2682870so4324292276.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918978; x=1707523778; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XX/qPWiFzcrNc98rmsyPZwe0j7yaMHMPDZjofeW64Pk=;
        b=j8KTXUoksUR2UegpS2SQ0YarQrgYmdiiHLnAhJypSd1DyXrKjEgJsVUEvktSaEBuTQ
         nreITXyr97mnAU9OPxU4g43BamX2gAcrzCeR2KOGSUmS/6x6yZLCfmkpJBUa88xQv4C2
         WAf1XeM4lBBE27D2U+ibRxPYNekXbpPafb5v+gM8dwvf7tstxK6VbUSd1D8YuzHtQSGR
         qaWMmgOTtp+4P56n82NlrzFWJdsCMvw/JikGjQqomumBuW9Nd5fKtMkSKNkZmRSb2mzh
         xkj+C9nr5CBzsUpHCy/WTiKc0gMt28N3B0DAIuaILeydSGUrsYU3zuvHQ9Vleles1S4x
         suVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918978; x=1707523778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX/qPWiFzcrNc98rmsyPZwe0j7yaMHMPDZjofeW64Pk=;
        b=iN6lEQzxEqNhIAMxHslW1765lnJnWu7O0UNVfJP79R+SInus5iHhZudDb2fypwSmcZ
         0LXe/Fcn6LNVYQzgcqNfZBvX6q7XLb8IgdiOOSpBlY9HpyemH53JcqSOCqFEZY4vkKgJ
         tHN1A0rse7gUE4uCZOmlQ6A6FfOwmo+K2rpViElDqeQFZRtAuVTuZAkQZtw7dLPDtIzl
         +kQQsO9Tz+CpsbuqBiOjwZjbKKRtl94pb+AvaReIUlU0GTyfVtUupOlg+zyvBxWAU3MW
         M5Cz85Hkw5XdbP2Q1mXQh67cAi0/PRqf4SaNzGtnyMWgJYfEketsRbF5u6vThIJxSNR+
         7/OA==
X-Gm-Message-State: AOJu0YxDK+r4C1raXEd/Cv7zQF4PCbadLvYBLxw/DuKhqY3X0Y5SJNJt
	IpXjOm2aiX0gxhx4TllMeeY2Bls4+tZ2VHqOFNWyaOjS28nikCLlNpPyGjHlXJFYpanUL/zBEaG
	n0Q==
X-Google-Smtp-Source: AGHT+IGBKIXyRsAwi5cacC2RTa4GkVM2EUkU98GzGDTFoqRDoIOEQUQo2SlZwq83sHOJV7drFveoG9mVQK8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1085:b0:dc6:e5e9:f3af with SMTP id
 v5-20020a056902108500b00dc6e5e9f3afmr1242765ybu.9.1706918978596; Fri, 02 Feb
 2024 16:09:38 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:15 -0800
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-10-seanjc@google.com>
Subject: [PATCH v8 09/10] KVM: selftests: Use the SEV library APIs in the
 intra-host migration test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_000957_378214_6D77446A 
X-CRM114-Status: GOOD (  12.82  )
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

Port the existing intra-host SEV(-ES) migration test to the recently added
SEV library, which handles much of the boilerplate needed to create and
configure SEV guests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/sev_migrate_tests.c  | 67 ++++++-------------
 1 file changed, 21 insertions(+), 46 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/sev_migrate_tests.c b/tools/testing/selftests/kvm/x86_64/sev_migrate_tests.c
index a49828adf294..d6f7428e42c6 100644
--- a/tools/testing/selftests/kvm/x86_64/sev_migrate_tests.c
+++ b/tools/testing/selftests/kvm/x86_64/sev_migrate_tests.c
@@ -10,11 +10,9 @@
 #include "test_util.h"
 #include "kvm_util.h"
 #include "processor.h"
-#include "svm_util.h"
+#include "sev.h"
 #include "kselftest.h"
 
-#define SEV_POLICY_ES 0b100
-
 #define NR_MIGRATE_TEST_VCPUS 4
 #define NR_MIGRATE_TEST_VMS 3
 #define NR_LOCK_TESTING_THREADS 3
@@ -22,46 +20,24 @@
 
 bool have_sev_es;
 
-static int __sev_ioctl(int vm_fd, int cmd_id, void *data, __u32 *fw_error)
-{
-	struct kvm_sev_cmd cmd = {
-		.id = cmd_id,
-		.data = (uint64_t)data,
-		.sev_fd = open_sev_dev_path_or_exit(),
-	};
-	int ret;
-
-	ret = ioctl(vm_fd, KVM_MEMORY_ENCRYPT_OP, &cmd);
-	*fw_error = cmd.error;
-	return ret;
-}
-
-static void sev_ioctl(int vm_fd, int cmd_id, void *data)
-{
-	int ret;
-	__u32 fw_error;
-
-	ret = __sev_ioctl(vm_fd, cmd_id, data, &fw_error);
-	TEST_ASSERT(ret == 0 && fw_error == SEV_RET_SUCCESS,
-		    "%d failed: return code: %d, errno: %d, fw error: %d",
-		    cmd_id, ret, errno, fw_error);
-}
-
 static struct kvm_vm *sev_vm_create(bool es)
 {
 	struct kvm_vm *vm;
-	struct kvm_sev_launch_start start = { 0 };
 	int i;
 
 	vm = vm_create_barebones();
-	sev_ioctl(vm->fd, es ? KVM_SEV_ES_INIT : KVM_SEV_INIT, NULL);
+	if (!es)
+		sev_vm_init(vm);
+	else
+		sev_es_vm_init(vm);
+
 	for (i = 0; i < NR_MIGRATE_TEST_VCPUS; ++i)
 		__vm_vcpu_add(vm, i);
+
+	sev_vm_launch(vm, es ? SEV_POLICY_ES : 0);
+
 	if (es)
-		start.policy |= SEV_POLICY_ES;
-	sev_ioctl(vm->fd, KVM_SEV_LAUNCH_START, &start);
-	if (es)
-		sev_ioctl(vm->fd, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
+		vm_sev_ioctl(vm, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
 	return vm;
 }
 
@@ -181,7 +157,7 @@ static void test_sev_migrate_parameters(void)
 	sev_vm = sev_vm_create(/* es= */ false);
 	sev_es_vm = sev_vm_create(/* es= */ true);
 	sev_es_vm_no_vmsa = vm_create_barebones();
-	sev_ioctl(sev_es_vm_no_vmsa->fd, KVM_SEV_ES_INIT, NULL);
+	sev_es_vm_init(sev_es_vm_no_vmsa);
 	__vm_vcpu_add(sev_es_vm_no_vmsa, 1);
 
 	ret = __sev_migrate_from(sev_vm, sev_es_vm);
@@ -230,13 +206,13 @@ static void sev_mirror_create(struct kvm_vm *dst, struct kvm_vm *src)
 	TEST_ASSERT(!ret, "Copying context failed, ret: %d, errno: %d", ret, errno);
 }
 
-static void verify_mirror_allowed_cmds(int vm_fd)
+static void verify_mirror_allowed_cmds(struct kvm_vm *vm)
 {
 	struct kvm_sev_guest_status status;
+	int cmd_id;
 
-	for (int cmd_id = KVM_SEV_INIT; cmd_id < KVM_SEV_NR_MAX; ++cmd_id) {
+	for (cmd_id = KVM_SEV_INIT; cmd_id < KVM_SEV_NR_MAX; ++cmd_id) {
 		int ret;
-		__u32 fw_error;
 
 		/*
 		 * These commands are allowed for mirror VMs, all others are
@@ -256,14 +232,13 @@ static void verify_mirror_allowed_cmds(int vm_fd)
 		 * These commands should be disallowed before the data
 		 * parameter is examined so NULL is OK here.
 		 */
-		ret = __sev_ioctl(vm_fd, cmd_id, NULL, &fw_error);
-		TEST_ASSERT(
-			ret == -1 && errno == EINVAL,
-			"Should not be able call command: %d. ret: %d, errno: %d",
-			cmd_id, ret, errno);
+		ret = __vm_sev_ioctl(vm, cmd_id, NULL);
+		TEST_ASSERT(ret == -1 && errno == EINVAL,
+			    "Should not be able call command: %d. ret: %d, errno: %d",
+			    cmd_id, ret, errno);
 	}
 
-	sev_ioctl(vm_fd, KVM_SEV_GUEST_STATUS, &status);
+	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &status);
 }
 
 static void test_sev_mirror(bool es)
@@ -281,9 +256,9 @@ static void test_sev_mirror(bool es)
 		__vm_vcpu_add(dst_vm, i);
 
 	if (es)
-		sev_ioctl(dst_vm->fd, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
+		vm_sev_ioctl(dst_vm, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
 
-	verify_mirror_allowed_cmds(dst_vm->fd);
+	verify_mirror_allowed_cmds(dst_vm);
 
 	kvm_vm_free(src_vm);
 	kvm_vm_free(dst_vm);
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
