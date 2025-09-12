Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E7CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pN2iVA/egWZrOqZqfo3Cbn8vJ3A1B60a6wCO+pazbAk=; b=hwpfyW1igZIm6z
	HJtDjuGF5SfcEymRMlZd+Felr6j4dX798I8Mtme/zgvNrgDOWFRzkK3PDSR7CnxZ6ULJdByT7C/Zc
	aDC3XTKF+HMZBhVHv4dmOYfwMoAYKfz/uMP6mYRhbjVthKLIHlAIey9pEgN3GjkcNRGGpMqiIO0oE
	FIP6RdeEnm0T0UFgL8HTgvsMfALx8/V0zjrV3AdQNV49h6Qe3ugDdwda5RMjzKiltAjCUhuPKcZkv
	3A+gY+eT8wEsVaQ5Zlh7dCRshLo6YyYCevwLzPNUNe0y27hT/g6TQqbVWQjuLpKnCOq00f5Zr4q1i
	6SJv9kxOE2RHNmidgP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzum-00000008Byu-0OlZ;
	Fri, 12 Sep 2025 09:17:56 +0000
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzui-00000008Bvt-3h4E;
	Fri, 12 Sep 2025 09:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668672; x=1789204672;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nAXTWOycHUS9oQq/r+tGcFhviHWk3dwfE1BhY62JZQI=;
  b=eE5fOLNMqBcB7QXVPGcGbvgtdG8miCs1CFKWMj1hmyXFriK/ciV/7g9j
   HRFgxxnvHQZwpFdhe3xIJMlzd0csIPaPVi45enuKdYpD0SDclVnGFs3oM
   cg7lNMvMrh5bRrCrSOCBMR4PBKwUFCShkOnEgvHwtu/Q6RzNRxDJEpO4F
   Anp4o3i83Qsgmo28KNZzYh0dRTn0NFLPsK4nHMMaX09P+Kruq0LIIVT/e
   BaFeUiu5VteA8Dkp3XEBG+OETrkEVulRSYnqrotvWyYxB3f16X3zFeu24
   pWX1HkyfVyjOovJfOucDcpG9nE19LCZ8IKEDQPrLxtYJW7l5AuwZ24wYo
   Q==;
X-CSE-ConnectionGUID: j4Efto7WShqD4fI79HucAg==
X-CSE-MsgGUID: 6DNTX8jxTMubfNopILf8Eg==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2004634"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:34 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:6318]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.11.107:2525] with esmtp (Farcaster)
 id a91e1d85-e397-46af-94b1-48a53ba9e43e; Fri, 12 Sep 2025 09:17:34 +0000 (UTC)
X-Farcaster-Flow-ID: a91e1d85-e397-46af-94b1-48a53ba9e43e
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:33 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:33 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:33 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "Fuad Tabba" <tabba@google.com>
Subject: [PATCH v6 02/11] arch: export set_direct_map_valid_noflush to KVM
 module
Thread-Topic: [PATCH v6 02/11] arch: export set_direct_map_valid_noflush to
 KVM module
Thread-Index: AQHcI8YSgiTpMeKXGkS2hhvLGeEJDA==
Date: Fri, 12 Sep 2025 09:17:32 +0000
Message-ID: <20250912091708.17502-3-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021753_071933_F82FEAD2 
X-CRM114-Status: UNSURE (   7.14  )
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

Use the new per-module export functionality to allow KVM (and only KVM)
access to set_direct_map_valid_noflush(). This allows guest_memfd to
remove its memory from the direct map, even if KVM is built as a module.

Direct map removal gives guest_memfd the same protection that
memfd_secret enjoys, such as hardening against Spectre-like attacks
through in-kernel gadgets.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 arch/arm64/mm/pageattr.c     | 1 +
 arch/loongarch/mm/pageattr.c | 1 +
 arch/riscv/mm/pageattr.c     | 1 +
 arch/s390/mm/pageattr.c      | 1 +
 arch/x86/mm/pat/set_memory.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..4f3cddfab9b0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -291,6 +291,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return set_memory_valid(addr, nr, valid);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index f5e910b68229..458f5ae6a89b 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -236,3 +236,4 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory(addr, 1, set, clear);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..6db31040cd66 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -400,6 +400,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory((unsigned long)page_address(page), nr, set, clear);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 348e759840e7..8ffd9ef09bc6 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -413,6 +413,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 bool kernel_page_present(struct page *page)
 {
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8834c76f91c9..87e9c7d2dcdc 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2661,6 +2661,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_pages_np(page, nr);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
