Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A544C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57F8610F8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C57F8610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUVAFxQf4B9muuYzxJHmzbjr5yf73z6uqA+lnXItK84=; b=kZwI/MOlh9FwQj
	bQGmDeBVeaS5Hy8uiKHrLLI9WmXNOeDLDhba3TsdjeiVaG98dcRtYjwt5nP+fF1mv+bbuIXHgErOB
	zHeYnUbazF/cJUS1Xu+vB9yfNplmCgVqgQX2lxoCztvc2fKQHTGCs+C4s+qkfZaqtRN4js42NKpJZ
	iesDTzGx+wYCYuadmpVhOakDnkxtwZC1tGZ4hUYeAOgWmFxBjmOegcS/cEUbIzclJ0r846MUMGhpb
	rdcS4TCbupPaVv87fgEAYmHtOistDi/8uR5V0eWNp3aAyrVFUdp94RuuZL54/Gu1ur6sIqCdW6UfF
	aLnW3yCGYd/n7p9RRMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkGCY-000SE1-8A; Tue, 09 Nov 2021 01:45:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkG1u-000Nf5-8P
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 01:34:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id b11so4701141pld.12
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 17:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1YRNoCeeCQqxDvBnoZCtovzT6k/QbqjejEhDlgxJ1xE=;
 b=pNVpk+rCV3HDgb16D6KNssN4BA5U8FFOZNcV6kT2A3hGuTm+OeROOwB3Gc25RBu5yd
 X4Uhm2QzCn6VeLOQwzmDpP+LvkACbbM7DOiiN1F9FMFmdBDaNGhlXPS6Id8TxlqFveUv
 ykpl9sKIWGUMRi9cWNOq4NVL7iOrhHfOKikKZQ1aYP9i+ytWzFlBD/awLiOZyTwIbWYd
 XQYDPLCQNX3Mp2Ht8drmEm0GVWUVRwAlw4IodZrpKgzHqAjOAs0439do5Z+7ssrDyIK1
 8md3BDizbcDwWCcQYcShMQ13fICVIj7mwm722Rbu19AAPS5eH2kbVej7sO/fO5BfTAlH
 wWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1YRNoCeeCQqxDvBnoZCtovzT6k/QbqjejEhDlgxJ1xE=;
 b=P0eqrwTWLxBV4wtwu9735yGWgCCZQ4d76NOaGaWhaWJTOFz4lQQYgj7wTYDzXGp7PH
 F55Rh67KvP5+BfPekbdgEzgNC+u4a6ifFRVPCFfUXvA7fR0e2qTHbJGa8TneaKJts1U5
 rQpHv9EqHWQeEHbbFr7AoZQ9cOhUwTD+CLW6iKxkOjayMcZZHxvG+juY1IHWuigCtCWU
 PhaMjgVvFg5fk066ypDdAcgjOfAUM5b2w41dJ0cKhQGwbAUKCPutuokAXO6TU4qiixIc
 aEoH5D/e2LIShtw0pJoUKwSI5065dNZ7Wr2LqB/v1WX4emDczpBLlVuX4/jB3xHFUzUy
 gR4Q==
X-Gm-Message-State: AOAM533lcqZgFfSzz0apz0LdEAS6Zb8cHFKjPQvjCMwkssUTkQ2jwYbk
 R6qjuOdO7aIYCyF+IlcqcrERcw==
X-Google-Smtp-Source: ABdhPJy0HaVA5X41obakvoewrsg+dddMWtR8SRrwlCTWxcj9Z8BfUyvzJbNA9mrSzEmNcuMJfGzR8Q==
X-Received: by 2002:a17:90b:1c02:: with SMTP id
 oc2mr2968763pjb.65.1636421669237; 
 Mon, 08 Nov 2021 17:34:29 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h36sm307891pgb.9.2021.11.08.17.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 17:34:28 -0800 (PST)
Date: Tue, 9 Nov 2021 01:34:25 +0000
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
 Anup Patel <anup.patel@wdc.com>, Paul Mackerras <paulus@ozlabs.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 20/30] KVM: x86: Use nr_memslot_pages to avoid
 traversing the memslots array
Message-ID: <YYnQIYdsb3wwg86j@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-21-seanjc@google.com>
 <88d64cd0-4db1-34a8-96af-6661a55e971e@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d64cd0-4db1-34a8-96af-6661a55e971e@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_173430_353989_D881AD97 
X-CRM114-Status: GOOD (  17.54  )
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

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > 
> > There is no point in recalculating from scratch the total number of pages
> > in all memslots each time a memslot is created or deleted.  Use KVM's
> > cached nr_memslot_pages to compute the default max number of MMU pages.
> > 
> > Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > [sean: use common KVM field and rework changelog accordingly]

Heh, and I forgot to add "and introduce bugs"

> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h |  1 -
> >   arch/x86/kvm/mmu/mmu.c          | 24 ------------------------
> >   arch/x86/kvm/x86.c              | 11 ++++++++---
> >   3 files changed, 8 insertions(+), 28 deletions(-)
> > 
> (..)
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -11837,9 +11837,14 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> >   				enum kvm_mr_change change)
> >   {
> >   	if (!kvm->arch.n_requested_mmu_pages &&
> > -	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE))
> > -		kvm_mmu_change_mmu_pages(kvm,
> > -				kvm_mmu_calculate_default_mmu_pages(kvm));
> > +	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE)) {
> > +		unsigned long nr_mmu_pages;
> > +
> > +		nr_mmu_pages = kvm->nr_memslot_pages * KVM_PERMILLE_MMU_PAGES;
> 
> Unfortunately, even if kvm->nr_memslot_pages is capped at ULONG_MAX then
> this value multiplied by 20 can still overflow an unsigned long variable.

Doh.  And that likely subtly avoided by the compiler collapsing the "* 20 / 1000"
into "/ 50".

Any objection to adding a patch to cut out the multiplication entirely?  Well, cut
it from the source code, looks like gcc generates some fancy SHR+MUL to do the
divide.

I'm thinking this:

#define KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO 50


	...

	nr_mmu_pages = nr_pages / KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO;



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
