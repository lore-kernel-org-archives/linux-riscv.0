Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F9AC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vocipAEofXYF1wGeIyY7h6IizRwjuhc+vjXkm4OAm/A=; b=e+WKckr9GIL5AE
	4pU+zcYfBDubLIxg6TwBewST3WcZemxYIeCxhO/pX6eMP2eHsd5vD4Uitclrd8GbISHOLt8C5GT80
	gLKI8UkUsufSLCZ5V87P6u/9qnT5z0qCYAxfpzzfDHM6BThEpRjMZHkeD3cR03qolkEgbfFtCLBf5
	+/fk1mV/EZktzUj8fWthreBedWzhOt2JE/Pel9jc7e6hlef3+mZLlaE2VPfs3W+nO+zSuGXgBc7dE
	X5ZauEsdDSglzBiJQ9CgVyIqnWT1AVTzYj/oBlquU4bRDdMcAYCXZoF979EIHmsSdw9zUp3T+/rRw
	mufoSGegpnYkgimlAtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sr-005cnf-0M;
	Wed, 19 Jul 2023 06:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sp-005cmV-1l
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RgixHOC4KKphqTDNjO+JFitY6BYM03Mxe9+IG67pQW4=; b=aSoWr03BPgqBWdU4aK0h40iEM0
	62KHWi0H8ztYmQJTV5bMPCKcbqMUcwimlRwjKyTjB4aylYYop29N7q7cnKfNP0caqefcLDDnHgZwV
	u/TE02kN08Z7g1IU4iCkwihapRqWB/IA6O1j/2ry7XEr56IiyJ2YzIX0H/v1RgJYum1X0bWzZv0b+
	fWSH6i4SZMRdi/0bLx6A3b8yywz9fPoGcgN2V68c73/bh57I3D7uKT8twuhdQywZ006Oixe2YeQL0
	a5dbaVKHd0Q3jKC4UqIjOXBifnAbN2ieYrKBSBeqmz6gIoMUiaug7a67IPyvSApoMdJfbNh/iMBBx
	ZgyKM9FQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLuSE-00CFP0-0k
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 23:50:34 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b89f6463deso48815675ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724140; x=1692316140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RgixHOC4KKphqTDNjO+JFitY6BYM03Mxe9+IG67pQW4=;
        b=jr2fs44d+7BmMZPp9ybqRVhLe6DoUmnDVGGK/YxGf0Asu27qFmDOog5/7ezq8m4Ys7
         LB4TAF+aUXOU9vvZC3f7sCq7Qp6i9IPbi3VCM23iiZE2lWsjgfpk1UphaC4PromgcBa9
         nNuUO7C76a3+5q0Gf8ijV1dvvN0iI9MYocGBFlwlZWxo+oVA0VDDW9ZRP17wI+9kNKbR
         b/F5X7vtJ0QCTS7pjO0kMtxUEap2HU9N8Chl8h4VBmGvGutp4QtM3GkrHRbiuZH0RfDS
         Df8UlL/rj7lQEedr2TSELrHMasjkzJ51vXMKZpffeRoXHoSbQaRFODPANCOUb4yN0y8L
         ypGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724140; x=1692316140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgixHOC4KKphqTDNjO+JFitY6BYM03Mxe9+IG67pQW4=;
        b=NiRligH7qjzYIWHAVs3zlmYLO7l686qyHXPeMqzsZfBRcHUTiUlGpTFT2GURK76Ow8
         b7qTm58ByetTwm4PkYIS8GE1/ieB11E+QqvZsq0zeHkzX+s4AgU4VPYTOKztspR5WfNK
         zTm4nmaa1FyAnN8r1EFj3HfKRc9TO5N40LFHSfZqA5o2WBFmBa8bChgxP7XDEFgYV+7m
         sfQr0YIsRHtHLzknt6uBpZ3wGNgaUvmlhain+c3F6RAubotYbHce0eZ4tHMaTNTmOz3N
         dFGKr669L7ezyCMOcZe6rQ4a1Z36zQrkwA1uP+0japQA/7kylWsAspTmXg6AcdsqKpMh
         zswA==
X-Gm-Message-State: ABy/qLansXZLLS9erPXNmWhS/beL6u7dJvtFqI8AeDFaE1uDHJXJg+Rp
	LJO6/EWH56/FhmYhLOGcbjnzZCKYPDA=
X-Google-Smtp-Source: APBJJlGmnxKpuVWpCwuKlcGO555af6O2CzLSJLrftIAb/WXIRBmN0a0otiSNa7LmthtetMuC6YJJMcmnlto=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2cf:b0:1ba:a36d:f82c with SMTP id
 n15-20020a170902d2cf00b001baa36df82cmr7700plc.7.1689724140625; Tue, 18 Jul
 2023 16:49:00 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:58 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-16-seanjc@google.com>
Subject: [RFC PATCH v11 15/29] KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
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
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005028_478586_D5AA1104 
X-CRM114-Status: UNSURE (   9.19  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 -
 include/linux/kvm_host.h        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b87ff7b601fa..7a905e033932 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2105,7 +2105,6 @@ enum {
 #define HF_SMM_MASK		(1 << 1)
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
-# define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 # define KVM_ADDRESS_SPACE_NUM 2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0d1e2ee8ae7a..5839ef44e145 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -693,7 +693,7 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
 #define KVM_MEM_SLOTS_NUM SHRT_MAX
 #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
 
-#ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
+#if KVM_ADDRESS_SPACE_NUM == 1
 static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 {
 	return 0;
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
