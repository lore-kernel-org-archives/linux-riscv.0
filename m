Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7CCC4708E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDF6b72ze45CamJAe9CcmW0PbJIX+O+69D8Wo4XoXtw=; b=Q4e9EgUmIsPECg
	gs9XUc7r5IWs1EBzwIbfwyIqLXo9JccW0dxvjQQgmCQMGdf/Afu0pNF8/445FhEa5m5BDyCaGTM4G
	yw7FVQbac7WaV89co/qsXLrQSVfuxKt8KVjIusnIZ8Y6yuOcEx0SMi7hmiQW71L8aG9yEJ8uIX6t5
	j1cirtfBb2T37zzvX+n4z1PQwttDGUQ5P4yllxbW5lDvvr7cox8srEW3vhFrb1/aDLFbX6hddt3PP
	HRspuyqMTHxRkanfby3Pn6Oge5miInD4xlTQtbUItwcp5OmhMzCn9mSMAQBq4LLIyMvaj8p372YJY
	5297KqYfI8kc70HeD8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6vx-00AUgS-3x; Wed, 04 Jan 2023 16:48:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6sr-00ATTH-J7
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 16:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672850693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6EzsGSC3holClBSPQw8EocT+rCm9w6LTUpG8IqXLKaM=;
	b=KmfhUiP1Z4CC5XYWE1y6bb4X3paTR4BHLNiHsyvkK1hSy9BNhGkpmIauh4f2QAVKtFrtS6
	Bsse17u+qgjcH6bQQEQ8giUdoCi6b/cvkKsoyb74VQWJ4rqr/zwJu6eHjoHaFMu3Xxp2gJ
	CtAJd4AYtX+NswBVrw5S6W57LY8xFss=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-V0NIWImXPMGiGnzknJUF-g-1; Wed, 04 Jan 2023 11:44:52 -0500
X-MC-Unique: V0NIWImXPMGiGnzknJUF-g-1
Received: by mail-qk1-f198.google.com with SMTP id q21-20020a05620a0d9500b0070572ccdbf9so2846653qkl.10
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 08:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EzsGSC3holClBSPQw8EocT+rCm9w6LTUpG8IqXLKaM=;
        b=ApVMEx74GXqcCGRcYGWVZJdm/CTKOJNVqRqmOk+OT5zCMatRG9Pb4LXHs3IX80I9ql
         cjFzWt2dLMBtcPFx7Zw6YhW9pl+7Ri2bNKI0oYgkfK++VH0KBmJ2R0iz1eIM5Dx6ybiE
         6S3+YIG9o2GdqYXn9mPX/VQqpR3pBpfiOqlzzeuh0cA1IgnSnq8YO++NXpxeoAMO2pzF
         8t+cWCks3BxVhbzB0CJRRX81adUpTp8sqOKBNjqwWb4Y8H1laSA/vix/njfoyRsLJY1h
         26dhljLqzrZvz3DVa5YVg/2sFHoxssthTgH0tjzbJkYQgPTmReDTxUAHGxK0uU4jpVNU
         0SGw==
X-Gm-Message-State: AFqh2kptLXR5qjiyj2tEhcPrMM9nZPXtyLLSiZ5uBAZMjb4B9ZlHbDAX
	KfBluh58vw/L8B0FvSqfBpB0s2KP0ohr4D/vm3LIPqjpZF/QUgFF095h7COXxs5Ff7+0E7iGmFf
	ZLznOKvIURcONWGt2r4BFgDHISUAU
X-Received: by 2002:a05:622a:124b:b0:3ab:7bb3:4707 with SMTP id z11-20020a05622a124b00b003ab7bb34707mr50094179qtx.64.1672850692368;
        Wed, 04 Jan 2023 08:44:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtC6/5x1TZXjNxaTZni/mgmGgEGvHrxdB4Ldf1ggEJ59TT3GmI7MMZ8cyzI4+MP/hbyTOvkqA==
X-Received: by 2002:a05:622a:124b:b0:3ab:7bb3:4707 with SMTP id z11-20020a05622a124b00b003ab7bb34707mr50094133qtx.64.1672850692030;
        Wed, 04 Jan 2023 08:44:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca. [70.52.228.144])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a455600b006fb112f512csm24300165qkp.74.2023.01.04.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 08:44:51 -0800 (PST)
Date: Wed, 4 Jan 2023 11:44:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Nadav Amit <nadav.amit@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7WtAXpZM3Mxi95N@x1n>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_084457_900239_118EF2C7 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Jan 03, 2023 at 04:27:32PM -0800, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
