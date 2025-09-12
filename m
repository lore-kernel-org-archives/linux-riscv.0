Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C830CAC594
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZbDNUAoKQ5SA7lXLDT032i6GLsBUYMaDZeehliodgE=; b=LvbjIaVlv8kkvm
	NzpTkAM+DpwzrPBRSITYSM0phkNILEVJuyr2IT/S+BOzgT8FWczU41CIR8B5z172BuHk3B3+rqA4v
	6Mka9t0ZMISzq0zEpSWtgpMmva+RamC0nq5LMUHnCgOBGX1imAtyeVeowneY5zP9nXMdzVYduPJ/k
	Fln+uKhg/GceEmWyniSOWWaUTXS6HI3c3jhHKRX7UMDdd9Nf2UHrZMVi+oaBSVOV3lSVYvXyvlpXn
	7p0Hg7LeEOZfc+KbXYCq9koOGTQ+mHQhvp8uOy8CmxchaeXkjF2t0ILqTA+D/oURH65SNO5uQjjMl
	hocnp/c33cSO0p2qPJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzv1-00000008CGU-3YmY;
	Fri, 12 Sep 2025 09:18:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzv0-00000008CDk-0aQY;
	Fri, 12 Sep 2025 09:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=2GKsQpLhDwEigIcg6L6Ns++AnIJyQDate+xl8DCsoZg=; b=oq+tX6Z9lyLikXsoXvplbJ/oHf
	GBEtvJwKBuEGw+M/mUpmvf0fM+jIsFchRp1JGDFkbBXS7byd5636XyQ9WhJoEqS9mmZML5zIfohEV
	6oSasLmhDEq41RpgV/ja+csnbnPWCOR/K9nlmCci0HxPh7e1lYNm+mPr39ftJ9LIqlT5wND6v/RwI
	T74aeYmNW2grw6CFVQYe6j4/olJr+peuZpbimeRBabgXGkjvxTgNanqyBWi7XDW9mK149V+ATkIhb
	KQbPptc9iH6VimFu4IPi3JTAUCE96sowXTMFBAyDUfwJO1bwaYvHItJY8B7QFbcwCuYMC5/RCGgwI
	9YDxOpfQ==;
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.197.217.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzux-00000006HYC-0o0v;
	Fri, 12 Sep 2025 09:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668687; x=1789204687;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2GKsQpLhDwEigIcg6L6Ns++AnIJyQDate+xl8DCsoZg=;
  b=tUJYliADo9GpxA3xk5tDFukreZ6rFlK5ipjBshJLszlLEAcHcz1pnzU2
   UmRTO3dUXAawzW2MS4HV6RtxcfiKwRtKRvZ4jkIXdCQf25ba1YKe//t44
   S7L+BNd4GYIkm84u3NXSRreEerk2f+qpUPhtOlxdwbWOArCUsm+AxK0V6
   gcfry4edhqxChSHfQVOYeZy5/KHEDypDYpYUYkC6YghUUldNzVg1o6F0Z
   S0F6f2i8tqmtRh/xO8A6C3czZD8fgsrvheKjBOOaB8LwYVfIDlXcnPU7K
   H3FeMwcx541LdroXsULfuKllZdYDZiLnEnIRPBqEBzVIEnhdK6uyV+vG9
   A==;
X-CSE-ConnectionGUID: EQbxnKQwQYmgqUwZT2/W1g==
X-CSE-MsgGUID: TxKdpCE+QeCObZn1Jdms6w==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2009018"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:57 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:4257]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.23.240:2525] with esmtp (Farcaster)
 id 333abaee-5346-466a-a477-4aea92fee266; Fri, 12 Sep 2025 09:17:57 +0000 (UTC)
X-Farcaster-Flow-ID: 333abaee-5346-466a-a477-4aea92fee266
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:45 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:44 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:44 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 09/11] KVM: selftests: stuff vm_mem_backing_src_type into
 vm_shape
Thread-Topic: [PATCH v6 09/11] KVM: selftests: stuff vm_mem_backing_src_type
 into vm_shape
Thread-Index: AQHcI8YZpVhjVEUOFEesx4zhC46W0w==
Date: Fri, 12 Sep 2025 09:17:44 +0000
Message-ID: <20250912091708.17502-10-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101807_409252_03C4A958 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Use one of the padding fields in struct vm_shape to carry an enum
vm_mem_backing_src_type value, to give the option to overwrite the
default of VM_MEM_SRC_ANONYMOUS in __vm_create().

Overwriting this default will allow tests to create VMs where the test
code is backed by mmap'd guest_memfd instead of anonymous memory.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 19 ++++++++++---------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  2 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     |  1 +
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5204a0a18a7f..8baa0bbacd09 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -188,7 +188,7 @@ enum vm_guest_mode {
 struct vm_shape {
 	uint32_t type;
 	uint8_t  mode;
-	uint8_t  pad0;
+	uint8_t  src_type;
 	uint16_t pad1;
 };
 
@@ -196,14 +196,15 @@ kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
 
 #define VM_TYPE_DEFAULT			0
 
-#define VM_SHAPE(__mode)			\
-({						\
-	struct vm_shape shape = {		\
-		.mode = (__mode),		\
-		.type = VM_TYPE_DEFAULT		\
-	};					\
-						\
-	shape;					\
+#define VM_SHAPE(__mode)				\
+({							\
+	struct vm_shape shape = {			\
+		.mode	  = (__mode),			\
+		.type	  = VM_TYPE_DEFAULT,		\
+		.src_type = VM_MEM_SRC_ANONYMOUS	\
+	};						\
+							\
+	shape;						\
 })
 
 #if defined(__aarch64__)
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a81089f7c83f..3a22794bd959 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
 	if (is_guest_memfd_required(shape))
 		flags |= KVM_MEM_GUEST_MEMFD;
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
+	vm_userspace_mem_region_add(vm, shape.src_type, 0, 0, nr_pages, flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;
 
diff --git a/tools/testing/selftests/kvm/lib/x86/sev.c b/tools/testing/selftests/kvm/lib/x86/sev.c
index c3a9838f4806..d920880e4fc0 100644
--- a/tools/testing/selftests/kvm/lib/x86/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86/sev.c
@@ -164,6 +164,7 @@ struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t type, void *guest_code,
 	struct vm_shape shape = {
 		.mode = VM_MODE_DEFAULT,
 		.type = type,
+		.src_type = VM_MEM_SRC_ANONYMOUS,
 	};
 	struct kvm_vm *vm;
 	struct kvm_vcpu *cpus[1];
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 0350a8896a2f..d403f8d2f26f 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -68,6 +68,7 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 	const struct vm_shape shape = {
 		.mode = VM_MODE_DEFAULT,
 		.type = vm_type,
+		.src_type = VM_MEM_SRC_ANONYMOUS,
 	};
 	struct kvm_vcpu *vcpu;
 	struct kvm_run *run;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
