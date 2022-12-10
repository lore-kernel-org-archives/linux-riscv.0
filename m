Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB3C4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 01:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDw81pAlUPKtob0LO4WYpxMwcO58pxnld3ZNGHY6DOk=; b=OtUoaX5kGxmh4d
	NqtM1T+oIlDgzDb8nmtCO11jJEIzbOgU27qmrFPZFKbXyCFYIpwvGuqfiZR9h+ux529EW4uTD09Th
	CUE7bDhIivbbXn0cW/964+ln2V9JRAUJNrdo4xcD8vtpQlnFD9zlc6CfX2smoBRUVEA2Fq1liC8pt
	6oUztmV3jJwJNxkKbASM1P+TFCca7uNjsS5UNUqbN67SZZUqGSBNsjqG/hM0xt1QUbJG7gufNKu5c
	5qHgpWFqGn1B3552rtkNadK1nqufsXq5Vc/c01K0bdtrdCygv99Yi3XI2Z5GaGKpeZS1qA9TDr/cP
	ihk2eoizxl8q1QzqqZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3oLE-00CyOo-65; Sat, 10 Dec 2022 01:07:48 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3oLC-00CyLa-0F
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 01:07:47 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3c090251d59so73650857b3.4
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 17:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2GE1P9MKB5IEXA78EjWjeGIw+fkI4b001mr77BECX4=;
        b=Zz3MbiPPY1SHgc009qCyxMWHtFmspb6G3A0xzYMbttsp31nw0tSX4tppfrsPzNCIF6
         D7iZa+LTmezBYiYDtrAmYb1oC/fxxbCFXDl2x8spANHzzlsqXtea4DYwT5ZwgelbohYZ
         089wInVCX/E1aq3PKr5hxN9tOHp0A9lXSiHrUb2tvZFE38B1gNZClvkVFMpcr2O4jVlr
         9bJlXy7+oFG62lvofRFDdTYYtZ7NVMOdXK6E5CeH1XdzyTgiFtvIInk1zIkAc8vPoxQI
         9f4u+ARi+JH2GcPIweLO4Jw0BwgiylZumo9BqAOOnhTCwihz86Bnx7mwqeF8hZA9e/Yn
         C+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2GE1P9MKB5IEXA78EjWjeGIw+fkI4b001mr77BECX4=;
        b=4KomaUkm79vowifOABINVPxzTCuz8Yg4F50uzllW6KdXgknDtwiyce4ck2eRRM8mCF
         zFFk0qtfptsa+RU38yj+8r2csOVRwB6rF3pJj57uwugP8L2Nj84WgCJ/nhTeQJwxj4Lu
         xucIqypVU+WHC94HcqAne4v40p1TrluX3MMF7xGJAX8qCs81Wf6RXcBo/4PuEDJDJejr
         nM8IZegSRWms2xh1Fuhx2S0aWXv8reIE1DlP7dov8QdwMw6bfl7pZoRaAeLoXqMbXNOe
         1ZPQEqnQXjR2N1TP9ENuYSbLfN33IvZDi5+PGCJvCsngRnybTT4QvHX+zcKYJl/XpH+D
         /WXQ==
X-Gm-Message-State: ANoB5pmT1GhSD8SLwo1k9sWt5fFi8kExOeqjuzfVjtLToG1Rac1hCHg6
	FGuPG/MNqVnnw6HNPG/IdPzYhC60A9YjrO1YgZPX0Q==
X-Google-Smtp-Source: AA0mqf7NPTsewklw8WtJjMQ5b4Z4DLLXvnPd6MTLSGVUxVce2NMxMIFrAkSkhyQdcwqQG9PUK7aUBAXAR0abljqhaUo=
X-Received: by 2002:a81:1401:0:b0:3b0:b9aa:46eb with SMTP id
 1-20020a811401000000b003b0b9aa46ebmr2248873ywu.150.1670634464404; Fri, 09 Dec
 2022 17:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y5OHVzBSHPmAq2FO@google.com>
In-Reply-To: <Y5OHVzBSHPmAq2FO@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 9 Dec 2022 17:07:18 -0800
Message-ID: <CALzav=c328M1jgApAEEnz5B6h_pr5w07VpcMx0kSg0MtJjAf2w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_170746_118256_2AF10045 
X-CRM114-Status: GOOD (  27.49  )
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

On Fri, Dec 9, 2022 at 11:07 AM Oliver Upton <oliver.upton@linux.dev> wrote:
>
> On Thu, Dec 08, 2022 at 11:38:20AM -0800, David Matlack wrote:
>
> >    Also do we want to keep "TDP" or switch
> >    to something more familiar across architectures (e.g. ARM and RISC-V
> >    both use "Stage-2")?
>
> As it relates to guest memory management I don't see much of an issue
> with it, TBH. It is sufficiently arch-generic and gets the point across.
>
> Beyond that I think it really depends on the scope of the common code.
>
> To replace the arm64 table walkers we will need to use it for stage-1
> tables.

Speaking of, have ARM folks ever discussed deduplicating the KVM/ARM
stage-1 code with the Linux stage-1 table code (<linux/pgtable.h>),
which is already architecture-neutral? It seems backwards for us to
build out an architecture-neutral stage-1 walker in KVM when one
already exists.

For example, arch/arm64/kvm/mmu.c:get_user_mapping_size() looks like
it could be reimplemented using <linux/pgtable.h>, rather than using
KVM code. In fact that's what we do for walking stage-1 page tables in
KVM/x86. Take a look at
arch/x86/kvm/mmu/mmu.c:host_pfn_mapping_level(). I bet we could move
that somewhere in mm/ so that it could be shared across KVM/x86 and
KVM/ARM.

> I'm only hand-waving at the cover letter and need to do more
> reading, but is it possible to accomplish some division:
>
>  - A set of generic table walkers that implement common operations, like
>    map and unmap. Names and types at this layer wouldn't be
>    virt-specific.
>
>  - Memory management for KVM guests that uses the table walker library,
>    which we can probably still call the TDP MMU.
>
> Certainly this doesn't need to be addressed in the first series, as the x86
> surgery is enough on its own. Nonetheless, it is probably worthwhile to
> get the conversation started about how this code can actually be used by
> the other arches.

Yup, we'll need some sort of split like that in order to integrate
with KVM/ARM, since the hyp can't access struct kvm, work_queues, etc.
in tdp_mmu.c. I don't think we'll need that split for KVM/RISC-V
though. So for the sake of incremental progress I'm not planning on
doing any of that refactoring preemptively. Plus it should be possible
to keep the TDP MMU API constant when the internal implementation
eventually gets split up. i.e. I don't forsee it creating a bunch of
churn down the road.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
