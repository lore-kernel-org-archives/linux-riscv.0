Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BADD37E3A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpBerJXCV8qJWZ9IrovOaUOSjLeM0l2stfVYoPXKyIo=; b=RErk9R5RLFFtTT
	wlkFDHnp70D0T98rB6+dZroi6vyX7HT8ZJvXuvz+AGWNlxffP6ony2tmJb8+MtDXPN+RYYjobuHwe
	CrNjHsJR9LlJa+93tm5tCsX52vd6ZjEnpG1N9RpAfemFVKtPdGpgqENXE6pk3aStFi35eD3fPRR2N
	SnyMgz/YQ87QnbM9nsVwOCyEmf+Qc8+FJEx7autungQQkD4aIQIonu8stUO9ofJDh6yT0J+6R7+lK
	VXLsf4Rv56SeM9+WBGez31Jiw3EiE7KFuvVgIndTTuLfuOy2DntNEWpdbxTpHl47bFzIrZeBo5cQM
	86viwhNfn+IZBSK1jMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1C0-00000009NAb-2gce;
	Wed, 14 Jan 2026 13:45:48 +0000
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Bx-00000009N8s-0Lkm;
	Wed, 14 Jan 2026 13:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398345; x=1799934345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DwK9FSlwBQuU4XKtXrxQXwU9sl3B3N2UH+rK7uUp150=;
  b=iKQhlnoRjNcRwH8nS2nOSi7HafiZPyY0qosG6lNYWEnG43qzMf3Cagll
   0DsovsOYE6i9cl1ix3ZQ4RCo5qx1GSmFsmglIdXruHIrppQbmiSLZOFij
   awtm/Koyllp1380s9Z9zhOB5kp7PQWBK2vq4evuR0hE8ZJKvg449j9qND
   0k0muLQYef9XjoiYteR97UNMLAkEb8WGbhfnp9yqhu0UAG4dTctDXTg0C
   Jx05jvphn3bBDg3N7daAmJFodEsNTbDoghTbczN49+8JifN/yrlE0Fq+a
   LmVIOK8PW5pEQND3dLehZnZkiWLDlQk6/bwmNK+jTv7TUP2cxQKDUuc0b
   w==;
X-CSE-ConnectionGUID: ADRkyAvURkCXCw3a2Bdf2g==
X-CSE-MsgGUID: EjV5CGptQgi+UwaC8hUurA==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7586296"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:45:25 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.232:28749]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.28.56:2525] with esmtp (Farcaster)
 id 5afb6478-7936-4852-84d5-bdcc3b7d5c5a; Wed, 14 Jan 2026 13:45:25 +0000 (UTC)
X-Farcaster-Flow-ID: 5afb6478-7936-4852-84d5-bdcc3b7d5c5a
Received: from EX19D005EUB001.ant.amazon.com (10.252.51.12) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:24 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB001.ant.amazon.com (10.252.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:23 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:45:23 +0000
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
Subject: [PATCH v9 01/13] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Topic: [PATCH v9 01/13] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Index: AQHchVwI418o+7jue0CuccMT4sV6lg==
Date: Wed, 14 Jan 2026 13:45:23 +0000
Message-ID: <20260114134510.1835-2-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_054545_554131_8D013C7E 
X-CRM114-Status: GOOD (  10.27  )
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

From: Nikita Kalyazin <kalyazin@amazon.com>

These allow guest_memfd to remove its memory from the direct map.
Only implement them for architectures that have direct map.
In folio_zap_direct_map(), flush TLB on architectures where
set_direct_map_valid_noflush() does not flush it internally.

The new helpers need to be accessible to KVM on architectures that
support guest_memfd (x86 and arm64).  Since arm64 does not support
building KVM as a module, only export them on x86.

Direct map removal gives guest_memfd the same protection that
memfd_secret does, such as hardening against Spectre-like attacks
through in-kernel gadgets.

Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 arch/arm64/include/asm/set_memory.h     |  2 ++
 arch/arm64/mm/pageattr.c                | 12 ++++++++++++
 arch/loongarch/include/asm/set_memory.h |  2 ++
 arch/loongarch/mm/pageattr.c            | 16 ++++++++++++++++
 arch/riscv/include/asm/set_memory.h     |  2 ++
 arch/riscv/mm/pageattr.c                | 16 ++++++++++++++++
 arch/s390/include/asm/set_memory.h      |  2 ++
 arch/s390/mm/pageattr.c                 | 18 ++++++++++++++++++
 arch/x86/include/asm/set_memory.h       |  2 ++
 arch/x86/mm/pat/set_memory.c            | 20 ++++++++++++++++++++
 include/linux/set_memory.h              | 10 ++++++++++
 11 files changed, 102 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..d949f1deb701 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index f0e784b963e6..a94eff324dda 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -357,6 +357,18 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return set_memory_valid(addr, nr, valid);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), false);
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), true);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
index 55dfaefd02c8..9bc80ac420a9 100644
--- a/arch/loongarch/include/asm/set_memory.h
+++ b/arch/loongarch/include/asm/set_memory.h
@@ -18,5 +18,7 @@ bool kernel_page_present(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 
 #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index f5e910b68229..14bd322dd112 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -236,3 +236,19 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory(addr, 1, set, clear);
 }
+
+int folio_zap_direct_map(struct folio *folio)
+{
+	int ret;
+
+	ret = set_direct_map_valid_noflush(folio_page(folio, 0),
+					   folio_nr_pages(folio), false);
+
+	return ret;
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), true);
+}
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 87389e93325a..16557b70c830 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -43,6 +43,8 @@ static inline int set_kernel_memory(char *startp, char *endp,
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..2c218868114b 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -401,6 +401,22 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_memory((unsigned long)page_address(page), nr, set, clear);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	int ret;
+
+	ret = set_direct_map_valid_noflush(folio_page(folio, 0),
+					   folio_nr_pages(folio), false);
+
+	return ret;
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), true);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
 {
diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/set_memory.h
index 94092f4ae764..fc73652e5715 100644
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@ -63,6 +63,8 @@ __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 #endif
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index d3ce04a4b248..df4a487b484d 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -412,6 +412,24 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+	int ret;
+
+	ret = set_direct_map_valid_noflush(folio_page(folio, 0),
+					   folio_nr_pages(folio), false);
+	flush_tlb_kernel_range(addr, addr + folio_size(folio));
+
+	return ret;
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), true);
+}
+
 bool kernel_page_present(struct page *page)
 {
 	unsigned long addr;
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 61f56cdaccb5..7208af609121 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -90,6 +90,8 @@ int set_pages_rw(struct page *page, int numpages);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 6c6eb486f7a6..3f0fc30eb320 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2656,6 +2656,26 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_pages_np(page, nr);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+	int ret;
+
+	ret = set_direct_map_valid_noflush(folio_page(folio, 0),
+					   folio_nr_pages(folio), false);
+	flush_tlb_kernel_range(addr, addr + folio_size(folio));
+
+	return ret;
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_zap_direct_map, "kvm");
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_page(folio, 0),
+					    folio_nr_pages(folio), true);
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_restore_direct_map, "kvm");
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..8d1c8a7f7d79 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -40,6 +40,16 @@ static inline int set_direct_map_valid_noflush(struct page *page,
 	return 0;
 }
 
+static inline int folio_zap_direct_map(struct folio *folio)
+{
+	return 0;
+}
+
+static inline int folio_restore_direct_map(struct folio *folio)
+{
+	return 0;
+}
+
 static inline bool kernel_page_present(struct page *page)
 {
 	return true;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
