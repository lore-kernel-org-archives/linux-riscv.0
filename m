Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF2E7107A
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iKfz3FQaZo2C15VSiYIdm0IqBTn9TKGIoxXpYwl0pCA=; b=E93rvbvzlLpH91aRnjJTnuTDMT
	58gzDIc/FEmsO95cLkWMXyzGtVppCUM6sjWXtI7kEe8faikL6d3un4hyPpnaScXtbsPdVWAx5evzX
	Noc/qYUcMc+jWKNubmOFqek8mSqP3zRtXdf29ysjdi82QcSwVJ0TqsCqWhQ8id56IYGeOAlx+S3nu
	J67pubcuSYpCyNOdACqVtdOPY0nuwhU6R/KrohqJeY8LudpA+2J0imic3r1CExzPScPR9lIG05/h9
	QDN6VSABY6Z8GfwDUeB5kq8Fu92h5ao6bpsRT9UUt/trg3ImatBZXPFwwUyTOPm/rwwPxP5nqCRzw
	uOQBz0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKbe-006Fyl-0h;
	Thu, 21 Sep 2023 14:24:38 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKbZ-006Fwf-2U
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 14:24:36 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c577fea3dcso8361285ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695306271; x=1695911071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=i42f9Lc1sTmK1duCL0p9kDfVhu3/gBD9GsPcr2D3GUJ+d24xdge9Tyi8KeC8AfbrFR
         2zoUC/6gDqiCE2JgL7JT2KAOHv1WpfMDQomx/OLGTMwihAY0X/HgMdk3D7XlFS00evj5
         zYW2+Cjj90KtMOtIsHFtYcaDMqEVJ2J/qVF7rxhHtGZL/z2gRaaOXaX3tJbB0reF98mv
         yoYFn1ENU8IKxsqjnYeWAGai8qEsKh3nSFCp69249xgl7LwVtoj2FhzDsjNzZ/sHlm40
         KrcxvVLmRMkWl2EIudtR13FeZG2EDnRy6o0Lx0Xs1Ew6NeCatiJAbGpE/1z3Udo3J07a
         eXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306271; x=1695911071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=tB9cJc9BnOLk4KIYNqU7SiNTKTP0fu1+FahvmsMjKONg8oXiMw9Rkty7H+DTpB3921
         /nG8XwnS3fknCMGIKg6KWIf70rbe9P3bfRyOFGIaHGnbkc4pLQNjHgq5qNXBFshNtFt4
         a1UbmRArdkTYzsD9YsBO1J5WPVExtL/OPrkQaI1UPHyEze0o1cPS8EPvO6s8cMqoJKSK
         imFU6fTDbg048YT3dWIUYLxjkEH6RqLBw5fMeoNjIrKL5ER+2taDxCjCDoZCxQUnyjc1
         ZXsS+H4HjmLsS4XIcB22jOPp/J8Ci/Mh8tId0NpNL2N3lpA6MsnVGb2Dhdy8LjhIwCli
         3EnQ==
X-Gm-Message-State: AOJu0YxVqvtgg2g3Hl2xIuMxXaQ74LTszMModJwRQZG4rSd8sYvnn1b+
	J3zInumEIs+UN17ANgqMdqhwSnezjzU=
X-Google-Smtp-Source: AGHT+IGn6bxt0aytyfRrQvdNGXaSXeT8sIcIptWMB2qfEas65NY2TcrLdWuDyigFBOjNZ28AUG3erUeC33s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce86:b0:1c3:c127:558 with SMTP id
 f6-20020a170902ce8600b001c3c1270558mr71199plg.0.1695306271120; Thu, 21 Sep
 2023 07:24:31 -0700 (PDT)
Date: Thu, 21 Sep 2023 07:24:29 -0700
In-Reply-To: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050> <ZQr5uXhV6Cnx4DYT@google.com> <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Message-ID: <ZQxSHXIGdWXy+zDU@google.com>
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
X-CRM114-CacheID: sfid-20230921_072433_811877_AC4F5676 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, Sep 21, 2023, Xu Yilun wrote:
> When the invalidation acrosses multiple slots, I'm not sure if the
> contiguous HVA range must correspond to contiguous GFN range. If not,
> are we producing a larger range than required?

Multiple invalidations are all but guaranteed to yield a range that covers addresses
that aren't actually being invalidated.  This is true today.

> And when the invalidation acrosses multiple address space, I'm almost
> sure it is wrong to merge GFN ranges from different address spaces. 

It's not "wrong" in the sense that false positives do not cause functional
problems, at worst a false positive can unnecessarily stall a vCPU until the
unrelated invalidations complete.

Multiple concurrent invalidations are not common, and if they do happen, they are
likely related and will have spacial locality in both host virtual address space
and guest physical address space.  Given that, we chose for the simple (and fast!)
approach of maintaining a single all-encompassing range.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
