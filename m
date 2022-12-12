Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWqFZgEuiMmMLrTQ9j5tbBRkbqhtuMIfwYroMKxzfA0=; b=czfV+VZZZ8qXaE
	7emoWg8onJm6w+/pm+Q/06hw4KK53iHKj0Tg8/P1jcgu9uOBgWgFK6qzqe445VWywEh2MAefF0dB6
	o6fb7oGVz24L7EKtEXtm1SVhR0PUShdW2J/Tt+WGNrHdXx9FoXD7noTxMBUfiDHsF//SvHZuOyIK5
	ByA9LVeCvVw1+Qp6AMTqzlP13kKYHfQuVMDg5f9tMrlmQp9uJsRhfIBj3XRz0wclMXHzqZIpA332s
	t6IwmhtcHG/ooGAzfHixIByf+W5urSZEO4lMMxdnHl7N/5s1sV6ZWYUxUNhKnXXgTVVwKWCeD+a2R
	JcNm5mOBMtzYlzy9ksrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4q0N-005VtS-AL; Mon, 12 Dec 2022 21:06:31 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4q0J-005Vli-Oi
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 21:06:29 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id o127so15275919yba.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=as6M7rF8vu2B1VLzLGLnujoNEHxjqSZF2ixbKuvGXxE=;
        b=jIhGaXVnl3YvAnDSTeWQFwWR+xDHpsjs16kACsfVA5aKtf91JC05OJjmUmKeP0nkpM
         SnDACAK7EvYaQ0k+/SaN1mEHgyH0DYgRRStukX7P77NP1FuYigKrflB4Ki4chVKDLckx
         PcbOzgjjYKRLK44+Pe1nn5owF1kec2HNqSnIpRfr7QP2EE/vpPFzlWfDvSdDUaVVenod
         N2kzbeLjIoQucXZh1kYPlKrgL+ICtIDFTpL/2QNV3RfTDJQxiKbZ0U4k49qhwdvrXZew
         rCl3bxQP1QGlSh1wnz8qOTaqIvdkcp0n2w91WmgfaTkcQxK4hFcijjPmc+qIiQbMg51Q
         ysyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as6M7rF8vu2B1VLzLGLnujoNEHxjqSZF2ixbKuvGXxE=;
        b=fMZefTRFfDODmH1eMeUdTM/820Ohh/n4nd74L+zggzoFXvOtD0FRkMcVzf5PmYtDk0
         6eIjavXuomEePdak8rK8EGTQcTzFga0g5LSaO7AGCIEZPfBIhAneHdjjR/gaihz+to2G
         0UqSNzizLXgDzcPLVE0MuJud5WT9pgyDxSlk2LqiMk8tFA27gb4OwVMp/19Q10m/ggHr
         iW+tZrQtOA9VFOttSjNSSzlt0HyMXKn1Y40/BdTZTY0X9w6teblwYaOL37yyaKxM8rRE
         fMAhH3Y7HjdLVQo+LsGVHHOuOvbSH0aUPHEbTNlVMmcv3iREuxB9GL2Z5g8yAn9Houd5
         f1UA==
X-Gm-Message-State: ANoB5pnrd6mhcoWu/Ebd3bNG5ecsxAZTo89fhDWRVR+lQWPWglTkASOe
	g5NUj2MOcBRqCrO65s3/5IE3jDn4vDvogAQRyfquyw==
X-Google-Smtp-Source: AA0mqf6t0tL+M5odHwBkmEtWZ3JrhY8ZOtTx4LY0nKQZE8xDjE9jvCGoO42nxIdR/mBoqjExkkZ8XXCco0Q3+sfbdfg=
X-Received: by 2002:a25:742:0:b0:6fd:6aa4:82a5 with SMTP id
 63-20020a250742000000b006fd6aa482a5mr26123897ybh.305.1670879183958; Mon, 12
 Dec 2022 13:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-21-dmatlack@google.com>
 <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
In-Reply-To: <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 13:05:57 -0800
Message-ID: <CALzav=cashgJPmeKSRQnd_kdYg2EK0G4rygSCt6GaJWSYz3juw@mail.gmail.com>
Subject: Re: [RFC PATCH 20/37] KVM: x86/mmu: Abstract away computing the max
 mapping level
To: Ben Gardon <bgardon@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Krish Sadhukhan <krish.sadhukhan@oracle.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_130627_823792_5DF407EE 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, Dec 12, 2022 at 11:32 AM Ben Gardon <bgardon@google.com> wrote:
>
> On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Abstract away kvm_mmu_max_mapping_level(), which is an x86-specific
> > function for computing the max level that a given GFN can be mapped in
> > KVM's page tables. This will be used in a future commit to enable moving
> > the TDP MMU to common code.
> >
> > Provide a default implementation for non-x86 architectures that just
> > returns the max level. This will result in more zapping than necessary
> > when disabling dirty logging (i.e. less than optimal performance) but no
> > correctness issues.
>
> Apologies if you already implemented it in a later patch in this
> series, but would it not at least be possible to port
> host_pfn_mapping_level to common code and check that?
> I'm assuming, though I could be wrong, that all archs map GFNs with at
> most a host page table granularity mapping.
> I suppose that doesn't strictly need to be included in this series,
> but it would be worth addressing in the commit description.

It's not implemented later in this series, but I agree it's something
we should do. In fact, it's worth doing regardless of this series as a
way to share more code across architectures (e.g. KVM/ARM has it's own
version in arch/arm64/kvm/mmu.c:get_user_mapping_size()).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
