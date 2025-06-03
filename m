Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB44C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgb9qtfcxAQ9bN5rHpVqSqeK7R9zqVWpIvOmwR4wwo8=; b=JHPjAdrFT0AF3X
	PcMnKvJ8FBmni7nsKkzVVzJoVVHomUuKQr7b4fHHDgsibdJPLwe/jEidSd2+uvaqLE0b1icFfCobD
	f/eKgcF8Vu8HG3nKJtppYHMqEqZCPruly46piQOxIYBY3bnSr+8P2lDxptQV4T2hQEBJDjBFLAl7z
	N9c6Jz70HwxIbFgWzTpaJ4IuhhQreOwwkU8gbwEeoR1lDKJzdBUdlx73/IOgSkSXiZvaB/Uo6Y7S1
	wuY2JQQxRxhlPl51g8+w0U7TisD1c+ueB6lzW+cYr1MUlGfmQHVsDrBDurIkEqUBb7DIlpMh9N/W4
	ePZ0eiW/YqCwsj2QSYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSAb-0000000B76Q-28fI;
	Tue, 03 Jun 2025 13:59:13 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRzb-0000000B4w8-23Ux
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:47:52 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-72bc3987a05so3523268a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958470; x=1749563270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=fUYi6+wS56EqvFUFpOHZDHLW+Cz0qkEMP6rdz3sBN2eY0DYd4iPQ0RfRZpS/R1jBGj
         v5JqbWXQSLlWuVA3YIg3P3QDbLmMtUCcsW0xV9a5eESucli2gWXN3Y4J3d9qjQxEigmL
         XprGqRTLKQ2OFOwyZIiCU0alxDOj3dXMkeVz9u3mSPmYU2Wpfrl3fg/FEk12ye5UNctj
         /3QX+VTQGZOOo+Ac960gnp/hbY+O3oSZrxRcUohdDLtW3vtJAWmnfjOl8bvhE/GZV2fM
         nkgTbN22R1RdBG80XO103M2/FSpJRcpzN4frNLWb2LivTxpWnkcaBuxwP7U1mqfA8z5s
         X5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958470; x=1749563270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=LDEtQV/LYUBX4MS/tJMWdwI31/9RnqRPEhTOlcTLOSUOPKjQmgAXhJ5QoMqH2v3Sid
         0Pxgg8SfxoTp4878XOH3KuM0QOba+5U7B4N/ySM2imqfZrvVorTiq0zDF1rfk/b6ztI3
         WnyTL7l+ngp0g5qia5on7x3WvxtKu4mo0Q/N1vp4HBvPo0MmGTgfw4PIsXSpA0q81E9K
         OkzPM5ojA+b4Xeffj86xK/i8fwDcPQo66Q0asm5rNCheAr1Ca1l2d+x8qRMWEsL9Kqp1
         YqDAbn8ENanj5WtMYgYb/jsX7dKrS+9drzs5S3pl/0IkKIQnePhwrXxBJN5oPFDkRkjM
         B67Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4JSJDkKWW4NdmIr7pjjxH8jsZMvXiOpznkMa3YKCKbt1Pq+jz97vpHrx/fqXkIHR1GGCD/y1Ey+ICBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5F3LTy74ho50O7KBjF1nMIA/FXvD30x6WBWRLk/diovm28q50
	UQDIFRASLGpn/hh7smMF/qX3hSubFapcYTL9dfUZRoE6gwiRxcKfQnBXz1WycDKOiw8=
X-Gm-Gg: ASbGnctAS9IyvtwLOPIGqB9ko3kHhe2wDAA3FKxDmno9ziYiLBQ3TfG+JSgqTiaYoky
	jPPzP2wqPjGMMkommgDE1IiF5ewt8CL0uW/WGJn5A8O6rhkSjMc9acneT+1c90cgJIEDQ6ytMTM
	CiGOo2dAlTll0/Sa2S1nLK6bIA6R4DEn8BZhkxXqwnVKIsD+AMoCaUW7I2npebSWRZqFkePKfvh
	+n0Y5cuZ1K78KPflN+TJTY4vV2qHCyINB0/xaHGwy37V+REG1/67UHjo+0nNxu/BlyXhTLbvrVG
	r2qHAwkWGRQFcI6+Tohe9QdgI2GZaQKYn3n99HcAVHquYVGgZC98iXKnvk6XTuFdzl8JuG8Dn8e
	jDFAa2NlbcwVC5ZAi7H1QUpN4n7E=
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7d211676724mr394455585a.8.1748958459265;
        Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzO-00000001hB3-1CmA;
	Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
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
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064751_526107_0EDEBF1D 
X-CRM114-Status: GOOD (  14.94  )
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

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
