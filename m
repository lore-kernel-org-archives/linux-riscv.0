Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64372C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACF7604AC
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ACF7604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBkigSTqW9/i1dE5TQDRYVbfCDPRg3YYKaF+SxwGLo8=; b=mqoKBdvHLjDzVZ
	FaRU8ZDUoAtIBIaNJJV35M0L5iR6b9PxIFjGagNMPwCElAhQ6BdhEiAO42aXsimpYPkQg2ep6lIiy
	Y5riO4wQwAb1CUe9Mz++wXQ81pihF+AGxY/9rK0ftHlbjBnz6Ba98BTfiFnMOP8TQXZQvFj07eL7Z
	Lc+qGgTK3igZRgewqjM01eP5GPAZcJWmJ5CD/Kf6yRJjAA+ADAGeD6GatCtoC0/oRbstmQNzkdhkM
	/djXO+r5vD3vPXmpQDIbL4t6OCjw0YwSs8THlvlLJN/0qRGcoXGb27C/i6SewSfLuXtJo/YO4VOjm
	vinHnM/qnN/3SxvrUzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mexgX-00GAYd-I7; Mon, 25 Oct 2021 10:58:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mexdZ-00G97S-FL
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 10:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635159327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l9r/2xnQluktoJQNTVnyYXdf7iQ2Ry5qJeSjDsQ0D0w=;
 b=NS0JWknUPLQkUutR/Nv4AqUIkPHlS5Uri1+ZLX1mPz3v4lCC/bNNnnY8Pe/xRFCDG45pBv
 ChfT0vU1SwJAx0Xt0gRMDVIYGJfED+/Pgq/4KmeLsXFp46lx7GhaaiROF8Tphwt1omLBE6
 dsIzXCLbLXPLbYm/MxCOL03+JirR9Zk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-4RGhOU4zPsm7Yvxu9v0j8A-1; Mon, 25 Oct 2021 06:55:22 -0400
X-MC-Unique: 4RGhOU4zPsm7Yvxu9v0j8A-1
Received: by mail-ed1-f71.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so3007584edc.16
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 03:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9r/2xnQluktoJQNTVnyYXdf7iQ2Ry5qJeSjDsQ0D0w=;
 b=MF8iZ8HBTglg4GQJr8jIeHakERBb1uGPL0kG/3L22AAatYnfPnehu6aLPsGdso1FNd
 qrgE7stlRhNEcttM7bZTiei69VZDQ1daf+fEnSbPr7H6MRmPW0crerDbg8LKwfmzwR/E
 2IRPiEEPcagLRYopdCClNFVyOWrRmbjZpfyGc9SQ8LwvOsLkOH5Odk6HARSOxedo8lJw
 8K5WKO7/SNfrO3ozhewlXkWwlUrF/DNIjPR4dawN9GLQJ3pho3DBrfWymLA2/eVCNrKg
 ZAFH3oZDK9jZeFMd5t2vjK0ORzFLuUGYZipU6osT73VJUauJ8FLqJJh7ddOlA6TeSBSz
 JOPA==
X-Gm-Message-State: AOAM531OR7D+i5yZXOUKSj/ykHZOrwVxDD8X+BjUlUVMY615I+EkKSYu
 /zZC8FIeMwhBkgFdwJcvvYTtB/t5K1jiQ76c7GyyeniCfNmHauQActmlj1LXq28wKtqt3/kFf6O
 d2xUBeffxmMoHttS2x31Dx+5Osowxb8P7edkXKIRA5Qv2
X-Received: by 2002:a17:906:4452:: with SMTP id
 i18mr20707037ejp.374.1635159320507; 
 Mon, 25 Oct 2021 03:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHvjGx1o/l6cvWtLlt1bGcsJAK4tj98GXlzcrNu3As9Dt3iN96hZKCL/C9ae8LCUWJQ5rLjfsX6KSXF7IsaAQ=
X-Received: by 2002:a17:906:4452:: with SMTP id
 i18mr20707017ejp.374.1635159320347; 
 Mon, 25 Oct 2021 03:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com>
 <YXZU/3/YmRGFrOXK@infradead.org>
In-Reply-To: <YXZU/3/YmRGFrOXK@infradead.org>
From: Wei Fu <wefu@redhat.com>
Date: Mon, 25 Oct 2021 18:55:09 +0800
Message-ID: <CA+YCwKkX64A8p9vfLJHC3+LqOWyDg99eDBR0mjfB=H45BOyJLQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211025_035529_693717_7C508A71 
X-CRM114-Status: GOOD (  17.32  )
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

Great thanks for your review.

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
>
> > +#define _SVPBMT_PMA          ((unsigned long)0x0 << 61)
> > +#define _SVPBMT_NC           ((unsigned long)0x1 << 61)
> > +#define _SVPBMT_IO           ((unsigned long)0x2 << 61)
>
> 0UL << 61
> 1UL << 61

How about this macro:
#define _SVPBMT_PMA         0x0UL
#define _SVPBMT_NC         BIT(61)
#define _SVPBMT_IO         BIT(62)
#define _SVPBMT_MASK         GENMASK(62, 61)

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
> Also why not use the standard names for these _PAGE bits used by
> most other architectures?

Which names are you suggesting? Would you mind providing an example ?
_PAGE_BIT_   for _PAGE_KERNEL_ ??

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
