Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDAAD2FEE7
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mK0Y/mPXA4RGQESBb6FB4vsMad1cH7Q+YqcZxG0b6tw=; b=qypQiadLMnc1hl
	5FuoRhdCCS861VD1VPZTy1joqYWSAEHMXVEpaEGgOzPuCa73glb8vaByc0Nojnx5Acba+tXH8gm5F
	BhIzT+cmVrr96vh97RM2GQZ2a1ndLUDzAiJJsrBbBfHWQIdzuYtMkI1nuz70KxWU0fh+E2f85LvyT
	LxW4ANyttnecz7v2+zNZWdYdunYS0cWUXMactyke00XbvmLFih/96yT+y4h+3x3Nsk+w6BuSOxOnh
	mOcKnGh2Wifep9RHwKvocGj/knLdWI1v6rduCnKMYqkD74OG6G2qPriovgLXIPlCLanN2ShtAZnhv
	7pxZ35cNcXSIR3u577Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqs-0000000EvwO-0qxM;
	Tue, 27 Jan 2026 19:35:50 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPqd-0000000Cu6g-3vfw;
	Mon, 26 Jan 2026 16:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1769446435; x=1800982435;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IZkODn83RzbQJlBtvngM/cf4CG/FWZhQcx+73Doqz/A=;
  b=VpQJuO6GpVkePDyUJVv8TtD1M4TVLjs6M44HBADkuTd47jYwsKVAYLg2
   htHaEs53DtRuEBVMcV4UwV5ZZf2VpfCV4rvxu+1DmY7ufUpc8jFaq4X3M
   JNXh16yDckl4YIWjNGpiTzMDwUJ7H4WI9qaFqeeTmXG8am3+2av+f47i2
   lMmWlVjdrmORUpF6ZKz7QNMqPG0bhI97hQFrWepKk1i+hFmC80F0anbX1
   e9jjzhTO45eYuxtIw/EKQqtRWt1EEcWBLzMSzCiiLzYj3rvefgtlEj2GS
   T2cTVA0Wji3pmBzjJs+shkD7IzISc4fcwf3YpiBolj50YtbOVj3bg6eTi
   w==;
X-CSE-ConnectionGUID: 2nORrr6YRC2G4fZW1A4I7Q==
X-CSE-MsgGUID: +c9glS2LQGe9MdXD3TLgeA==
X-IronPort-AV: E=Sophos;i="6.21,255,1763424000"; 
   d="scan'208";a="8357402"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:53:36 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.233:21035]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.23.198:2525] with esmtp (Farcaster)
 id a8706c82-9dc2-42cd-ab2c-9b60461130fb; Mon, 26 Jan 2026 16:53:36 +0000 (UTC)
X-Farcaster-Flow-ID: a8706c82-9dc2-42cd-ab2c-9b60461130fb
Received: from EX19D005EUB002.ant.amazon.com (10.252.51.103) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:53:30 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB002.ant.amazon.com (10.252.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:53:30 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Mon, 26 Jan 2026 16:53:29 +0000
From: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org"
	<ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>,
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev"
	<martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>,
	"song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev"
	<yonghong.song@linux.dev>, "john.fastabend@gmail.com"
	<john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com"
	<peterx@redhat.com>, "jannh@google.com" <jannh@google.com>,
	"pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>,
	"riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com"
	<mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>,
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com"
	<gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com"
	<urezki@gmail.com>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com"
	<jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org"
	<pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v10 14/15] KVM: selftests: stuff vm_mem_backing_src_type into
 vm_shape
Thread-Topic: [PATCH v10 14/15] KVM: selftests: stuff vm_mem_backing_src_type
 into vm_shape
Thread-Index: AQHcjuRM7p/8/MtlVUCsx1GyifAAag==
Date: Mon, 26 Jan 2026 16:53:29 +0000
Message-ID: <20260126164445.11867-15-kalyazin@amazon.com>
References: <20260126164445.11867-1-kalyazin@amazon.com>
In-Reply-To: <20260126164445.11867-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_085356_287186_08B86B37 
X-CRM114-Status: GOOD (  10.45  )
X-Mailman-Approved-At: Tue, 27 Jan 2026 11:35:38 -0800
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

From: Patrick Roy <patrick.roy@linux.dev>

Use one of the padding fields in struct vm_shape to carry an enum
vm_mem_backing_src_type value, to give the option to overwrite the
default of VM_MEM_SRC_ANONYMOUS in __vm_create().

Overwriting this default will allow tests to create VMs where the test
code is backed by mmap'd guest_memfd instead of anonymous memory.

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 19 ++++++++++---------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  2 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     |  1 +
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 6689b43810c1..4bc4af9a40cf 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -192,7 +192,7 @@ enum vm_guest_mode {
 struct vm_shape {
 	uint32_t type;
 	uint8_t  mode;
-	uint8_t  pad0;
+	uint8_t  src_type;
 	uint16_t pad1;
 };
 
@@ -200,14 +200,15 @@ kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
 
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
index 28ee51253909..268a4520633b 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -467,7 +467,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
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
index 93e603d91311..8a4d5af53fab 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -165,6 +165,7 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
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
