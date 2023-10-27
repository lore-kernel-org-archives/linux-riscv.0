Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F6DC25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DudlhQuB5aH1VQ1fWThtpgSc/edNu4Va8Svie7q+Nc4=; b=JF3R73cnQCDHx0
	Aw2twW40eJPeKNstTFjaEclWdovk7dU/7klSdXLBlPTR3d2lyEQlpVMjdIN1dWiMXJCKmHXigbfoa
	QUvJbON0tTj4Vpp5nJzCpUpOhVBmh/voPiTl4Xv9Zd1EsfAPnBqL18YX/vNZGh/LXTgjp3TzBVSRj
	tQwaLvLTFSBvk6R8Bp47RRqU9MvJqykzQrNCiaAHxnT7h9Dm9ocys0T++hX87qnUpj1naC6h1l1CX
	+bD52d3yv/OLrRWU81UqScyOYwvjMCvi71Ew7BP5VzLS1h+2JSPDmZKqmx+heYOd4oHaI4HHPPzWb
	GlvlhnwY0YFy4z0fJB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUz-00Gy9H-0c;
	Fri, 27 Oct 2023 18:23:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU2-00GxAV-0E
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7QvlKvGCf16Xr+uDo8e13B+5xMJ1JYvNFtX+dCaVrEc=; b=JWSO4ml5UfMvLvf6aRiz9adXfC
	KwCu6vDvwDYgWoIOTsbA0BbpLv1Zt8+egDypduTiV66nD8N7zDuOo37hkkmoRlXIfhjOqqJzJM/bo
	XWl3qJGwstVHyQExK3hcwPUHE8ceb0VNtWATf9mtA/1MNxMnmSVoNw8HTVdMIqc/KBFESt7rftBJo
	WtaGKsWlzk0znoY+X4AH0tGgpR6YYRFpziNOevA59OOfHPUN5+OWHGbHjllikq+PohsRRmt4gLwtO
	XvYU+F+RQC5in2NuJb8VQTQ2TSOjSxFlETJSQhZD5gRqLQPZUlWMcT12IsBVpNu7H20tXqh6cwC8J
	SP2PgajQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTv-000uVO-0C
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:56 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04fb79246so1711617276.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430961; x=1699035761; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7QvlKvGCf16Xr+uDo8e13B+5xMJ1JYvNFtX+dCaVrEc=;
        b=y2b25pvHmGSTpTbkRifgOzU4g4oKbHRj4YtNXs9VdfXw6HpS0l/GZr3I5xTR4beNR5
         baaSoglwfheOflvfy57IIm1A9DJO7QoCXlxknmAmNA05iZApxkIaBYMsMzTFeL37aet/
         BIaxcfad8KJ/D5hSUDqb+nBM/Dp/P09CnKdQBto9WSfrbFsng8uOx8SHUcsCn4vPXXgC
         Nyo/pndGvdWKXkvu4JdtwatuI6BitG6Ij7NUPuJ/mMf+efskLuZc/mkq00JmnFgh7qZA
         Og/KJHj7g7CvEllS4OaNEH7EZ1w78ke9+O4yognXFvQ9GPYhVGGW5lsnD+zcj75yB2JV
         eAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430961; x=1699035761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QvlKvGCf16Xr+uDo8e13B+5xMJ1JYvNFtX+dCaVrEc=;
        b=J/4Ghfv3zcas0U00BZ0YyirzVwiV4ly2SiR15Zh2j3kZKbJlSBD5yBjHmx4BJNIBDc
         4Wx+RKFWtW5k3yJBGJVmfS2CdNy1lkHn+CIlHQzp2GFZ2hrM6cLmhnUfAKVGw9rwAhaf
         ka28axgIXJDPC0owY5o2oDTFw2Tr4LAxh5lZ9jvkeA8wk23w9iI4KGWSqI17SNPJCiTv
         ta3pnfRryaNjxBkuZ4hD7eRnJ6J4GPXqPDP1Y4zJ7OoEmvnkqRoMsRQkpe15B9F+leHC
         4Ra7DnR9Y3l8Dh1btzzyCPtu2EEEA7HHaaeUCDdOlMHelOS5KxU8yI0hVoFO2lNGNn9i
         4Q+Q==
X-Gm-Message-State: AOJu0YyUqE7uoJ/juaticSEGIK6Hu2IXaeKmxgUeKHdPWGdcgHohoQcw
	6G6Xc0fjHhvErZjr71MsBGYxy4EqKfQ=
X-Google-Smtp-Source: AGHT+IEGteVk64WoocowFgc++46Ydn1QrcnOyupSkq+rT/SBtiB9CXAW8K00cqUCj/t8cf8Aji8XyxJUQTQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:abe2:0:b0:da0:48e1:5f46 with SMTP id
 v89-20020a25abe2000000b00da048e15f46mr66725ybi.9.1698430961446; Fri, 27 Oct
 2023 11:22:41 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:50 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-9-seanjc@google.com>
Subject: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192253_004870_9B006F1D 
X-CRM114-Status: GOOD (  23.96  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
information can be supplied without setting userspace up to fail.  The
padding in the new kvm_userspace_memory_region2 structure will be used to
pass a file descriptor in addition to the userspace_addr, i.e. allow
userspace to point at a file descriptor and map memory into a guest that
is NOT mapped into host userspace.

Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
makes detection of bad flags a bit more robust, e.g. if the new fd field
is guarded only by a flag and not a new ioctl(), then a userspace bug
(setting a "bad" flag) would generate out-of-bounds access instead of an
-EINVAL error.

Cc: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++
 arch/x86/kvm/x86.c             |  2 +-
 include/linux/kvm_host.h       |  4 ++--
 include/uapi/linux/kvm.h       | 13 ++++++++++++
 virt/kvm/kvm_main.c            | 38 +++++++++++++++++++++++++++-------
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 21a7578142a1..ace984acc125 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6070,6 +6070,27 @@ writes to the CNTVCT_EL0 and CNTPCT_EL0 registers using the SET_ONE_REG
 interface. No error will be returned, but the resulting offset will not be
 applied.
 
+4.139 KVM_SET_USER_MEMORY_REGION2
+---------------------------------
+
+:Capability: KVM_CAP_USER_MEMORY2
+:Architectures: all
+:Type: vm ioctl
+:Parameters: struct kvm_userspace_memory_region2 (in)
+:Returns: 0 on success, -1 on error
+
+::
+
+  struct kvm_userspace_memory_region2 {
+	__u32 slot;
+	__u32 flags;
+	__u64 guest_phys_addr;
+	__u64 memory_size; /* bytes */
+	__u64 userspace_addr; /* start of the userspace allocated memory */
+  };
+
+See KVM_SET_USER_MEMORY_REGION.
+
 5. The kvm_run structure
 ========================
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 41cce5031126..6409914428ca 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12455,7 +12455,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	}
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
-		struct kvm_userspace_memory_region m;
+		struct kvm_userspace_memory_region2 m;
 
 		m.slot = id | (i << 16);
 		m.flags = 0;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5faba69403ac..4e741ff27af3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1146,9 +1146,9 @@ enum kvm_mr_change {
 };
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem);
+			  const struct kvm_userspace_memory_region2 *mem);
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem);
+			    const struct kvm_userspace_memory_region2 *mem);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 13065dd96132..bd1abe067f28 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
 	__u64 userspace_addr; /* start of the userspace allocated memory */
 };
 
+/* for KVM_SET_USER_MEMORY_REGION2 */
+struct kvm_userspace_memory_region2 {
+	__u32 slot;
+	__u32 flags;
+	__u64 guest_phys_addr;
+	__u64 memory_size;
+	__u64 userspace_addr;
+	__u64 pad[16];
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
  * userspace, other bits are reserved for kvm internal use which are defined
@@ -1192,6 +1202,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_COUNTER_OFFSET 227
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
+#define KVM_CAP_USER_MEMORY2 230
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1473,6 +1484,8 @@ struct kvm_vfio_spapr_tce {
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
+#define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
+					 struct kvm_userspace_memory_region2)
 
 /* enable ucontrol for s390 */
 struct kvm_s390_ucas_mapping {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6e708017064d..3f5b7c2c5327 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1578,7 +1578,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
+static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
@@ -1980,7 +1980,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
  * Must be called holding kvm->slots_lock for write.
  */
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem)
+			    const struct kvm_userspace_memory_region2 *mem)
 {
 	struct kvm_memory_slot *old, *new;
 	struct kvm_memslots *slots;
@@ -2084,7 +2084,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem)
+			  const struct kvm_userspace_memory_region2 *mem)
 {
 	int r;
 
@@ -2096,7 +2096,7 @@ int kvm_set_memory_region(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(kvm_set_memory_region);
 
 static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
-					  struct kvm_userspace_memory_region *mem)
+					  struct kvm_userspace_memory_region2 *mem)
 {
 	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
@@ -4566,6 +4566,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 {
 	switch (arg) {
 	case KVM_CAP_USER_MEMORY:
+	case KVM_CAP_USER_MEMORY2:
 	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
 	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
 	case KVM_CAP_INTERNAL_ERROR_DATA:
@@ -4821,6 +4822,14 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
 	return fd;
 }
 
+#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
+do {										\
+	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
+		     offsetof(struct kvm_userspace_memory_region2, field));	\
+	BUILD_BUG_ON(sizeof_field(struct kvm_userspace_memory_region, field) !=		\
+		     sizeof_field(struct kvm_userspace_memory_region2, field));	\
+} while (0)
+
 static long kvm_vm_ioctl(struct file *filp,
 			   unsigned int ioctl, unsigned long arg)
 {
@@ -4843,15 +4852,28 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
 		break;
 	}
+	case KVM_SET_USER_MEMORY_REGION2:
 	case KVM_SET_USER_MEMORY_REGION: {
-		struct kvm_userspace_memory_region kvm_userspace_mem;
+		struct kvm_userspace_memory_region2 mem;
+		unsigned long size;
+
+		if (ioctl == KVM_SET_USER_MEMORY_REGION)
+			size = sizeof(struct kvm_userspace_memory_region);
+		else
+			size = sizeof(struct kvm_userspace_memory_region2);
+
+		/* Ensure the common parts of the two structs are identical. */
+		SANITY_CHECK_MEM_REGION_FIELD(slot);
+		SANITY_CHECK_MEM_REGION_FIELD(flags);
+		SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
+		SANITY_CHECK_MEM_REGION_FIELD(memory_size);
+		SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
 
 		r = -EFAULT;
-		if (copy_from_user(&kvm_userspace_mem, argp,
-						sizeof(kvm_userspace_mem)))
+		if (copy_from_user(&mem, argp, size))
 			goto out;
 
-		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
+		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
 	case KVM_GET_DIRTY_LOG: {
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
