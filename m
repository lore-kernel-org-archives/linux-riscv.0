Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E31C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7318B60C40
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7318B60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q68Nh4qkyV1JAu5hcmgQ7S0gCiz6f41EHQnVUsUt+IQ=; b=KJDEx2Bko/GTqQ
	YCEaEHDWMKMQaCJOqs1lp4nfdGOutwJNyrXY3Bq2gRR9+RuyFla43kVV54xhlpYVKtTnVghnnMkT3
	hCnM31yNwSBsoayXzDOp+2wqqDfmwbOAM0Qp+7EJk0FYCtgGjRT5Jo8iRdKX/6HD0TkcOFebSENMv
	nLlsMkljCT8V+SUi9AzPtPbW2iuZ5GN9zfKxAywKhoqJrVrQQ5c52C2X/T50E7f4AEchEe7HJSKql
	Vuk3lkv+3jkmu+PCuZr20kVBuzul2iy2Egpncwg2Lnp1mzq6N3QbVlSN2DuV+edYr0SF14zuKrMHd
	EQcK9mJGBE3TM/M8f6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf1IS-00GlTI-T4; Mon, 25 Oct 2021 14:49:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf1I3-00GlCL-6Q
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635173370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fQIV8R9EVwqjc2F+5+VNaVeJn8YGGw0zb5KvsfSTOE=;
 b=EyxXK3NL34GKbkabfASCUZxOHmDizQl3wmY2Lj3OpC0kZbASigldALEiN1zBJzexXqAap3
 749vvLz8Z9ZpjF0Qkd/w1AOzZp8wMYE2HrXtJRJtEd1OkxeKS3wVO3GKdh9cjaR9BzhFuJ
 02ntDEvxSmV3a5c60rMlBmj0f0B1l0o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-nsph0B9YONKHPPfEdjVaUA-1; Mon, 25 Oct 2021 10:49:24 -0400
X-MC-Unique: nsph0B9YONKHPPfEdjVaUA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso10168093edj.13
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fQIV8R9EVwqjc2F+5+VNaVeJn8YGGw0zb5KvsfSTOE=;
 b=czAApmzrK55Tt6Ole3RQARIhHR63QCJOBdavhokZHSvRkpt0kDuyKq1PDlNQpf6yxE
 N1BZoe1DfbdMfLca0H3+LIJuEq2X1yKmqtDBQgY2AGRev6fgI0ZGGhugeZOwaWYKdjRb
 2mSnEKa7zE/kPcWG5wYBwBvNa1NpxnEVm6L/dFXlebGr2NPOywyBDKTlWjYIH+K5TLME
 tfwyDWzZ5Nj6z0/bsnEi/Rj5l4c/Wh/2ec++3CqrLBfrpor8L0ldiagob8zCcd4jEj60
 WYgjSsq6B1CxWwoRa9/HdweejTIl1zimJ/NyL67H1a0C3NOd9LfKcDYXofj5p9ZW0ZLh
 C8HA==
X-Gm-Message-State: AOAM530T9NXyb/U9XCRZh/sCl6hkweUNwxS5Fu1TDuwIl0XabM8csnU5
 95qumyfN/hQHK9qQ9n4ycl+DmzxeT10X88GzS0GPDx76wtnZCh+t93IjzIzJ4i0iMu2gus8IBrm
 X7Mg25p8XDEkrtx4RI/QY4xXnZOGhXBjECzBghBilDuko
X-Received: by 2002:a05:6402:55:: with SMTP id
 f21mr27200732edu.8.1635173363358; 
 Mon, 25 Oct 2021 07:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/3Iij3j6rCMHEZLZ0laZvPfZAeKNcI+Q2GLVeBfeMLuYto9Is0QQTiujMiPil6Vzeuyp3IRplt1X+mCUlfx4=
X-Received: by 2002:a05:6402:55:: with SMTP id
 f21mr27200658edu.8.1635173362997; 
 Mon, 25 Oct 2021 07:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com>
 <YXZU/3/YmRGFrOXK@infradead.org>
In-Reply-To: <YXZU/3/YmRGFrOXK@infradead.org>
From: Wei Fu <wefu@redhat.com>
Date: Mon, 25 Oct 2021 22:49:11 +0800
Message-ID: <CA+YCwKn1VA8=NSa=bdhP99jfpokYGHBvqVSKvZmdndQOz6UUPA@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 2/2] riscv: add RISC-V Svpbmt extension supports
To: Christoph Hellwig <hch@infradead.org>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, guoren@kernel.org,
 christoph.muellner@vrull.eu, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, 
 Liu Shaohua <liush@allwinnertech.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, guoren@linux.alibaba.com, 
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_074931_353859_43527128 
X-CRM114-Status: GOOD (  17.39  )
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

Hi Christoph,

I hope I understand this correctly,

On Mon, Oct 25, 2021 at 2:57 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Oct 25, 2021 at 12:06:07PM +0800, wefu@redhat.com wrote:
> >  static inline pmd_t *pud_pgtable(pud_t pud)
> >  {
> > -     return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +     return (pmd_t *)pfn_to_virt((pud_val(pud) & _PAGE_CHG_MASK)
> > +                                             >> _PAGE_PFN_SHIFT);
> >  }
> >
> >  static inline struct page *pud_page(pud_t pud)
> >  {
> > -     return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> > +     return pfn_to_page((pud_val(pud) & _PAGE_CHG_MASK)
> > +                                             >> _PAGE_PFN_SHIFT);
>
> >  static inline unsigned long _pmd_pfn(pmd_t pmd)
> >  {
> > -     return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> > +     return (pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT;
> >  }
>
> The "(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT" expression begs
> for readable and well-documented helper.

How about these:
#define _chg_of_pmd(pmd)  (pmd_val(pmd) & _PAGE_CHG_MASK)
#define _chg_of_pud(pud)  (pud_val(pud) & _PAGE_CHG_MASK)

>
> > +#define _SVPBMT_PMA          ((unsigned long)0x0 << 61)
> > +#define _SVPBMT_NC           ((unsigned long)0x1 << 61)
> > +#define _SVPBMT_IO           ((unsigned long)0x2 << 61)
>
> 0UL << 61
> 1UL << 61
> ...
>
> > +#define _SVPBMT_MASK         (_SVPBMT_PMA | _SVPBMT_NC | _SVPBMT_IO)
> > +
> > +extern struct __riscv_svpbmt_struct {
> > +     unsigned long mask;
> > +     unsigned long mt_pma;
> > +     unsigned long mt_nc;
> > +     unsigned long mt_io;
> > +} __riscv_svpbmt;
> > +
> > +#define _PAGE_MT_MASK                __riscv_svpbmt.mask
> > +#define _PAGE_MT_PMA         __riscv_svpbmt.mt_pma
> > +#define _PAGE_MT_NC          __riscv_svpbmt.mt_nc
> > +#define _PAGE_MT_IO          __riscv_svpbmt.mt_io
>
> Using a struct over individual variables seems a little odd here.
>

How about :

extern unsigned long  _svpbmt_mask
extern unsigned long _svpbmt_mt_pma
extern unsigned long _svpbmt_mt_nc
extern unsigned long _svpbmt_mt_io

#define _PAGE_MT_MASK              _svpbmt_mask
#define _PAGE_MT_PMA        _svpbmt_mt_pma
#define _PAGE_MT_NC          _svpbmt_mt_nc
#define _PAGE_MT_IO           _svpbmt_mt_io

> Also why not use the standard names for these _PAGE bits used by
> most other architectures?
>
> > -     return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> > +     return (unsigned long)pfn_to_virt((pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
>
> Overly long line, could use a helper.  Btw, what is the point in having
> this _PAGE_PFN_SHIFT macro to start with?
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
