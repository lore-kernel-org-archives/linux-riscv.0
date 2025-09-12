Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACE8CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LUc86f8GMrGFaVDIBOyiywpGPPXl2kwC6B5Rcp3QOg=; b=Fub3OecI1AA0AM
	t6A+xnHruLg3mJPWKc7ab3HWtYNcvXJ3w06Ip+26EmwClmwXZE2uuxWxcW6hNvMyfIFgQHG1z8v6+
	t4tcEJnwnm9B+ZuhZNzzmzmmVsG3Ovymz5scqzLWzxM3rhK5maEWpCbsOw2wNab4K07eryCODOIA+
	k1/C57j09JTLX2oGaw9WCUEl7UNPpATl20NdL8+e9bCdnk9msIuDcRX5OobQQld8wT9S0TwGtQ+zG
	pcFbFVG0g4vUYMiOyW9AE8wCmwq5N/H9YKmcIQ17UFvlvciAsbZ1u5sEbDuxNl0Tb1In/boxjgAD/
	3QVmfi8ZooLYIO2ECFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzus-00000008C6E-4Byj;
	Fri, 12 Sep 2025 09:18:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuq-00000008C33-3zJL;
	Fri, 12 Sep 2025 09:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-ID:Date:Subject:CC:From:Sender:Reply-To:To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=euX1DcBgIQsakeQD0gmDCocpRR5IiK5IHce/Exk3Qcs=; b=og0l4XGjSZncS2FYCcwhw/XSx4
	Dwoo3qjNcCQJpoHy5cz9+eLjzf1oSuOCdjkCPOQWUjPOA2tYBmbJUo+FJfGJhrUhl6VDoU0hcrHvz
	OEOTdB+SmT243F3OU9Ni/v94aqWbz6zCmMo7aRbn6RF6iio1jPbmarrgSWOf/ZQnjDZDaVrtJuDNh
	IoohrmW595sat/6qUW7xlEHEO1yA8BbNrD4nDIHAVtZo6WSAhY7BoC4mh6WBzZ3qzmTuK4uWHWCxN
	ekl0qybx8worq50RAH5uSTmZJJfz2Bky4EJXVK3lvfiKgTj9TPlijHMOJtLel7ojpM4vUECXdLH32
	ckG0zyZQ==;
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzum-00000006HSF-04hu;
	Fri, 12 Sep 2025 09:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668676; x=1789204676;
  h=from:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=euX1DcBgIQsakeQD0gmDCocpRR5IiK5IHce/Exk3Qcs=;
  b=PVi+bA38xVB5Dur10EmpSywjBsf/vLyXPIANZb2LO3jCCTlzbUek6GrK
   S6GFedwW+vpRqp3OvCtGnsy2U+/I9xAKneBndMhO+2OHHnyCpdvRCNax9
   bxLOCM0lGndFHuxsve0/EHoozdHMUulpcGQndnLGZ1bm0DEVJKVobW/ik
   kmLXKJebeP2p9bG8qJdhqcWJj4reT91gJEHNmglRi/hT4Vm9JRuunll5T
   Cx2DvRKIsU20NYLjq3+z9RgTqweOI+2HBU7pi9akzI0LB3AKkXQaAKcN0
   0WDowBxvu4fZDSm4E4IU4FG8ohKq24CIv5wNniTddjriiSKD5LDa45V9c
   Q==;
X-CSE-ConnectionGUID: din/RBPeSnGfqj64mcO16Q==
X-CSE-MsgGUID: h+u6Z7AnQzWKlyQKajwbGQ==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2004929"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:30 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:6055]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.45.248:2525] with esmtp (Farcaster)
 id 353fed0d-37b0-4710-853f-25025dd2cbc0; Fri, 12 Sep 2025 09:17:30 +0000 (UTC)
X-Farcaster-Flow-ID: 353fed0d-37b0-4710-853f-25025dd2cbc0
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:29 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB004.ant.amazon.com (10.252.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:29 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:29 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 00/11] Direct Map Removal Support for guest_memfd
Thread-Topic: [PATCH v6 00/11] Direct Map Removal Support for guest_memfd
Thread-Index: AQHcI8YPHCplp86cBE2LweCaK1PIkA==
Date: Fri, 12 Sep 2025 09:17:29 +0000
Message-ID: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101756_328485_6F5202A2 
X-CRM114-Status: GOOD (  10.12  )
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

[ based on kvm/next ]

Unmapping virtual machine guest memory from the host kernel's direct map is a
successful mitigation against Spectre-style transient execution issues: If the
kernel page tables do not contain entries pointing to guest memory, then any
attempted speculative read through the direct map will necessarily be blocked
by the MMU before any observable microarchitectural side-effects happen. This
means that Spectre-gadgets and similar cannot be used to target virtual machine
memory. Roughly 60% of speculative execution issues fall into this category [1,
Table 1].

This patch series extends guest_memfd with the ability to remove its memory
from the host kernel's direct map, to be able to attain the above protection
for KVM guests running inside guest_memfd.

Additionally, a Firecracker branch with support for these VMs can be found on
GitHub [2].

For more details, please refer to the v5 cover letter [v5]. No
substantial changes in design have taken place since.

=== Changes Since v5 === 

- Fix up error handling for set_direct_map_[in]valid_noflush() (Mike)
- Fix capability check for KVM_GUEST_MEMFD_NO_DIRECT_MAP (Mike)
- Make secretmem_aops static in mm/secretmem.c (Mike)
- Fixup some more comments in gup.c that referred to secretmem
  specifically to instead point to AS_NO_DIRECT_MAP (Mike)
- New patch (PATCH 4/11) to avoid ifdeffery in kvm_gmem_free_folio() (Mike)
- vma_is_no_direct_map() -> vma_has_no_direct_map() rename (David)
- Squash some patches (David)
- Fix up const-ness of parameters to new functions in pagemap.h (Fuad)

[1]: https://download.vusec.net/papers/quarantine_raid23.pdf
[2]: https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[RFCv1]: https://lore.kernel.org/kvm/20240709132041.3625501-1-roypat@amazon.co.uk/
[RFCv2]: https://lore.kernel.org/kvm/20240910163038.1298452-1-roypat@amazon.co.uk/
[RFCv3]: https://lore.kernel.org/kvm/20241030134912.515725-1-roypat@amazon.co.uk/
[v4]: https://lore.kernel.org/kvm/20250221160728.1584559-1-roypat@amazon.co.uk/
[v5]: https://lore.kernel.org/kvm/20250828093902.2719-1-roypat@amazon.co.uk/

Elliot Berman (1):
  filemap: Pass address_space mapping to ->free_folio()

Patrick Roy (10):
  arch: export set_direct_map_valid_noflush to KVM module
  mm: introduce AS_NO_DIRECT_MAP
  KVM: guest_memfd: Add stub for kvm_arch_gmem_invalidate
  KVM: guest_memfd: Add flag to remove from direct map
  KVM: selftests: load elf via bounce buffer
  KVM: selftests: set KVM_MEM_GUEST_MEMFD in vm_mem_add() if guest_memfd
    != -1
  KVM: selftests: Add guest_memfd based vm_mem_backing_src_types
  KVM: selftests: stuff vm_mem_backing_src_type into vm_shape
  KVM: selftests: cover GUEST_MEMFD_FLAG_NO_DIRECT_MAP in existing
    selftests
  KVM: selftests: Test guest execution from direct map removed gmem

 Documentation/filesystems/locking.rst         |  2 +-
 Documentation/virt/kvm/api.rst                |  5 ++
 arch/arm64/include/asm/kvm_host.h             | 12 ++++
 arch/arm64/mm/pageattr.c                      |  1 +
 arch/loongarch/mm/pageattr.c                  |  1 +
 arch/riscv/mm/pageattr.c                      |  1 +
 arch/s390/mm/pageattr.c                       |  1 +
 arch/x86/mm/pat/set_memory.c                  |  1 +
 fs/nfs/dir.c                                  | 11 ++--
 fs/orangefs/inode.c                           |  3 +-
 include/linux/fs.h                            |  2 +-
 include/linux/kvm_host.h                      |  9 +++
 include/linux/pagemap.h                       | 16 +++++
 include/linux/secretmem.h                     | 18 ------
 include/uapi/linux/kvm.h                      |  2 +
 lib/buildid.c                                 |  4 +-
 mm/filemap.c                                  |  9 +--
 mm/gup.c                                      | 19 ++----
 mm/mlock.c                                    |  2 +-
 mm/secretmem.c                                | 11 ++--
 mm/vmscan.c                                   |  4 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +
 .../testing/selftests/kvm/include/kvm_util.h  | 37 ++++++++---
 .../testing/selftests/kvm/include/test_util.h |  8 +++
 tools/testing/selftests/kvm/lib/elf.c         |  8 +--
 tools/testing/selftests/kvm/lib/io.c          | 23 +++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 61 +++++++++++--------
 tools/testing/selftests/kvm/lib/test_util.c   |  8 +++
 tools/testing/selftests/kvm/lib/x86/sev.c     |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     |  1 +
 .../selftests/kvm/set_memory_region_test.c    | 50 +++++++++++++--
 .../kvm/x86/private_mem_conversions_test.c    |  7 ++-
 virt/kvm/guest_memfd.c                        | 56 ++++++++++++++---
 virt/kvm/kvm_main.c                           |  5 ++
 34 files changed, 288 insertions(+), 113 deletions(-)


base-commit: a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
