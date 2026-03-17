Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2882210775E8
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leoBWO3q3//8Ic++iEQD9kc1AACpmiz6QUN7O5G8SvU=; b=0+WOqgS+vA+Ncg
	S5TULwjz/y4optA+5uIqRjkRwLaifaEwa7jo4nNOR9MU1sgjy8kqVt3x+FlSp3emk3Mz68A+gdJiG
	6CvkCwa1vNU8jo3mfXJV0RMZujVkaoNgG9EmaD2BlJ6SPtc4nBVBZu6Nq+gQ2IXeyEB59qQeh1WCL
	UmGVSL/1sbGm2+uKelQqOGNVcW0WoNSqtXzRi+415xB4XUcQy/0a3y4hOreO55pHJynTuyXlrmHMU
	lK9FClGM7fljk4hnp/PqgLxm64i1n1C01IVZfmCpWnhA1rrfDArwTll+Gb5vrflXLPIgNB8uLyGGz
	HR6QqnaDnXP4Ci/0xdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkk-00000008vMS-0qIv;
	Wed, 18 Mar 2026 16:28:14 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V8K-00000006WcB-1cKF;
	Tue, 17 Mar 2026 14:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1773756656; x=1805292656;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YT+RN7R7BxgHS+s1x91TyyjwNFc2MVFokFMzhgUvxKw=;
  b=rUbY/HUZXlVLzmCkCWW4rPOu0F+csmx8PqTd1CAV6Ya3qAJvpRmUpWfR
   dqA/mzTYqt5XG8dgyPq/fMzC8tUeIc6e04y6zXwLjT0Yxez/vJs0kwIyp
   3c3rHsjZFwm3hsdQPNEKmbvSDQMwIDzrrzZa4mm19wUnDNXwlfmX9Lvov
   SLLWim6j0kiV1UqwMv7unByO51JgL8/zgQWINhK4OgAldzP3xyuPwcPjy
   uOXevcJsQogAHTSn3gH72xSkhp3mvKIsklEIwLv+9Go5LyaxpnPUGYsqv
   viMJyPAUJj+nD7kAKfhq31HyqhY6N2buvrFlsFdOu7vEcoKctxmSUGhnY
   A==;
X-CSE-ConnectionGUID: Jl3fpmDvQqSZ6PiOFO0afQ==
X-CSE-MsgGUID: hATzySX/RrW5GB1+DbrJjQ==
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="10894902"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:10:51 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:31423]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.35.101:2525] with esmtp (Farcaster)
 id 57d99ac1-34a2-4a23-b520-ce9bbfa8863e; Tue, 17 Mar 2026 14:10:50 +0000 (UTC)
X-Farcaster-Flow-ID: 57d99ac1-34a2-4a23-b520-ce9bbfa8863e
Received: from EX19D005EUB001.ant.amazon.com (10.252.51.12) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:10:45 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB001.ant.amazon.com (10.252.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:10:44 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.037; Tue, 17 Mar 2026 14:10:44 +0000
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
	<loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
 "Manwaring, Derek" <derekmn@amazon.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v11 01/16] set_memory: set_direct_map_* to take address
Thread-Topic: [PATCH v11 01/16] set_memory: set_direct_map_* to take address
Thread-Index: AQHcthfYKKVWyGEnck+/HNsWWreYfw==
Date: Tue, 17 Mar 2026 14:10:44 +0000
Message-ID: <20260317141031.514-2-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
In-Reply-To: <20260317141031.514-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071056_883338_77DD8137 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 18 Mar 2026 09:28:11 -0700
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

This is to avoid excessive conversions folio->page->address when adding
helpers on top of set_direct_map_valid_noflush() in the next patch.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 arch/arm64/include/asm/set_memory.h     |  7 ++++---
 arch/arm64/mm/pageattr.c                | 19 +++++++++----------
 arch/loongarch/include/asm/set_memory.h |  7 ++++---
 arch/loongarch/mm/pageattr.c            | 25 +++++++++++--------------
 arch/riscv/include/asm/set_memory.h     |  7 ++++---
 arch/riscv/mm/pageattr.c                | 17 +++++++++--------
 arch/s390/include/asm/set_memory.h      |  7 ++++---
 arch/s390/mm/pageattr.c                 | 13 +++++++------
 arch/x86/include/asm/set_memory.h       |  7 ++++---
 arch/x86/mm/pat/set_memory.c            | 23 ++++++++++++-----------
 include/linux/set_memory.h              |  9 +++++----
 kernel/power/snapshot.c                 |  4 ++--
 mm/execmem.c                            |  6 ++++--
 mm/secretmem.c                          |  6 +++---
 mm/vmalloc.c                            | 11 +++++++----
 15 files changed, 89 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..c71a2a6812c4 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -11,9 +11,10 @@ bool can_set_direct_map(void);
 
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_invalid_noflush(const void *addr);
+int set_direct_map_default_noflush(const void *addr);
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 358d1dc9a576..5aff94e1f8b2 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -245,7 +245,7 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_VALID));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(const void *addr)
 {
 	pgprot_t clear_mask = __pgprot(PTE_VALID);
 	pgprot_t set_mask = __pgprot(0);
@@ -253,11 +253,11 @@ int set_direct_map_invalid_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE, set_mask, clear_mask);
+	return update_range_prot((unsigned long)addr, PAGE_SIZE, set_mask,
+				 clear_mask);
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(const void *addr)
 {
 	pgprot_t set_mask = __pgprot(PTE_VALID | PTE_WRITE);
 	pgprot_t clear_mask = __pgprot(PTE_RDONLY);
@@ -265,8 +265,8 @@ int set_direct_map_default_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE, set_mask, clear_mask);
+	return update_range_prot((unsigned long)addr, PAGE_SIZE, set_mask,
+				 clear_mask);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
@@ -349,14 +349,13 @@ int realm_register_memory_enc_ops(void)
 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid)
 {
-	unsigned long addr = (unsigned long)page_address(page);
-
 	if (!can_set_direct_map())
 		return 0;
 
-	return set_memory_valid(addr, nr, valid);
+	return set_memory_valid((unsigned long)addr, numpages, valid);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
index 55dfaefd02c8..5e9b67b2fea1 100644
--- a/arch/loongarch/include/asm/set_memory.h
+++ b/arch/loongarch/include/asm/set_memory.h
@@ -15,8 +15,9 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 
 bool kernel_page_present(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_invalid_noflush(const void *addr);
+int set_direct_map_default_noflush(const void *addr);
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid);
 
 #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index f5e910b68229..9e08905d3624 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -198,32 +198,29 @@ bool kernel_page_present(struct page *page)
 	return pte_present(ptep_get(pte));
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(const void *addr)
 {
-	unsigned long addr = (unsigned long)page_address(page);
-
-	if (addr < vm_map_base)
+	if ((unsigned long)addr < vm_map_base)
 		return 0;
 
-	return __set_memory(addr, 1, PAGE_KERNEL, __pgprot(0));
+	return __set_memory((unsigned long)addr, 1, PAGE_KERNEL, __pgprot(0));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(const void *addr)
 {
-	unsigned long addr = (unsigned long)page_address(page);
-
-	if (addr < vm_map_base)
+	if ((unsigned long)addr < vm_map_base)
 		return 0;
 
-	return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
+	return __set_memory((unsigned long)addr, 1, __pgprot(0),
+			    __pgprot(_PAGE_PRESENT | _PAGE_VALID));
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid)
 {
-	unsigned long addr = (unsigned long)page_address(page);
 	pgprot_t set, clear;
 
-	if (addr < vm_map_base)
+	if ((unsigned long)addr < vm_map_base)
 		return 0;
 
 	if (valid) {
@@ -234,5 +231,5 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
 	}
 
-	return __set_memory(addr, 1, set, clear);
+	return __set_memory((unsigned long)addr, 1, set, clear);
 }
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 87389e93325a..a87eabd7fc78 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -40,9 +40,10 @@ static inline int set_kernel_memory(char *startp, char *endp,
 }
 #endif
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_invalid_noflush(const void *addr);
+int set_direct_map_default_noflush(const void *addr);
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid);
 bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..0a457177a88c 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -374,19 +374,20 @@ int set_memory_nx(unsigned long addr, int numpages)
 	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(const void *addr)
 {
-	return __set_memory((unsigned long)page_address(page), 1,
-			    __pgprot(0), __pgprot(_PAGE_PRESENT));
+	return __set_memory((unsigned long)addr, 1, __pgprot(0),
+			    __pgprot(_PAGE_PRESENT));
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(const void *addr)
 {
-	return __set_memory((unsigned long)page_address(page), 1,
-			    PAGE_KERNEL, __pgprot(_PAGE_EXEC));
+	return __set_memory((unsigned long)addr, 1, PAGE_KERNEL,
+			    __pgprot(_PAGE_EXEC));
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid)
 {
 	pgprot_t set, clear;
 
@@ -398,7 +399,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 		clear = __pgprot(_PAGE_PRESENT);
 	}
 
-	return __set_memory((unsigned long)page_address(page), nr, set, clear);
+	return __set_memory((unsigned long)addr, numpages, set, clear);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/set_memory.h
index 94092f4ae764..3e43c3c96e67 100644
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@ -60,9 +60,10 @@ __SET_MEMORY_FUNC(set_memory_rox, SET_MEMORY_RO | SET_MEMORY_X)
 __SET_MEMORY_FUNC(set_memory_rwnx, SET_MEMORY_RW | SET_MEMORY_NX)
 __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_invalid_noflush(const void *addr);
+int set_direct_map_default_noflush(const void *addr);
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid);
 bool kernel_page_present(struct page *page);
 
 #endif
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index bb29c38ae624..8e90ff5cf50d 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -383,17 +383,18 @@ int __set_memory(unsigned long addr, unsigned long numpages, unsigned long flags
 	return rc;
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(const void *addr)
 {
-	return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEMORY_INV);
+	return __set_memory((unsigned long)addr, 1, SET_MEMORY_INV);
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(const void *addr)
 {
-	return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEMORY_DEF);
+	return __set_memory((unsigned long)addr, 1, SET_MEMORY_DEF);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid)
 {
 	unsigned long flags;
 
@@ -402,7 +403,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	else
 		flags = SET_MEMORY_INV;
 
-	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
+	return __set_memory((unsigned long)addr, numpages, flags);
 }
 
 bool kernel_page_present(struct page *page)
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4362c26aa992..b6a4173ff249 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -86,9 +86,10 @@ int set_pages_wb(struct page *page, int numpages);
 int set_pages_ro(struct page *page, int numpages);
 int set_pages_rw(struct page *page, int numpages);
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_invalid_noflush(const void *addr);
+int set_direct_map_default_noflush(const void *addr);
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid);
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 40581a720fe8..6aea1f470fd5 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2587,9 +2587,9 @@ int set_pages_rw(struct page *page, int numpages)
 	return set_memory_rw(addr, numpages);
 }
 
-static int __set_pages_p(struct page *page, int numpages)
+static int __set_pages_p(const void *addr, int numpages)
 {
-	unsigned long tempaddr = (unsigned long) page_address(page);
+	unsigned long tempaddr = (unsigned long)addr;
 	struct cpa_data cpa = { .vaddr = &tempaddr,
 				.pgd = NULL,
 				.numpages = numpages,
@@ -2606,9 +2606,9 @@ static int __set_pages_p(struct page *page, int numpages)
 	return __change_page_attr_set_clr(&cpa, 1);
 }
 
-static int __set_pages_np(struct page *page, int numpages)
+static int __set_pages_np(const void *addr, int numpages)
 {
-	unsigned long tempaddr = (unsigned long) page_address(page);
+	unsigned long tempaddr = (unsigned long)addr;
 	struct cpa_data cpa = { .vaddr = &tempaddr,
 				.pgd = NULL,
 				.numpages = numpages,
@@ -2625,22 +2625,23 @@ static int __set_pages_np(struct page *page, int numpages)
 	return __change_page_attr_set_clr(&cpa, 1);
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(const void *addr)
 {
-	return __set_pages_np(page, 1);
+	return __set_pages_np(addr, 1);
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(const void *addr)
 {
-	return __set_pages_p(page, 1);
+	return __set_pages_p(addr, 1);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
+int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
+				 bool valid)
 {
 	if (valid)
-		return __set_pages_p(page, nr);
+		return __set_pages_p(addr, numpages);
 
-	return __set_pages_np(page, nr);
+	return __set_pages_np(addr, numpages);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..1a2563f525fc 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -25,17 +25,18 @@ static inline int set_memory_rox(unsigned long addr, int numpages)
 #endif
 
 #ifndef CONFIG_ARCH_HAS_SET_DIRECT_MAP
-static inline int set_direct_map_invalid_noflush(struct page *page)
+static inline int set_direct_map_invalid_noflush(const void *addr)
 {
 	return 0;
 }
-static inline int set_direct_map_default_noflush(struct page *page)
+static inline int set_direct_map_default_noflush(const void *addr)
 {
 	return 0;
 }
 
-static inline int set_direct_map_valid_noflush(struct page *page,
-					       unsigned nr, bool valid)
+static inline int set_direct_map_valid_noflush(const void *addr,
+					       unsigned long numpages,
+					       bool valid)
 {
 	return 0;
 }
diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index 6e1321837c66..6eddfb22c0ff 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -88,7 +88,7 @@ static inline int hibernate_restore_unprotect_page(void *page_address) {return 0
 static inline void hibernate_map_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
-		int ret = set_direct_map_default_noflush(page);
+		int ret = set_direct_map_default_noflush(page_address(page));
 
 		if (ret)
 			pr_warn_once("Failed to remap page\n");
@@ -101,7 +101,7 @@ static inline void hibernate_unmap_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
 		unsigned long addr = (unsigned long)page_address(page);
-		int ret  = set_direct_map_invalid_noflush(page);
+		int ret  = set_direct_map_invalid_noflush(page_address(page));
 
 		if (ret)
 			pr_warn_once("Failed to remap page\n");
diff --git a/mm/execmem.c b/mm/execmem.c
index 810a4ba9c924..220298ec87c8 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -119,7 +119,8 @@ static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid)
 	int err = 0;
 
 	for (int i = 0; i < vm->nr_pages; i += nr) {
-		err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
+		err = set_direct_map_valid_noflush(page_address(vm->pages[i]),
+						   nr, valid);
 		if (err)
 			goto err_restore;
 		updated += nr;
@@ -129,7 +130,8 @@ static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid)
 
 err_restore:
 	for (int i = 0; i < updated; i += nr)
-		set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
+		set_direct_map_valid_noflush(page_address(vm->pages[i]), nr,
+					     !valid);
 
 	return err;
 }
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 11a779c812a7..fd29b33c6764 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -72,7 +72,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
 			goto out;
 		}
 
-		err = set_direct_map_invalid_noflush(folio_page(folio, 0));
+		err = set_direct_map_invalid_noflush(folio_address(folio));
 		if (err) {
 			folio_put(folio);
 			ret = vmf_error(err);
@@ -87,7 +87,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
 			 * already happened when we marked the page invalid
 			 * which guarantees that this call won't fail
 			 */
-			set_direct_map_default_noflush(folio_page(folio, 0));
+			set_direct_map_default_noflush(folio_address(folio));
 			folio_put(folio);
 			if (err == -EEXIST)
 				goto retry;
@@ -151,7 +151,7 @@ static int secretmem_migrate_folio(struct address_space *mapping,
 
 static void secretmem_free_folio(struct folio *folio)
 {
-	set_direct_map_default_noflush(folio_page(folio, 0));
+	set_direct_map_default_noflush(folio_address(folio));
 	folio_zero_segment(folio, 0, folio_size(folio));
 }
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61caa55a4402..8822f73957d9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3342,14 +3342,17 @@ struct vm_struct *remove_vm_area(const void *addr)
 }
 
 static inline void set_area_direct_map(const struct vm_struct *area,
-				       int (*set_direct_map)(struct page *page))
+				       int (*set_direct_map)(const void *addr))
 {
 	int i;
 
 	/* HUGE_VMALLOC passes small pages to set_direct_map */
-	for (i = 0; i < area->nr_pages; i++)
-		if (page_address(area->pages[i]))
-			set_direct_map(area->pages[i]);
+	for (i = 0; i < area->nr_pages; i++) {
+		const void *addr = page_address(area->pages[i]);
+
+		if (addr)
+			set_direct_map(addr);
+	}
 }
 
 /*
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
