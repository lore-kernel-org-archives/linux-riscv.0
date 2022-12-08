Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE637C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N+DhgknRwlYxMTLi2poFDw0/51+kNHm5IyMBHbCbw6c=; b=qxU9gPCnNH0xZ/WJlQcURMp6HX
	44HPRpucSGl9lRkr7iCeP5POIJMxJXPsq5zh/2JKMcYKvzjq858iCbjERtka+CoGul+bFhMI1GYpj
	1CT4VxKao9kc3kJDUUEAWQ8fgj/z9zjNBt1fei4GpXv6d8m12TBHTx2hgcmOg9AIu/f2zr6Yrnt9g
	BltVpX6HjTBRXAGdq8IfXWGH4476b/+DPlVT+NQ6tm+2MxdVmoOsZIQc38mVRB87nqxf3XDhqpcYN
	ADRh3BsUhb+7UQVlT0So5Tedo5Ry1HJmlfVnUToRy6F3Y/u+nrGDWt555DFcU/LMAadRmNr0WY9Bh
	sK0wUU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NqD-00AxTn-NM; Thu, 08 Dec 2022 20:50:02 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjj-009rOF-0h
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:19 +0000
Received: by mail-pf1-x449.google.com with SMTP id bd20-20020a056a00279400b0057340fe1658so1744902pfb.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqhilQnjSVH+DKsiF3UuxsA3mWYraWvqkpSQiCn4mk=;
        b=iEvz84VootOQzL2fuUOye77ff0RBTUJwBPc/nCp9n7wqfMIJewYjnWs+e+UV8BdMIw
         elYqajuLHReDubNQsxzeD4LQOafn7i58BjesdxlcK+vzw+x1HQo9F7VP57LAnqtKoesr
         UywCJYsjvD0BlUoCSDFWtr6dHwgWaW3JtPzOAkFIkkT8WGiWMzZ2oAHhyStfBm7eJSsS
         38EqRrqfu/Bb+ppVcaHkYCPUXH92lKxDVFDbgcDFRtoe1sRIy80NzBB22C9JYr71mn8T
         A1Ozw0Mgmaj7KonevqN/mmVI3ivsgF7FtLFAmhFybNP5PHPBvBWnlJEVJf0pakv7c2rW
         r4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqhilQnjSVH+DKsiF3UuxsA3mWYraWvqkpSQiCn4mk=;
        b=8G1e8tby/y1xl8NbGmx5UhBAu+0roWon6kQK7f7I/a5LddwuIxlu44PBPqGxzlsP6P
         q/HLSD4Xxl4EJ2V3DNG5aZzNt9CdGB5NSy8BdFoGLHShQkd47JFsQFHnt+NV56iVjkf5
         xLIl44bVCPh2zVVy1mwRNRz8KVMxKe1XIYlOcUIMztnzaLv213KqJebXnnBghoP5fOT5
         k430AXi0YyAHzE44uvotRujbRK4HPUYKYPFo1zKUm18c/JNEWXFoUIMmL6ekwY84Igkf
         bCNveVfrzaeiKCKXldxvkjFCMvxN/H5LXbXasN6zDNWAw8aXQLsAVhZEri4wBCfZyEwp
         PAwA==
X-Gm-Message-State: ANoB5plf9cDNez6pF4DFFfdEbpB4FFSNf/rS91G3qySkzr8msBrjdKjR
	3dYfMsWLfQwhvfI1yQSZhSXfqV+oznwrMw==
X-Google-Smtp-Source: AA0mqf7eM5A3bS0eYMJF7BGmyZN+evZ/sdXM528vLtaTteWzbjmMBYJhb583jjAiLFnL4yHJF6g542RYvvvpWw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:1623:b0:577:4baf:f412 with SMTP
 id e3-20020a056a00162300b005774baff412mr10161002pfc.77.1670528352538; Thu, 08
 Dec 2022 11:39:12 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:23 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-4-dmatlack@google.com>
Subject: [RFC PATCH 03/37] KVM: MMU: Move tdp_ptep_t into common code
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_113915_086290_C254C484 
X-CRM114-Status: GOOD (  11.46  )
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

Move the definition of tdp_ptep_t into kvm/mmu_types.h so it can be used
from common code in future commits.

No functional changed intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 2 --
 include/kvm/mmu_types.h         | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c19a80fdeb8d..e32379c5b1ad 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -44,8 +44,6 @@ extern bool dbg;
 #define INVALID_PAE_ROOT	0
 #define IS_VALID_PAE_ROOT(x)	(!!(x))
 
-typedef u64 __rcu *tdp_ptep_t;
-
 struct kvm_mmu_page {
 	/*
 	 * Note, "link" through "spt" fit in a single 64 byte cache line on
diff --git a/include/kvm/mmu_types.h b/include/kvm/mmu_types.h
index 3f35a924e031..14099956fdac 100644
--- a/include/kvm/mmu_types.h
+++ b/include/kvm/mmu_types.h
@@ -34,4 +34,6 @@ union kvm_mmu_page_role {
 
 static_assert(sizeof(union kvm_mmu_page_role) == sizeof_field(union kvm_mmu_page_role, word));
 
+typedef u64 __rcu *tdp_ptep_t;
+
 #endif /* !__KVM_MMU_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
