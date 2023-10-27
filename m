Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA348C25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOO0cVJmGcUJlWK3+radnPasJj5LpPxzpNOUcWL4rW0=; b=PTwG/eTbDEYlYV
	mYtEjU2863q0iDmdOT0VpNJRQW2qu+W38SvzWcoocCSc15qz7l4CJJk6Q2ew2RC+Cp1+pJv5YM0RR
	GFqOXayMsKPyAxp/WuBV1aDyH6WihFcFZQ6Fexst/pGJ7jv+6wffBW3veVyFkhbYqUKaGLvLKQd3p
	DhAmY0WyTwP+G3L2f5Se+EO7jj6LXn+NDftaoG9g1zcFtAn7/Pj5x9bsLlUSbnufooBYMoH7JCsPC
	8/NkaPhJbPeUc0r2vwVhj0Gtgj84zef3Yz0/QYE61ijHzoi4Yt23ZZ4k1JUDBtP5aS3cLnH37mtOh
	4ksnbqvi0i1DlECRLrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSYi-00H681-1U;
	Fri, 27 Oct 2023 19:31:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUS-00Gxdr-1O
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yVf4MoQ+pgFottQ0gtqF7KbCgtXqLOOMhwiDUmO9tI4=; b=QbuyVt0KuCfVET22VPbHrw8Gg5
	tePx6isIyhdvv2rVx29kb8SSzjLy7bYkHJ1I+qFCfKtJEceclGLtvoTuwKax8PP6y56Sd7bHUGUNS
	kjceEWa3OX3aBClppPhGx/f0NSJK4dHreWK0b7UZLJJZM3dUqyZnkpfW23NAfVg2aNmjD8q/LCSKk
	ypujdJHradZSAvW9dpNy5b99e6Hsi343SQHK2GQcapt94Zssa956KHIDHzBvyqgwCoxSQ/anObISP
	NArzR9yNJoTe5aKBkvotVW9+t5AX0AP00OmGpHT3+3bJsUTG9G6WniYE4/BuAu1Pe4+fwr3Pq8Koq
	XbfCTTzg==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwRUP-004tBA-83
	for linux-riscv@lists.infradead.org; Fri, 27 Oct 2023 18:23:23 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da0cb98f66cso1259601276.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430999; x=1699035799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yVf4MoQ+pgFottQ0gtqF7KbCgtXqLOOMhwiDUmO9tI4=;
        b=PZ0apWYzhmgcVbdkT7yueAvthfIwsYjVct4X9LEHFwQ5jHb9Y3AF5e49DBN6molJYT
         stgREGAWUBuDusy1vdxnFbCII0cFecJ7jLn1lIj75+PmqGdfSQYNW+SkZuFlLsEuxzFK
         yd4zyxrjDdoYu7xk8jseV/i8PmAMMSrsD1yWglRHGCRWJPQz4M+J/uzFOle+K2iZp3HT
         hnifnzQTYx8Dub6ooEXXAd3SwQhBF5xN6vO2Qna2ioLvPy3hFNfw6l5n8A6hgpvkzkFX
         dy1BxjDOejl8QZNF4gabUIKiSTbf8dv4V1KVJR1jYcYOvCAdPiuOTTRuGE2VqBfJ2Zgn
         BRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430999; x=1699035799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVf4MoQ+pgFottQ0gtqF7KbCgtXqLOOMhwiDUmO9tI4=;
        b=Tjg8HkgLntpLebrfylelYhMHH7iac8XqAb99+GPJS+nwszWy16FO1hAXwgFgpyQYO9
         w6W5V7kNRWMEdY4F/1zogrb41Ats/e4Aq3TsrFtfvmN/Y081aKy6CgD8G63NhdpQ7Vx9
         6+0KrgWbivz7AFF/+UANivxm0hT7Src92uzegk2PWHsOjzYpP0g7fiPb5MV567qaWq3A
         YVVY7Q0GyFRixlq8NEPa54clms5cc9W4ttXRkyH+guRWmxSeh2BsFlBY+TnxByvQ3Eqp
         lI0arn+ESiRqnNXEFK2/XmPur3AxaywvvU16oEFzQSyfmvOtIW21r5oGZIEshWBo1x8c
         DiXQ==
X-Gm-Message-State: AOJu0YyvwBvOGrPJ/wS3OxUmFRZ7ns3gcILHJoMDEwyVNhGWH8AbjTts
	sMgJw+UoxuoYjz6jfjIct5BPMufMMuc=
X-Google-Smtp-Source: AGHT+IG9XwjMpXerybQ74hZWKPyWlQIkLL60UP7vz/JRGdDaUmVGZC9suFSomOjVdAtgwjkxyK2jTqS148U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2fce:0:b0:d9a:f3dc:7d19 with SMTP id
 v197-20020a252fce000000b00d9af3dc7d19mr60503ybv.11.1698430998960; Fri, 27 Oct
 2023 11:23:18 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:09 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-28-seanjc@google.com>
Subject: [PATCH v13 27/35] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
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
X-CRM114-CacheID: sfid-20231027_192321_296043_CE27D1FE 
X-CRM114-Status: GOOD (  11.26  )
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

From: Vishal Annapurve <vannapurve@google.com>

Add helpers to convert memory between private and shared via KVM's
memory attributes, as well as helpers to free/allocate guest_memfd memory
via fallocate().  Userspace, i.e. tests, is NOT required to do fallocate()
when converting memory, as the attributes are the single source of true.
Provide allocate() helpers so that tests can mimic a userspace that frees
private memory on conversion, e.g. to prioritize memory usage over
performance.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 48 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 28 +++++++++++
 2 files changed, 76 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 9f861182c02a..1441fca6c273 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -333,6 +333,54 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
 	vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
 }
 
+static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
+					    uint64_t size, uint64_t attributes)
+{
+	struct kvm_memory_attributes attr = {
+		.attributes = attributes,
+		.address = gpa,
+		.size = size,
+		.flags = 0,
+	};
+
+	/*
+	 * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
+	 * need significant enhancements to support multiple attributes.
+	 */
+	TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
+		    "Update me to support multiple attributes!");
+
+	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
+}
+
+
+static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
+				      uint64_t size)
+{
+	vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
+}
+
+static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
+				     uint64_t size)
+{
+	vm_set_memory_attributes(vm, gpa, size, 0);
+}
+
+void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t size,
+			    bool punch_hole);
+
+static inline void vm_guest_mem_punch_hole(struct kvm_vm *vm, uint64_t gpa,
+					   uint64_t size)
+{
+	vm_guest_mem_fallocate(vm, gpa, size, true);
+}
+
+static inline void vm_guest_mem_allocate(struct kvm_vm *vm, uint64_t gpa,
+					 uint64_t size)
+{
+	vm_guest_mem_fallocate(vm, gpa, size, false);
+}
+
 void vm_enable_dirty_ring(struct kvm_vm *vm, uint32_t ring_size);
 const char *vm_guest_mode_string(uint32_t i);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 45050f54701a..a140aee8d0f5 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1176,6 +1176,34 @@ void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot)
 	__vm_mem_region_delete(vm, memslot2region(vm, slot), true);
 }
 
+void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t size,
+			    bool punch_hole)
+{
+	const int mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
+	struct userspace_mem_region *region;
+	uint64_t end = base + size;
+	uint64_t gpa, len;
+	off_t fd_offset;
+	int ret;
+
+	for (gpa = base; gpa < end; gpa += len) {
+		uint64_t offset;
+
+		region = userspace_mem_region_find(vm, gpa, gpa);
+		TEST_ASSERT(region && region->region.flags & KVM_MEM_PRIVATE,
+			    "Private memory region not found for GPA 0x%lx", gpa);
+
+		offset = (gpa - region->region.guest_phys_addr);
+		fd_offset = region->region.guest_memfd_offset + offset;
+		len = min_t(uint64_t, end - gpa, region->region.memory_size - offset);
+
+		ret = fallocate(region->region.guest_memfd, mode, fd_offset, len);
+		TEST_ASSERT(!ret, "fallocate() failed to %s at %lx (len = %lu), fd = %d, mode = %x, offset = %lx\n",
+			    punch_hole ? "punch hole" : "allocate", gpa, len,
+			    region->region.guest_memfd, mode, fd_offset);
+	}
+}
+
 /* Returns the size of a vCPU's kvm_run structure. */
 static int vcpu_mmap_sz(void)
 {
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
