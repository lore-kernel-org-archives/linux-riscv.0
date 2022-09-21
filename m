Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F6DC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 07:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ceULJJ0yVS1kUBODEjI9HdFvxHkYzsHyusoo1u9apA=; b=CqU7Q4zZyX8N6m
	mul+Y/2eTSzkwspzznpSPkAB88MHZA8zh8xGIXO4ZfsA7ypLhrQYJxRFzkfDDMDEu2m76voqjHlFt
	wJXOYYX1lZDKaIH6pxAXwl2sPIuSn1wJ7ngmLVwfVV524UjadXoCuc+o07udeY3LevuqOXJiJ9PEu
	nolr8pnE+NmOcHc8jNaO9H98wuuREj4Df2bDrbpAerJ912Q7zYFDaRCoJIku/zjUyCHiYO6yZBJGh
	YjDU+rCa7t9YT3G06+jenFO8fEgMAGzMkfMxWErWA2qukANFowSlXZ95i9wyBz+eCTD7Bj7HZWhoy
	yWnyT/YJGDksdbkTc2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oatxS-009VwQ-4l; Wed, 21 Sep 2022 07:15:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oatx8-009VnI-48; Wed, 21 Sep 2022 07:15:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id e17so7271841edc.5;
        Wed, 21 Sep 2022 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=z9jXMKTsbXt/GY48g/wdOYArfXNGBa3cbn0t4HSGf7c=;
        b=UiTMai2YO907oZTmL2uRRBUvQZje672mf6EbZ9LgXUMIQqDtJoEU89YEJ98C1iKFq6
         6aeo1LqTpUmEdFw2CaSaL28YZg63X9PaAExd1UpR0MksLPUasxQTMUS69mrLKvm0i5tk
         e+hFnF/9spxfT0XRQ4XHRAw+QOtJoML5Vz1O2F4ZVoDwC/N5QPHI623PCIhl5qf2Uzs6
         VtL7p6OurNamkmgIdL4rb5sRfKwpRieDiY2ZiC2WZG4mXXiBevFcf0mmEL8JqIYWdM6i
         PRQdgQ5j9YvBGXmjMfUP4G3iqVPZJBS27lF04is8Z5yupn+hVJQtVn2lVCtMTZdQPasZ
         8cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=z9jXMKTsbXt/GY48g/wdOYArfXNGBa3cbn0t4HSGf7c=;
        b=pIoEhT82exI/9BgWClgyUPhdu/NovXU2iS16BDQsNwroK5FwiXIcku880+LmZNNQri
         U6oAFo6r/5WAIFVI0hk/YuzvUBxw07ayEtTs+zHLVNJPHV38KbxfIEk9PsWx/QD6ySpL
         czV3BXmY8HTTS6woqWMUdneNx6xnCp0PMyMBTgQRY+ZA5AvyxSsDYnPp39iqaQpI9MvL
         Up6ALSl1y8pxIbqDwX7F3r4DhjjMBbTYBWDea/tO5v6HrjHbaLZSKxUEQtp9rgOCzb+N
         bX1d1+SIq338dhJKxqljwGAgUKU1YCgCJtdUkOsNZ3qEjqe1U3x2qQrUKhDtEXFMCKXA
         xZvA==
X-Gm-Message-State: ACrzQf1EeIre3PevAyOUJTNUptKH5Pefvt8eBhmtirt4Tk2q8FeZ4gfY
	sEkXDmKxT8ZdKv7v+SZ/kMlK3Nu3YLbXqwO5k0U=
X-Google-Smtp-Source: AMsMyM55Ybm0ogt2YynX5Ic5pid72Oh9X7U20E3TfVabrhaJXkQZyVhJOQK1a/CYV33WISOGkFZPMdCY+LA22ybkLZI=
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr22952604edf.277.1663744522301; Wed, 21
 Sep 2022 00:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
In-Reply-To: <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 19:15:10 +1200
Message-ID: <CAGsJ_4wtkSfH2DTDg10qTbUkxD1QTNBD09nx_H+S6H_-tBPQBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_001526_184583_398B348F 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, Sep 21, 2022 at 6:53 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> > +                                     struct mm_struct *mm,
> > +                                     unsigned long uaddr)
> > +{
> > +     __flush_tlb_page_nosync(mm, uaddr);
> > +}
> > +
> > +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > +{
> > +     dsb(ish);
> > +}
>
> Just wondering if arch_tlbbatch_add_mm() could also detect continuous mapping
> TLB invalidation requests on a given mm and try to generate a range based TLB
> invalidation such as flush_tlb_range().
>
> struct arch_tlbflush_unmap_batch via task->tlb_ubc->arch can track continuous
> ranges while being queued up via arch_tlbbatch_add_mm(), any range formed can
> later be flushed in subsequent arch_tlbbatch_flush() ?
>
> OR
>
> It might not be worth the effort and complexity, in comparison to performance
> improvement, TLB range flush brings in ?

Probably it is not worth the complexity as perf annotate shows
"
Further perf annonate shows 95% cpu time of ptep_clear_flush
is actually used by the final dsb() to wait for the completion
of tlb flush."

so any further optimization before dsb(ish) might bring some improvement
but seems minor.

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
