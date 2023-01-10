Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731AAC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ztrf6/rUB5n0WgikYbZGK/etwmn6dB5oXQzlcQSmHw=; b=f5Gg39RWrH9pOo
	RtvF+xQEBVORqAw3aKcSPkoZ4kp6O8w2j+5uEY5mfcaDFUTuZw4y3ZRpeoScDr0/7tiyKsEXBVtwK
	Mc1TgP59NppRFubZe5y1nYXwF/nA6AbTtJgCfu6n/uaONfqgb432sevQXm9xGOGvfNESFgLuFyLix
	nQh+8P9JGw3CFAJlHW4mnqV8Wqw45akJeslFaFBMaJXx7OV2zMvgD7Y9kQFZY8wtAQm71p/swsF70
	G4s47nJVGISXuyrI01QD9VhEjob6UcLePTWLiHtzjlIXK0jpo4/a6KMdPoCs1Wq9jAgfebYk5EBue
	8brl5DjZ+5KTDV3zxh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8bz-005YaP-Jz; Tue, 10 Jan 2023 06:59:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8bw-005YYD-PZ
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 06:59:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id ay40so8046114wmb.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 22:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYD5MyerxPHDgEFU7gYGQqySbkICvj5ul/SHrnuhJgk=;
        b=Npp8rbeuvo8Jz2ry2WSzGJAwmgUsb848J0cnSMQGSOAnAPrqdR4FHDtT32iZtLeGDH
         I/flTR3XtLmfzMgcZJXz8e1DNk996TJxDJKF3312O9JQLrLaESTUoCV1S2u+IyAXsc3Y
         NQlsPt28SQDlnkKZ944o3ubjgg+IwHBzPPnUN9AxZX4MXZ/utiecgpEWMM0YV2fKfY02
         vgij2mNTWxXwEXoBVJMAkMVYpE3wiJ+mS0KeZVhtIwWEusGtkbbP/aWTTt3EPNOdeSDW
         rTRnicWROe7CwpaeHyzzT3zzyNbtxULpEliSar/nEtakfcnbOzaM9Z0icIeA8Ph3Wvlm
         ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYD5MyerxPHDgEFU7gYGQqySbkICvj5ul/SHrnuhJgk=;
        b=g/t7z0p/zcFYmVfF0iMvdQNCGFMp8I8ori/Bq+DI1/D0q4AtvAAfwZkilwUxDKB9OB
         956QS3y5sHjs79qnz/O7XzSu1c3s0RPPBywhOLdiElTN97cvxD8Vm7LqTc849Ua5PRnB
         4pVZkeQty9Sgl+V0+SS4tXc4C0PlCh9yemK5p9NTylZALV+tYG7L3JuO4jUIOiq/t492
         GlOY0CZQHtsebJJq/NxxPGUrpAPmOYMNsI5baiTP2iuyg8C7MwHjh+IzSLhnVxtIkOx8
         Z4ioCytcjXp7H10DYCIkgVWB54ihIw3UvDKTtzdQHNB4adxF2jwK0hQfjow4EzE9cv1J
         8v8A==
X-Gm-Message-State: AFqh2kqk++EDfCaBDnwGwREufuMtlIcAWbcK1xzedcxYzcJ842PzPOQe
	NbeEPTKbOtPOIAipanERErpt1RcTjPbW04hR
X-Google-Smtp-Source: AMrXdXtPb0KvBQPoN/dxU9m6L2RZsntp6ZmPfrxTFkBPCo2I0aTWvX5XQ2xMI3oFobo0w+Bz6YbzWA==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id o20-20020a05600c4fd400b003d34877e556mr51013210wmq.29.1673333989079;
        Mon, 09 Jan 2023 22:59:49 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bcaa47bf78sm985695wrr.26.2023.01.09.22.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 22:59:48 -0800 (PST)
Date: Tue, 10 Jan 2023 07:59:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Message-ID: <20230110065947.iieuscadlb6veygf@orel>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
 <20230109144525.4xgnpeb6zcyyvx4j@orel>
 <62163664add9493db394c8ca45b73ce2@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62163664add9493db394c8ca45b73ce2@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_225952_848762_EC0B07AA 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, Jan 10, 2023 at 06:45:19AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Monday, 9 January, 2023 10:45 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> > Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to
> > kernel_page_present() function
> > 
> > On Mon, Jan 09, 2023 at 02:24:06PM +0800, Sia Jee Heng wrote:
> > > Currently kernel_page_present() function doesn't support huge page
> > > detection causes the function to mistakenly return false to the
> > > hibernation core.
> > >
> > > Add huge page detection to the function to solve the problem.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > > ---
> > >  arch/riscv/mm/pageattr.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > > index 86c56616e5de..73fdec8c0a72 100644
> > > --- a/arch/riscv/mm/pageattr.c
> > > +++ b/arch/riscv/mm/pageattr.c
> > > @@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
> > >  	p4d = p4d_offset(pgd, addr);
> > >  	if (!p4d_present(*p4d))
> > >  		return false;
> > > +	if (p4d_leaf(*pud))
> >                       ^ p4d
> > 
> > I guess you got lucky with the stack garbage in your testing.
> You are right. But the reason it is added here is because kernel page table walk is checking for the p4d_leaf as well. 
> For example: walk_p4d_range() in the mm/pagewalk.c. So, I just trying to make it consistent to the Kernel page table walk mechanism.
> Should I remove it?

The only thing I see wrong with it is the use of the uninitialized
pointer. Just change 'pud' to 'p4d'.

Thanks,
drew

> > 
> > > +		return true;
> > >
> > >  	pud = pud_offset(p4d, addr);
> > >  	if (!pud_present(*pud))
> > >  		return false;
> > > +	if (pud_leaf(*pud))
> > > +		return true;
> > >
> > >  	pmd = pmd_offset(pud, addr);
> > >  	if (!pmd_present(*pmd))
> > >  		return false;
> > > +	if (pmd_leaf(*pmd))
> > > +		return true;
> > >
> > >  	pte = pte_offset_kernel(pmd, addr);
> > >  	return pte_present(*pte);
> > > --
> > > 2.34.1
> > >
> > 
> > Thanks,
> > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
