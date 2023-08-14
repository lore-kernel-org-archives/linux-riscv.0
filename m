Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2841C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/0/6E2R+BgnzShHIVRHP8AbQSceBn2lnDszijknnwys=; b=MOZqG7C9+kDb8HjEpFuUAJRLnL
	GWQgH33pqTUyQPXpLsDBuphovasItnZJS3gp4yOPgLKa1Mt7xDIZm3QbgNpqpKLvEVSzgkvEhBbJT
	SpiDMOoeEKIN+tH1bZUSayXR2lNth4QY+38485Z7w07gq+0C2yShcJ5j0ux8ORV2N1J2w6Ert6aZy
	akkaGzvm9b05soPbonvEAjT2W1ZXNETCSPwVxOJF2g7KK81+xv9xFwu0CF0YWbW3HRB+O6HNhvQeO
	BVdPaNVWOU5SPcZf+84C8bmqCRSXNOcTuiBwZZTwwrPLY3l/PfOBUlOOcfYxpOVZlll4CSHc4qqDa
	XAXY2kMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVfWI-000PuO-1r;
	Mon, 14 Aug 2023 21:54:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVfWF-000PtF-35
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 21:54:37 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55bf2bf1cdeso8921523a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692050074; x=1692654874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLV8cwl+q0+MgeCaKnjEbSXBm+ijn/cuT9eg2QvMQy8=;
        b=WyQ6Tn/5h37xMsEIDmbWcY+nQiTqqFoftlXVBTiztMb2A7vinkou0FyJxT5Tj+pa31
         3y4mktmY47itqZcGsKCOeUubQi9MQwPyYS/ntrx9oV/jIdUAoZkwRuGY0yw403B+hUV5
         PyUzYrySs29/O30p+yDsELGRzby+1aqFcxoBBJ6omQFPygNitIVTJAp2Hnd4R0/QcY2H
         EgizfgVBfhm/BlB4owWFjSnqlPuhKRjVS+MvDjPpwOsN8USa7haRJjhrCn+/9m5M/b9b
         HnVauoeuLnwYhNy2SBnjlv/xkJdMMlVKqHESswng1uUarqPNC4oB5B1VogZQC9cpA3Kv
         gLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692050074; x=1692654874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLV8cwl+q0+MgeCaKnjEbSXBm+ijn/cuT9eg2QvMQy8=;
        b=ayN9YuRRGdROxdu81chyt3ZxXUOJki4kWaC2+0AI+gVO9RX4Pv2DTO2oqrJpqprh5Y
         4gvWstEAlMh1DQ7WGVWSbGcjYVi9kHnheRXoszGecf3WicH59vjuPnI00lM0O77ntUE6
         E122/CgnBFeA4gqQykhDMbNM3bQx7rqbAQO1cV1JvZESl1iis5mSWTzC8rGtOEJCNbL1
         Q43cRnpBpuLrEIPfB/oAvA8/L4J73y6ToiRtwChoNdRMpn3pM+Hn7MDNA1jZlu/h5cN/
         zJDJoodNkIunTMiFFofOAxNK0LPqM20GLfG8b8oyiSI/F06yHE51UiBzoBOB/5u/p+8Z
         w4fQ==
X-Gm-Message-State: AOJu0YyP0Q9xn8gjhwWJWFlCfgffdG/0TfB5qXqFgp1l/+AcVpK0/TNJ
	u4zln5skztcPUzdMBhkknYKy8Hzm7eM=
X-Google-Smtp-Source: AGHT+IGPzyG2ye2a1feyqcG86dyCHC82qzx5i2/p6ALHRmr0rfFoFMM8MlFz9jxGz9wjwtqC3ppaRbddXVE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:9f12:0:b0:565:3355:87b0 with SMTP id
 g18-20020a639f12000000b00565335587b0mr2044577pge.5.1692050074189; Mon, 14 Aug
 2023 14:54:34 -0700 (PDT)
Date: Mon, 14 Aug 2023 14:54:32 -0700
In-Reply-To: <02239d95-0253-a223-28c2-016cca3ab4d2@linux.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <02239d95-0253-a223-28c2-016cca3ab4d2@linux.intel.com>
Message-ID: <ZNqimGhCD+70q/lG@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_145436_017537_ECCCC8EB 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon, Aug 14, 2023, Binbin Wu wrote:
> 
> On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > +	struct kvm_mmu_notifier_range post_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.arg.attributes = attributes,
> > +		.handler = kvm_arch_post_set_memory_attributes,
> > +		.on_lock = (void *)kvm_null_fn,
> > +		.on_unlock = kvm_mmu_invalidate_end,
> > +		.may_block = true,
> > +	};
> > +	unsigned long i;
> > +	void *entry;
> > +	int r;
> > +
> > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> Why attributes of value 0 is considered not a value? Is it because 0 is not
> a valid value when RWX is considered in the future?

0 values don't require an entry in the xarray, i.e. don't need to be stored and
so don't consume memory.  The potential conflict with a RWX=0 entry has already
been noted, but we'll cross that bridge when we get to it, e.g. KVM can easily
support RWX=0 by using an internal "valid" flag.

> Both the changelog and the document added mention that the address and size
> of attrs will be updated to
> "reflect the actual pages of the memory range have been successfully set to
> the attributes", but it doesn't.

Yeah, on the todo list, all of the changelogs are horribly stale.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
