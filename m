Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0CBC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0jZsYeSNAH3+HEBToMazkf3nhDPH5GLaRmmQWK/wBI=; b=HQ4h+3B7gX9Nex
	oDgb78q24dRJVY9sgLl6kiDFQSEyyduX1j5OE6CWa2AftsCRi3OBHJJRtqu9+g5JNdk6CViMlUobK
	mxxo1v/8cc2zhmRFizgWApJOiefYJzCQGUQXrm37HgqJUpQmR3Q6Tulh1TNJ72AzL4g3Hh5j3hZr+
	TLodlCkfsokD0nxiSKElHea8uYTO8RnEjJ9CZZ+Fq49AWmWK37epG8aE2TPag323R968qiXULi9Ir
	d8hxCmMGu2ahfYD2DonqBbp1MRNC04A+f14Re1KP7bE0ihz+QouAVup2weRXB5Bx5uoLACyuwbEXj
	BcdWW7IWmIbFrhQiJehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnfZ-0000000DCWk-1arl;
	Tue, 02 Apr 2024 23:35:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnfW-0000000DCV8-3BsS
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 23:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712100953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
	b=Ztr6bB2UK05WGxDokJzMkzdRqAjGbzJPLJqartAOn+Yont0sbnE9C2AooBepyvCFRMqpXC
	kznpRQ/I+ySsoe917KUB6yKB9ccQL3TIu1VPQArdlOjlNFZGEw85M968HppYLg6w9YzhUo
	rgjCyj6FayLKD2/4MO9SLO5mxXEXTzc=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-fNWoR5UMPYWizE3MFePiMQ-1; Tue, 02 Apr 2024 19:35:50 -0400
X-MC-Unique: fNWoR5UMPYWizE3MFePiMQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e6b0efc193so2551202a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 16:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712100949; x=1712705749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
        b=MDehO9NqCulUihkRL8O6Jp0VDVgqQJd3BUKaHbzgelg0Y6oRDOW/7I5AzR7w78T4ze
         L+sGiToWWKzuOXJGkeF8krryQpftHG9oAqI7i6jti6yA2lasr4/cf2U/z/aORL+cRab7
         wkyKDBwY2MIgWiNHRpEgsP82oYRRDXap5QXGCPEe2BLFTpmUL1t84Pf5/Yv/aVcljJlz
         uKwYdHxXM0UF1ZHpbpSss8VGnSUKEzb3puAC/5qiI+KTkvasK/w4DNQNyKf4WhAFOJ8h
         gqJjEIuCL+EGe2uE/z2v2ATbdRB1LHUXtrtE0/xZwFteq1wSNJT1eiGAv/7I3roZ/jfA
         SCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUET++w25Pmc5bvkNI0NS+fdmHxGGkdxUNn4mOd5p8uBtN3KnMnxD33PFQdZ43fUJ/wmR71/2efFmpoPRe9iZj9KDoZjRRi6ujRn5Aa2ioo
X-Gm-Message-State: AOJu0YzTBDV/l5SaliUfXWMiBdLL9o6XYGdBzQbe4yxxddAP/HgzRK74
	tJVq73E+fdz/8DwvOFTaLRUr0gnGLfP+cQIfYuCRf2upq+5+XlEl+GFg2IBpe7tdKQWWNzJPofk
	Fg8ggPJRvnExCVeSkImaOdUVcz4sjTGKs8mKKb0X4OOCLQt03Ug+il5UBf5qy7v8jDg==
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684093otf.1.1712100949125;
        Tue, 02 Apr 2024 16:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvGEFvbrAiLdQh8lUIUnqC+uQoSnGXUScHs/S+SFU0VVogBN2f5CbF/OzNKGljOo4S/t2faA==
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684059otf.1.1712100948622;
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Received: from xz-m1.local ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ob12-20020a0562142f8c00b0069046d929a3sm5893803qvb.145.2024.04.02.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:35:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <ZgyWUYVdUsAiXCC4@xz-m1.local>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240402225320.GU946323@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_163554_893826_B461B0D1 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> 
> > I actually tested this without hitting the issue (even though I didn't
> > mention it in the cover letter..).  I re-kicked the build test, it turns
> > out my "make alldefconfig" on loongarch will generate a config with both
> > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > THP=y (which I assume was the one above build used).  I didn't further
> > check how "make alldefconfig" generated the config; a bit surprising that
> > it didn't fetch from there.
> 
> I suspect it is weird compiler variations.. Maybe something is not
> being inlined.
> 
> > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> >  triggering it elsewhere but failed..)
> 
> As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> called and the optimizer removing it.

Good point, for some reason loongarch defined pud_leaf() without defining
pud_pfn(), which does look strange.

#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)

But I noticed at least MIPS also does it..  Logically I think one arch
should define either none of both.

> 
> Perhaps the issue is that the pud_leaf() is too far from the pud_pfn?

My understanding is follow_pud_mask() should completely get optimized and
follow_huge_pud() will be dropped in the compiler output if pud_leaf()==false.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
