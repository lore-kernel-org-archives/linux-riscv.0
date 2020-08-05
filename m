Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0869C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 08:13:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823762177B
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 08:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b9SJ96v2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="AdpdWlhX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823762177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j/9RrM5roJ7Ys9kkW6jom282jXrBN6unJwYl0A5t8dQ=; b=b9SJ96v2sOoSyVC1ipn6N9Fee
	HyMvdEparEG5KxG+Qm8OncK/Fa214FMrrYM/UQiKeE006owcCqhrxiKEYRqFpwbVNQefUXPycm7cT
	jGvhkqHV3brsNrhl+qiYhLQH+wEtpuR8iXeblcDUfsUuL417Xs72CevHMRUNWaax4mhxrY+Um4vjl
	SqLzr7uIWTTT/z9P2BWJeb+1G3UTFtzF26q56/MJjn5QI+EMG3WYlrz6IeZsb10q40o2va8cFBaJ9
	c8+fuqy1eKqROP7HjPDRx6CZxD7cg7pUQZ8FXm/a47Lg6aX3+1yOvgXz0naNZfk6W1BptIlf+SSYm
	0kJbStwtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3EXh-0005jO-LA; Wed, 05 Aug 2020 08:12:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3EXf-0005is-B2
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 08:12:56 +0000
Received: by mail-wm1-x343.google.com with SMTP id t14so5399154wmi.3
 for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2020 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lQpAXAKr6GTVwsUX1cbs0chy8xDobqsX5dTE8YjHl24=;
 b=AdpdWlhXTzCcR+WzTN1v4E0OsU4J2DMIl8YWvZ3Sj9Yh7o68EKCRpwq9r+QzMLyyir
 TnwhUmcCtmDuyIcndoKOrhe1r4agoZ3COSZO9GlnjNxXvFsi70tu1i3HdomJveoMVIl2
 yOz6crp34Rxxq6WbaOtwjYoB/VsiHREjqs4FdJGIoR+wAdmw0Z46hKqRRmeop4RpGfEs
 w3tGKNfgWF4wzGDa3iRVSRqHt/rv2hL87qdjHnerIOBP/alshyNwmF54PActY99ka0bu
 u66WrEsPE3cy+d/GtaAz6i7iKyNq3QLFxTP7bPLqrk3egU+tzs7Knvn0ilnYjMdYv/Xo
 aCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQpAXAKr6GTVwsUX1cbs0chy8xDobqsX5dTE8YjHl24=;
 b=C51fSaebRsUFIumh/mIE4Sjk7Lol5gdgiN/x9WV8cykCedSEtWkvY7Y/n4w2GLmgns
 ON1c3JuMozjTWnx2I3yUrJPWJabt1PeM3/Y3+6sQs93V56AupyBUDExdVhrMMAa329Yc
 FJSwayec79JbAie+97eIfGj3BF2O1azbmOWANd4R68z2o2wOS5fN6iTpUQ3/Q0+Cq2QT
 MxyunrtrMChRTexsnfMvYRjX/32vXXa/zwMPYQAYGermBQrAP7smWtyl4iFaHXhspfhZ
 F2d/PmmwktQZ1b8Od9S97knmGAAfBO+5rXdYN8FV5ECV8UOZ4Voiqd7cNHvmK0PEay+1
 5Uow==
X-Gm-Message-State: AOAM530C8jMDqMuGrto+eBfTNbWCBIbXRVUech7VdMSfqeZeaz5pW6Vv
 M3yOW4PEeqdmA9+NyYTNnWhaW0ECjot+3A==
X-Google-Smtp-Source: ABdhPJzEchxyBP3fBg8aeweqi9LZ95rwdUU2Ah+J0k/rWSDJPv5NCgO6JGaZjKSIO01Vepgvc9S+mg==
X-Received: by 2002:a1c:9c91:: with SMTP id f139mr2302972wme.134.1596615172354; 
 Wed, 05 Aug 2020 01:12:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:f693:9fff:fef4:a833])
 by smtp.gmail.com with ESMTPSA id e4sm1635863wru.55.2020.08.05.01.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 01:12:51 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:12:50 +0100
From: Will Deacon <willdeacon@google.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Add sfence.vma after page table changed
Message-ID: <20200805081250.GA3064472@google.com>
References: <CAAhSdy1QbMjZxxu+wSBYr3+3oaM2Qg=_Uwj8dfQidi=ck6PV_Q@mail.gmail.com>
 <mhng-1f7adcd7-551c-4b8a-80f5-e1230b335c6a@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-1f7adcd7-551c-4b8a-80f5-e1230b335c6a@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_041255_421388_7E0A478B 
X-CRM114-Status: GOOD (  22.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Marc Zyngier <maz@kernel.org>, aou@eecs.berkeley.edu,
 syven.wang@sifive.com, catalin.marinas@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 anup@brainfault.org, greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 07:03:06PM -0700, Palmer Dabbelt wrote:
> > On Tue, Aug 4, 2020 at 8:32 AM Greentime Hu <greentime.hu@sifive.com> wrote:
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index f4adb3684f3d..29b0f7108054 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -202,12 +202,11 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
> > > 
> > >         ptep = &fixmap_pte[pte_index(addr)];
> > > 
> > > -       if (pgprot_val(prot)) {
> > > +       if (pgprot_val(prot))
> > >                 set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
> > > -       } else {
> > > +       else
> > >                 pte_clear(&init_mm, addr, ptep);
> > > -               local_flush_tlb_page(addr);
> > > -       }
> > > +       local_flush_tlb_page(addr);
> > >  }
> 
> arm64 appears to be upgrading all set_pte()s on valid kernel mappings to
> include the fence.  It looks like the message from 7f0b1bf04511 ("arm64: Fix
> barriers used for page table modifications") is out of date, as I can't find
> create_mapping() any more.  If that was some generic kernel thing then we
> should probably upgrade ours as well, but if it was arch/arm64/ code then this
> approach seems fine as __set_fixmap() isn't on the hot path -- I guess this is
> fine either way, but there may be other issues that the arm64 approach fixes.
> 
> Do you guys happen to remember what was going on here?

Basically, the architecture says we need these fences in order to guarantee
that the page-table walker sees the updated entry. Since we couldn't
tolerate spurious faults on kernel mappings, we had to add them (for
userspace we don't bother because in reality we don't tend to take the
spurious fault, and it's harmless if we do).

But having said all that, check out 42f91093b043 ("arm64: mm: Ignore spurious
translation faults taken from the kernel").

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
