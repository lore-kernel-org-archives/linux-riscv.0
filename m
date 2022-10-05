Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB703C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6WhVpYProB3hrWgXPEnhLduk/7M9BtqIAPxblQLE/g=; b=r5ypdvMrDfes6s
	hwP4/zCZfSBJxAQ/rUtO/8q+AduztZOBP+DQZn7NzL1eoB98zs24767ju1hQ0480NEbfDcy1p66rN
	egGz33hy91ps5DezNeXxsljVCQI4Vi8/224UXNFAu+queyfTZvga/Px13w6MEtBCq7GA5DysJJCYp
	GTio00NTh2TgfH2olvgE6ork25q3LjhWisRdq/PdmrgDbHmi8MpAVBwFquNW4v+JTOz28hlzQAfTB
	uJ2wM+CxhjidsrDdpqZszoUAQJLuhS0Ubd0txmwUhStUb07TJw8r3QGxEtNru7BstShPnYBaZV37v
	la9/3M5mIKcEvpbaILNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofydT-00Cmhk-TW; Wed, 05 Oct 2022 07:16:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofydN-00CmhI-U9
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 07:16:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id kg6so18207049ejc.9
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XUixTn9UIg2U+4sm1auJsVJmBCsYKmkoUbTMo+A7dPk=;
        b=o/bwBVCB3xaOMAgSBpbhNLSnvwPeEsj2qR0h5pAq+9W/Lbw8a7s7jTKRyiO8racKu6
         7UHnAljFvGKq6FQOvYe6fF6aGgfl50G/udkbBe+XGROR1wNURdBqcyIm0VrMsVu/wHLJ
         1H72bkaOlJrGcEATUmhnoEukGCx1y/9UmSWMLC8q9o3PQo737Bhh5NNbPfplur9eRJoV
         TqCRetefGvp2zj3yXW9qMVKnUfVU/jNPzPhnYPdooniGDbb9OwYR1I3BdzJjweixbJ9p
         YAPvtAadl6+2pA73rTQTJh1u2kfbl9lkglGrjzQG19jP4pl2tOPXoLvl8r5wYfIs8z6P
         757g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XUixTn9UIg2U+4sm1auJsVJmBCsYKmkoUbTMo+A7dPk=;
        b=tXn2gwuN1LnsBj1FSnwXktjGQPUNOxc4bRkqimHLHV+atf9uc2eGqe26uM0PVsWzXh
         cQUSFgVErPujpeNK4hQCqFeSGZ0YmdZFafBxvSeZo6fWMGfZuNkn6CLLyMzONO5/AQxQ
         26Mw9LjDcMcv3RQCPt+9aAZ6V/wAdZLjE6/9gxHmGhG4vKF3iMxuoBh9rUdpPBak1AqL
         puQIsSPyuKRqxX5oePyzKIQ+1eJKW8iLFJsdlGufk3wjix+OdPuOeBBKYc8f/0gmMSfe
         TBtNz1/Rjfr55AK4oFAN4TFNN5R3fhmLA1K+5bTX+ACnTo35JGCZ7KAMBpkuFUZ58YDA
         mg2Q==
X-Gm-Message-State: ACrzQf3LC1y6qoE07qhzDqPfGIRAZD4OGf9bUUdDn5JgvWg+U5FyL+wH
	XML0osJlmotQcTyViCHyKSLLjw==
X-Google-Smtp-Source: AMsMyM7GmFwDyW7NIGvWoLWD2p5cIFEbaThsY0rZJqaeBm+vtEuIsH8r59LCsPGa13hHpTNg5PGd+A==
X-Received: by 2002:a17:907:728f:b0:78c:336b:d8c0 with SMTP id dt15-20020a170907728f00b0078c336bd8c0mr9317404ejc.429.1664954159501;
        Wed, 05 Oct 2022 00:15:59 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d759000000b0045391f7d877sm3182456eds.53.2022.10.05.00.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 00:15:59 -0700 (PDT)
Date: Wed, 5 Oct 2022 09:15:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Message-ID: <20221005071558.45pc3i2m3eb747ov@kamzik>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
 <20221004170027.duk2nc6pq52d4vcf@kamzik>
 <Yzx8YfVUmHc/3CJl@spud>
 <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_001601_998046_FDF01786 
X-CRM114-Status: GOOD (  47.04  )
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

On Wed, Oct 05, 2022 at 12:43:01PM +0800, Qinglin Pan wrote:
> Hi Conor and Andrew,
> 
> On 10/5/22 2:33 AM, Conor Dooley wrote:
> > On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
> > > On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:

> > > > +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
> > > > +asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
> > > > +		"srli %0, %0, %2\n\t"					\
> > > > +		__nops(3),						\
> > > > +		"srli t3, %0, %3\n\t"					\
> > > > +		"and %0, %0, %1\n\t"					\
> > > > +		"srli %0, %0, %2\n\t"					\
> > > > +		"sub  t4, %0, t3\n\t"					\
> > > > +		"and  %0, %0, t4",					\
> > > 
> > > This implements
> > > 
> > >    temp = ((pte & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
> > >    pfn = temp & (temp - (pte >> _PAGE_NAPOT_SHIFT));
> > > 
> > > which for a non-napot pte just returns the same as the non-napot
> > > case would, but for a napot pte we return the same as the non-napot
> > > case but with its first set bit cleared, wherever that first set
> > > bit was. Can you explain to me why that's what we want to do?
> > > 
> 
> For 64KB napot pte, (pte >> _PAGE_NAPOT_SHIFT) will get 1, and temp will be
> something like 0xabcdabcdab8, but the correct pfn we expect should be
> 0xabcdabcdab0. We can get it by calculating (temp & (temp - 1)).
> So temp & (temp - (pte >> _PAGE_NAPOT_SHIFT)) will give correct pfn
> both in non-napot and napot case:)

I understood that and it makes sense to me for your example, where
temp = 0xabcdabcdab8, as we effectively clear the lower four bits as
expected (I think) for napot-order = 4. But, what if temp = 0xabcdabcdab0,
then we'll get 0xabcdabcdaa0 for the napot case. Is that still correct?
With the (temp & (temp - 1)) approach we'll always clear the first set
bit, wherever it is, e.g. 0xabcd0000800 would be 0xabcd0000000.  Am I
missing something about the expectations of the lower PPN bits of the PTE?

> > > >    */
> > > >   enum riscv_isa_ext_id {
> > > >   	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > > > +	RISCV_ISA_EXT_SSTC,
> > > > +	RISCV_ISA_EXT_SVNAPOT,
> > > >   	RISCV_ISA_EXT_SVPBMT,
> > > >   	RISCV_ISA_EXT_ZICBOM,
> > > >   	RISCV_ISA_EXT_ZIHINTPAUSE,
> > > > -	RISCV_ISA_EXT_SSTC,
> > > 
> > > Opportunistic alphabetizing an enum is a bit risky. It'd be better if this
> > > was a separate patch, because, even though nothing should care about the
> > > order, if something does care about the order, then it'd be easier to
> > > debug when this when changed alone.
> > 
> > I think for these things it is s/alphabetical/canonical order, given the
> > patch from Palmer I linked in my previous mail. Although thinking about
> > it, that means V before S, so SV before SS? Which his patch did not do:
> > https://lore.kernel.org/linux-riscv/20220920204518.10988-1-palmer@rivosinc.com/
> > 

I wonder if we should just go with alphabetical order (or no order) for
places that the order doesn't matter. In my experience it's hard to
enforce even alphabetical order when nothing breaks when the order is
"wrong". Where the order does matter we should enforce whatever that order
is supposed to be, of course. So maybe Palmer's patch isn't quite right,
but the canonical order, which is almost-alphabetic, is going to make my
head explode trying to use it...

> 
> Not very sure about how to place it by canonical order:(
> I will avoid reorderint other enum variants in this patch, and only add
> SVNAPOT just before SVPBMT. Another patch to reroder them is welcome:)

Or even just put SVNAPOT at the bottom of the enum for this patch.

> > > > +
> > > >   /*
> > > >    * [62:61] Svpbmt Memory Type definitions:
> > > >    *
> > > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > > index 7ec936910a96..c3fc3c661699 100644
> > > > --- a/arch/riscv/include/asm/pgtable.h
> > > > +++ b/arch/riscv/include/asm/pgtable.h
> > > > @@ -264,10 +264,39 @@ static inline pte_t pud_pte(pud_t pud)
> > > >   	return __pte(pud_val(pud));
> > > >   }
> > > > +static inline bool has_svnapot(void)
> > > > +{
> > > > +	u64 _val;
> > > > +
> > > > +	ALT_SVNAPOT(_val);
> > > 
> > > Why aren't we using the isa extension static key framework for this?
> 
> I am not very sure why static key is better than errata? If it is
> really necessary, I will convert it to static key in the next version.

Well the errata framework is for errata and the static key framework is
for zero-cost CPU feature checks like has_svnapot() is implementing. The
question shouldn't be why static key is better, but rather why would we
need to abuse the errata framework for a CPU feature check.

> > > >   /*
> > > >    * Probe presence of individual extensions.
> > > >    *
> > > > @@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> > > >   	if (cpufeature_probe_zicbom(stage))
> > > >   		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> > 
> > While in the area, could this be converted to BIT(CPUFEATURE_ZICBOM)?
> 
> This zicbom related code is not produced by this patchset. It may be better
> to convert it to BIT in another patch.
> 

Actually, to be type pedantic we shouldn't use BIT() below, but rather use
the (1U << ...) like above. cpu_req_feature is a u32.

> 
> > 
> > > > +	if (cpufeature_probe_svnapot(stage))
> > > > +		cpu_req_feature |= BIT(CPUFEATURE_SVNAPOT);

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
