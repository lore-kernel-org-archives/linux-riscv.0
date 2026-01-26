Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD17AD2FEDE
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ji8+hJl/zttdZkftUvE2vNmJbpa9/EgrUqdsg2CUkQs=; b=cZY/1DCOUfAag4
	foHNuJ92ya22XLUOgZcx8VMmUtqbTNXsGo0Ifv5lmZzbERcVvTQ3pH63/3MJD75XKqLjVGSWzMZbP
	wx1B7O1b8zudnnsCj1NWIiZBc2G2eBhIj3joAN6QgRpluDR/1KOt107TN3pnVGICfaHubfJIEOHvH
	U6OHy6MT5+m1YI7WVweefY9kqYH89dl7SwJvu0wD6cgyYk720Ct5m/26AkKjOEi2kbf4hX6c9XOrs
	DNt6hFfRODep/X5/RMjSRX92ViyaUcADlaafkpl1GbNpEeReOvx6HT3zSnvDZ8zj5ZiGbVL5ZkVNL
	00BY7s+Ti3hBGszeC//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqk-0000000Evr7-2d82;
	Tue, 27 Jan 2026 19:35:42 +0000
Received: from fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.65.3.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPkR-0000000CtFe-2gmP;
	Mon, 26 Jan 2026 16:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1769446051; x=1800982051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=itJUHovmx8ThQnuXFjcLy1G60dRyIFRRQr44NmgQ9VQ=;
  b=av28pWNEVJn3VMWqWUSrBCHb10+j609zYlL0PBS3P7k8f3tw2OkmA+6M
   gEayfhW9ZsX0PI5aGQHioXfuUSMgx4BhzzE2IXRW1irtnTKLj1zSFf46P
   qsLHQRuguRoMiAsPWXGgzzYTx7D/ftfO+onclY31ae2Q0tngYKEabQoMY
   Gp96Y9t7GQpQckLcEzUpMz+wWh4TIQaT8lXQ2/S52T8b5IXZMwA0whid9
   HJo2qEyXb5QgOGPeYGtgRs0KfBkG/jGHfV6sGIiVqbRqjeJrhPdSU2kO5
   QdLKnGDlDhGSgj7Z4EOyHPeft4etXmohQHPaanxF7yWfKRaL12o/scKaN
   A==;
X-CSE-ConnectionGUID: mAl7W5q2Q9qKqPQn17E9NQ==
X-CSE-MsgGUID: vLAaNxp6S+iNE/SUHLTamA==
X-IronPort-AV: E=Sophos;i="6.21,255,1763424000"; 
   d="scan'208";a="8460917"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:47:12 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.233:20657]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.13.191:2525] with esmtp (Farcaster)
 id 7aedb640-8db8-4ae8-804d-436f487cb697; Mon, 26 Jan 2026 16:47:12 +0000 (UTC)
X-Farcaster-Flow-ID: 7aedb640-8db8-4ae8-804d-436f487cb697
Received: from EX19D005EUB002.ant.amazon.com (10.252.51.103) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:47:12 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB002.ant.amazon.com (10.252.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:47:11 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Mon, 26 Jan 2026 16:47:11 +0000
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
Subject: [PATCH v10 02/15] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Topic: [PATCH v10 02/15] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Index: AQHcjuNqThDEVtMYx0OshrAVDnsQEg==
Date: Mon, 26 Jan 2026 16:47:11 +0000
Message-ID: <20260126164445.11867-3-kalyazin@amazon.com>
References: <20260126164445.11867-1-kalyazin@amazon.com>
In-Reply-To: <20260126164445.11867-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084732_116164_3328FEF4 
X-CRM114-Status: GOOD (  10.60  )
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

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 arch/arm64/include/asm/set_memory.h     |  2 ++
 arch/arm64/mm/pageattr.c                | 12 ++++++++++++
 arch/loongarch/include/asm/set_memory.h |  2 ++
 arch/loongarch/mm/pageattr.c            | 12 ++++++++++++
 arch/riscv/include/asm/set_memory.h     |  2 ++
 arch/riscv/mm/pageattr.c                | 12 ++++++++++++
 arch/s390/include/asm/set_memory.h      |  2 ++
 arch/s390/mm/pageattr.c                 | 12 ++++++++++++
 arch/x86/include/asm/set_memory.h       |  2 ++
 arch/x86/mm/pat/set_memory.c            | 20 ++++++++++++++++++++
 include/linux/set_memory.h              | 10 ++++++++++
 11 files changed, 88 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index c71a2a6812c4..49fd54f3c265 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -15,6 +15,8 @@ int set_direct_map_invalid_noflush(const void *addr);
 int set_direct_map_default_noflush(const void *addr);
 int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 				 bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index e2bdc3c1f992..0b88b0344499 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -356,6 +356,18 @@ int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 	return set_memory_valid((unsigned long)addr, numpages, valid);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), false);
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), true);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
index 5e9b67b2fea1..1cdec6afe209 100644
--- a/arch/loongarch/include/asm/set_memory.h
+++ b/arch/loongarch/include/asm/set_memory.h
@@ -19,5 +19,7 @@ int set_direct_map_invalid_noflush(const void *addr);
 int set_direct_map_default_noflush(const void *addr);
 int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 				 bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 
 #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index c1b2be915038..be397fddc991 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -235,3 +235,15 @@ int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 
 	return __set_memory((unsigned long)addr, 1, set, clear);
 }
+
+int folio_zap_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), false);
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), true);
+}
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index a87eabd7fc78..208755d9d45e 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -44,6 +44,8 @@ int set_direct_map_invalid_noflush(const void *addr);
 int set_direct_map_default_noflush(const void *addr);
 int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 				 bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 0a457177a88c..9a8237658c48 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -402,6 +402,18 @@ int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 	return __set_memory((unsigned long)addr, numpages, set, clear);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), false);
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), true);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
 {
diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/set_memory.h
index 3e43c3c96e67..a51ff50df3ca 100644
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@ -64,6 +64,8 @@ int set_direct_map_invalid_noflush(const void *addr);
 int set_direct_map_default_noflush(const void *addr);
 int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 				 bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 #endif
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index e231757bb0e0..f739fee0e110 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -413,6 +413,18 @@ int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 	return __set_memory((unsigned long)addr, numpages, flags);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), false);
+}
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), true);
+}
+
 bool kernel_page_present(struct page *page)
 {
 	unsigned long addr;
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index f912191f0853..febbfbdc39df 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -91,6 +91,8 @@ int set_direct_map_invalid_noflush(const void *addr);
 int set_direct_map_default_noflush(const void *addr);
 int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 				 bool valid);
+int folio_zap_direct_map(struct folio *folio);
+int folio_restore_direct_map(struct folio *folio);
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index bc8e1c23175b..4a5a3124a92d 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2657,6 +2657,26 @@ int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
 	return __set_pages_np(addr, numpages);
 }
 
+int folio_zap_direct_map(struct folio *folio)
+{
+	const void *addr = folio_address(folio);
+	int ret;
+
+	ret = set_direct_map_valid_noflush(addr, folio_nr_pages(folio), false);
+	flush_tlb_kernel_range((unsigned long)addr,
+			       (unsigned long)addr + folio_size(folio));
+
+	return ret;
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_zap_direct_map, "kvm");
+
+int folio_restore_direct_map(struct folio *folio)
+{
+	return set_direct_map_valid_noflush(folio_address(folio),
+					    folio_nr_pages(folio), true);
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_restore_direct_map, "kvm");
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 1a2563f525fc..e2e6485f88db 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -41,6 +41,16 @@ static inline int set_direct_map_valid_noflush(const void *addr,
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
