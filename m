Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034DDC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bywOz3pcomEzEWhEXJ5KGT7j5uSgSbrRe5XfIxYtjlI=; b=Bx9jQ/EZg4il2i
	tvr2a01HEXvVpmu5DWu+kVOXGN0p52cV0hhZIblKvkCDsWr1LyEzOjOQlhO6L1xS8cPPgmkoIf84N
	OLtXX1fFi6371vlvGoT+TO7BbaJeXQk4NFnKd/kPeqV+TvOjvwDo6C2oYuVb+UHbuNRcXNNA3i8jY
	XQyY6zBL46w3vE+CI4/+pvEEd67NLrrwVzLqiEfrS90/khcVPn8mJu57FAxyduZdVbEpQusNF0Ixb
	6yfQqtZON2WM0CwG5o2oufK8TNXH1VXefcGpitlnQ/lnll1IH1Yb+7O916lNndZQTjoqNW1M4hMvF
	QOXUOBlykyM/JdxJDniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXTC-0077tJ-0F;
	Tue, 02 Jan 2024 05:37:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXT7-0077rZ-2V
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 05:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCnGZSmn0Xbft/VvC3w27VmkfIRRQMc7XVfvoJNmfHo=;
	b=aAjr2CcL3ZNlU4giTwaa8lKKewvWOns6u8sCT3oDje9TKppiUSu3euPbf6YoC+EbZm30KA
	QbFHD+o4Kj7sODWqCgomPYgeDH2bcxxwQkDJLlTXyeB7hQr/RYJ8E8B+/FdhCKMY10YYbv
	PoM8u6v6SM7sUXtgYMPQrz1liXCAVSY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-EnQcK3NdOIGFmDIP4cM_RA-1; Tue, 02 Jan 2024 00:37:32 -0500
X-MC-Unique: EnQcK3NdOIGFmDIP4cM_RA-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6da4d130a82so881295b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jan 2024 21:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704173851; x=1704778651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCnGZSmn0Xbft/VvC3w27VmkfIRRQMc7XVfvoJNmfHo=;
        b=DL9ISnVC14hgGa7pY4QgTXATE+w7gXeL+0T7yx2eHo4ZMBiiTPZFmJIHsxZKjotHc1
         nswCq152jiUpEU+dXaxWNkHG/GcMmPxDG/+LhPqCwxkSUdYLbM8noFXm2IAhbDRKkwcW
         8yeVsXH7POe4rJAyT9bc4dWas762Z/ZQoTrptrQsQxX5+vZxvuT1LROfYdWDBDZQT26g
         mq5+7kTjijIflHV32LWMLhuhmUzmBsvlbz9bn5VWhOqFf3GmVkngZgtsyLFXY0Ic1wu7
         izmtv/YeeTor/RsBpv8iMzz9NZGw6xZPKkXDYHUDI9KGWdtav0wziOqiha8OD/PSX8/t
         Nvwg==
X-Gm-Message-State: AOJu0YwH/OhpLKGh/yCuSbAKpXzawLob9BoYznJJjVKF1PcePeL3jEy4
	Wc/20BIzMhtPNyaMpoxrV+Y/6n54OOetOQQVOS0qPa7PAKDspM8Fg8IPTlF5V5Jab1u4CfFMmJ9
	J/0bYg+qKgtuYIiQ107BzNTusc5IxjnUdX5qX
X-Received: by 2002:a17:902:ce86:b0:1d3:eecd:b296 with SMTP id f6-20020a170902ce8600b001d3eecdb296mr33590835plg.6.1704173851409;
        Mon, 01 Jan 2024 21:37:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHENzr2M0aJyyZm2vt3XzuVCeWLevZs5IuWsUdjc1ZzU9FWxHr/jzg4D3MMktI1x4ptpcHyFg==
X-Received: by 2002:a17:902:ce86:b0:1d3:eecd:b296 with SMTP id f6-20020a170902ce8600b001d3eecdb296mr33590810plg.6.1704173851161;
        Mon, 01 Jan 2024 21:37:31 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id v4-20020a17090331c400b001d49c0daf60sm6900347ple.265.2024.01.01.21.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:37:30 -0800 (PST)
Date: Tue, 2 Jan 2024 13:37:14 +0800
From: Peter Xu <peterx@redhat.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org, Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org, Yang Shi <shy828301@gmail.com>,
	James Houghton <jthoughton@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <ZZOhCuuozrBscdRC@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
 <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
MIME-Version: 1.0
In-Reply-To: <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_213737_902223_B8C4A4E9 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Dec 25, 2023 at 02:29:53PM +0800, Muchun Song wrote:
> > @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
> >   #endif /* pmd_write */
> >   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > +#ifndef pmd_thp_or_huge
> 
> I think it may be the time to rename to pmd_thp_or_hugetlb,
> the "huge" is really confusing. thp is not huge? Actually,
> it is huge. It is better to make it more specific from now on, like
> "hugetlb".

The rename will need to touch ARM code, which I wanted to avoid, see:

arch/arm64/include/asm/pgtable.h:#define pmd_thp_or_huge(pmd)   (pmd_huge(pmd) || pmd_trans_huge(pmd))

So far this series only touches generic code.  Would you mind I keep this
patch as-is, and leave renaming to later?

> 
> BTW, please cc me via the new email (muchun.song@linux.dev) next edition.

Sure.  Thanks for taking a look.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
