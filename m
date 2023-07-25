Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A81C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zpy1n39i9Xmxt4q7M9rTdgt5lxRPO+wUahsteuWWDQw=; b=1Ai9+84G571Vytb7cZj5e7oPE9
	Lomv7fxZnlAbLw3EYk6F/OJNSvBJbEiYA4XWyC0yLeY3JNcFsyfz1ezAwvc4mw0HPAXRJ+Ta7qcwI
	bSukN7gcauKJo53XR24pzN6IgAxOV0k5X7XnRpRtMIeU6BuSalvA60uGukHkEHSZruKdI61OhPXGf
	l9ubgNz7rPpUuHAGghRrAHxVeng46RhrBn5a7FdE7Kc/5RRoTlH5ZhYaLryDsU550QRy48CeYQAGK
	SW69xOGPWPe9gcI7xyw8S+0bjmuO14ViL8i/S4OdDlEkrqNK6b3+7dQQooEWtlAkpS9koZH3hy9Kd
	mRBvmtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKW8-007zRz-1n;
	Tue, 25 Jul 2023 16:04:08 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKW5-007zQZ-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 16:04:07 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-584139b6b03so19313517b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690301041; x=1690905841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzfMU5Qs8JliFSPK4e1C5em4CWxZCGfzp6e2iymS9Yg=;
        b=dW59zwmrsLAamcGnirE6A1LfKT51T61DtWDAOhx4/cSvK3sOAiDmr+BlK4XiPthtzP
         CN9MlQi3HhBVcH71uuUqq+M14CfwGnGPEE/BpfevOBdEFKHG7J0iaICViLaRAky8BhEp
         HFcQ65KDccgqhPQn/ChYInnlcEfq7qr0Ma/Jgkr7SmWI+05vO/bEbUCWl8Rn7I2emovI
         UeVOyMZohBruEuz8fBipp3NgVzf/qbnB/hnqT0XX1CDCZ3KOl7DJQE2yXx50QpLL6+Az
         IlluRAj7yyIarMAgzXmFlQrKZdiqjqFyPfBBVM/tbJmItA4hkVu10uPsnU/tUYfyPMpN
         N63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690301041; x=1690905841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzfMU5Qs8JliFSPK4e1C5em4CWxZCGfzp6e2iymS9Yg=;
        b=l4Sw322SxP5badtfFPokOdOX1NNerId0E0zsELBIO0RTQPjShqSeyBK0M4jmYzwJ0B
         TtNMTPD3dpunEDZevcH+lCdgjb0C7Y6GMdmNviD/G14H3/EtKL93RMuBO9TZFiOBAVHU
         ChagrYT8ltvYdpZnR+3ounO8Kd+7HksOMo/2+Qs6alRmLX9xduojViys/rqJ6iyA/aJB
         pg+eMN7seVgVyCE93YRD/2SyGbeXd+rQg7g8KrD552fVtAw0Uut416gp0znOUYWMifzu
         8xMJLvphYcSF5SV2Qo9edOvUP0CiIAg/oghfcG3N/zb6iZ6dosTPtVkeOr/5EcihL3Dp
         Uj+g==
X-Gm-Message-State: ABy/qLZ//WYXCNorCcE3RVcps26385q7Te1EzVcjnPjG9Mk2nU6HZe+s
	TLMjceNYUwmzO9Nj8MY82sH0MDKqyf4=
X-Google-Smtp-Source: APBJJlH1niyzp4cjBeRls9BsaNe03YLK4iKuUQJEO3t7N9JW3OW9U+d5kcfXqA22KUPE/pwVy1vkIiRVphQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:46d4:0:b0:cf9:3564:33cc with SMTP id
 t203-20020a2546d4000000b00cf9356433ccmr81585yba.13.1690301041144; Tue, 25 Jul
 2023 09:04:01 -0700 (PDT)
Date: Tue, 25 Jul 2023 09:03:59 -0700
In-Reply-To: <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
Message-ID: <ZL/yb4wL4Nhf9snZ@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Wei W Wang <wei.w.wang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Liam Merwick <liam.merwick@oracle.com>, 
	Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_090405_816303_BBB697EC 
X-CRM114-Status: GOOD (  17.16  )
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

On Tue, Jul 25, 2023, Wei W Wang wrote:
> On Wednesday, July 19, 2023 7:45 AM, Sean Christopherson wrote:
> > +int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > +		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order) {
> > +	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
> > +	struct kvm_gmem *gmem;
> > +	struct folio *folio;
> > +	struct page *page;
> > +	struct file *file;
> > +
> > +	file = kvm_gmem_get_file(slot);
> > +	if (!file)
> > +		return -EFAULT;
> > +
> > +	gmem = file->private_data;
> > +
> > +	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
> > +		fput(file);
> > +		return -EIO;
> > +	}
> > +
> > +	folio = kvm_gmem_get_folio(file_inode(file), index);
> > +	if (!folio) {
> > +		fput(file);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	page = folio_file_page(folio, index);
> > +
> > +	*pfn = page_to_pfn(page);
> > +	*max_order = compound_order(compound_head(page));
> 
> Maybe better to check if caller provided a buffer to get the max_order:
> if (max_order)
> 	*max_order = compound_order(compound_head(page));
> 
> This is what the previous version did (restrictedmem_get_page),
> so that callers who only want to get a pfn don't need to define
> an unused "order" param.

My preference would be to require @max_order.  I can kinda sorta see why a generic
implementation (restrictedmem) would make the param optional, but with gmem being
KVM-internal I think it makes sense to require the param.  Even if pKVM doesn't
_currently_ need/want the order of the backing allocation, presumably that's because
hugepage support is still on the TODO list, not because pKVM fundamentally doesn't
need to know the order of the backing allocation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
