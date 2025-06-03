Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0102DC5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0p3Hh9LvFq9JB8EKSMMs6C3Q1zKrtXrkTVeXAhgQExY=; b=sN4BVc54vNl7zW
	elA+jKUKBTkeapLw6acUAmum+LXQG9210npuZOtuj9lbAKn9hcCN/QeDsirzVtngpMUc/GZV/jN51
	Wi6v/3CDzRj1d8VJC7P9hFLUDPsAjGPxRMcj/Nu5v/0411GU4FPhSj+isXoW0gt85lMXuJfgBwWR0
	5MWxfMMtfQ6K2AEIPY34OgJJC6zuZ6dLjCPjAXPALy7AI7yOOxPr4dBuGnZlWkdAUi3p9zIyVWVW+
	26GrO7n6Rp3xpeRT/9BFtG3MiYh9s3pcAa50IOSZ313Y+a3mJHA9bhtFCBjS8w68uCANXXz058D6S
	nw/XoGKRm9FJICfWTXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSAc-0000000B76V-0ZPV;
	Tue, 03 Jun 2025 13:59:14 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS01-0000000B56c-15YB
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:48:18 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7cadd46ea9aso682652385a.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958496; x=1749563296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=NHi1pblxXy3kcy0t0jhDGz2VFfbRkR4YB7ORUS21bKhHlnbL7A1pPRjl5nGeJiNm5T
         oVlRRCSlRZ7ouS1iTWZe8E6Z4KdwgdhLfcsqO1mJ15llHrXbOIWtHNRQMjMBtHsECbSS
         uv2UkcTwvQkzJEL+mQOwHJF6mm/h1adrDGcp5l5BUDzRwCCyBz+T8sfr99R0sR8ucDTZ
         N7oa4r8FMtEGYMF6bZhSj+EHe65YvoMIK5MSbmzROHZjPL/40UqeDQzyKcCgoDiQpHCc
         e8YGQgJa9MZZyXr/GDXLrrvy5m2tZ9mm9Jye0RlhQpdmDoavVV/C81Of6vpAnP5IOokR
         XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958496; x=1749563296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=V6aCkwDQHIO0FdJXG6dMF3QLxQIdO9pRexRLbaDUEReIkBPs2YKDFMaVpmkR2aAeea
         EupaqPJ1XRSXXpTGOpLR7jQ+6ZaxThGMU+LPLl7fQbgvE+rVvg5hLuf/LWIQ+eXofJIU
         kTUF2bhCC1VjIvYSMgmkzTqL0v8DJ353GcHVEV04MLuBbRgzRZplYFgkyBQuVzMn10Zh
         R2d8Yjie1w/eDsED+bwyPABqaGd/ImTJK4FcYyWDXaN2wAaXRW74fP6Vs46HGSWcBE0r
         kJZUqh/ewu6Za9ZT6BA7kNXEyuJ42wFDOtprapi5hYj3uKhWWwrBtV0xltOuz3psxkio
         BNJA==
X-Forwarded-Encrypted: i=1; AJvYcCXckzTevSlX0ghf0Xp6MfPr3RZIYKsYjIXgn6xd4uBqYbw0bpXhHwUolWTE6UQs2HYEiKbCPsUq21n8lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz5wdykqL9Am1ZqBDXb7NTeWRcygv6gCYtjo2rrSdwl+CFoqUm
	Crp7hf3JZh1kl74jMTLiQsnEaNB3W+HXi8ArllG0aezhE9F8iHGlnL4/eQboWPyE4KY=
X-Gm-Gg: ASbGncvPPUb1x98nkubYGjxMSEot9dSzbBWHdZHvBrjj6skfwhKJtkzqoFAdqGCGBDI
	+NVISl4xg9+l8wroQxW3dJzsAe7UCRukVn3/uxtjjS+kLTZMn7GDPd8uSDiWNhEjkWazL6WaEVb
	7BmwiooMYhTtLlzE3cdnVmPj6lFYoo85B40HkQ/CckuiJ5FZzqFkOMrsCdXRqVXepHn9k2t9IHt
	p+gcrrYEVjSHZlYWBnQqnWDrgFJN76jUpWshbzxn0LfOqXLzloYeCd7cBVajX7QUazbE+7vmRkl
	p1dcOzYXhUV1qkcXXRcQKffTLjil3ONUZ035di+RP3S5Kb4dsm48YpV26H23/lBSTe1WffuR9jQ
	i8cM1A7qN/wDFhGFoMowgpln3rz8=
X-Google-Smtp-Source: AGHT+IEC7tetoyd4MWB27Cys7lEZRwLgg/tDNDKGL2nO8t1WlsQDGW4e4zhoToAJp9Wky9F+fr/2kQ==
X-Received: by 2002:a05:620a:290a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7d0a4e57644mr2655730585a.57.1748958495697;
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm838696585a.24.2025.06.03.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzy-00000001hBT-2tOq;
	Tue, 03 Jun 2025 10:48:14 -0300
Date: Tue, 3 Jun 2025 10:48:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250603134814.GH386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064817_310430_04DE688D 
X-CRM114-Status: GOOD (  10.19  )
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

On Thu, May 29, 2025 at 04:32:08PM +1000, Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/dax.c                   |  5 ++---
>  include/linux/huge_mm.h    | 10 ++++------
>  include/linux/pgtable.h    |  2 +-
>  mm/hmm.c                   |  4 ++--
>  mm/huge_memory.c           | 30 +++++++++---------------------
>  mm/mapping_dirty_helpers.c |  4 ++--
>  mm/memory.c                | 15 ++++++---------
>  mm/migrate_device.c        |  2 +-
>  mm/mprotect.c              |  2 +-
>  mm/mremap.c                |  5 ++---
>  mm/page_vma_mapped.c       |  5 ++---
>  mm/pagewalk.c              |  8 +++-----
>  mm/pgtable-generic.c       |  7 +++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/vmscan.c                |  3 ---
>  15 files changed, 40 insertions(+), 66 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
