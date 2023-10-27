Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F79C25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huAc0tHQgNc1+FWrPe9l5cqRQnlohbnkvSS6cj3ZHFo=; b=fKTw6I8PFqxq2p
	JCzP4Fm0f39PKymOvBsdmkq4lkKx/cFoDoQOLWhUu3jJKNVEeX7loF/6/l1w1ulh3CDDhj2r6oSnM
	w1xIRxTxJoESmvGe8u1stpFxHMvyLV9WjCH6v2LtDLNIMg3wguGggQE4llAWyjrPkD2vbCN9fZLnA
	Y7bSoPZZdoNj7lZev6b1abXm1b8KETRf5ySb6n03qHHaw6ZCAtOmyRqoCwW9U1kBOuyHB2G6Bp8DQ
	iAX83IToGh+TuBQ8cQeSBR+AFmjd4X3GTRJyJgKsgO9aCBMzyt49eQU8xW+bE5pLSvo6uUcbYuo69
	mEup55TLga3DKe4uRHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSXs-00H5NM-0a;
	Fri, 27 Oct 2023 19:31:00 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTu-00Gx1l-1m
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59b5a586da6so22562347b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430969; x=1699035769; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MfwjFnr1wNHEBMs743caMc0qlRTo5HMEnN08vNH/OXQ=;
        b=PE9VtZTS+hWfzU76IC6a6SpVUlI/n1OIF78g3qcpWaBlkKBHdosM7YqhXltCB3U7N4
         2xorRngZOR0Y+c1QB2AqRW1MSea7N7VqGYhszQvjmhoZtdnNO0ii6u7iR/1KB86XoGfm
         ioeou3Aad98tdzCL5DNQwNv/Bb6HqE+J8femYqX4o9GfvZ6FyPVEZJG1rBgn/qrg2CC/
         ebu6FD2igR+6z7PVF6J0dZjc9z9034FTwWt9dbsi3x7sHfZvLW1D5mifQYwdywYmkflj
         GhMY9InGeWMEtL3MiHNQpP0malE8qZxfpDEOtDI8jSu7mQhjlTaLSgJHXK1v+SINB0Qz
         oqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430969; x=1699035769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfwjFnr1wNHEBMs743caMc0qlRTo5HMEnN08vNH/OXQ=;
        b=or2WvHul7mHkc+lZnxoNfeDntSUhT4c7mHCAY4IDoRqXQJIabVqeBMXCDgO37jhyLz
         WmbmG6PMMOuXAxSsf1IoulCNcICN1B2DNIyDPF/VNTi5uFziKUw/0kPdnjX3XHBZBH2g
         JSEsIdNifrB98PdtlKMyMD1IfaP2z3aYHUbuiweyZEtk4DNa7jSvJa0kGWvzImYe+Mth
         u6Zk34NQZVblbURwX2GP+qOwxqqRNGlHt26vHr369owsWgaXBTiiaprVqVB9xdXB5Q8N
         T58MULeZmZmGz7mjZBLt5cJPGWDf4DiI8y033oz3InDzmu31EhTf3tEs1sxG/2wvVySO
         Tp9g==
X-Gm-Message-State: AOJu0YwYImm18eppaRW+umOHHmq8cYeSnIg+uFmviz+OsCELU+FgD92h
	8gCyLWBt112qnG2rXBi32z+AcEwHS6o=
X-Google-Smtp-Source: AGHT+IHtw6A7NuD1zDZw/j7xBoNpID5PTLHCLxD7YeudY/tlgoiYGQdJN9iuOebDV/xY0oQ2kV5qeLUK06Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:59b:e663:23b0 with SMTP id
 m15-20020a0dca0f000000b0059be66323b0mr102868ywd.4.1698430969394; Fri, 27 Oct
 2023 11:22:49 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:54 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-13-seanjc@google.com>
Subject: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings in
 mmu_notifier events
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
X-CRM114-CacheID: sfid-20231027_112250_593973_C9B0A6E6 
X-CRM114-Status: GOOD (  10.25  )
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

Add flags to "struct kvm_gfn_range" to let notifier events target only
shared and only private mappings, and write up the existing mmu_notifier
events to be shared-only (private memory is never associated with a
userspace virtual address, i.e. can't be reached via mmu_notifiers).

Add two flags so that KVM can handle the three possibilities (shared,
private, and shared+private) without needing something like a tri-state
enum.

Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 ++
 virt/kvm/kvm_main.c      | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 96aa930536b1..89c1a991a3b8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -263,6 +263,8 @@ struct kvm_gfn_range {
 	gfn_t start;
 	gfn_t end;
 	union kvm_mmu_notifier_arg arg;
+	bool only_private;
+	bool only_shared;
 	bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cb9376833c18..302ccb87b4c1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			 * the second or later invocation of the handler).
 			 */
 			gfn_range.arg = range->arg;
+
+			/*
+			 * HVA-based notifications aren't relevant to private
+			 * mappings as they don't have a userspace mapping.
+			 */
+			gfn_range.only_private = false;
+			gfn_range.only_shared = true;
 			gfn_range.may_block = range->may_block;
 
 			/*
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
