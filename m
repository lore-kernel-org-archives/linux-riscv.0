Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A76EC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u66a3lQJqaxOD1LAF33+sjumpZSpRvynLPijO4/vqtA=; b=Td5ZBRtsaSPPMB
	204VqidH6nc4R/0Q/ehSxkQ2V2K+RtJSpvn8me7yDIwUAo/tC+p69w2ADf9WbxU2W6iPvGCkH5NLP
	XBUzt1mSxjpeAPDs67mu8fbUek7iOfKI/kXpY9faJ+cblosjVUwM8BrKh6hrz0A1KBE41cNRt8BIB
	mNNRaUv3pqXqy5SCn9FBnqFQJxYKZGQr8U+8B/Z+kgWS2FRCIw136UqXiFCSOrz6KVijGyeQ/lQQv
	+iW5c4PSCnjFgSXhbhpYbQXsCCOxENxeqS0WEgyWz9yO3oePfN/eavrhHtvE/Rhgq9IoYEdsHL9WR
	KEPB57Smbg3mh/Dz1ORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6q-00AFkP-2C;
	Wed, 26 Jul 2023 11:55:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6m-00AFhW-2p;
	Wed, 26 Jul 2023 11:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0fof81wtAtiFX2QB1HpVgM6UAN/KWIc+Da/gHz8pCPI=; b=CEihuIBq7HtWBr/LwwEu3rpn1M
	oJpTACjjqW08/kdR1fs8sAJ+1/czGFUTY4g/HMLBLOCHfxGSLEgPw1iFV0MR9ihAv3JGHyGXwXevM
	/K8X9RAd6p9Uo0d/il0s5m7tW6B88cp/wPx3r+mNGqOTM4GqgxN8S06KBWtMr0mKWZ8Q9KuS0CmOt
	d2OQcfaWxH/Ac2qiIFd3TTtmKQr4NE/fslBXSWbZrGW9fme/tNI5PRoAz84zZ6kYuBfFQ70ZK7LTS
	X2vcD/yjDj08VoNVInXZ2PdVmx3OIcORP+rE42TwKI0LnfWcSczRO095JLtEY3MnyZ2CS3bZN4v5p
	7roP3Yqg==;
Received: from mga03.intel.com ([134.134.136.65])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcor-005pmT-2z;
	Wed, 26 Jul 2023 11:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690371401; x=1721907401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuZ1oLRGv+DogObqtc+f4FAjzMjj7hxAmbmabhNK8B0=;
  b=Sx/yv7iOBrkfZfLJnQCUlilTLHx2BDWTyrUj0wPyfSGFjZgd6j2IlsTK
   fAK6KHGQFnurG2mZas4lqj3ZtXP857BnZfJuXm/l8Xj0z0XxjKf9zoDR7
   /U/ErYbLGhOZcrd8UBOIoW9dcy3IFiNNBVIx12hbTPJHJoH72A+FSmwg7
   BFZPNAWd/JqoXhB2pIC0NkvVzvREX5KXdh/BQmgZANZPMK8iJZV63Stau
   LiSkPYZ/oKPQOVJ5L38UrNsXU3inCwS82nZ48HV6oIuvikKMV05Dxg8q0
   tCjfM+OQeLt/RlpqLMz77AHjEir8YLy+w9cRRI+TMqtvVX4aio+oNHN3X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371598765"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371598765"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729807753"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729807753"
Received: from mbrdon-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.209.47])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:36:21 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 8BCEB109503; Wed, 26 Jul 2023 14:36:17 +0300 (+03)
Date: Wed, 26 Jul 2023 14:36:17 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Message-ID: <20230726113617.432nuovswn6odcmx@box>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
 <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_123642_869175_F5FBAEC1 
X-CRM114-Status: GOOD (  26.48  )
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

On Tue, Jul 25, 2023 at 01:51:55PM +0100, Matthew Wilcox wrote:
> On Tue, Jul 25, 2023 at 01:24:03PM +0300, Kirill A . Shutemov wrote:
> > On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> > > diff --git a/mm/compaction.c b/mm/compaction.c
> > > index dbc9f86b1934..a3d2b132df52 100644
> > > --- a/mm/compaction.c
> > > +++ b/mm/compaction.c
> > > @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
> > >  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
> > >  			goto isolate_fail_put;
> > >  
> > > +		/* The mapping truly isn't movable. */
> > > +		if (mapping && mapping_unmovable(mapping))
> > > +			goto isolate_fail_put;
> > > +
> > 
> > I doubt that it is safe to dereference mapping here. I believe the folio
> > can be truncated from under us and the mapping freed with the inode.
> > 
> > The folio has to be locked to dereference mapping safely (given that the
> > mapping is still tied to the folio).
> 
> There's even a comment to that effect later on in the function:
> 
>                         /*
>                          * Only pages without mappings or that have a
>                          * ->migrate_folio callback are possible to migrate
>                          * without blocking. However, we can be racing with
>                          * truncation so it's necessary to lock the page
>                          * to stabilise the mapping as truncation holds
>                          * the page lock until after the page is removed
>                          * from the page cache.
>                          */
> 
> (that could be reworded to make it clear how dangerous dereferencing
> ->mapping is without the lock ... and it does need to be changed to say
> "folio lock" instead of "page lock", so ...)
> 
> How does this look?
> 
>                         /*
>                          * Only folios without mappings or that have
>                          * a ->migrate_folio callback are possible to
>                          * migrate without blocking. However, we can
>                          * be racing with truncation, which can free
>                          * the mapping.  Truncation holds the folio lock
>                          * until after the folio is removed from the page
>                          * cache so holding it ourselves is sufficient.
>                          */
> 

Looks good to me.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
