Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15E6C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlgV+fyXAT7XH3ldCgeb9OCTw9U/FD0P3aTOkwJyju8=; b=EGXiysMpiVwzv1
	1UtF5HLgOa9GoEBeqD/fFCK7sUzOptOBJ3OLPLHpDpelBT4kNr4yoV6EFvAxrr41s3N/WURKKlKMl
	rLuh1v2t+qQ0ULSYxg6DHH1/PRAGYXT6hWLvTQV4sTscODUD7Ef5vKUMrnnbIgPHnjzokxVBBoW/S
	U/ZS92775KvQm6cnSkjcOXAGOEKQOuvJXkNG5AGm+Yn8T8LVou1jTS4JozYfGAXN37vRfCbkH02KC
	VXV/Hh/YSIaxRNcyAvZrOCdg9mCGJiiSvIZOGcqG3x/7sZLXrop25mz2tFhxSsNFeZ4MscH0LJkYv
	RI8w/Radf0zE9esnMlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRWB-00Gz2o-2P;
	Fri, 27 Oct 2023 18:25:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUH-00GxSs-2I
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o8gdvYQ3/1yqqCN7M6+cUJLwJKILjEFSh0R8bjlKI1I=; b=Afp8I4aw/XYKa0yZGz19xbNwtX
	zjvNIH9ZAGSSi+z/1Q0xHcbpK2PeoRr8TpXrJW+TI7RhLMkr5tELBBG5i1vpNXhzu4i5pSAWDoMT7
	2mo7TXDmDmgnVLBCc0x/jucKnhJWRXLXJydTu8dNTXpMCQgVKo6eiPNJHF3d8VnKjN0GISliiAJ8/
	fmpNJAdcebwsVKwWcwvhJRGzX7hCQ2iFM1EHv4iZEEo7zAoHXLXeihz11SzofD4OxiuBXCMnpLFKE
	l2WgGUL5j6crKIPhRf+F145YETzV+jt/lT262LCHdTJ/YRNnvJafzJxYNFcvdnKec9aMFWemwfNNK
	+wM4IXQw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUD-000uhB-0w
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:11 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc252cbde2so6362235ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430987; x=1699035787; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=o8gdvYQ3/1yqqCN7M6+cUJLwJKILjEFSh0R8bjlKI1I=;
        b=ys+YIeGEFALQxSkqN3AwlXMZuj/Y0AuENivjTPOmSL98oNmJd2XtxqBYE0In2yK0UB
         My/3oAFa7Ixh2prJ82zY+L4rN54yh9VNqt3FlaHslEEw0sCOF+aM/SgHGthrxCjxNuaZ
         Eg46MEE9O0D3RaE3E37RcRbjY+5vHUpr0SSf4nRPJ/OHi4wQxoMl0aELr4MUXjkIWs/w
         1Zk9XdkOB+a7BKVdRwe1kZcyKFUf/zX2x+3GSaV2JFjqOSvt3U6MdMq3jVt8p2erWqsG
         0c7a4k9pZMfdGS3ieNqGKhngX7TqvxzCNiLz4LtAzBn0INT2r19HCxdHsiacQ6WlSrcP
         vqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430987; x=1699035787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8gdvYQ3/1yqqCN7M6+cUJLwJKILjEFSh0R8bjlKI1I=;
        b=X3F/ysnia1/N7rZE7TAAUHpg+2G8qXS8fRKUJ3SXc7br2j+nxzcSDNAlXMB8RBRP3Q
         bxiEWEc3/zURg0ek6/1i6QmqJ+9oLW9IhIdcQfE+9HR6GfyK1OhZjMjC8nlmxl3n+hXQ
         62aqgKFeYgaQqmzZxTbsGHU/C+bM+0xmGb0xaRgMJpsKraoMxOhhABELPsUMx4nPm4fn
         EAjdX5Gnr+NwprdpF9NZVR1+ked/9pSQO/zzlQvxhbasC361dXPbiRJpQn9ahJrks80B
         Hx3PnV9MmfXt5XiiY20595WTm5EAAwFC9n1xE8b8XPcsFFnGWa3xNjvOd4yiRD5f6D/X
         2AsA==
X-Gm-Message-State: AOJu0Yx+PZpB1eBJQIPp3INopxmQepPrCn1mlMrHmxb26gxyA9uwzVLY
	xejGz9thAnnOqyxW2xqLkb2x7Ykcjvg=
X-Google-Smtp-Source: AGHT+IGxPKYh61YDaE4Ab16I5616FjNw5G/WLIOxqZ93NjDEP07jn0icTkqJBzjVXPbdr7XzvwkO91qMX/M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c144:b0:1cc:281a:8463 with SMTP id
 4-20020a170902c14400b001cc281a8463mr32544plj.7.1698430987435; Fri, 27 Oct
 2023 11:23:07 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:03 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-22-seanjc@google.com>
Subject: [PATCH v13 21/35] KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 macro
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
X-CRM114-CacheID: sfid-20231027_192309_400633_92305175 
X-CRM114-Status: UNSURE (   9.65  )
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

Drop __KVM_VCPU_MULTIPLE_ADDRESS_SPACE and instead check the value of
KVM_ADDRESS_SPACE_NUM.

No functional change intended.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 -
 include/linux/kvm_host.h        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 8d60e4745e8b..6702f795c862 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2124,7 +2124,6 @@ enum {
 #define HF_SMM_MASK		(1 << 1)
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
-# define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 # define KVM_ADDRESS_SPACE_NUM 2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3223cafd7db..c3cfe08b1300 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -692,7 +692,7 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
 #define KVM_MEM_SLOTS_NUM SHRT_MAX
 #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
 
-#ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
+#if KVM_ADDRESS_SPACE_NUM == 1
 static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 {
 	return 0;
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
