Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B20D37E37
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5vwphSbgb9GtOZsqsXdpnfDeEUP47JX2VFwsgnLiPo=; b=bB+wyBSNYWtHLT
	JeoBJqCfvB+riXk6OeLXUVLjJ4+jj9cmBk1IoLSyYKpVnmJRH+hV2NN3ytys+r91EZ5DpL2bjjNnl
	2TITuO6xxWr30Eh/N/JfGoItK48InCwt726IV9U2uF2fwoki6qn9EgJ6r8G15gkAqqAH4CVNN+UeK
	2b8uUf/hFhTKFDMprtS62+MC6euiiLggfsD66xuAlKpmogwuPmRFwbBYiExaIJ4I7kYZqkbhPf8Rk
	hc96gho6PJou3O9WkCKhQFVQ/ZgbLmt7LA3XQOxmT5jlZXt65xRrtaWvsOsogRZtwdhFd9f6wFdRJ
	1TmQTF02ALDw7j12POJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Bt-00000009N7n-016T;
	Wed, 14 Jan 2026 13:45:41 +0000
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Bn-00000009N6V-0UNF;
	Wed, 14 Jan 2026 13:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398335; x=1799934335;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=C5qlMH/wtsmcLk6SljUNTD3DCGuIp1OApZnkGozlYCk=;
  b=hEsxdcaorFeDpWcIKyRGxpV/0bJ4MmvYlsKVi64330ZwwPHIIinQuSDD
   MhzEVTqcSlllc34FJLvGWqX4CZr/m/1Yvq5MXGCoPkVjEb3Em2NhKjaLQ
   rCIh4X6OdKE6tfmPkgQYudbvJhP8qOztBBtzyD5q7xPaiJcHxpWanSD1H
   Q3byibNGlYGCYlGHRhwjvdiZvop9D5ODVtrf+Nc97OPOFpJ2F110HPxvI
   6Uu2paeVwWgNTOepW307Y/Cvx9qD9jcjkvu0wST5cW5DB1YpwqRVYxq3b
   sZS4avc3MNMNsK5dTEfFKY4tOpdAyIq3wcpk/eRoW0/2oJ3Pz2p2lLnaw
   g==;
X-CSE-ConnectionGUID: cAS/p1IlQ+6brG6UAGBozA==
X-CSE-MsgGUID: 6cYb4iAZQq6KhV7Q0e9uwA==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7898964"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:45:13 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:25244]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.2.33:2525] with esmtp (Farcaster)
 id 4d53a730-c517-4321-8200-fcfe21696f25; Wed, 14 Jan 2026 13:45:13 +0000 (UTC)
X-Farcaster-Flow-ID: 4d53a730-c517-4321-8200-fcfe21696f25
Received: from EX19D005EUB004.ant.amazon.com (10.252.51.126) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:12 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB004.ant.amazon.com (10.252.51.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:12 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:45:12 +0000
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
Subject: [PATCH v9 00/13] Direct Map Removal Support for guest_memfd
Thread-Topic: [PATCH v9 00/13] Direct Map Removal Support for guest_memfd
Thread-Index: AQHchVwBJodCfIOOzk6JfArIPtu1ug==
Date: Wed, 14 Jan 2026 13:45:12 +0000
Message-ID: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_054536_475497_A5DECDBD 
X-CRM114-Status: GOOD (  11.86  )
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

Unmapping virtual machine guest memory from the host kernel's direct map
is a successful mitigation against Spectre-style transient execution
issues: if the kernel page tables do not contain entries pointing to
guest memory, then any attempted speculative read through the direct map
will necessarily be blocked by the MMU before any observable
microarchitectural side-effects happen.  This means that Spectre-gadgets
and similar cannot be used to target virtual machine memory.  Roughly
60% of speculative execution issues fall into this category [1, Table
1].

This patch series extends guest_memfd with the ability to remove its
memory from the host kernel's direct map, to be able to attain the above
protection for KVM guests running inside guest_memfd.

Additionally, a Firecracker branch with support for these VMs can be
found on GitHub [2].

For more details, please refer to the v5 cover letter.  No substantial
changes in design have taken place since.

See also related write() syscall support in guest_memfd [3] where
the interoperation between the two features is described.

Changes since v8:
 - Dave: create new helpers for direct map manipulations
   (folio_{zap,restore}_direct_map()) instead of using
   set_direct_map_valid_noflush() to abstract TLB flush logic
 - Dave: add WARN_ON_ONCE on the error when restoring direct map
 - John: separate patch for dropping secretmem optimisation in
   gup_fast_folio_allowed()
 - Vlastimil: add missing clearing of the flag when restoring direct map
 - Reorder patches to keep the kernel compilable in between

v8: https://lore.kernel.org/kvm/20251205165743.9341-1-kalyazin@amazon.com
v7: https://lore.kernel.org/kvm/20250924151101.2225820-1-patrick.roy@campus.lmu.de
v6: https://lore.kernel.org/kvm/20250912091708.17502-1-roypat@amazon.co.uk
v5: https://lore.kernel.org/kvm/20250828093902.2719-1-roypat@amazon.co.uk
v4: https://lore.kernel.org/kvm/20250221160728.1584559-1-roypat@amazon.co.uk
RFCv3: https://lore.kernel.org/kvm/20241030134912.515725-1-roypat@amazon.co.uk
RFCv2: https://lore.kernel.org/kvm/20240910163038.1298452-1-roypat@amazon.co.uk
RFCv1: https://lore.kernel.org/kvm/20240709132041.3625501-1-roypat@amazon.co.uk

[1] https://download.vusec.net/papers/quarantine_raid23.pdf
[2] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[3] https://lore.kernel.org/kvm/20251114151828.98165-1-kalyazin@amazon.com

Nikita Kalyazin (1):
  set_memory: add folio_{zap,restore}_direct_map helpers

Patrick Roy (12):
  mm/gup: drop secretmem optimization from gup_fast_folio_allowed
  mm: introduce AS_NO_DIRECT_MAP
  KVM: guest_memfd: Add stub for kvm_arch_gmem_invalidate
  KVM: x86: define kvm_arch_gmem_supports_no_direct_map()
  KVM: arm64: define kvm_arch_gmem_supports_no_direct_map()
  KVM: guest_memfd: Add flag to remove from direct map
  KVM: selftests: load elf via bounce buffer
  KVM: selftests: set KVM_MEM_GUEST_MEMFD in vm_mem_add() if guest_memfd
    != -1
  KVM: selftests: Add guest_memfd based vm_mem_backing_src_types
  KVM: selftests: cover GUEST_MEMFD_FLAG_NO_DIRECT_MAP in existing
    selftests
  KVM: selftests: stuff vm_mem_backing_src_type into vm_shape
  KVM: selftests: Test guest execution from direct map removed gmem

 Documentation/virt/kvm/api.rst                | 22 ++++---
 arch/arm64/include/asm/kvm_host.h             | 13 ++++
 arch/arm64/include/asm/set_memory.h           |  2 +
 arch/arm64/mm/pageattr.c                      | 12 ++++
 arch/loongarch/include/asm/set_memory.h       |  2 +
 arch/loongarch/mm/pageattr.c                  | 16 +++++
 arch/riscv/include/asm/set_memory.h           |  2 +
 arch/riscv/mm/pageattr.c                      | 16 +++++
 arch/s390/include/asm/set_memory.h            |  2 +
 arch/s390/mm/pageattr.c                       | 18 ++++++
 arch/x86/include/asm/kvm_host.h               |  9 +++
 arch/x86/include/asm/set_memory.h             |  2 +
 arch/x86/mm/pat/set_memory.c                  | 20 +++++++
 include/linux/kvm_host.h                      | 14 +++++
 include/linux/pagemap.h                       | 16 +++++
 include/linux/secretmem.h                     | 18 ------
 include/linux/set_memory.h                    | 10 ++++
 include/uapi/linux/kvm.h                      |  1 +
 lib/buildid.c                                 |  4 +-
 mm/gup.c                                      | 19 ++----
 mm/mlock.c                                    |  2 +-
 mm/secretmem.c                                |  8 +--
 .../testing/selftests/kvm/guest_memfd_test.c  | 17 +++++-
 .../testing/selftests/kvm/include/kvm_util.h  | 37 +++++++++---
 .../testing/selftests/kvm/include/test_util.h |  8 +++
 tools/testing/selftests/kvm/lib/elf.c         |  8 +--
 tools/testing/selftests/kvm/lib/io.c          | 23 ++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 59 +++++++++++--------
 tools/testing/selftests/kvm/lib/test_util.c   |  8 +++
 tools/testing/selftests/kvm/lib/x86/sev.c     |  1 +
 .../selftests/kvm/pre_fault_memory_test.c     |  1 +
 .../selftests/kvm/set_memory_region_test.c    | 52 ++++++++++++++--
 .../kvm/x86/private_mem_conversions_test.c    |  7 ++-
 virt/kvm/guest_memfd.c                        | 58 ++++++++++++++++--
 34 files changed, 406 insertions(+), 101 deletions(-)


base-commit: 0499add8efd72456514c6218c062911ccc922a99
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
