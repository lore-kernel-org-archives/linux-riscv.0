Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C5C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPSX3fNbizKv7lqA8JomgAvq4Q1ubyQroK3PxbH9ykA=; b=0tztB5l0ZsSC4H
	Pa3DwCCmomXiwnH2pKc7Q5lE+Bkb3x9/C4y8IFJ41pBwiXIXgJBoQU9MPn3Q9N8zyxAXtf01K7Q2I
	zXjBmK1k21qOuX6qTthzdtTyq3tr7LuevwqoU0CxGudOERI+qDgdlJocCphC3QX9txPN7+WVu2toM
	Qf9yYO9hkAlSJ3rATTDYx6gJQ530nLKaFlNOubv/7wwRr6O8WKFNpPm+5Zm1ZuNZcrfQ0aYkh9i8l
	jeC8icMvBJYErhGc5spdyMClrPjfZsVApAe//rV8Il5m/O3XZCeuFLOHGVwdMHyvVLGS79KeMxwu8
	lEyY2qI0mN9OYyp4fwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4PS-00ECRF-Uy; Wed, 05 Oct 2022 13:26:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4PQ-00ECP3-7S
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:26:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id bj12so35400755ejb.13
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=RgNbY5HAHawTK3xj1KvajyKupBufLmUr8wm8JYM81xA=;
        b=L8dO2e4yKiFAYi9LJy5J8gofdzEzpRNXadpWlxCj54Nd2LujvRsiryRJmL1QCAXkDI
         XzC1BNFvOvFjQnB6V7EdgLWtW91/O3CFRD85lkhAGZvye5vho3v0jSwlssdh5U0ktigG
         mLlKBHdGN+NBclFxmehRBeTPVmcHhLsrBCQSzRf1a1x4/BYShdqiEBOib4qLdxzymD6H
         63RJK+1/IAgbRcOsmG8St+OfgBCqQzpxUHoy/tV65VyvCKRbvVTaH8HXGEcYQxoKxE50
         Gs6P9h7V1PuNx9YB5BbazkdgVXSGggnA0RgfQCbDrMO6fHws9ztF9hQC2PT8RobiyP4o
         9BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=RgNbY5HAHawTK3xj1KvajyKupBufLmUr8wm8JYM81xA=;
        b=Q7n2xbcrw2QM1Qm+7xuLS7mcPdpK5tkEq9SFIdT43MrSRH/dqDjlc77fVVy/h64tTg
         HUm3LQygWfLd8u1SCbwhTtrlq5xzN+iIh714ApFnmuIueSTj9fiitNhHpSJZxXBPylPD
         A9K52u7hhlSo6NUxF8bLfNI3/ACrN5CbkLfmaDnHGjo5l55OArUeftJfFkKydN7DckMs
         8f1jPRT0Znk02YNWAG6qcFC2C0Qi6kgfoo7V2XHsox2yXYABu6/sRoHkarPkPZT8UIa9
         iVEb9q9TUKgYL+1WmmulIkDuXxFSSavqjqo06OGKhvLO4REX1xEHbMs8bYhwtACnNhbi
         ogew==
X-Gm-Message-State: ACrzQf1ojj/FF+xEakSW9Zj4Q2DA7rbiLUefMBER3z06jKfjjw6g03Is
	rZ0Zvrq/z+1/QctJulk3JrQuEVNMILwmuA==
X-Google-Smtp-Source: AMsMyM7CJF3hLf41cGC2aUx05KFeQ+VlL/lNMSv0CeOky5/fqG61SnH/dWfEuo11+Pf1+DFliU85UQ==
X-Received: by 2002:a17:906:eec9:b0:783:e662:2513 with SMTP id wu9-20020a170906eec900b00783e6622513mr22986971ejb.656.1664976356633;
        Wed, 05 Oct 2022 06:25:56 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id u5-20020a509505000000b00458ac4b4798sm3811804eda.76.2022.10.05.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:25:56 -0700 (PDT)
Date: Wed, 5 Oct 2022 15:25:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Message-ID: <20221005132555.hmwrzncg6wizt3k6@kamzik>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
 <20221004170027.duk2nc6pq52d4vcf@kamzik>
 <Yzx8YfVUmHc/3CJl@spud>
 <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
 <20221005071558.45pc3i2m3eb747ov@kamzik>
 <9055bb90-b314-d2cf-8d5d-8c12936f4cf7@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9055bb90-b314-d2cf-8d5d-8c12936f4cf7@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_062600_288875_B828171F 
X-CRM114-Status: GOOD (  27.17  )
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

On Wed, Oct 05, 2022 at 08:41:02PM +0800, Qinglin Pan wrote:
> On 10/5/22 3:15 PM, Andrew Jones wrote:
> > On Wed, Oct 05, 2022 at 12:43:01PM +0800, Qinglin Pan wrote:
> > > Hi Conor and Andrew,
> > > 
> > > On 10/5/22 2:33 AM, Conor Dooley wrote:
> > > > On Tue, Oct 04, 2022 at 07:00:27PM +0200, Andrew Jones wrote:
> > > > > On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > 
> > > > > > +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
> > > > > > +asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
> > > > > > +		"srli %0, %0, %2\n\t"					\
> > > > > > +		__nops(3),						\
> > > > > > +		"srli t3, %0, %3\n\t"					\
> > > > > > +		"and %0, %0, %1\n\t"					\
> > > > > > +		"srli %0, %0, %2\n\t"					\
> > > > > > +		"sub  t4, %0, t3\n\t"					\
> > > > > > +		"and  %0, %0, t4",					\
> > > > > 
> > > > > This implements
> > > > > 
> > > > >     temp = ((pte & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
> > > > >     pfn = temp & (temp - (pte >> _PAGE_NAPOT_SHIFT));
> > > > > 
> > > > > which for a non-napot pte just returns the same as the non-napot
> > > > > case would, but for a napot pte we return the same as the non-napot
> > > > > case but with its first set bit cleared, wherever that first set
> > > > > bit was. Can you explain to me why that's what we want to do?
> > > > > 
> > > 
> > > For 64KB napot pte, (pte >> _PAGE_NAPOT_SHIFT) will get 1, and temp will be
> > > something like 0xabcdabcdab8, but the correct pfn we expect should be
> > > 0xabcdabcdab0. We can get it by calculating (temp & (temp - 1)).
> > > So temp & (temp - (pte >> _PAGE_NAPOT_SHIFT)) will give correct pfn
> > > both in non-napot and napot case:)
> > 
> > I understood that and it makes sense to me for your example, where
> > temp = 0xabcdabcdab8, as we effectively clear the lower four bits as
> > expected (I think) for napot-order = 4. But, what if temp = 0xabcdabcdab0,
> > then we'll get 0xabcdabcdaa0 for the napot case. Is that still correct?
> > With the (temp & (temp - 1)) approach we'll always clear the first set
> > bit, wherever it is, e.g. 0xabcd0000800 would be 0xabcd0000000.  Am I
> > missing something about the expectations of the lower PPN bits of the PTE?
> 
> According to spec, when napot-order=4, the last 3 bit of temp will be 0, and
> the fourth bit from the bottom must be 1. All 16 PTEs will be the same.
> We'll always need to clear the first set bit of napot PTE's pfn.
> The first set bit is used by MMU to determine this PTE's napot-order.

Thank you for the clarification. My first reading of the spec left me
confused, so I was hoping your answer would help me understand it and
it did. The assembly you've pulled together is indeed a clever way to
handle this :-)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
