Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B171BC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:27:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B1560230
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74B1560230
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afV6/gHvwmVkq9sTnj+fIOfSln4X7Ef5YQdkQgoKe7s=; b=eLbDIEOZfqYL+2
	OPz5X4a171idwuspFVUTGf2r+gExV7b4V1T238HBn68aeP6C0+mkPg38PJbcHFcapqcL6lc1HeIGb
	lobcRNgUBuWqozON9Lc+z0ICHKHTjhnmm9t2CYLdQSIaVKrisQxP8aIARvlcAJeHxp1gx2W+YDRlg
	LUTSAYuwGRYepUf871VcA7Y3gdof/vj+X4xps09EZHDYUc6QaLSyBHr/ppsOf2Q0j3Gl+ITTc2sfu
	ig7pcBXVTVnLJ9w2dMZr5r1YPQ34QfscJstKxIX2noRPjhcVAC9coYLMELYuTNcP01B9x821gxrMs
	Q2Fsh8CupQFtclPdxQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQbE-007DK9-E4; Thu, 04 Nov 2021 00:27:24 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQZw-007CXk-Eg
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:07 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 76-20020a63054f000000b002c9284978aaso2389169pgf.10
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=uUiF2cCeyvLcomA71gNb8UtnumiDOcYwDfMiXjWen6E=;
 b=oTQ7zxZOtJdIWwrRYuqPf1zjANoRXpGs4d18yx/1uFcULOqfGSPv/eGnnTHt2OaFXl
 Fw2Ja9jpx42JTWA+4xQHXaSDJzaLjB39qn72mpFaq/+8Pgyy1WE+Sui5ukzf7K0T1tch
 WQUzSIOcUqQ4RYGuYqINyp9t2Du3YpUpxuubgXkNzI9EfzqleZjWAUTMgOc4YeGCZQie
 KXx3n4rodQ4x96mmNgtB9r6T1WA9dTicsSrUIx+if+mPJuWUWAF+djp3CD78xEHLczgf
 /8ph947YIr/9EVIDN0A2sn1MabQLXDCtd3nrNdsi57mxIxM3VfxgHreQqgiovSN/aw02
 N1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=uUiF2cCeyvLcomA71gNb8UtnumiDOcYwDfMiXjWen6E=;
 b=yuXnBPvqpplheWiHgS2pGp4YMcNDtpwzCYfy4rXOyvoJZ/HqG+ISX+3fp2p3vhKVJK
 a3VBhImRCNGJtVLScuFCDhAQyHGy2znEl+0Lk6WiaQXFmx54ho2FWLX7kj0O97rDPcmo
 Q0wjURSjGD3tTDzQ00UqJGs2GqH0gBp3EbwZnvORnfwnF1GfsIlInq6wBvxeuiGD+vQ2
 4MmX66fYBA6j0AaZvqKiz4fIZw2ug74AiOKTudv81xZ/D5M00fdtnOwcoCm6/1HkJy3L
 v+N5oJAxoiVW6xb+INm/7Jtal8DgDi4nqLua/Zrax92TinGc0l4IwaHh+KIveZmawx/w
 TTXQ==
X-Gm-Message-State: AOAM531A643BrSkMzogCKmEZ4r0Zlp/jI6SGuZFZ+QMLBu16CumT/0Sv
 +/+chBKhDM6xItyYKTkQO/CyzZpEhAw=
X-Google-Smtp-Source: ABdhPJzS1sKm1vihVbRPixin8ADPxwIwiRu+sSSO0iFE9jTmdDmiJb4scGZK4H9WqPr37m1ISOQPandeoog=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2181:b0:44c:f4bc:2f74
 with SMTP id
 h1-20020a056a00218100b0044cf4bc2f74mr47622932pfi.68.1635985562987; Wed, 03
 Nov 2021 17:26:02 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:04 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-4-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 03/30] KVM: Require total number of memslot pages to fit
 in an unsigned long
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172604_520258_4781E3CF 
X-CRM114-Status: GOOD (  16.10  )
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

Explicitly disallow creating more memslot pages than can fit in an
unsigned long, KVM doesn't correctly handle a total number of memslot
pages that doesn't fit in an unsigned long and remedying that would be a
waste of time.

For a 64-bit kernel, this is a nop as memslots are not allowed to overlap
in the gfn address space.

With a 32-bit kernel, userspace can at most address 3gb of virtual memory,
whereas wrapping the total number of pages would require 4tb+ of guest
physical memory.  Even with x86's second address space for SMM, userspace
would need to alias all of guest memory more than one _thousand_ times.
And on older x86 hardware with MAXPHYADDR < 43, the guest couldn't
actually access any of those aliases even if userspace lied about
guest.MAXPHYADDR.

On 390 and arm64, this is a nop as they don't support 32-bit hosts.

On x86, practically speaking this is simply acknowledging reality as the
existing kvm_mmu_calculate_default_mmu_pages() assumes the total number
of pages fits in an "unsigned long".

On PPC, this is likely a nop as every flavor of PPC KVM assumes gfns (and
gpas!) fit in unsigned long.  arch/powerpc/kvm/book3s_32_mmu_host.c goes
a step further and fails the build if CONFIG_PTE_64BIT=y, which
presumably means that it does't support 64-bit physical addresses.

On MIPS, this is also likely a nop as the core MMU helpers assume gpas
fit in unsigned long, e.g. see kvm_mips_##name##_pte.

And finally, RISC-V is a "don't care" as it doesn't exist in any release,
i.e. there is no established ABI to break.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 60a35d9fe259..d8e92d4a78d8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -551,6 +551,7 @@ struct kvm {
 	 */
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
+	unsigned long nr_memslot_pages;
 	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 83287730389f..264c4b16520b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1623,6 +1623,15 @@ static int kvm_set_memslot(struct kvm *kvm,
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, as_id, slots);
 
+	/*
+	 * Update the total number of memslot pages before calling the arch
+	 * hook so that architectures can consume the result directly.
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm->nr_memslot_pages -= old.npages;
+	else if (change == KVM_MR_CREATE)
+		kvm->nr_memslot_pages += new->npages;
+
 	kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
 
 	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
@@ -1653,6 +1662,9 @@ static int kvm_delete_memslot(struct kvm *kvm,
 	if (!old->npages)
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
+		return -EIO;
+
 	memset(&new, 0, sizeof(new));
 	new.id = old->id;
 	/*
@@ -1736,6 +1748,13 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (!old.npages) {
 		change = KVM_MR_CREATE;
 		new.dirty_bitmap = NULL;
+
+		/*
+		 * To simplify KVM internals, the total number of pages across
+		 * all memslots must fit in an unsigned long.
+		 */
+		if ((kvm->nr_memslot_pages + new.npages) < kvm->nr_memslot_pages)
+			return -EINVAL;
 	} else { /* Modify an existing slot. */
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
