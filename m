Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B60EE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Se+a013uwUKEYlcsexIa19r4XS7DyDPSHn+Cum/vxWM=; b=EpyibaOIuqrFke
	k9RhOXtNd/TtdvunIchPvbV4sDxO9M1NQP6dIGCxj76j14+Sly7bC50q0pMjzWHPgA8e8QLQB6ESz
	LGcFJybRQzqdOxBug/jO/zPz1Zwopz4RZD+EGuhQs74X7qmNe1z0iR1hl2hUd61XeLdwlxNW7CUgc
	8jWiVms9amHgeT3ngi8Lq12E/DxVeTBNnfJZB8nD7Uh4BAeoscaFepSjtCjHIEuOhq6RJifQ+rNTr
	0FmLl/JEig1Z++/ZtkD7h/18EwIP8zTmscc5FD/+NfYTlOatD+V2UqRi5WzXWXECJNaK7yKPqIIWC
	HXcRYlwmgX5ZuJl8zi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbd9-0075p2-00;
	Thu, 14 Sep 2023 01:58:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbam-0073ZP-3B
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TEdWNzKShragyniQ9J+Ve2p49++UXy1fA45JB0RVd2M=; b=dpndtheXLkKVYboLVIEEuWZAx9
	piKYunQpq2eBzx76l36+iE54N/0Yz9vU6PVmBfYrT/BOGXYdr6swr2hH3ZKTEJV43E+bJBnGT7Be1
	XwOCzfK67wuvi31DNpF3RUPOWcmOfH5GZWPkVXOMDUtVwSuJ198ToWz1szp89YAv9GII+ittrCaQH
	BWiMX+q6sm5wpDWo91uSTXKGMIWhzyupkkmVinY0xbIA6Dg3un5/j/bJJrttRzyQCT+CIzMdDeeaI
	evKRLlhfc0pQ1SWiTwlCpDYND2oIE6W2LeZveYGetGiJtalOkMUQKr/F61S5/VUIs6dKeaI7UT7Kb
	N3cW/mlA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaf-007TbG-1m
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:27 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5924b2aac52so6443147b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656573; x=1695261373; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TEdWNzKShragyniQ9J+Ve2p49++UXy1fA45JB0RVd2M=;
        b=39FWY/rwJopwN2cTQCj3NPq9KxzHRSeERi29xsZ7qKk5/62o7x3Acg93asEbGHABOl
         gEpzOJtrmfHXH+CnlWJLpEwGxqdvxyDdGEJzaleBSHDHUJh9jLSnkeHBBNF60BOwlwng
         z6L2LVm3CA0bcpED80l0d6cJGdoBiSOU1oHBsXObL1bz4/wCXy/hC42L0cMU8omqt4GZ
         l1OjsS1nB6CCRVxgUH3KXFiFD4NgeiQu0FiTJF1SPZDHjMQKRmr0Y7lGV3bQkdeCXo/d
         ooNGrsl1+gNdYGDvNp9mp8nlWj67IMteXzJQKptlibXYvAsN9nHfiRb1biqGhgromOXx
         i30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656573; x=1695261373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEdWNzKShragyniQ9J+Ve2p49++UXy1fA45JB0RVd2M=;
        b=erQLi8o5Ygl9MgMq1SjxLqbjNOIYoR6z8vkDB1CZvzrzxC6yfPFaXawbeUI5N2JXsH
         qrNXu81Resa38Pg8MF5OCJZEUbaYXroe4a82751NAgipBI7bvkZr3okzgXKU+xSal9IM
         wzv2adbgCjBEAsR3yL9j2AuvyZYmGkd1YbIMWyIUTnkfoQsI10fYGpGkMQRnqNsoYUJp
         jdDnl5cZMbn+5/AgIiPffMMXGKUoYcYsYFV3XwQPxGW9EZgWtAwkvKtPXRGJBmqBkjjn
         xrkrWlDs4QkrzN4FkqDNULtZZD5q5XSMtAKFEqDaOnsP5FisfOPaLBfLY+K2dVXaS0No
         CQnQ==
X-Gm-Message-State: AOJu0YwDqczR0hrjCpj/LN4Vsp6XTkAoL3G3dxpfe5JNb5qf0kG9HMFy
	lAXoD5MMZai7ALp2/g7t/pgXyswE4xw=
X-Google-Smtp-Source: AGHT+IGYm//r9vLVsRhCBexYLsW+kyUM6dthNH5+IPZo7SQZB/dk4at291uiQmKPgon5iad9USRf5MgW9tA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:400c:0:b0:589:a855:7af with SMTP id
 l12-20020a81400c000000b00589a85507afmr107415ywn.7.1694656573483; Wed, 13 Sep
 2023 18:56:13 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:17 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-20-seanjc@google.com>
Subject: [RFC PATCH v12 19/33] KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 macro
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
X-CRM114-CacheID: sfid-20230914_025623_467118_87FB2A50 
X-CRM114-Status: UNSURE (   9.83  )
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
index 91a28ddf7cfd..78d641056ec5 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2126,7 +2126,6 @@ enum {
 #define HF_SMM_MASK		(1 << 1)
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
-# define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 # define KVM_ADDRESS_SPACE_NUM 2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 18d8f02a99a3..aea1b4306129 100644
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
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
