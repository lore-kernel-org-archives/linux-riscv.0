Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3A1EE0216
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 02:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlIrPMpMkO9AN4ZQaAeblAXFn1QOgMLSLdR/ZEYY858=; b=Hf1u14kg2Pw5aO
	Nroc3IodHwjGXmoSsA4tkJiYSbpjQcBAcvldcRkR6eIs2ZNETy3LM7MDjfmw48U3pAsOx6Wvb/+xS
	rmBV8hWz0Zy1qD2DgvPn6RayDn3CNmz2+SAe/888LnipSA5GohzJn50+OlzmThKOB4gUbjjb4ddRO
	DqPAkMpY3ccjmZtlAHmeLNjRZeQPEa2bZ3OEGWI4Vzb1k0+/LO7xKC8HdzP9HKuJtuPEUYNE/CaPB
	+tbBcCWNO2RBAGb1chauncUNK9EiInHH7HUc2MmbZzpfigvbXuRCgjQtIbujMlPhI1RrQMo7J7RIz
	6+mmwdaqbHwkKBwRCAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbeA-007739-0f;
	Thu, 14 Sep 2023 01:59:58 +0000
Received: from mail-yw1-f201.google.com ([209.85.128.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbax-0073jg-2H
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:43 +0000
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-592210fe8easo6715777b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656596; x=1695261396; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SX/tmvtGQjfAKzRzM0R+P9Auz7l4k5LFyR/Je4f49mI=;
        b=JiKgqRBya19jJLhNoTvDZHA64ILCBoj8+1XjVSl8vjbcM1wjpvcQFOyxrhQ5d3pXZ6
         pBO7X9iJeuxPWiTdcpuTixJzkuQcxg9t20LrdCfzXdfS61F5qfvGHqXeGy1IuKZtA5P1
         g4M9FIhi6bmeW9Js8HS/7OGKPl78M9BEeEPU1ybuYkwJTyvEx4DYdcRpLCB7TxdomNQp
         dQ93jmBIO83MGteBbSXTJuHhqwl4cqfmat8+bpLsfIjXR0GkI9BA4guiUOJZFG7OYARt
         CVf2W+yaYcMmebcvFTtn2rowmwYiJ/P77/W4BDIRAepdsOuXwt848BT/eA0zb5MEpdtF
         7Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656596; x=1695261396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SX/tmvtGQjfAKzRzM0R+P9Auz7l4k5LFyR/Je4f49mI=;
        b=PMKDT8ukJMaanOKUMLlfKtlX1NBgtbdT6iIpjHT2aOWDyWXfByqIzuU33+kUVdzA6q
         TjATE+Qxlt4liCDWwWHpFfxcP+09D3TgcPBuz0WehcwJAnZ8mSzqwN+Y0o942iSb098n
         gDiMsgfeq0lnzAVM6LHj5K9ZvrW+3fdxERxVLutsxWFDE1w6B/931pDPPg7f6u/MpaUI
         g9Uicw6BUqJUCjQNiJo798wqM4V8zCWIzHahjUos5wjI0wA+B1att69UTvKW+IHfCVKV
         1hEDfby2lsD303z9A0v/8l6Ey53nQU52rxdlG52EcVFLFvvb2Z4kE2OlHPGhOYflJlKd
         8e1w==
X-Gm-Message-State: AOJu0Yypp8CEl9k5SxQzHgg6VexYPC4T0Me13Rp+G15P6dS83kiCXiRi
	dsrQS+GnX7jui3Ol3kVtttO9BEJPcCo=
X-Google-Smtp-Source: AGHT+IHERRdQQcWN7mkCNgIgj9nlxuSe44izkSe/zW2QZGFwDrBBBoEw/nSNmj2b/8hHFzwPazIBLLDdPVQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:905:b0:d64:f7ec:6d5d with SMTP id
 bu5-20020a056902090500b00d64f7ec6d5dmr96462ybb.10.1694656596047; Wed, 13 Sep
 2023 18:56:36 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:28 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-31-seanjc@google.com>
Subject: [RFC PATCH v12 30/33] KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_185639_840341_A5330E91 
X-CRM114-Status: UNSURE (   9.03  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Chao Peng <chao.p.peng@linux.intel.com>

Add helpers to invoke KVM_SET_USER_MEMORY_REGION2 directly so that tests
can validate of features that are unique to "version 2" of "set user
memory region", e.g. do negative testing on gmem_fd and gmem_offset.

Provide a raw version as well as an assert-success version to reduce
the amount of boilerplate code need for basic usage.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  7 +++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 29 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index b608fbb832d5..edc0f380acc0 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -522,6 +522,13 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 			       uint64_t gpa, uint64_t size, void *hva);
 int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				uint64_t gpa, uint64_t size, void *hva);
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				uint32_t flags, uint64_t gpa, uint64_t size,
+				void *hva, uint32_t gmem_fd, uint64_t gmem_offset);
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				 uint32_t flags, uint64_t gpa, uint64_t size,
+				 void *hva, uint32_t gmem_fd, uint64_t gmem_offset);
+
 void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 68afea10b469..8fc70c021c1c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -873,6 +873,35 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 		    errno, strerror(errno));
 }
 
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				 uint32_t flags, uint64_t gpa, uint64_t size,
+				 void *hva, uint32_t gmem_fd, uint64_t gmem_offset)
+{
+	struct kvm_userspace_memory_region2 region = {
+		.slot = slot,
+		.flags = flags,
+		.guest_phys_addr = gpa,
+		.memory_size = size,
+		.userspace_addr = (uintptr_t)hva,
+		.gmem_fd = gmem_fd,
+		.gmem_offset = gmem_offset,
+	};
+
+	return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
+}
+
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot,
+				uint32_t flags, uint64_t gpa, uint64_t size,
+				void *hva, uint32_t gmem_fd, uint64_t gmem_offset)
+{
+	int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
+					       gmem_fd, gmem_offset);
+
+	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
+		    errno, strerror(errno));
+}
+
+
 /* FIXME: This thing needs to be ripped apart and rewritten. */
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
