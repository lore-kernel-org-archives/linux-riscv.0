Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D07C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 00:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C11361268
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 00:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C11361268
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzqEhxsILDYCC5Vr1B3Ra05Hx6Sj2K2e0PzdQd3KYKA=; b=oPbo+OvzyvsVOe
	w3ULNclW6eSu7UwG8sa83XeOrJgQdpwplee1syadJM4bbc4fv+K9v15YSA5Do+wjwMYbdzm4PCsfv
	f+DN/X3wL/fazmNO4D2VWw9mbcjf5eDF3JtYH+RG42QN8fh4Okz3vMoE9hhfXNBsBnHMYTCgmZO3r
	YTBIewYHj2h+NDB4ncWx9VBHrrmNpHzjB+gj+q39I9tnh0Ulj3RaiAgQtZBAGuZgSgkDSdzqmbv1y
	zDMlBKLtMVx4vB/i/Zp4aXI4YPKMA+Y7uBhKW+jJhK4tfOYXyB3O+d+YU6d+D/+AI/wbsUh2TEaHW
	4rTO5xv/CQQtx6fsLDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlKmr-009655-99; Fri, 12 Nov 2021 00:51:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlKme-009626-6r
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 00:51:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id u11so7153264plf.3
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 16:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7VoEwbSPzrTyOh3w99mGEcK1Otv61yXE8VpDyQ7XU/Q=;
 b=aR0iTUNTxKf6faFpqVLtDxLZ+Z93VjgfuMSy8Y9h3wnwVUTL/oHfhEOsrg0V7yOdYT
 7fq8GTKIKG9OH6zETAjAXEzMtYxKZ4n8vzmgKUi//wtyVazuE6xgdlSVa2YM1WXEZK7o
 ckgTdbQk1CrwriNKigDb1ZxyhMDgLtfKnE3RIVuAKQjcg2mMhNzjvwVYycKmLb0GnSZ1
 GYcRaJBvetbHNGisq5tuHOigfRUZHZConfP9luv9GZtaibkXsyjw/cHwj8DSAwBW3aaZ
 7VyKPKnacS2ZdpG3N5SRXdGPcXpnFm1QD3uLEDYX71FQ35qKY9q+/DI/dPGPqFGBB6ib
 ajeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7VoEwbSPzrTyOh3w99mGEcK1Otv61yXE8VpDyQ7XU/Q=;
 b=0dFstrMS5JIJfQNk/mkKBwV1KiwlQE3H0F74FKO4B3ErKlyzA86MhbQXSw5BJHAkuj
 dh67fPDrNuR0VZXtitYpbu03Invgti8hrn+vNMZHX5x5Bh9D3tZc0intc7mjJ1Qvg2Vr
 UnSjbGmbiMTCKJTaVsoEFd3FIbUpRWBsYl9NVkea4l/jcSeMFp3FMhoLdbVA2Owt8NQa
 I45dp+UxJqEY1/cZFUpN78NDvO+Hw2ktsBKhzrxRGfxSCQT/aNp7olwfpzjJ5UtoLUFv
 Bhq2NHnYvgtxf2rkNALM1R8eGpDrDyRZYNw1UMrZmTnJxKrblJGb53KfeN52+dAfx43d
 lS2w==
X-Gm-Message-State: AOAM532/fFl/MRQtPENbCGMc3UDI29QsGHNQgtyZ9f/+d63oSlAuOT7/
 agHaGEFJB/nvpq21fWA7JAw5CQ==
X-Google-Smtp-Source: ABdhPJxC4jGH9js/28DTzQpRvZ4IBLyKiJDKoUfHaiXaxCscmtOSb6+KYszrts8CNNHGQNLMJ/jO0g==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr12870593pjt.168.1636678268099; 
 Thu, 11 Nov 2021 16:51:08 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id s21sm4279773pfk.3.2021.11.11.16.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 16:51:07 -0800 (PST)
Date: Fri, 12 Nov 2021 00:51:03 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 26/30] KVM: Keep memslots in tree-based structures
 instead of array-based ones
Message-ID: <YY26dxv2kM3m2H7Z@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-27-seanjc@google.com>
 <5f5c80ce-9189-def3-9c50-d5a504925253@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f5c80ce-9189-def3-9c50-d5a504925253@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_165112_282690_5C010CF2 
X-CRM114-Status: GOOD (  23.68  )
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

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > -	/*
> > -	 * Remove the old memslot from the hash list and interval tree, copying
> > -	 * the node data would corrupt the structures.
> > -	 */
> > +	int as_id = kvm_memslots_get_as_id(old, new);
> > +	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
> > +	int idx = slots->node_idx;
> > +
> >   	if (old) {
> > -		hash_del(&old->id_node);
> > -		interval_tree_remove(&old->hva_node, &slots->hva_tree);
> > +		hash_del(&old->id_node[idx]);
> > +		interval_tree_remove(&old->hva_node[idx], &slots->hva_tree);
> > -		if (!new)
> > +		if ((long)old == atomic_long_read(&slots->last_used_slot))
> > +			atomic_long_set(&slots->last_used_slot, (long)new);
> 
> Open-coding cmpxchg() is way less readable than a direct call.

Doh, I meant to call this out and/or add a comment.

My objection to cmpxchg() is that it implies atomicity is required (the kernel's
version adds the lock), which is very much not the case.  So this isn't strictly
an open-coded version of cmpxchg().

> The open-coded version also compiles on x86 to multiple instructions with
> a branch, instead of just a single instruction.

Yeah.  The lock can't be contended, so that part of cmpxchg is a non-issue.  But
that's also why I don't love using cmpxchg.

I don't have a strong preference, I just got briefly confused by the atomicity part.

> > +static void kvm_invalidate_memslot(struct kvm *kvm,
> > +				   struct kvm_memory_slot *old,
> > +				   struct kvm_memory_slot *working_slot)
> > +{
> > +	/*
> > +	 * Mark the current slot INVALID.  As with all memslot modifications,
> > +	 * this must be done on an unreachable slot to avoid modifying the
> > +	 * current slot in the active tree.
> > +	 */
> > +	kvm_copy_memslot(working_slot, old);
> > +	working_slot->flags |= KVM_MEMSLOT_INVALID;
> > +	kvm_replace_memslot(kvm, old, working_slot);
> > +
> > +	/*
> > +	 * Activate the slot that is now marked INVALID, but don't propagate
> > +	 * the slot to the now inactive slots. The slot is either going to be
> > +	 * deleted or recreated as a new slot.
> > +	 */
> > +	kvm_swap_active_memslots(kvm, old->as_id);
> > +
> > +	/*
> > +	 * From this point no new shadow pages pointing to a deleted, or moved,
> > +	 * memslot will be created.  Validation of sp->gfn happens in:
> > +	 *	- gfn_to_hva (kvm_read_guest, gfn_to_pfn)
> > +	 *	- kvm_is_visible_gfn (mmu_check_root)
> > +	 */
> > +	kvm_arch_flush_shadow_memslot(kvm, old);
> 
> This should flush the currently active slot (that is, "working_slot",
> not "old") to not introduce a behavior change with respect to the existing
> code.
> 
> That's also what the previous version of this patch set did.

Eww.  I would much prefer to "fix" the existing code in a prep patch.  It shouldn't
matter, but arch code really should not get passed an INVALID slot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
