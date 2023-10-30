Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF8FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 22:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cHGFGjq9uCLryCkQGFkXdEebCUdzq3k1XZFnwYqokcE=; b=twsl1BGHy7Itf5NUFP8n6arwNl
	hvPmvBr1xnaMLTwHp3KgNkF1aSd0KusjxIX0u3eokAzAr1zeDa9dPO2zBtklx+U7px41B+5aZlRck
	IFexeagjysq0asgb73WhrkS5Fg+yBz1t6kWcECHUe6MGQbtMwaXsZJ6bwQvKygySVd8cvCSdqDz03
	9ElVoDd2fxQxbgNqeI5c9DoLxZlwjHIkNdFFeCloPr5mRgHv0oEyz22ssgRccvmcbCuA3RjM7CUMu
	SVmK5hepFkvr161vSAafR9dKRWyuFK86lK8MzfavKm1OZJZIEsXHx8ugtEu+QstLwD1DZncF7w8Ww
	LqUkecGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaQ4-004766-1U;
	Mon, 30 Oct 2023 22:07:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaQ1-00473y-2v
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 22:07:35 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc3ad55c75so13204045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703652; x=1699308452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkAABuzKmGyzNibmrxwxoleV2c1qCswFjV4kStA9p5Y=;
        b=eqIz1wwoXEHCdg7Dgxz64uSBBbe5ZZxBKeQal6iYXBh0CdnLXtn1/2n+UvoEcXxSuD
         R2EUklqoPtKObxla6fmyFct7CS7Ra6mWlG4jwhBBUs+xQPBgoXoSfJWLyilrWN9utZzo
         cWNQRDntkpV3QqyqoDZ1DZRIdZdWghJv28+h0L6CbSdjrVHFJk6r5mpMfYIybjlAxBhg
         Ht931b0yVkTxyh5Vm5j7GmsRdY6my2zictkaKnRP9MT0HpZEFE/rhuGY+KD9oaFxS9EF
         tnoGmRt2SOH/XVqyezI389Wmnz+QWbRqttbvyuQcnuj1of5EHif24mDW7uMyXWxcmmL6
         FrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703652; x=1699308452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkAABuzKmGyzNibmrxwxoleV2c1qCswFjV4kStA9p5Y=;
        b=nJbZoqjtEGjZH4UDDwtWZoe+ToMNmzfKixn9QY0Px+4jotSjV+zTzEwNlEFMHhzeAh
         du057ZHWJR/5nVM8DW+V14kWcK9zcOVML2QtxY6+6RwHyX8J3BG9MCv1HOjIdErW+zz1
         lYH38ecDhpN7fB2D1usi24u0M/veQSAV3KEV6NhDJGxL7WSHVJn9JBfhBAMU4AA6stEm
         sxyffdsV3J1NMV1jgDWQ5CLy33ey3X3qcIL9OIhZR0joiZiOXPBMJ5ydOVifL94smbEo
         tccNXQX1YqsunDOYpG00Rgobc32gQwdm3yVx6OD+7IasrhI7+105C5EDLEItL4qXr4Gr
         F49w==
X-Gm-Message-State: AOJu0Yzmhcev1MdO6TygQRyXaAMPmhW9+28vZ9wjwa/pwFXJj9pPQlfb
	CQJSsI52pShQfA84SxoO4LvgmllGNNs=
X-Google-Smtp-Source: AGHT+IHfmttfYISWufdVkZGI1GGv3oPE0CaVU/9uw2yWegmaBLqLOedbYI1/usu4SKmN8TEK3NCdArCTZyE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ed45:b0:1cc:533e:f52b with SMTP id
 y5-20020a170902ed4500b001cc533ef52bmr49726plb.4.1698703652255; Mon, 30 Oct
 2023 15:07:32 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:07:30 -0700
In-Reply-To: <077cec97-7920-4d20-8bd3-fe07ab8bcc29@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <077cec97-7920-4d20-8bd3-fe07ab8bcc29@redhat.com>
Message-ID: <ZUApIvo_gIdsfEEV@google.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_150733_943979_6F10E70D 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> On 10/27/23 20:21, Sean Christopherson wrote:
> > @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  			 * the second or later invocation of the handler).
> >  			 */
> >  			gfn_range.arg = range->arg;
> > +
> > +			/*
> > +			 * HVA-based notifications aren't relevant to private
> > +			 * mappings as they don't have a userspace mapping.
> 
> It's confusing who "they" is.  Maybe
> 
> 	 * HVA-based notifications provide a userspace address,
> 	 * and as such are only relevant for shared mappings.

Works for me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
