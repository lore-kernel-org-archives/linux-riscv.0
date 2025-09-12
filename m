Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8411CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Grxf2X2AFkn/ckdFpt/xuTyB5rHF5pD8Wo/UZd3/WF8=; b=QvOsZ9Kwn0Fh+Q
	6cMO9qgKJaempL2NKL4pJZvp/il0HvsV2Kc5CmW6HP/NBQPVAB4mgCSa+KE4NXQakVuuHpU+Of12s
	bVx9OKxQ4Y4qJaJUTR6P35+xRV7LhaUgnWY3dcqcAe2tJW4+943+jIq/C9JJtImXxLuSDSJAfDEYK
	WeesvcP6RuwXuUA6SJO5ZdT7VFkquYqcGR35X2IvNP2XzVAFlSwCk8gyeoOe1FYi1GZ4jMITh7Nis
	KD6+tVyjcM4yB9kuO8XTd8BfD8oqG1Zux2FWOoEw0L7RzinhJpUZzjcZc9Q17VEgbD+/NJUZJiAw8
	8pvz+M4FI8R3nhqk9WQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzul-00000008Byd-3CLY;
	Fri, 12 Sep 2025 09:17:55 +0000
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzui-00000008BvE-3PQ5;
	Fri, 12 Sep 2025 09:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668672; x=1789204672;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KTZ/VOJbbCjyGaq9AddgILCkPAHpmVIUuRAnTMPHRJE=;
  b=Q0cGzsBOwcmhUVf9H12Pd/ZfJ1vLsfXhTO0mx4wAkX8pS/36b6Kdk/Kd
   ZM4zN5r9tkQINxUZYOEhvvZwZZ91k4yujLv511I6l+uQMLFyT35nqyIoM
   0Uyvmp0BNKkeP9Mip+Dez9iyH84IDTY7IKMOL8XpslV7KLNfbCQaDHJ8i
   5sgj99vb0HGWtMTBLSPhmAKEh3dqvPiJxnOPrfjslqK72OACgeiXgJuz0
   y7UhegdcAR+shJX1RaA9n0Lyqa4reEyZXj9Z6oY3KjSKycnbNT7CSSpfc
   6FfYmUR2ePr/BNkpw3Q1ulFPSloneWpuodTqUHOl/7GE54rfScCKvyXbt
   w==;
X-CSE-ConnectionGUID: QEXct2vdTta8TMzv4Ngyng==
X-CSE-MsgGUID: jfWOQOMCT/uSRNaEor6nYA==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2007537"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:41 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:27364]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.20.211:2525] with esmtp (Farcaster)
 id 5628c97f-0538-4e01-83c3-9a2b6facd620; Fri, 12 Sep 2025 09:17:41 +0000 (UTC)
X-Farcaster-Flow-ID: 5628c97f-0538-4e01-83c3-9a2b6facd620
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:40 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:39 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:39 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 06/11] KVM: selftests: load elf via bounce buffer
Thread-Topic: [PATCH v6 06/11] KVM: selftests: load elf via bounce buffer
Thread-Index: AQHcI8YWbSkdpV9N8kuaL7J+KZ9Yaw==
Date: Fri, 12 Sep 2025 09:17:39 +0000
Message-ID: <20250912091708.17502-7-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021753_137419_F599AC0C 
X-CRM114-Status: GOOD (  11.73  )
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

If guest memory is backed using a VMA that does not allow GUP (e.g. a
userspace mapping of guest_memfd when the fd was allocated using
KVM_GMEM_NO_DIRECT_MAP), then directly loading the test ELF binary into
it via read(2) potentially does not work. To nevertheless support
loading binaries in this cases, do the read(2) syscall using a bounce
buffer, and then memcpy from the bounce buffer into guest memory.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 .../testing/selftests/kvm/include/test_util.h |  1 +
 tools/testing/selftests/kvm/lib/elf.c         |  8 +++----
 tools/testing/selftests/kvm/lib/io.c          | 23 +++++++++++++++++++
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index c6ef895fbd9a..0409b7b96c94 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -46,6 +46,7 @@ do {								\
 
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
