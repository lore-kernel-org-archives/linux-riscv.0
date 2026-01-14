Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFE5D37E3A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mK0Y/mPXA4RGQESBb6FB4vsMad1cH7Q+YqcZxG0b6tw=; b=ygKXnefeGJwWiB
	YoSH6TLQ7pl40q9B7Xk9WD9M+d1Wh0Y1f/Ho4cavmmMmYBEZPp/aRVLoGbDPMbdeXiZEq1dd9lJI7
	Xy+1CqMMP1nOpMqvMLSIG6/B4zad6MXIsHEsLxc99P+BvHX1o8wIa7tV7URQFiwDnDVAPZAw9Gep3
	Sq8QlNLze8IuD3xMXd6eECN5/9IepqQwgNxtC/zypFcB5puzKq/QgNILjCERvydB5E1FwHy9CEGfI
	ETpq18dLEfdyJ9LnB6xEXd8oVnOEkLP+65kyoaj9hOSeIXkczNVS5Z2qeLF4XUBDQ1tT4fzXjIXgs
	1gEPmQjVPHINm8HpzQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1E0-00000009OFZ-3yhw;
	Wed, 14 Jan 2026 13:47:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Dz-00000009ODs-0pn4;
	Wed, 14 Jan 2026 13:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IZkODn83RzbQJlBtvngM/cf4CG/FWZhQcx+73Doqz/A=; b=mlEU1ubxpD+p1o2IgUzTDOT3WC
	152DrzPWfzS/ojJesxhGf1IhmxsgQ622ujSSGVV0AAVgr2gatKXC5tJTci8hBcNwrK5IaFWFy0mTq
	3iIfjm9fRMNCAFRmJSIqjbYITcJkOa2JODXrd3XGft2d7lyrL7iXC/VDSTTIgJWekHg76XhbhEVIz
	1vJFCXgVAYQRWj37Owx4lNJS0BVVdNUGQ7yGFMoX1RC+U8jguuJw8cdrsz/Ro3GY4mKO+H4lqsGS4
	QR8Ye6Ed9JccvkBbYzn/TKj8OFbP4YE9vianfDFvUPSrFGS+QrrI+NfMLIGTkoThPYed3H5UEKY0Y
	mvBeCa6Q==;
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Dw-00000004wq2-12hK;
	Wed, 14 Jan 2026 13:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398468; x=1799934468;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IZkODn83RzbQJlBtvngM/cf4CG/FWZhQcx+73Doqz/A=;
  b=Q/0D3m3NytLHbOA1NZ269kqnmLKcvizNRFYVtjWOIYoCw32EeJxC+tkh
   HF4qBJ+n2lYyOYVJmeqTkMPGCOqGOYgp/b0g1zkNYfQhRO2DYhi8+yTYP
   cWOFQcjwHo4pgsXyF5VYIyQ8z6f+3urJd3DoOChA9X+5kO41JaF+Y7+Yb
   m7UUR5QMepjx9XHhYoBmi2vUqZO+sIvAuFUklpmL+RSr+0xigIsJoTXeh
   T20Nb6y8nxGIcqtj3uQpesw5Jr+cuei0ja2fph4Vv2H6bht3We6Xql3Xz
   1TJ/fudoAx0VIMMafHTZNxQzK3bR9jagPBD8YtP7YPq+W1Jf2sUNDTj9g
   Q==;
X-CSE-ConnectionGUID: 9KpH60D2Si6qGIHBYMit1w==
X-CSE-MsgGUID: IOYRS41zTEev1F6z9fXK1w==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7911948"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:47:30 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.236:26468]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.21.80:2525] with esmtp (Farcaster)
 id 3d5272de-56d4-40db-b0b7-a6e47fa35f1a; Wed, 14 Jan 2026 13:47:30 +0000 (UTC)
X-Farcaster-Flow-ID: 3d5272de-56d4-40db-b0b7-a6e47fa35f1a
Received: from EX19D005EUB004.ant.amazon.com (10.252.51.126) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:29 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB004.ant.amazon.com (10.252.51.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:28 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:47:28 +0000
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
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org"
	<luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
	"willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz"
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
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v9 12/13] KVM: selftests: stuff vm_mem_backing_src_type into
 vm_shape
Thread-Topic: [PATCH v9 12/13] KVM: selftests: stuff vm_mem_backing_src_type
 into vm_shape
Thread-Index: AQHchVxSq2wgeUau5UaeM0CUzdmDKw==
Date: Wed, 14 Jan 2026 13:47:28 +0000
Message-ID: <20260114134510.1835-13-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_134748_376677_5E5D8D09 
X-CRM114-Status: UNSURE (   9.76  )
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
