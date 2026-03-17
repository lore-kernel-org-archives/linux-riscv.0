Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6304010775EC
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1nE65Rh5eOQfM3NVFZ9+UPKSPuxvruYBS/aMAQM5UE=; b=4LruxxX/LSTbo/
	+k8QxpvEaNTFyg3vvYhmHQtYJj5FiCsEZ3oy5Avaa1PLaUT2283KcKQsOIv4knAGzce5gUdususlv
	nFoK2U+NxEBKRX48WYa4Ih2MZeqYl+a4+78YcWGgKg+iMaO8hZjT3P2b7B309wh5QSgH0qji18fdZ
	FYEMAaJ4I1sCJgsDY7+Tu7KyoaodZMwgL2tGfpCABaNHj0YxNx32Vik4hJN1i9U9FJNSn0w4AClyP
	VHcEbIV3vZzOo097mVUNUcplZOZ2K3JxOAxdFV87a1vHdYt8q+dl4PbgEMdvfKVyr38BftIWfjaLC
	NFy5T7Ot7YAAOLMODaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tko-00000008vQA-21fM;
	Wed, 18 Mar 2026 16:28:18 +0000
Received: from fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.64.237.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V9Y-00000006X4Q-0QNS;
	Tue, 17 Mar 2026 14:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1773756732; x=1805292732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2SCO26JpbOiwEtwoE9l8FfCOHJ0EvPaKqEJRKju7FG0=;
  b=dBfeSlMnkZQ0vNJ/O3qApM2IKUA8qiaDe3YAKpeopTTEj2uupxY7XZCa
   BGjrW8+zwaBuE+TZnvsgSsQVXNvQrfGTJu4yyOGp1Ovap4UxHB8UqGtVT
   ZQfzmdDFDR9oMfMQ+W6zUJtSTdtLSGUBK0Di4xAtcQaVH5RMln30/XhJe
   0ZEaC8WF8JMrclSSrMdaLeauZFcpgQ8Il4DTMs7YCiNLdgs32Wv+yUs7t
   Ewb17xbwpajCLoMYum6Us+PnpPqOToyqyJPNSAmSMUVAlH2qZ7t3BVBMF
   tC/bYRTiK8DS9K897J//GcWKJZa+/7eyLDzYMAt85ZCpuBTiCAYz+1Hok
   A==;
X-CSE-ConnectionGUID: 5D9wGET8QOqETp5aZ1O1cA==
X-CSE-MsgGUID: OtiFxA9LRWOMk1RcEAwspg==
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="10906733"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:12:06 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.236:22517]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.27.205:2525] with esmtp (Farcaster)
 id e6120801-828d-4fd3-9ad9-592c219420da; Tue, 17 Mar 2026 14:12:06 +0000 (UTC)
X-Farcaster-Flow-ID: e6120801-828d-4fd3-9ad9-592c219420da
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:12:05 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB003.ant.amazon.com (10.252.51.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:12:05 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.037; Tue, 17 Mar 2026 14:12:04 +0000
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
Subject: [PATCH v11 08/16] KVM: x86: define
 kvm_arch_gmem_supports_no_direct_map()
Thread-Topic: [PATCH v11 08/16] KVM: x86: define
 kvm_arch_gmem_supports_no_direct_map()
Thread-Index: AQHcthgINR9mE7SLRU6CsacYgHQHtw==
Date: Tue, 17 Mar 2026 14:12:04 +0000
Message-ID: <20260317141031.514-9-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
In-Reply-To: <20260317141031.514-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071212_423196_EEBCF51B 
X-CRM114-Status: UNSURE (   7.00  )
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

From: Patrick Roy <patrick.roy@linux.dev>

x86 supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP whenever direct map
modifications are possible (which is always the case).

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 arch/x86/include/asm/kvm_host.h | 6 ++++++
 arch/x86/kvm/x86.c              | 5 +++++
 include/linux/kvm_host.h        | 9 +++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6e4e3ef9b8c7..171ce8b84137 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -28,6 +28,7 @@
 #include <linux/sched/vhost_task.h>
 #include <linux/call_once.h>
 #include <linux/atomic.h>
+#include <linux/set_memory.h>
 
 #include <asm/apic.h>
 #include <asm/pvclock-abi.h>
@@ -2504,4 +2505,9 @@ static inline bool kvm_arch_has_irq_bypass(void)
 	return enable_device_posted_irqs;
 }
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm);
+#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
+#endif /* CONFIG_KVM_GUEST_MEMFD */
+
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fd1c4a36b593..6a4dcf449a37 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14079,6 +14079,11 @@ void kvm_arch_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 	kvm_x86_call(gmem_invalidate)(start, end);
 }
 #endif
+
+bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm)
+{
+	return can_set_direct_map() && kvm->arch.vm_type != KVM_X86_TDX_VM;
+}
 #endif
 
 int kvm_spec_ctrl_test_value(u64 value)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e8aa3d676c31..ce8c5fdf2752 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -742,6 +742,15 @@ static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
 }
 #endif
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+#ifndef kvm_arch_gmem_supports_no_direct_map
+static inline bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+#endif /* CONFIG_KVM_GUEST_MEMFD */
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
