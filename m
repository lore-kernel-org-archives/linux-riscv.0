Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49871C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZ07KmPlAueuLs5++ybVFnfrZ9fd7t6zEKMnHyMbapg=; b=Y8kUzJoevhiAms
	AJpy4ut3ex3w1vCFXMgdIU93bJGZCzCzsWX6LU8GW5KQmhgrk/lD0q3izV/yPv0G/s5VRZp6JVfmx
	7DRXP6aiZ/cFPcKqLOwR2UEpx/v1hX0+3IAW9y4mGEAOglv2kkY3gMFt6hu1CDYF9gQA8BVCvhIaR
	5xyQDAbczvgiIKYBtILAZKhsmER9ImpeB2VDuhIalPAFxsxLXLVNcbJd8TU0qwtvr7psoPAHbHvv6
	zIg3Ytp6HNUe7H2f9k4B87fFEeEEGrS+5eobDme7Rybt0LeviLtFkl8x6EKB2MhJoJiTzkcrWY6Hq
	bdHY+NsfKVHAFbWfAUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlhz-00000006JpU-0DB2;
	Wed, 24 Apr 2024 23:07:23 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlhw-00000006Joc-2IWm
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 23:07:21 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-22ec61aaf01so234720fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714000037; x=1714604837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5EOPLUxSGdh2673E9UnVgdv/f9WeKREWyE41T1+ComY=;
        b=cQ5u22eHMiLXQ6OlUUf1Oor48kQLMyzIcjxJTFdfx9njw9oCilJT/VLwNeYOhp/Cg4
         WHZKJWqFajX1CwBj0ga/SVsWvSxLlC8h1RUAzwLP8WzKrd0eS8YIdBXoEPCKXyT2cxc7
         rwkzF/5Wn8x/zCdttlIgw6KfFuGUZTNWAXkY96ixKVUso/t/NXi+Bkum+x2Kd/KGyCK8
         lGisH/dvZNUAvH+Eq/YCUVqKp8a2P7cbRPzZqvsQ2A/UOCI/2hsQsou7anQGAw5LWZQi
         ThuzQCc3H1rzLBO1d4COINAORaXex5gTwBC2e21ZJ7QhCH7u94iZ19a8Oap5uHaiPebl
         vL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714000037; x=1714604837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EOPLUxSGdh2673E9UnVgdv/f9WeKREWyE41T1+ComY=;
        b=ClGExmiX5QDVDciwISGEWx48uPZ+saDgIbEvnFViUSIulnWTY50wtBDFLYG6dzUG+4
         SRrRXOHX5Qf9v1sb+4fUnHmGQdPT2D1mVE8b8vLrjsjfZhYv8DG53aKHDhMBpD15vZdD
         wLCo79Ok0hVK6NZaSyN2TTuk9co6oTO5eBmQjpBspdVETgqvKS7EfMQ+/P/vq1iIMf8L
         d2vmAtnohCH06fdWoqpQPzZwogv59gNErsgUeB3ui9oc43zNnj7cmKMK19Fzq/Bajf/D
         0Mq8tWuMdzl+0Pfj5/jxmPuueX5LPNEo837w2dK8v+QNVIpRQptzsFkXsAnCJcd3Ev3T
         8P8g==
X-Forwarded-Encrypted: i=1; AJvYcCUOpeQ8YCmir03bLwrVVhn29PwvmM8beDmbZwPZHLJECc/WZDc/VT1LpyX3g0lf019cBInz1IARoBRE/jmA8iRkhiOV+V3V/OeXwF+lXvEe
X-Gm-Message-State: AOJu0YxjeCxt3laJgMEWHGRCV9qF4XD/sSLSK/yjVk/GjzUeYtopul+/
	XHFbkqepCEnoHEmF1s1yptIzzw49JuY6WOOlRcT4ASl58segYoXS3ELY16d7F6I=
X-Google-Smtp-Source: AGHT+IEK1yF/pF3Jt1MaMAE7gbVSzzN/c9vmeIlr7aFyXy4aHkiw6cz3OYQ6jtkyalR6CHilLOVggw==
X-Received: by 2002:a05:6870:c0c7:b0:235:3d0:3096 with SMTP id e7-20020a056870c0c700b0023503d03096mr4168277oad.24.1714000037198;
        Wed, 24 Apr 2024 16:07:17 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id oh23-20020a0568702c9700b00239379f06cdsm2596004oab.9.2024.04.24.16.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 16:07:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rzlhr-009uvX-JB;
	Wed, 24 Apr 2024 20:07:15 -0300
Date: Wed, 24 Apr 2024 20:07:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 5/7] iommu/riscv: Device directory management.
Message-ID: <20240424230715.GI231144@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <232b2824d5dfd9b8dcb3553bfd506444273c3305.1713456598.git.tjeznach@rivosinc.com>
 <20240419124017.GC223006@ziepe.ca>
 <CAH2o1u7_YBtS6m1-T56tmxud1mda2gb6tLGVpbBSs15FPcjaGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u7_YBtS6m1-T56tmxud1mda2gb6tLGVpbBSs15FPcjaGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_160720_767438_FD3E4855 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2024 at 04:01:04PM -0700, Tomasz Jeznach wrote:
> > > +     /* Update existing or allocate new entries in device directory */
> > > +     for (i = 0; i < fwspec->num_ids; i++) {
> > > +             dc = riscv_iommu_get_dc(iommu, fwspec->ids[i], !iommu_domain);
> > > +             if (!dc && !iommu_domain)
> > > +                     continue;
> > > +             if (!dc)
> > > +                     return -ENODEV;
> >
> > But if this fails some of the fwspecs were left in a weird state ?
> >
> > Drivers should try hard to have attach functions that fail and make no
> > change at all or fully succeed.
> >
> > Meaning ideally preallocate any required memory before doing any
> > change to the HW visable structures.
> 
> Good point. Done.
> Looking at the fwspec->ids[] I'm assuming nobody will add/modify the
> IDs after iommu_probe_device() completes.

Yes

> > > +             /* Swap device context, update TC valid bit as the last operation */
> > > +             xchg64(&dc->fsc, fsc);
> > > +             xchg64(&dc->ta, ta);
> > > +             xchg64(&dc->tc, tc);
> >
> > This doesn't loook right? When you get to adding PAGING suport fsc has
> > the page table pfn and ta has the cache tag, so this will end up
> > tearing the data for sure, eg when asked to replace a PAGING domain
> > with another PAGING domain? That will create a functional/security
> > problem, right?
> >
> > I would encourage you to re-use the ARM sequencing code, ideally moved
> > to some generic helper library. Every iommu driver dealing with
> > multi-quanta descriptors seems to have this same fundamental
> > sequencing problem.
> >
> 
> Good point. Reworked.

I suppose by force clearing the v bit before starting the sequence?

That is OK but won't support some non-embedded focused features in the
long run. It is a good approach to get the driver landed though.
 
> > The release_domain has landed too now. Please don't invent weird NULL
> > domain types that have special meaning. I assume clearing the V bit is
> > a blocking behavior? So please implement a proper blocking domain and
> > set release_domain = &riscv_iommu_blocking and just omit this release
> > function.
> >
> 
> Updated to use release_domain, should be cleaner now.
> Clearing TC.V is a blocking (but noisy) behavior, should be fine for
> release domain where devices should be quiesced already.

blocking is fine to be noisy.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
