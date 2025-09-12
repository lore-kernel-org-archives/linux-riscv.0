Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DE9CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2kJJpLLkxXDpZTW+4UCRtMs1iKIWoPq8y7rDjXzhDY=; b=G201zZA7eKEmJA
	GRsZam9JcKo6sUp9gXlfI1UCRQamnEDL8vwxUJky8oBlj0hJ7+WYvtYqqLMFDq6+wLUfgUyBByMFS
	C0bGIO57It8nvplbSsb/Ffp6I7szao2xL63LGwZopTEkAbr+JfUXtdK2t1ol90SBUJUaYd+iE2yC7
	ojLUzDmmAVZSqUPlFnP/MdL+YPkpomF0pJvYnNSN/joDzqxO6xwAYZ1NICNIbHUDM1AvwefhjotjC
	nMlS1HSkoySgnGm81KorcbayENcAvyQvLrU4kYl6WzVj3RZSVjnh0daBENqChNnkRfcBMvCrUtgqc
	lsTPvQtmk/fHV7pw48fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzus-00000008C5Q-2oKZ;
	Fri, 12 Sep 2025 09:18:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuq-00000008C2v-3eJf;
	Fri, 12 Sep 2025 09:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=dhEedpfYEt1PcCJtARYDpqAPZgRl3DEDExfgwDPiBsk=; b=D80dQwtfYv3U1xeV+VE5kKqT/v
	GO++1cKeK/LU7fkRz7YmKRZkYA9ISZVEnzUbZtTIBoiP8nM7hssFsuNqo1CURG7ZDosCOrWZFBQMO
	28PldBR3UN/9nTuoZSdw/v0WAyDZYYMkLEs1Rj2f1wuaN0SopCYHiqv/2TA6K1n6y7B47E4I/0TOq
	urGvpRphk4xLuujj+p8cpZxQYw5Nr0+YpuMQnIntSGd1YU1y7/ua8Si5h2TPv368HRBDPN8m4AOIf
	p8aocKcVYWgLsoOHQHKuV52uOA+mLzwTdk6Yn/Rudv7fC0PFtwzrKJs+DSl0o+5AIBPZ5JrTIwODp
	iF8zegMA==;
Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.132.221])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzul-00000006HRS-2jec;
	Fri, 12 Sep 2025 09:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668675; x=1789204675;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dhEedpfYEt1PcCJtARYDpqAPZgRl3DEDExfgwDPiBsk=;
  b=VL9Q4bn1+HaNi1dbo7b/60kABpGmY4WyR5bfd/DVAaDf1+9lpomJOmTx
   msMJky23D673XfcPePC8fO0vic34g/2FN8fBS7YL2dSXbzzH4Y/jp/Qlm
   q5XlMeAqU5OPH83FzZdrgko43uosQLEpRHyidxkMonpFNAZTjmMsHbP6P
   XPm4Vqdx/6kNh1OW6Ok1flkcosElNbqbeo/KLbN6QS22g6VIIrI0ZzWEo
   1FHka7dqwXekIT4JZKoS1+BvnnXt41K2ar6A5eE1BpKtLKt1vi6Kjv2Im
   orwYV2Ox+XRAoNA+1YHta08VprvFLMdvGHbREtzsYgToWOHCb26E2/QXv
   w==;
X-CSE-ConnectionGUID: W6I7DBGsT7aIZUgxxd8n6A==
X-CSE-MsgGUID: biCfRrtRTymbPzXlG7U+9Q==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="1905409"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:42 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:21541]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.45.248:2525] with esmtp (Farcaster)
 id 472e2554-8a6f-4381-b8b5-7eb2482469c1; Fri, 12 Sep 2025 09:17:42 +0000 (UTC)
X-Farcaster-Flow-ID: 472e2554-8a6f-4381-b8b5-7eb2482469c1
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:42 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB004.ant.amazon.com (10.252.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:41 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:41 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 07/11] KVM: selftests: set KVM_MEM_GUEST_MEMFD in
 vm_mem_add() if guest_memfd != -1
Thread-Topic: [PATCH v6 07/11] KVM: selftests: set KVM_MEM_GUEST_MEMFD in
 vm_mem_add() if guest_memfd != -1
Thread-Index: AQHcI8YXZeuO05bOzUOx1mmYQcKn6g==
Date: Fri, 12 Sep 2025 09:17:41 +0000
Message-ID: <20250912091708.17502-8-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101755_949264_8AB569CC 
X-CRM114-Status: GOOD (  12.87  )
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

Have vm_mem_add() always set KVM_MEM_GUEST_MEMFD in the memslot flags if
a guest_memfd is passed in as an argument. This eliminates the
possibility where a guest_memfd instance is passed to vm_mem_add(), but
it ends up being ignored because the flags argument does not specify
KVM_MEM_GUEST_MEMFD at the same time.

This makes it easy to support more scenarios in which no vm_mem_add() is
not passed a guest_memfd instance, but is expected to allocate one.
Currently, this only happens if guest_memfd == -1 but flags &
KVM_MEM_GUEST_MEMFD != 0, but later vm_mem_add() will gain support for
loading the test code itself into guest_memfd (via
GUEST_MEMFD_FLAG_MMAP) if requested via a special
vm_mem_backing_src_type, at which point having to make sure the src_type
and flags are in-sync becomes cumbersome.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c3f5142b0a54..cc67dfecbf65 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1107,22 +1107,26 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 
 	region->backing_src_type = src_type;
 
-	if (flags & KVM_MEM_GUEST_MEMFD) {
-		if (guest_memfd < 0) {
+	if (guest_memfd < 0) {
+		if (flags & KVM_MEM_GUEST_MEMFD) {
 			uint32_t guest_memfd_flags = 0;
 			TEST_ASSERT(!guest_memfd_offset,
 				    "Offset must be zero when creating new guest_memfd");
 			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
-		} else {
-			/*
-			 * Install a unique fd for each memslot so that the fd
-			 * can be closed when the region is deleted without
-			 * needing to track if the fd is owned by the framework
-			 * or by the caller.
-			 */
-			guest_memfd = dup(guest_memfd);
-			TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
 		}
+	} else {
+		/*
+		 * Install a unique fd for each memslot so that the fd
+		 * can be closed when the region is deleted without
+		 * needing to track if the fd is owned by the framework
+		 * or by the caller.
+		 */
+		guest_memfd = dup(guest_memfd);
+		TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
+	}
+
+	if (guest_memfd > 0) {
+		flags |= KVM_MEM_GUEST_MEMFD;
 
 		region->region.guest_memfd = guest_memfd;
 		region->region.guest_memfd_offset = guest_memfd_offset;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
