Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779DFD37E33
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPhNQel25T7s7CFU52LQY6t76p1rMCqEONsrT5SmIl4=; b=LynD5sBXl+UAO4
	Y/2kXTzt03nWp4KM1a2thuVvIHETTKkm1zHgVD6cmbObTP/MtX8FY2XZ6yrLRutOJKrjsu+DKP1tp
	kNHojW//ssnFGZjoLlbWgLN+zs7GdpsPtTCdDpXdoY8xKgkLmehWAmftu9jcM2R39cSNW6LFml25g
	fWOCastdlo4P4/alB/tfrdJsvG0e2DihG1daMMDBo5nGpNC7PKLdn8fQdBg5MuzZzYsn7RweBhDvF
	JG3BILIZZobI+yougWVSctLLjJpTazQAkdxsLTBMRCga8G8NZ0ZdGsHtdWk5AllaKU86Ic9sIaMkb
	0mj5WJwz8ecOm3+fa/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1EK-00000009OPo-3Ytt;
	Wed, 14 Jan 2026 13:48:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1EI-00000009OOQ-3vXb;
	Wed, 14 Jan 2026 13:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sUXffJ10pcwposVmC9vM2kcbCnj2+0WuRal0d/tv1pE=; b=RWUiVxTM0XqYBXJbqnz1yPH6S4
	gMAZ2i0o8z5r0rL5/pOUQltCfNBvzDwOIJTN1s0IC9M0+VnaTMbuUbGY0GtS0Jlytw1DXHU6mpejP
	fetxbpeKDcJAsIf/t/EcKb+Qr03nh6xMB+dqNVHnQilS84RXW/xC/9y604zlJHOUa3q0VgRby3Zqi
	H3qcInmo/7X5V20dXyUveygIKWBFr5NzkrphbgQf5LaGLawgS38QRHJoROy3IbwMtHlFAPbYrlX2G
	G+raUv7z7jo6saC/hb/srNrYk0jz/m7uK2q58K4u44/7hFF8PnMAbN8nkThAlKPH3Y/n4eFvsmklV
	G0piE7Jw==;
Received: from fra-out-007.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.75.33.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1EG-00000004wwE-029z;
	Wed, 14 Jan 2026 13:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398487; x=1799934487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sUXffJ10pcwposVmC9vM2kcbCnj2+0WuRal0d/tv1pE=;
  b=niLWlQ2qNPh/Vvl/tiR4zdn2AXQQlNrlaEZZGtmADQJLSeKfzWdp2qQJ
   No8fPz33F/kCOHzDQbuKq96ynLTuAFO+dmM1dA3McBcCvsqBlSo+uZ7sQ
   igOzwR9sXoKzcsWhZuZUJOaOHsobYMZfffKy6rrnHYffhHYD2qHsgzUhD
   9nveKI+PUQNHnRH339q+SNz9KIwbUHF9jomRucun84QLGWXEcbxsBv+M6
   9MQEriaz9LE5HSlQ4QYttd7qtaBklKp6QYhhyBs0MrtnwgitabGWumwgF
   qQaEadIYGjlyM6nkuRxNpd5eqfbw7uViGtYkPKVJKRwO1BsW/Fb/ltiB+
   g==;
X-CSE-ConnectionGUID: TM2P1oQYSV+xOXLTuttl/A==
X-CSE-MsgGUID: EW6MjOESTFSHJbSl7EhLcw==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7897283"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-007.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:47:49 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:3376]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.7.212:2525] with esmtp (Farcaster)
 id 24ecbc43-4ad6-4a75-8fbe-89bf20ddb079; Wed, 14 Jan 2026 13:47:48 +0000 (UTC)
X-Farcaster-Flow-ID: 24ecbc43-4ad6-4a75-8fbe-89bf20ddb079
Received: from EX19D005EUB002.ant.amazon.com (10.252.51.103) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:40 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB002.ant.amazon.com (10.252.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:40 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:47:40 +0000
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
Subject: [PATCH v9 13/13] KVM: selftests: Test guest execution from direct map
 removed gmem
Thread-Topic: [PATCH v9 13/13] KVM: selftests: Test guest execution from
 direct map removed gmem
Thread-Index: AQHchVxZK9VKx1JGv0KQmfxswHb3WQ==
Date: Wed, 14 Jan 2026 13:47:39 +0000
Message-ID: <20260114134510.1835-14-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_134808_238060_B5C8520F 
X-CRM114-Status: GOOD (  11.12  )
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

Add a selftest that loads itself into guest_memfd (via
GUEST_MEMFD_FLAG_MMAP) and triggers an MMIO exit when executed. This
exercises x86 MMIO emulation code inside KVM for guest_memfd-backed
memslots where the guest_memfd folios are direct map removed.
Particularly, it validates that x86 MMIO emulation code (guest page
table walks + instruction fetch) correctly accesses gmem through the VMA
that's been reflected into the memslot's userspace_addr field (instead
of trying to do direct map accesses).

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 7fe427ff9b38..6c57fb036b20 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -602,6 +602,41 @@ static void test_mmio_during_vectoring(void)
 
 	kvm_vm_free(vm);
 }
+
+static void guest_code_trigger_mmio(void)
+{
+	/*
+	 * Read some GPA that is not backed by a memslot. KVM consider this
+	 * as MMIO and tell userspace to emulate the read.
+	 */
+	READ_ONCE(*((uint64_t *)MEM_REGION_GPA));
+
+	GUEST_DONE();
+}
+
+static void test_guest_memfd_mmio(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.src_type = VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP,
+	};
+	pthread_t vcpu_thread;
+
+	pr_info("Testing MMIO emulation for instructions in gmem\n");
+
+	vm = __vm_create_shape_with_one_vcpu(shape, &vcpu, 0, guest_code_trigger_mmio);
+
+	virt_map(vm, MEM_REGION_GPA, MEM_REGION_GPA, 1);
+
+	pthread_create(&vcpu_thread, NULL, vcpu_worker, vcpu);
+
+	/* If the MMIO read was successfully emulated, the vcpu thread will exit */
+	pthread_join(vcpu_thread, NULL);
+
+	kvm_vm_free(vm);
+}
 #endif
 
 int main(int argc, char *argv[])
@@ -625,10 +660,19 @@ int main(int argc, char *argv[])
 	test_add_max_memory_regions();
 
 #ifdef __x86_64__
-	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
-	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
-		test_add_private_memory_region();
-		test_add_overlapping_private_memory_regions();
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD)) {
+		uint64_t valid_flags = kvm_check_cap(KVM_CAP_GUEST_MEMFD_FLAGS);
+
+		if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM)) {
+			test_add_private_memory_region();
+			test_add_overlapping_private_memory_regions();
+		}
+
+		if ((valid_flags & GUEST_MEMFD_FLAG_MMAP)
+			&& (valid_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
+			test_guest_memfd_mmio();
+		else
+			pr_info("Skipping tests requiring GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_NO_DIRECT_MAP");
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
