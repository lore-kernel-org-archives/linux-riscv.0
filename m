Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE64CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpqbkw1j60P3kl2p2BuESQLocqpJ91Gy95Ly29Mwwig=; b=VuNMs6JFngqM8u
	Nc+LUzF0q+v5exsvnymh6pM4M+NNzfCdNljbONNrzqDUtaJ/Kh7il+C7veT0+IFyGOkPr7jUlszRe
	aIv9a2QGkaB7yvCn8E8korf/SIJtHkaLU9wvP3DaXzGg2KWxpaEbdAZlACObu3vW9OFV3JSuufATY
	Di/3sEMMeRxdOw4/w7EfC4pXXSshG8OzitXWCDj43nP93ylHOnwUwot0kQoSqTU/CA7dPRjmOxpTT
	XD+0Sb+LMtACwjtvLgYNvgpQxYTw8WSSBCsaIte/VNVnkJAtzyZvHo7cOMrQZQ/z6Ilpz8gH6nvsb
	+RgIn+zpoANg76Zb9/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzv4-00000008CJ8-3WXd;
	Fri, 12 Sep 2025 09:18:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzv2-00000008CGs-3Xpo;
	Fri, 12 Sep 2025 09:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=Ojtm9hG3uDHHN9CPzAzA1kwd7CoLxip6b5f2qHGneMU=; b=dGpSi6YshuM6HSn2DqRQfpFPTn
	vUAlgy97QvcGhFgQUmPvnq7fl++ns6+m1c03clyoBHfSTriXJOSWDVgcTZItyBzPjKFKj7iNNZwuN
	GW0HCWfGzWjctWTTJAFbk92qXSy/deB0zZQZXjK/NPMalnHmR3fjlQQ8A5IHIOFUw3maWO9B6iKwe
	EyE9pHrsgiSsvWEgVI099rlmVSiIGQa+G3J72wHolEnLxOJWVEViF7WVarI1CDhTAX/mAo+mgOgDg
	TH7ip8fPXvWXbeOdfyMgLpdzxqEla9L1mv3l1/G3ARvfN7eh7z2uHdB3a6LrvzWGKSO+2cD5zxdoO
	P4KTdvmw==;
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([52.28.197.132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuz-00000006HZX-3EoS;
	Fri, 12 Sep 2025 09:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668689; x=1789204689;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ojtm9hG3uDHHN9CPzAzA1kwd7CoLxip6b5f2qHGneMU=;
  b=mBEXi80McV6KAi4ZVN020cRFqu/Fw+rcy5P+UU4sIgYHAGVlMwlk4JJM
   enkqxKKyUgp7UitDv+3YDhxym6eIRQ0CWvZdnTTSp3OE408QY5vOJ6Yyc
   3olY2O2Z29xbXluuzHviRFMCV4rxZaHxUgZLg8vBRQ2o9jusm9H/RfC60
   JYtAS8LPEfIuzkSQgD9pm6JNrnfReJzOt1g4qhCiYKrOoqwjBowt08VHD
   ErYb0di1kU/T71wfFKi8tBurSFZayOPzgjBYLXh+f/m5X8/adlM5qxE2/
   qlqx8LjX6amYHkmqZJjFPs6hbkHfhd5aN0hYcBZK5z1O/0GEcvtb0YBkB
   Q==;
X-CSE-ConnectionGUID: pZZ13Mj+TDqV8Gs/7yExlA==
X-CSE-MsgGUID: RfZcwfpiTzSibRHA+5TiDQ==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="1903318"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:59 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:4257]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.23.240:2525] with esmtp (Farcaster)
 id 0791345b-5f96-4e3a-80ef-d080c8c5816b; Fri, 12 Sep 2025 09:17:59 +0000 (UTC)
X-Farcaster-Flow-ID: 0791345b-5f96-4e3a-80ef-d080c8c5816b
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:48 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB004.ant.amazon.com (10.252.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:47 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:47 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 11/11] KVM: selftests: Test guest execution from direct map
 removed gmem
Thread-Topic: [PATCH v6 11/11] KVM: selftests: Test guest execution from
 direct map removed gmem
Thread-Index: AQHcI8YabQ9AygaqQUCaf6AaD/P8kg==
Date: Fri, 12 Sep 2025 09:17:47 +0000
Message-ID: <20250912091708.17502-12-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101810_178536_058C1894 
X-CRM114-Status: GOOD (  10.50  )
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

Add a selftest that loads itself into guest_memfd (via
GUEST_MEMFD_FLAG_MMAP) and triggers an MMIO exit when executed. This
exercises x86 MMIO emulation code inside KVM for guest_memfd-backed
memslots where the guest_memfd folios are direct map removed.
Particularly, it validates that x86 MMIO emulation code (guest page
table walks + instruction fetch) correctly accesses gmem through the VMA
that's been reflected into the memslot's userspace_addr field (instead
of trying to do direct map accesses).

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 .../selftests/kvm/set_memory_region_test.c    | 50 +++++++++++++++++--
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index ce3ac0fd6dfb..cb3bc642d376 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -603,6 +603,41 @@ static void test_mmio_during_vectoring(void)
 
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
@@ -626,10 +661,17 @@ int main(int argc, char *argv[])
 	test_add_max_memory_regions();
 
 #ifdef __x86_64__
-	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
-	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
-		test_add_private_memory_region();
-		test_add_overlapping_private_memory_regions();
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD)) {
+		if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM)) {
+			test_add_private_memory_region();
+			test_add_overlapping_private_memory_regions();
+		}
+
+		if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_MMAP) &&
+			kvm_has_cap(KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP))
+			test_guest_memfd_mmio();
+		else
+			pr_info("Skipping tests requiring KVM_CAP_GUEST_MEMFD_MMAP | KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP");
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
