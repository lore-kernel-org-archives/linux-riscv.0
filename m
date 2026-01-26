Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC87D2FEDC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXCUsEHqx3EJFK16S/uHvvr14MtR1h2VyQu8eYsXwFo=; b=gUL7WSnSUaHABk
	DyvkoWnMz+r8AHGXDug6EoIyrXvgax5nqf+mOUaaEPXU81VKIOzDZGm1W8JXNJN2GTMmJn+1lIVm+
	AjpXtjoNzwXFw2Kz2M+iAkOmKAqngy8nVTAbqWT9G/dupoYAk9ohEpNj9mpgNu2XTDtELs1Lhh50g
	N8/TqMgvl8OO9VQrn3N/e7NPM2zt5a4eWRR3L1MG1wrzs9hxMwI0g0SGCfB2UnjHDnsCpUtgm72B7
	8/eAZeR8C8ocQc1Z1mc1MbTvpO1x6nkxcnND4ZNfR+aq2M51g2V1VetL2ICdTSc4hGhuEOsGgbGoa
	QLKPmCnApTe58X+/riYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqq-0000000Evuk-3InE;
	Tue, 27 Jan 2026 19:35:48 +0000
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.199.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPnt-0000000Ctsm-1RmB;
	Mon, 26 Jan 2026 16:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1769446265; x=1800982265;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CWGOx1LJU1Lp2rVsMU/Gh8xhbQtWU2hA9WJ9kcqa2lY=;
  b=ZWmR+hfYZMZ7xD0gVzvXcYBCf45bgtPPS3CPohcy6uP/3djC8vjUfKsB
   tHLCP46OJBOipdNiGhPBh+b4TXrrKwHC/IWxdiLqTLbEkKfa6myeTv9Qh
   RDbnFap3t3HY+Qyi0QQArjisJ5v/znAbO+b8HLMyxhmJjQW2DWDrhL39L
   NAxOfG+MvpmycM9EEY+voLjsoVfPlB6XPNaHOdyBEYCb1W82wrVk5pxxg
   RKUMP9+CZULBlNxbJt2+TUKzbSYd83ytdaEReujVfJZ2NKFiilW11rKPH
   0UBSCoyV2WPezhUXxBNmipEoNhJ4erq6GBMMoAlalnu2uOXB06ATtGQgw
   g==;
X-CSE-ConnectionGUID: OTPDPd+WRq6SnWkJKAJ4vQ==
X-CSE-MsgGUID: WBzqhBMjTtmhVyyuALB2qA==
X-IronPort-AV: E=Sophos;i="6.21,255,1763424000"; 
   d="scan'208";a="8355925"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:50:46 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.233:6441]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.13.191:2525] with esmtp (Farcaster)
 id 11366de5-e0f8-4887-8ca6-1fe533487262; Mon, 26 Jan 2026 16:50:46 +0000 (UTC)
X-Farcaster-Flow-ID: 11366de5-e0f8-4887-8ca6-1fe533487262
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:50:44 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB003.ant.amazon.com (10.252.51.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:50:44 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Mon, 26 Jan 2026 16:50:44 +0000
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
Subject: [PATCH v10 10/15] KVM: selftests: load elf via bounce buffer
Thread-Topic: [PATCH v10 10/15] KVM: selftests: load elf via bounce buffer
Thread-Index: AQHcjuPpjxdWuZs0h0+r9kXLDgvviw==
Date: Mon, 26 Jan 2026 16:50:44 +0000
Message-ID: <20260126164445.11867-11-kalyazin@amazon.com>
References: <20260126164445.11867-1-kalyazin@amazon.com>
In-Reply-To: <20260126164445.11867-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_085105_669120_FB107C67 
X-CRM114-Status: GOOD (  12.26  )
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

From: Patrick Roy <patrick.roy@linux.dev>

If guest memory is backed using a VMA that does not allow GUP (e.g. a
userspace mapping of guest_memfd when the fd was allocated using
GUEST_MEMFD_FLAG_NO_DIRECT_MAP), then directly loading the test ELF
binary into it via read(2) potentially does not work. To nevertheless
support loading binaries in this cases, do the read(2) syscall using a
bounce buffer, and then memcpy from the bounce buffer into guest memory.

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 .../testing/selftests/kvm/include/test_util.h |  1 +
 tools/testing/selftests/kvm/lib/elf.c         |  8 +++----
 tools/testing/selftests/kvm/lib/io.c          | 23 +++++++++++++++++++
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index b4872ba8ed12..8140e59b59e5 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -48,6 +48,7 @@ do {								\
 
 ssize_t test_write(int fd, const void *buf, size_t count);
 ssize_t test_read(int fd, void *buf, size_t count);
+ssize_t test_read_bounce(int fd, void *buf, size_t count);
 int test_seq_read(const char *path, char **bufp, size_t *sizep);
 
 void __printf(5, 6) test_assert(bool exp, const char *exp_str,
diff --git a/tools/testing/selftests/kvm/lib/elf.c b/tools/testing/selftests/kvm/lib/elf.c
index f34d926d9735..e829fbe0a11e 100644
--- a/tools/testing/selftests/kvm/lib/elf.c
+++ b/tools/testing/selftests/kvm/lib/elf.c
@@ -31,7 +31,7 @@ static void elfhdr_get(const char *filename, Elf64_Ehdr *hdrp)
 	 * the real size of the ELF header.
 	 */
 	unsigned char ident[EI_NIDENT];
-	test_read(fd, ident, sizeof(ident));
+	test_read_bounce(fd, ident, sizeof(ident));
 	TEST_ASSERT((ident[EI_MAG0] == ELFMAG0) && (ident[EI_MAG1] == ELFMAG1)
 		&& (ident[EI_MAG2] == ELFMAG2) && (ident[EI_MAG3] == ELFMAG3),
 		"ELF MAGIC Mismatch,\n"
@@ -79,7 +79,7 @@ static void elfhdr_get(const char *filename, Elf64_Ehdr *hdrp)
 	offset_rv = lseek(fd, 0, SEEK_SET);
 	TEST_ASSERT(offset_rv == 0, "Seek to ELF header failed,\n"
 		"  rv: %zi expected: %i", offset_rv, 0);
-	test_read(fd, hdrp, sizeof(*hdrp));
+	test_read_bounce(fd, hdrp, sizeof(*hdrp));
 	TEST_ASSERT(hdrp->e_phentsize == sizeof(Elf64_Phdr),
 		"Unexpected physical header size,\n"
 		"  hdrp->e_phentsize: %x\n"
@@ -146,7 +146,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *filename)
 
 		/* Read in the program header. */
 		Elf64_Phdr phdr;
-		test_read(fd, &phdr, sizeof(phdr));
+		test_read_bounce(fd, &phdr, sizeof(phdr));
 
 		/* Skip if this header doesn't describe a loadable segment. */
 		if (phdr.p_type != PT_LOAD)
@@ -187,7 +187,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *filename)
 				"  expected: 0x%jx",
 				n1, errno, (intmax_t) offset_rv,
 				(intmax_t) phdr.p_offset);
-			test_read(fd, addr_gva2hva(vm, phdr.p_vaddr),
+			test_read_bounce(fd, addr_gva2hva(vm, phdr.p_vaddr),
 				phdr.p_filesz);
 		}
 	}
diff --git a/tools/testing/selftests/kvm/lib/io.c b/tools/testing/selftests/kvm/lib/io.c
index fedb2a741f0b..74419becc8bc 100644
--- a/tools/testing/selftests/kvm/lib/io.c
+++ b/tools/testing/selftests/kvm/lib/io.c
@@ -155,3 +155,26 @@ ssize_t test_read(int fd, void *buf, size_t count)
 
 	return num_read;
 }
+
+/* Test read via intermediary buffer
+ *
+ * Same as test_read, except read(2)s happen into a bounce buffer that is memcpy'd
+ * to buf. For use with buffers that cannot be GUP'd (e.g. guest_memfd VMAs if
+ * guest_memfd was created with GUEST_MEMFD_FLAG_NO_DIRECT_MAP).
+ */
+ssize_t test_read_bounce(int fd, void *buf, size_t count)
+{
+	void *bounce_buffer;
+	ssize_t num_read;
+
+	TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
+
+	bounce_buffer = malloc(count);
+	TEST_ASSERT(bounce_buffer != NULL, "Failed to allocate bounce buffer");
+
+	num_read = test_read(fd, bounce_buffer, count);
+	memcpy(buf, bounce_buffer, num_read);
+	free(bounce_buffer);
+
+	return num_read;
+}
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
