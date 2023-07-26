Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF44C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LGHgBx9E7lJ2X0OIOmUwifPe/A9kL8Mb6I+u++U1TiY=; b=AVVQVpd1mp4be2kptN7A6bqvLm
	fh3MBXuJBizyTT0M9hacZeXJvVgmPWZO7EEgq+YNh7mK3KEQwhs5S8XEl9sFrm+GByJgwVl/mN8Ix
	kgDT9+jZ43JdV9ZOGUDtAgzzAL4ycERLhVoIK2uLYxyMc9Rb/HNrnZzPCD32XYfx6VCRxXYUAgPBd
	N18LVXgfcWuoTXtJ1GXPCUDwpBpxhJ7ULuQs1GZovPP7/GCZc76S7K9/W+9zN9iKK2iYl96xZ3YZJ
	BQwtxsJarSz9hk9uIyn5LV3lupVfWtcRltWMrY4rrQDaK1MRV3XNlWa5zIjSs+5w67ZuusUQognmw
	r5/S5/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOl1k-00BTSy-2e;
	Wed, 26 Jul 2023 20:22:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOl1h-00BTQa-29
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 20:22:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d05883d850fso141321276.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690402944; x=1691007744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wk8YN2z9DygnTN7wIkQ/drKhQeRLfAOWaFSkpwIJ9VA=;
        b=eM8gatpIFAPsVcHsvCyPq5hyC8MsN3TVlS3mNniSEUN+A8XGjxiS8F6dC4aFmL513/
         OKqKBd4JNqQZqMKS0xCiGe+t5AXNUTDm2VuHrYqk4zFosWdPFjPIB6URfw5vd93IMKdx
         lKXXLluLhbwl+YjfsuqRPKzKU2+mG/aerZ1RHkgGlaQ2XngSQ4QWGzUzw8Bk02VhX6BY
         iemdbo75Y0mm9KaGC6Z479jAT6buL5FMFb75fU2ROzDvErIFsnjLxci0m6st5PC1U67q
         6FdRgc7HGPP7DF/FaK/f0cWfoJ+ZjAfbcmtP5i/qUasNowuJ11SfJCK8qdGxq6HB8Y5C
         RWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690402944; x=1691007744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wk8YN2z9DygnTN7wIkQ/drKhQeRLfAOWaFSkpwIJ9VA=;
        b=Ha4nPSMYaoo2c7nA5SQlUXl6zBCxG4Roxa7TIyVBpizhLsD6+Z1Hz/obfooOIKUwMF
         1bm3rOP9sTf7Jq/VuSfvu9RXyTP9zF1/dCZuW9ihy/IqdZnwjmDRKGs1rSG5sp2qKfY6
         PHcVaH1CEPiVpVT/MZqk9hTELNTeX2WtePWTXVZO8Qke5LDuLX6z0rCWF6JQCzjBep/0
         nEBIJq3e/fZwNGvpA+trJntJ87kf71JrdM3bhstrnof2mqCSsC6mBenqB2C3HvhIQQB1
         G0yzpC4Tj8JILoGg+CT5BYo+gXbsUtksR/4BmHSqZe/skP3sRU1D0IMDndCoFOYSdMPQ
         3i/w==
X-Gm-Message-State: ABy/qLZIXxc9c5maKOP9DfkQ0iitWZwNeZnYNSZ+nIjFsRMBF3q6kbqz
	tMQFlvFrCVUc7mXmwPpilZMqVgUar+0=
X-Google-Smtp-Source: APBJJlHa4e7bNU/FXY+wuV4M+6WYSA4uQsVmjVu+paqFG49PZpexPl+XQpMgzwVCSNNiruIZErv3dNdZQXc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:cf48:0:b0:d06:1a77:7d2 with SMTP id
 f69-20020a25cf48000000b00d061a7707d2mr18632ybg.13.1690402944082; Wed, 26 Jul
 2023 13:22:24 -0700 (PDT)
Date: Wed, 26 Jul 2023 13:22:22 -0700
In-Reply-To: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Message-ID: <ZMGAfvzEkVphWPdZ@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_132229_705420_52C820C1 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Jul 19, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> > +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));
> 
> I think these should be static assertions near the definition of the
> structs.  However another possibility is to remove 'raw' and just assign the
> whole union.

Duh, and use a named union.  I think when I first proposed this I forgot that
a single value would be passed between kvm_hva_range *and* kvm_gfn_range, and so
created an anonymous union without thinking about the impliciations.

A named union is _much_ cleaner.  I'll post a complete version of the below
snippet as a standalone non-RFC patch.

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..9125d0ab642d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,11 +256,15 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+union kvm_mmu_notifier_arg {
+       pte_t pte;
+};
+
 struct kvm_gfn_range {
        struct kvm_memory_slot *slot;
        gfn_t start;
        gfn_t end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..f84ef9399aee 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
        unsigned long start;
        unsigned long end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        hva_handler_t handler;
        on_lock_fn_t on_lock;
        on_unlock_fn_t on_unlock;
@@ -547,6 +547,8 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
+static const union kvm_mmu_notifier_arg KVM_NO_ARG;
+
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)         \
        for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -591,7 +593,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
                         * bother making these conditional (to avoid writes on
                         * the second or later invocation of the handler).
                         */
-                       gfn_range.pte = range->pte;
+                       gfn_range.arg = range->arg;
                        gfn_range.may_block = range->may_block;
 
                        /*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
