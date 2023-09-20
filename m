Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D7CE79D1
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5Hum+G8DZEOxo/iVBHJY+ERJO+DLP9BO7u5AcEBdCG0=; b=vbsP5xs1dYT9gSFVsTzeoozp0z
	Dw7k7pBova3b/ncKQE65uHq4OzcTCBMz3bFjps1OZfChcAkvpJtR7IElD2Z5sMNVvTKOS7ral7Tik
	eGAxbofe3A0wlVKBRpyhLryf0O8ls7PcWT4vmyUt/ZCB2h6fN+tDN+DsTMKfC+k37rDFenSwa4adt
	6xg9SkXKBQj1ucf5nOq0HV0AYodsXCxPkqbGKP/g6/JLm2VJOgyS4/JIm+H4cGwnLJYhyyemjsDFR
	LXDO7AVNLGTj2+9fGztk1KdfYRsJjhp4bK8tcVF8VNHNOqeB/0kK1BgM/73OhwrrDqpvMbxgRq8lw
	xgIXqEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixfg-003FAY-2q;
	Wed, 20 Sep 2023 13:55:16 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixfd-003F5a-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:55:14 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59c07ca1b44so74052197b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695218106; x=1695822906; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0APReAt4bNnnd5kx+NahuCYj0tgbUgwxY6/xmv3q1x8=;
        b=xFbVfKXO8lnaiDymTAs6kzR7FwK537w7UnUsvZfdFyBo990krkgd0ox/x6C76x+SZ0
         4Unv129M6waXLZfsI5DNX+5lJZBGd//6zK79FrliO+4ZDxtt9Q22nDHfC94AzsFUu8JJ
         tGQPk5j4+D8qmXVdy3AXURhBAgBpW9AhVnetaaJ+UdfzcOKwDkdt8AAN2bs7Le1ICaeL
         XKiZbXib5n8E/U6Lh021YL2qoGafp/UX8KzSubfXhtqKCbrrKJHqH9AgqWjcItphlILn
         qf+8bnBQRArnff+TYTY/35bfUbXBvXuDCjlyEZ9PdzkNRm+xB0rto8K2CzJrf9v9G8Dc
         tZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218106; x=1695822906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0APReAt4bNnnd5kx+NahuCYj0tgbUgwxY6/xmv3q1x8=;
        b=hpRK3v8I8bXfMJxi807+SFwB1gHgMhhaL3UIoIImvQreU47rQ021o1kpea0oESAu2j
         mXiAiug/Ca93bsu8wtipgNED3gZbtwEtbx9usvXeIb8Z+op/iFMlBCkizrzaeU8JzTez
         0puLw6SSyrvZnaQnJNTKKRsnDYPER3O94XV7uAP9Qah4Pr8V0xSeKUZMyKzMwTDEJa5B
         ajLP7B99aNQwjKs3vraPM4lZO1awAj5k7O1byKwsdocDQfarm/7TUkvqIJWTLrgaUDLM
         znMLfJLJEQ9TdG999FpJXC3y5BeA+U0ucr+SC585zQdwAAgHLrApc+8L0eJ+FXIoLgPx
         2ZuA==
X-Gm-Message-State: AOJu0YyKzajfXcHkMwxcZ6AEndvrCiSphNXIe5a0gkj07d1VZcyYNKF4
	ymOuZpPJVCFiq5l892PpIbfcWDyXzx8=
X-Google-Smtp-Source: AGHT+IHuQ24Hy0wlZqpKThD2hndi3rYWapG+J/d1L/ai4z7W/k7rmZdxNg2zwHr4zmYKJTJyjaSKmjFgB/U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae57:0:b0:59b:ee27:bbe9 with SMTP id
 g23-20020a81ae57000000b0059bee27bbe9mr35901ywk.9.1695218106527; Wed, 20 Sep
 2023 06:55:06 -0700 (PDT)
Date: Wed, 20 Sep 2023 06:55:05 -0700
In-Reply-To: <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
Message-ID: <ZQr5uXhV6Cnx4DYT@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_065513_169148_5C81BBD8 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, Sep 20, 2023, Xu Yilun wrote:
> On 2023-09-13 at 18:55:00 -0700, Sean Christopherson wrote:
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > +{
> > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > +
> > +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > +
> >  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> >  		kvm->mmu_invalidate_range_start = start;
> >  		kvm->mmu_invalidate_range_end = end;
> 
> IIUC, Now we only add or override a part of the invalidate range in
> these fields, IOW only the range in last slot is stored when we unlock.

Ouch.  Good catch!

> That may break mmu_invalidate_retry_gfn() cause it can never know the
> whole invalidate range.
> 
> How about we extend the mmu_invalidate_range_start/end everytime so that
> it records the whole invalidate range:
> 
> if (kvm->mmu_invalidate_range_start == INVALID_GPA) {
> 	kvm->mmu_invalidate_range_start = start;
> 	kvm->mmu_invalidate_range_end = end;
> } else {
> 	kvm->mmu_invalidate_range_start =
> 		min(kvm->mmu_invalidate_range_start, start);
> 	kvm->mmu_invalidate_range_end =
> 		max(kvm->mmu_invalidate_range_end, end);
> }

Yeah, that does seem to be the easiest solution.

I'll post a fixup patch, unless you want the honors.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
