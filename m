Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE86EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yF7PGlwoEgDMFiGs3S4awt228HYwRPYMnUN3w4VcDVY=; b=Wn90zWLQe8vquoYd+BVBFSsEJ+
	oqV4v0e6vksHWPaLBe7H7w9ziB1eoE2mZRI8uGyglk2TVas/BtRE/d9Fs1+2JgN5cnxOqIUtYpGfD
	I3ECLzNF+x+Yypwr/OLMtVFJMeQLcYSkdmskTdpVE8yEQ+bZUn5Ulg4UhTuNFx4d+SJ+14q3aY5gv
	SomqBKlXHIa/OE7aks0BEq3VyMHkStpCatB9a8Q+nsTIhjuP3F1Fd8O6BS9m3AvQQtWcyH/TTyp3g
	5IhPRD0Qm+gIi7/pac1MjlFFq7WAVKDk0Mer0FFTiEm7HmiTqYNDkz4KTsTF1fQBoUh7g6W3TkK3d
	Za0vKPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMu82-00Elpb-1Z;
	Fri, 21 Jul 2023 17:41:22 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMu7y-00ElnW-34
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:41:20 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c0f35579901so2084064276.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961276; x=1690566076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0EsEuc6ZrLkBpjfXrbTj3wl8CGw2RCGPAyUMK4WwkjA=;
        b=DoHzE6IB/gTaLmkueM9yb30EUG6tzOb2A5AXrz9PQw1Ifq3ks790NG9A8kHnulrV92
         RNCrZzNkmPOc83fANNDf5nXf1wPVFL2y5FNAhz+fPjDVllxc5Oizeq9OoCoSO3jrCWPO
         Fdo3zuU1ITNzecPSKDNY0XL2xmTCfJibF/rCjlkemXFUh+Sr371B5TqkScdP+lHN0Bsv
         l8bJ71cW4eJgHOkXZEVFnapIkfHWHqvRivBGgXBk81wx3rhHxJzYdjltDTwHbRDPypPU
         FqCvfBjArc5TGgWA7G3s9Jm2aOIc06rnT78obfljmzEALSkpFg35cZZdMznfZTRdtzpx
         x88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961276; x=1690566076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EsEuc6ZrLkBpjfXrbTj3wl8CGw2RCGPAyUMK4WwkjA=;
        b=gpFBaHFjY1HMOHnLZFBPQJFAyn/+gW/evOj6T19CxuK1ZGWWW1x7SISkbvqpQWNjH0
         jUfDsqUPCnJtbZYCGcjKpLmNNotLN+1wVKIVSVEAi2ZXVHuSXbaGPMKP7+WDBEhj1Oem
         R1iHjAJBv9JQt0py3+CQeasXOeOUdfKjpwTe4b1ztUrpamfNTRdjVHTquJYdMEDb7DL0
         zb3CBIwVfN2hesLaJTuZ6v7FdlG5NCSSmV4TNSva72qTwNY6O8cMcZblG+7EPWbD9ZSD
         qSHBs5l0/dPOQlv0o/g3aKWxtRMFNAKF3zE3dx01+JUAPzVrcIgfPjbKm6XxfMCwMYRV
         oADQ==
X-Gm-Message-State: ABy/qLYC41KBwTIOt6xzzLrut8rTFHlQxBsJjczIEGfiC5IF/iorgz1m
	h2Nut7RfcHLWOnelajY8cftKnGMF6+o=
X-Google-Smtp-Source: APBJJlFxyzDv1jxbiR1ec3ea79Hb3YohAr96lgMadcKGyfL8Br8SJoCJpXRoXSNCjiu8EtZhgF/6XBpHBow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4f41:0:b0:cb6:6c22:d0f8 with SMTP id
 d62-20020a254f41000000b00cb66c22d0f8mr17638ybb.4.1689961276130; Fri, 21 Jul
 2023 10:41:16 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:41:14 -0700
In-Reply-To: <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-10-seanjc@google.com>
 <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Message-ID: <ZLrDOljnluTrt+l+@google.com>
Subject: Re: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20230721_104118_988355_03E514D7 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
> > +			    unsigned long attrs)
> > +{
> > +	XA_STATE(xas, &kvm->mem_attr_array, start);
> > +	unsigned long index;
> > +	bool has_attrs;
> > +	void *entry;
> > +
> > +	rcu_read_lock();
> > +
> > +	if (!attrs) {
> > +		has_attrs = !xas_find(&xas, end);
> > +		goto out;
> > +	}
> > +
> > +	has_attrs = true;
> > +	for (index = start; index < end; index++) {
> > +		do {
> > +			entry = xas_next(&xas);
> > +		} while (xas_retry(&xas, entry));
> > +
> > +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> > +			has_attrs = false;
> > +			break;
> > +		}
> > +	}
> > +
> > +out:
> > +	rcu_read_unlock();
> > +	return has_attrs;
> > +}
> > +
> 
> Can you move this function to virt/kvm/kvm_main.c?

Ah, yeah, that's a good idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
