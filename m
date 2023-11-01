Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hjn1RfLiuun4VEdxdgzhmH2XZhvi94IIeSw+MZnZC0M=; b=kRqAj4BI9cv5us0MoWQE1I1BTd
	7gOkrS5AXMDLhJAOdYnCc7ZGluOfTEduCeivtLxukjFckrPQJsW4LWcsaawd53aqUmEaL0FEIHwqi
	QCo5zfEe1ZB/zVF7xRXmu+j4NomyfvFgYIL/55v7L+dAEG6AkXUVceNaCC6i+lX7m39n+sNpnewIH
	naBv5nGUoEbd9Jav1wxW5yDh5NNHzS3LcZ5wGgQnnHJ3kiP5WKd645hPqM4TOL5tWd8A/3cBm7Ede
	LIaupQTHVZpk/F1GapGVXcb8UmWH4r19XAHP60Xfi37fZKfT/HSLwW5yuaJQXJbzloLBW8Qzlpx0I
	ky4pJpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBTm-007alF-2S;
	Wed, 01 Nov 2023 13:41:54 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBTi-007aiq-1n
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 13:41:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b02ed0f886so61967957b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698846107; x=1699450907; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFf6aEaGwk5ej5JezQy0IgMN87WPAcTCXufwbiE3fug=;
        b=TxdC4ML5TuMh93VSDIBzefA8qXHE98Qp7DkzFy+i+0QcJgxEmBgxKmoMnY31GfO9Ts
         gDtoNMplscagESRttUr450U4+LUtViT8OE7gacG5SirW+Je8Jxobnh6HNWmst3ZDiPgG
         uour4Nxl6HgnqdaCxqzqyMhSSObKEf5sh71j2AtfIrV51wqqi8qXrYDV9ljHdB4x05jI
         MguS6b4M/dRvOLlkrbFJxPU1ei6wJ2Cxa5+mdwGLD8clMhJhMrY2LHUjsAYHAwx73ur9
         1s4EPR6dpmavK9dahKPREYfcNgrCv0ISEmhCQgOF2Jmx2py+HHhJsBEL6SLIlemGekp9
         KtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846107; x=1699450907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFf6aEaGwk5ej5JezQy0IgMN87WPAcTCXufwbiE3fug=;
        b=B50LeeS3w6zIjXeaJ/Rz/QsC4/vuzlqo6/IJL3pxpkKKUziUOv0hi+quP3MKkL3Gim
         TK0iH3nsgi2w5+jksJNpIm/frt5MeDmwh1WXk5/jZu88m+stacLXQL2YP7a5rXZZYvtz
         be16KaKBmp1Yli9eIJVn/tH/bCpx3o1LnIRXhGbp75/vU7T28iy6jTLyBLNoyZ9cC1i9
         hF2kRU7dgM8rx4ddLmr+xvL92iQPcb/Y1PeEz6/unVomxoRYRQv5AI4p3auCfTcbbc7Q
         tb/GzozXwOVeLVdfCd182gm+6mJIw28P/u+zGRKczyNJPL9OnEypSb6WB1RJsOLlAtqZ
         AfWA==
X-Gm-Message-State: AOJu0YwZ+xbaqrWwJowKSVx42A9K+BuBHjgnI6IKt6b526QU/+XfV24R
	FepRxlsRlIeXiyOWMpPnEHU1th5WMMY=
X-Google-Smtp-Source: AGHT+IEsRM1yQnQClQeVqyoNLxT9cYgRny7PWezkHcY0wXTm/cdeLyJgnrb+5OZENHYJQKvQlFBt8yx8E+I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e689:0:b0:5a7:bfcf:2cb8 with SMTP id
 p131-20020a0de689000000b005a7bfcf2cb8mr314827ywe.1.1698846106686; Wed, 01 Nov
 2023 06:41:46 -0700 (PDT)
Date: Wed, 1 Nov 2023 06:41:45 -0700
In-Reply-To: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Message-ID: <ZUJVfCkIYYFp5VwG@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_064150_592553_ED7CC8B9 
X-CRM114-Status: GOOD (  28.97  )
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

On Wed, Nov 01, 2023, Xiaoyao Li wrote:
> On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> > On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> > > On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > > > Extended guest_memfd to allow backing guest memory with transparent
> > > > hugepages. Require userspace to opt-in via a flag even though there's no
> > > > known/anticipated use case for forcing small pages as THP is optional,
> > > > i.e. to avoid ending up in a situation where userspace is unaware that
> > > > KVM can't provide hugepages.
> > > 
> > > Personally, it seems not so "transparent" if requiring userspace to opt-in.
> > > 
> > > People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
> > > support, or check is the sysfs of transparent hugepage exists; 2)get the
> > > maximum support hugepage size 3) ensure the size satisfies the alignment;
> > > before opt-in it.
> > > 
> > > Even simpler, userspace can blindly try to create guest memfd with
> > > transparent hugapage flag. If getting error, fallback to create without the
> > > transparent hugepage flag.
> > > 
> > > However, it doesn't look transparent to me.
> > 
> > The "transparent" part is referring to the underlying kernel mechanism, it's not
> > saying anything about the API.  The "transparent" part of THP is that the kernel
> > doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
> > (mostly) transparent to userspace.
> > 
> > Paolo also isn't the biggest fan[*], but there are also downsides to always
> > allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
> > and there's precedent in the form of MADV_HUGEPAGE.
> > 
> > [*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com
> 
> But it's different than MADV_HUGEPAGE, in a way. Per my understanding, the
> failure of MADV_HUGEPAGE is not fatal, user space can ignore it and
> continue.
>
> However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, which leads
> to failure of guest memfd creation.

Failing KVM_CREATE_GUEST_MEMFD isn't truly fatal, it just requires different
action from userspace, i.e. instead of ignoring the error, userspace could redo
KVM_CREATE_GUEST_MEMFD with KVM_GUEST_MEMFD_ALLOW_HUGEPAGE=0.

We could make the behavior more like MADV_HUGEPAGE, e.g. theoretically we could
extend fadvise() with FADV_HUGEPAGE, or add a guest_memfd knob/ioctl() to let
userspace provide advice/hints after creating a guest_memfd.  But I suspect that
guest_memfd would be the only user of FADV_HUGEPAGE, and IMO a post-creation hint
is actually less desirable.

KVM_GUEST_MEMFD_ALLOW_HUGEPAGE will fail only if userspace didn't provide a
compatible size or the kernel doesn't support THP.  An incompatible size is likely
a userspace bug, and for most setups that want to utilize guest_memfd, lack of THP
support is likely a configuration bug.  I.e. many/most uses *want* failures due to
KVM_GUEST_MEMFD_ALLOW_HUGEPAGE to be fatal.

> For current implementation, I think maybe KVM_GUEST_MEMFD_DESIRE_HUGEPAGE
> fits better than KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?

Why?  Verbs like "prefer" and "desire" aren't a good fit IMO because they suggest
the flag is a hint, and hints are usually best effort only, i.e. are ignored if
there is a fundamental incompatibility.

"Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_MEMFD_USE_HUGEPAGES
or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that KVM doesn't
(yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stronger than
a hint, but weaker than a requirement.  And if/when KVM supports a dedicated memory
pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
