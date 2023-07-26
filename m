Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DFC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9sE3oftJLtuRsyoOFfDvLwkRUfBrIZZkJt+8NDYIUkI=; b=qaoL7F2BLGjb1rCLGC8FIz1kpP
	WGJRu82w3p/U7ytNZDcCTkHWi4NqKaYBbXGkVNHOi18IQsR3xkx7oLlGvq00Iu7MAVEYTg2ayrsEj
	Nn05acnpba+dlY7qQzb8vXBHoGRir4m0MClVZcEbCKZt5uhDK7OOF2Z5jwxhXYMdJ5prNjhWZdUQP
	BWuwSO2qeZfvoZ0komHD9DyL+v3bB6BXMPGkJDX7C2K2DSlxVGqc3MgQ6SXmH8v/ORTsx3JWLfvQf
	YEjoBOaOKqmziGWiwzU3RgSU4yI3jTEfZ22cZ9K6yZ7i3TYtYP49wG26eamWzfsz/UX8zQYDPf6XL
	Lz2A5DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkBG-00BO8k-28;
	Wed, 26 Jul 2023 19:28:18 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkBD-00BO6P-1R
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 19:28:17 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8a7734734so903455ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690399693; x=1691004493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JT2UHI+2Np7L7QsdeetNAkLhraffv5kgEdfCjKl11Yk=;
        b=VVF1b7RUawi3/QYYQt22u1jH5OUH1Tf8XnLnE4b/agwXthOwpe69728aWprc+cBAPp
         m1NzpejyJPFn+J7cEl/k4Xfw7NV/DNs921DAj4mD25qN63m2UV8rxLRjeMa24TJWqXH7
         YevHJEPTBXycw8cNMxRiQayY5davffRodPeaquNPMlG3yhTbW+l2TZNv0KoNxIAjUf1u
         vx7QnvYOOpb+Nn9iea9EFg+zAfgVPq5/2O4eLtzlraYz5aepPr1S1PEGRUkv/ClpXjx1
         oD0KN8QbT88DXT6sIsMyGXbNhhlwFsmmZRUM0BDYakuaZeCUCb/tpsShC/zQA5q7Janp
         MXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690399693; x=1691004493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JT2UHI+2Np7L7QsdeetNAkLhraffv5kgEdfCjKl11Yk=;
        b=RzCsZvu1O4xRtihrJOvNmwtjkj+gKmdkOkR13orB86X5vBs6QjItqydnCLCPays2e2
         nmqgQ1EkmOXFsMHmHqPR6+AYNQAtnpt8g+QX85hro38gf2Sb0QrXNhg1/jo0tDbPW2zl
         pqjyZLzUQUBM+XKMHxUYjf7NV256KW0j8TTNd2LMsmCGTGkW/42LxJj2EAoxbBhetIZe
         tcyHdRAilGbSGTxA6odElpkPGEvjgDHtxkIZCoarRvG7OryRd4H4zknXOXP5bFV6Ia3d
         B5T5XAhPxTZyBVu5ucCDzaBAF6J+e1Aqg7liRtO/98qtscvdLWZhaxMhCMxz5jLoIqq7
         PD6A==
X-Gm-Message-State: ABy/qLZg4iKjPvkIks8SZcpBLI+Y4asI36fofbl+NnkWkvxOsPVtjIWB
	zlFe3FpKjUgh7BWeG/4Qjdyb7MOh/pY=
X-Google-Smtp-Source: APBJJlGcmwLcdH6TXOymYc9nTB5UyZup+2YRvQp3iON5gHoKZStwU7nqu5mwxNJ6DvyQEbhf1ifDNjwDMJ4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce8b:b0:1b8:2055:fc1f with SMTP id
 f11-20020a170902ce8b00b001b82055fc1fmr13036plg.2.1690399693010; Wed, 26 Jul
 2023 12:28:13 -0700 (PDT)
Date: Wed, 26 Jul 2023 12:28:11 -0700
In-Reply-To: <8f7ea958-7caa-a185-10d2-900024aeddf0@quicinc.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <8f7ea958-7caa-a185-10d2-900024aeddf0@quicinc.com>
Message-ID: <ZMFzyy5mZVxLn4uo@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
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
X-CRM114-CacheID: sfid-20230726_122815_484389_77947166 
X-CRM114-Status: GOOD (  22.68  )
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

On Wed, Jul 26, 2023, Elliot Berman wrote:
> 
> 
> On 7/18/2023 4:44 PM, Sean Christopherson wrote:
> > TODO
>  <snip>
> > diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> > index 6325d1d0e90f..15041aa7d9ae 100644
> > --- a/include/uapi/linux/magic.h
> > +++ b/include/uapi/linux/magic.h
> > @@ -101,5 +101,6 @@
> >   #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
> >   #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
> >   #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
> > +#define GUEST_MEMORY_MAGIC	0x474d454d	/* "GMEM" */
> 
> 
> Should this be:
> 
> #define GUEST_MEMORY_KVM_MAGIC
> 
> or KVM_GUEST_MEMORY_KVM_MAGIC?
> 
> BALLOON_KVM_MAGIC is KVM-specific few lines above.

Ah, good point.  My preference would be either KVM_GUEST_MEMORY_MAGIC or
KVM_GUEST_MEMFD_MAGIC.  Though hopefully we don't actually need a dedicated
filesystem, I _think_ it's unnecessary if we don't try to support userspace
mounts.

> ---
> 
> Originally, I was planning to use the generic guest memfd infrastructure to
> support Gunyah hypervisor, however I see that's probably not going to be
> possible now that the guest memfd implementation is KVM-specific. I think
> this is good for both KVM and Gunyah as there will be some Gunyah specifics
> and some KVM specifics in each of implementation, as you mentioned in the
> previous series.

Yeah, that's where my headspace is at too.  Sharing the actual uAPI, and even
internal APIs to some extent, doesn't save all that much, e.g. wiring up an ioctl()
is the easy part.  Whereas I strongly suspect each hypervisor use case will want
different semantics for the uAPI.

> I'll go through series over next week or so and I'll try to find how much
> similar Gunyah guest mem fd implementation would be and we can see if it's
> better to pull whatever that ends up being into a common implementation?

That would be awesome!  

> We could also agree to have completely divergent fd implementations like we
> do for the UAPI. Thoughts?

I'd like to avoid _completely_ divergent implementations, e.g. the majority of
kvm_gmem_allocate() and __kvm_gmem_create() isn't KVM specific.  I think there
would be value in sharing the core allocation logic, even if the other details
are different.  Especially if we fully commit to not supporting migration or
swap, and decide to use xarray directly to manage folios instead of bouncing
through the filemap APIs.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
