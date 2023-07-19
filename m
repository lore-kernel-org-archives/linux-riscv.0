Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE19AC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VjsiJZ4Y+d+aZJd/XRaCsahl9FWhZsaOw/EUaEeNeO0=; b=xesDNdIAe+yr8jYWmp5Ft0Ze7M
	cTip9mWhNqg0NWufpxrGQZh8NVg3V+KtYLbVB1ljHNhspu2YoO4yeZ5rK9zuhxnDeizf86aWY84AJ
	a9Q0YvraIAn23IchV/9Tb2p135eX8to90M5IReWok4AAsYqzA0A8kQYU+BIQw+VSLA0VaTeHEHtgQ
	O3oLMzNWm/6hc9bQb5S/y+tkM1XFTtgH7wwrr00kDE7H9pApfYVomJtEMh1n7XFT+zxB1IY0nq41A
	yEPIIbaywB/lE2cbnLw6SmBVwM02qLZ/SL8vfBeuiQZdYufBB4qXNoYoGTeJVNB0hYqyvAea0twyo
	/P5lIlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7zA-007h2o-2X;
	Wed, 19 Jul 2023 14:17:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7z7-007h1K-2L
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:16:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-267a0a0382eso2197437a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689776216; x=1692368216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ply9vOQ7PKiPIjqcvpgXEIwEBxatqkRJB2ZRy5lS2Xc=;
        b=QCgn5pm8yPPImP/ZfLF2Ea0jJXDpcGNQ/LF2jNeNTBG71TLZwae17UnwEuo78ONGHP
         atCG9sArqHfv277Ky9HWUevcQtozR/I9rfoMFWMGzH2p/tn1UptotifJkTzwcjUzjGM4
         2mRccC+Qe6eelyvVpzgsii1Dz38eewFROpWBRyPZo22w72yv1RXU/kRjiIgbgdf4vOiO
         m+eFtOZOtzemALwYg0UpO5hPIX4qNwingmWVGWsEqCwrs8u/CIQrQXsRy9c4nWVOA7nY
         TgAf9p3r7jbBOiu0L+1TlKBrMt3e7HNn72eYqwvkzNmnIVVzm8emG5isi9/yOnMB2w1e
         eLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776216; x=1692368216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ply9vOQ7PKiPIjqcvpgXEIwEBxatqkRJB2ZRy5lS2Xc=;
        b=Li8zExdunXsDOKSks5HmNo3A6tmoPRcnmuh5DDnu4fT29s8SHyLE9uKV47ZOE+bnp6
         pH6QeBN8QueS6phsF/AbQLGzT0PewlGbLNqdOeKA8s4EEEiEaj1X9UwM+FIbewVVY0Yo
         HR+29U5Qv2YLBqQxVtidjw2XFNoikBHmW1Y0h9dyhZaXS6FiUgSfTftgOnSh4NBRZGPh
         YaubVHvIxk60h8QQsVeuGmvW+3hKpcF77gQAwNJ37juDq6zCSEdPxAwu11YNo7ESpKU5
         Mz/2YuT/bXlftV4JYLJnX7HhZKPGt0S7XR5KwIqtJfn0YLwWrRJD++L2S3AysAuUeXIV
         j+4Q==
X-Gm-Message-State: ABy/qLb5xWIjJ12S42B7FzPYHQuJpIcllmZ6/q/labUVAAL7GU3CQ2oY
	Gz2iYdMTieZ2utHC55GJ8jk7d70alzE=
X-Google-Smtp-Source: APBJJlHe5KmJdZof+vQtZ6M87xlqjK1Ejx8t4AB5DMX6de6h21FipxJ2lQkyFnlQoXRyf3eYpC2jq3S2bQ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e542:b0:25b:f9e3:deab with SMTP id
 ei2-20020a17090ae54200b0025bf9e3deabmr136275pjb.9.1689776216142; Wed, 19 Jul
 2023 07:16:56 -0700 (PDT)
Date: Wed, 19 Jul 2023 07:16:54 -0700
In-Reply-To: <20230719075440.m3h653frqggaiusc@yy-desk-7060>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-8-seanjc@google.com>
 <20230719075440.m3h653frqggaiusc@yy-desk-7060>
Message-ID: <ZLfwVki27oLBGO6D@google.com>
Subject: Re: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
From: Sean Christopherson <seanjc@google.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
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
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071657_782478_DDDFA3FD 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, Jul 19, 2023, Yuan Yao wrote:
> On Tue, Jul 18, 2023 at 04:44:50PM -0700, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > This new KVM exit allows userspace to handle memory-related errors. It
> > indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> > The flags includes additional information for userspace to handle the
> > error. Currently bit 0 is defined as 'private memory' where '1'
> > indicates error happens due to private memory access and '0' indicates
> > error happens due to shared memory access.
> 
> Now it's bit 3:

Yeah, I need to update (or write) a lot of changelogs.

> #define KVM_MEMORY_EXIT_FLAG_PRIVATE (1ULL << 3)
> 
> I remember some other attributes were introduced in v10 yet:
> 
> #define KVM_MEMORY_ATTRIBUTE_READ              (1ULL << 0)
> #define KVM_MEMORY_ATTRIBUTE_WRITE             (1ULL << 1)
> #define KVM_MEMORY_ATTRIBUTE_EXECUTE           (1ULL << 2)
> #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> 
> So KVM_MEMORY_EXIT_FLAG_PRIVATE changed to bit 3 due to above things,
> or other reason ? (Sorry I didn't follow v10 too much before).

Yep, I want to reserve space for the RWX bits.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
