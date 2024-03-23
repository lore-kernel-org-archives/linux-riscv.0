Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DBFC54E64
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 00:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGPnVQVKMiy4fSB8UjGf21KhkGqZ8IbDWo2xpuNKmcc=; b=KtzBIIH/AHdZIH
	lLSXvQv8RewDX/60bMGMGUoZtTfBXhIgV8EFxVucPIal0Jj4i4f00yqwCNs9Ekje52/GMBlNXx3Ma
	QRcYxv/DqL0N6A0LxhQjBkEVVMa/Gq3ASYGcBl5wAq9M0XkxFORC2xmhbHTdJudljRGFdwgfv9QNs
	AVh4+dEQVUgEHOfWmAGvL2dimmdNg8GNNQHWZMB4LX+gKTM7NE+jGv4tnACpkDlALJFFCTowZsqWJ
	cZ2zE20BYqH2429gyNfSJRShN9gMQGl/iLo2yXlSfjJyfv02F71MvVMh1hUmHM8vOs6DbOCjelBiS
	fpI4K39xuLuCbOsLSZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnpHS-000000092JJ-0gVv;
	Sat, 23 Mar 2024 00:30:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnpHO-000000092HE-3z3y
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 00:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711153831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXzFSacRUGOz3guP7FE0TFnIIG/3J2Y+D5Xv5mcIJ4I=;
	b=L3YFDBz15ei4xi9DoU3KhivryQa/8U4gzdBOqvwor21EeR9oAssNEgMe2nz+t4qzcPjPl7
	QteYXNa11sSEbPEw5P4IpfSmck1hJ3gkJF2qosU8RCK8N243KmZovtLP7V5zbzOYV0ctPM
	Qldcb+vzriCqXSb+9XDaUWNXbxI2WZI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-gaIy6IU6P_aWa54pZiVRgg-1; Fri, 22 Mar 2024 20:30:29 -0400
X-MC-Unique: gaIy6IU6P_aWa54pZiVRgg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-430b9ee6bfbso5504801cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 17:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711153829; x=1711758629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXzFSacRUGOz3guP7FE0TFnIIG/3J2Y+D5Xv5mcIJ4I=;
        b=HeJLNttSYnLukYBbwsxw5tl5hJ4ElUP7p0dS7f8zSt2NWV9FPN88hlwp+2ufjtEJgP
         /pnsJKINiNZeNC8lRX3Ne1tnxnpAQvo9EOjtCB2irDM5gUe6qvmuGZO+QTfm568Izw6O
         NqJjd+ifqoJIr+WaOyq7M3jj3ICMo9ZN45in0IgqSPbkQrpr5LnJ6/yTXEw5k77WLseV
         +4fwl8FIr9gmBPvNEwoJ4VPktW4x4Q+0U9Q8mMEMXhzXhfH3X8I0jpQ6RyjkQgHsYCFd
         /8BONIbpzykl+9wFLuCdCnQN/rulIx37yGA3ZJA8qQPgiMb6pujLs0ZdDtSK8p/y6b3M
         tz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC5FNb7ez/rObeXrasRchLqOwP7Bu1Rs10QOh/bTRScs6zd2I2otBPKjONbUZ01I68A5sH5EFQYyFzLq34RYtkPSpZMxGeyTH2tQtNn8ln
X-Gm-Message-State: AOJu0YxdfFaZirg42+E0HAeQ06jDrLmrI7ZvGFhTWcKn8enqP5en9uSf
	T8m0qwpKiqXrTGf2paA0y8M+VLViioN9Ie6xmlVNlV5k5J7aocnlY5uXuDScAUOBa0wpNsxQaCp
	6gp5oiQ+K+gSWcUW8018u+NMcRwkHenuMwmaIMxJHaIvVTsO+B2y8noa2557J+A4ZLg==
X-Received: by 2002:a05:622a:1a97:b0:430:c2dc:a5ef with SMTP id s23-20020a05622a1a9700b00430c2dca5efmr1126594qtc.2.1711153828687;
        Fri, 22 Mar 2024 17:30:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Zwwie8lW8e1zjPdHeXjIabqqIya++N3e9UmqxHEMxwmGbP31eJT5HvpFdJCDH7G39Ns7UA==
X-Received: by 2002:a05:622a:1a97:b0:430:c2dc:a5ef with SMTP id s23-20020a05622a1a9700b00430c2dca5efmr1126562qtc.2.1711153828186;
        Fri, 22 Mar 2024 17:30:28 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id fy15-20020a05622a5a0f00b00430911bac01sm315722qtb.74.2024.03.22.17.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:30:27 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:30:24 -0400
From: Peter Xu <peterx@redhat.com>
To: SeongJae Park <sj@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yang Shi <shy828301@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Message-ID: <Zf4ioDkuSNJ0f1vR@x1n>
References: <20240321220802.679544-4-peterx@redhat.com>
 <20240322171456.118997-1-sj@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240322171456.118997-1-sj@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_173035_090541_A4B729B1 
X-CRM114-Status: GOOD (  35.04  )
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

On Fri, Mar 22, 2024 at 10:14:56AM -0700, SeongJae Park wrote:
> Hi Peter,

Hi, SeongJae,

> 
> On Thu, 21 Mar 2024 18:07:53 -0400 peterx@redhat.com wrote:
> 
> > From: Peter Xu <peterx@redhat.com>
> > 
> > These macros can be helpful when we plan to merge hugetlb code into generic
> > code.  Move them out and define them even if !THP.
> > 
> > We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> > Reorganize these macros.
> > 
> > Reviewed-by: Christoph Hellwig <hch@infradead.org>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/huge_mm.h | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> > 
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index de0c89105076..3bcdfc7e5d57 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
> >  				  enum transparent_hugepage_flag flag);
> >  extern struct kobj_attribute shmem_enabled_attr;
> >  
> > -#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > -#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> > -
> >  /*
> >   * Mask of all large folio orders supported for anonymous THP; all orders up to
> >   * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
> > @@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
> >  #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
> >  	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
> >  
> > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  #define HPAGE_PMD_SHIFT PMD_SHIFT
> >  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
> >  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> > +#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > +#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> >  
> >  #define HPAGE_PUD_SHIFT PUD_SHIFT
> >  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
> >  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
> > +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> > +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
> 
> I just found latest mm-unstable fails one of my build configurations[1] with
> below error.  'git bisect' says this is the first patch set started the
> failure.  I haven't looked in deep, but just reporting first.
> 
>     In file included from .../include/linux/mm.h:1115,
>                      from .../mm/vmstat.c:14:
>     .../mm/vmstat.c: In function 'zoneinfo_show_print':
>     .../include/linux/huge_mm.h:87:25: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
>        87 | #define HPAGE_PMD_SHIFT PMD_SHIFT
>           |                         ^~~~~~~~~
> 
> [1] https://github.com/awslabs/damon-tests/blob/next/corr/tests/build_m68k.sh

Apologies for the issue.  This is caused by !CONFIG_MMU, I think.

I thought this would be fairly easy to fix by putting these macros under
CONFIG_PGTABLE_HAS_HUGE_LEAVES, however when doing this I could have found
some other issue that violates this rule.. mm/vmstat.c has referenced
HPAGE_PMD_NR even if vmstat_item_print_in_thp() wanted to guard it only
with CONFIG_THP.

/home/peterx/git/linux/mm/vmstat.c: In function 'zoneinfo_show_print':
/home/peterx/git/linux/mm/vmstat.c:1689:42: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
 1689 |                                 pages /= HPAGE_PMD_NR;
      |                                          ^~~~~~~~~~~~
/home/peterx/git/linux/mm/vmstat.c:1689:42: note: each undeclared identifier is reported only once for each function it appears in
  CC      drivers/tty/tty_port.o
/home/peterx/git/linux/mm/vmstat.c: In function 'vmstat_start':
/home/peterx/git/linux/mm/vmstat.c:1822:33: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
 1822 |                         v[i] /= HPAGE_PMD_NR;
      |                                 ^~~~~~~~~~~~
make[4]: *** [/home/peterx/git/linux/scripts/Makefile.build:243: mm/vmstat.o] Error 1

static __always_inline bool vmstat_item_print_in_thp(enum node_stat_item item)
{
        if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
                return false;
        ...
}

I think the problem is vmstat_item_print_in_thp() uses IS_ENABLED() however
that won't stop compiler from looking into the "if".. so it'll still try to
find the HPAGE_PMD_NR macro.

It means, I may need to further change vmstat_item_print_in_thp() to make
this work in the clean way.. by properly switching to a #ifdef.

For that I'll need to post a formal patch and add people to review.  I'll
keep you posted.

Side note: thank you for your script, just to mention make.cross has been
moved to kbuild/, and it'll also need kbuild.sh now to work.  So you may
want to fix your test script (and it worked for you because you kept the
old make.cross around), like:

  wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/make.cross -O ./bin/make.cross
  wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/kbuild.sh -O ./bin/kbuild.sh

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
