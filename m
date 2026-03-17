Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E6910775E7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJMbWuVTGaZVvD01YX86j+96Jdu1NKEEdmYsO8RSgNo=; b=UYmulmQVm3AWRN
	sjgFtphkd+m54e8ZNiFLso6YId6r7GsqoKpQaw+U5uVsCPYFENkg2FzjnfqZ5Pc9zvkF+FZwfNO1V
	MYQqmIFni8xYNMhFKdqeFfTs41uZ9HCTyD0lqRiKNC0oGP+LrOtVZXwaEcwkQN9SnadXVV/b9akOE
	cWy2V2KdCgCLzgw/ckAfGlaAI1B5YjBoStAMu9A9s0FZuIsFwS+9jbYdBNzRadmwyHf3t+d33R32Z
	v8MBnSBOA5/LFmOpvO/s/yxAsUMQmxOXy58tcdXHJkgD7uC5bCdxO2eh4MpXM8CDxGCPysQlSUB2V
	+HFocBASfOmbYwRLCPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkn-00000008vOw-1kiN;
	Wed, 18 Mar 2026 16:28:17 +0000
Received: from fra-out-007.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.75.33.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V8w-00000006Wr7-2LAZ;
	Tue, 17 Mar 2026 14:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1773756694; x=1805292694;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yq/Z/mNNjYHh4gnEoHNSJLkORCM9JDhCuatXRLcv2PA=;
  b=nDIrBGSccuyX9OTJ6U//EafXn+n2zuHhOEgWKfYpPUUK+vamJwTehws3
   K9kaDJbCQqzUH9jrF/C3z2VIxosE9wscYE7nZFSmwNt57mXIePKusAsf+
   SdzpJndI7S/aLhbJVg5sPR+fvIqjfC+u4Mqd3JwpD8y6+7kl1LwUjcc/E
   rX5ZojWoFgm/Ha4J20A+WnBoOVyz4WT3lTWW/k2jQbjSmlsMXabFU/kKP
   zQpj2U3KHoLQ2pgfqd4vi1K19GbmyQglHW4RWj44yrIBi4KT6nOzSfP/F
   LWOLpcwHdqL9LZo075XcxEsTXRm1Vu9e50oH0dDhj7PIK18ZGbEPvue5y
   Q==;
X-CSE-ConnectionGUID: aH9ubdWDST6jSOpzSPbiCQ==
X-CSE-MsgGUID: r7wP3IKWR+GcRQYSRa2qvA==
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="10997942"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-007.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:11:32 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:2083]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.12.17:2525] with esmtp (Farcaster)
 id 8ba284ac-6fe7-47a6-8347-fb5d3507a06d; Tue, 17 Mar 2026 14:11:31 +0000 (UTC)
X-Farcaster-Flow-ID: 8ba284ac-6fe7-47a6-8347-fb5d3507a06d
Received: from EX19D005EUB002.ant.amazon.com (10.252.51.103) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:11:31 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB002.ant.amazon.com (10.252.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:11:30 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.037; Tue, 17 Mar 2026 14:11:30 +0000
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
Subject: [PATCH v11 05/16] mm/gup: drop local variable in
 gup_fast_folio_allowed
Thread-Topic: [PATCH v11 05/16] mm/gup: drop local variable in
 gup_fast_folio_allowed
Thread-Index: AQHcthfziSFmLyCfmUqH6JhuxYgvLA==
Date: Tue, 17 Mar 2026 14:11:30 +0000
Message-ID: <20260317141031.514-6-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
In-Reply-To: <20260317141031.514-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071134_908089_9041E5F6 
X-CRM114-Status: UNSURE (   9.67  )
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

Move the check for pinning closer to where the result is used.
No functional changes.

Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 mm/gup.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 5856d35be385..869d79c8daa4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2737,18 +2737,9 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  */
 static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 {
-	bool reject_file_backed = false;
 	struct address_space *mapping;
 	unsigned long mapping_flags;
 
-	/*
-	 * If we aren't pinning then no problematic write can occur. A long term
-	 * pin is the most egregious case so this is the one we disallow.
-	 */
-	if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
-	    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
-		reject_file_backed = true;
-
 	/* We hold a folio reference, so we can safely access folio fields. */
 	if (WARN_ON_ONCE(folio_test_slab(folio)))
 		return false;
@@ -2793,8 +2784,18 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 	 */
 	if (secretmem_mapping(mapping))
 		return false;
-	/* The only remaining allowed file system is shmem. */
-	return !reject_file_backed || shmem_mapping(mapping);
+
+	/*
+	 * If we aren't pinning then no problematic write can occur. A writable
+	 * long term pin is the most egregious case, so this is the one we
+	 * allow only for ...
+	 */
+	if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) !=
+	    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
+		return true;
+
+	/* ... hugetlb (which we allowed above already) and shared memory. */
+	return shmem_mapping(mapping);
 }
 
 #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
