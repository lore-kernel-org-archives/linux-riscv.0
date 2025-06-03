Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8992AC5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvQp0x6kqm3ch9Q4XIXQqw4422IMkskdIafP0OJ0XqE=; b=KWpeebxJiuDjET
	qY7cUT46O/YIn9zS7EjWQBu/iPDvtZADyooGguIE+Nf1JI2xBNJyKNkvB4irh+03IP1koqsm+9FmT
	q4D5Qbougmr7Iqq7NO9ApalarhtSovwAxmDpmXuA0Zm7VpQVxziasy7k3VcJgbFTjlw0eZWu3chXW
	SZcigyCd64ntlzxXa/GLRmjcT9lI0mxs2d7zALZvM4AxXO4XD+rwLNkhHxvwcz4uSHo0ehZCqMqk4
	WBi3AxOrUzx3sNKtw1gGAzhODwnTtDix8a6iyMe+u7JU57ulouArCFmwTqx9fRE0Vf+zFPbFxOzVI
	JSAsOydIKl+tUzydXTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSEx-0000000B7ej-3rxO;
	Tue, 03 Jun 2025 14:03:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0u-0000000B5Pa-0tNC
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Jun 2025 13:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=; b=GSO2o7ZHWR0iGbsp9J3iTQmWZS
	SzhEPSO/syocZ6KVkmWU8ULeMueQZ9vsW071ZJp68hxJstzky6EeTIEG1/zOJ9B76gHYEqSh2BVto
	Tw7ojlZLcNZ6ew7rrNjOGHy7EoTdREM49kkzmK/jeIv7ca7w4UnQDGPCV5y8VHeXku/qKhDe2sEZe
	jcvSVlSlaKB2pyhykWmHCOPWDVbwjymnER+23nwNxuyKQRa2WC+WM4rdiPEtoRgEW6Jfd9ATuJOlY
	HwSyxPK4tu1qMiDFpW4PphUl8uFda65iBf2ZQ3r6O9eqS+A6RrJSaaAbMO5Dim37hNuHGjhke0onL
	zc57wc6Q==;
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0r-00000000ldK-15nL
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:49:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a4323fe8caso36973411cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958546; x=1749563346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=P5B78d9jFkCI1USYXEvlZQp7XY7yXZ2M9jxIWg4ug7FRy2q1XS51qqKBdV7bpuWhQk
         dNUsZ/pWyG5wy2Ez98xQfERXKIHqZG9VdoMbUu13qrDK5fkjMdRl1Q8K933DTkKp6uow
         BBFY8E/oTd3SMo49a3O9r9829yPgCcMyzz4D69h/7lF0xPkvXhtMYyX/2091TiHVsP8o
         FxHO9JDQk3cdTBvXpxQPwJaKvfIvv0kmK9HJEvHU8JTLQucRzeqe3YN6zacVtUGxg0Gc
         d8/+ASDTJZeBRvXuZ3txv1At7B1+aeDXQhyw+3DTs2WCYUZ+iQ1opq+DHjJt5HpEfQwg
         FubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958546; x=1749563346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=n2Q/chKkNg5+BchUHrOnls4SKGGYEMRRT4d29tewp1j6hA9bZK+/uIl8389oFLNy0K
         6GbnoF8v9gcqA2Ft6CSfF82Tl4UTl2sfEc2Ge73bSZMfLImYtVmTW6LRf19bBf3secp4
         ilAo9pdFkoUg1FC20h7RhhXPAl2XPA9GukBbyk3zH3J5N/WUfbOc+78tPDd0BlfRVLRg
         H1FC/1bwlwjgUgo3Ri6uel0sz8OcPQsa0TloL4jMG2CYf05us93TPTyqbLi1F1EOw+2x
         HGjr+rw0T4CtvlPD6pNII0frZBevZ1wDpjNLl6TxvwNoQX6ACdJKFowrSDmn7IZoVjxm
         3ekA==
X-Forwarded-Encrypted: i=1; AJvYcCX85aeZLeqgxIFcLWF902vhm8ujXTHEq0EmZQPSbohtS01I5Uq/W5fFwWz6H5ljgth7qS+ePL9d+Ignew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB9b6qasz4mCITGO06Kfa777xgHwhnqODFx/ZROIK3o3MgrTe/
	G7tVMgxQ5jefVuPGZTZKMVD6oMO9EfP/0CL0pcRF0ktkvSal+HE56gSjSynH7U+MtcY=
X-Gm-Gg: ASbGncsuUAlU/onHw3W+WMi33DslgL0yB1m2xOXnFutajHU7XwYeV0yDBE5PrMrUymW
	mSaY0VO65qtTdXmuimmMOthnFYhYIu+0RQiyZVKhs3Ictyd1pj3iW0yr9ktDhFV8TN0S+Xxxic1
	q1D2M741SiL3MS8f9f/PpKlZnFpNdkVhrvPTdXnvQqbc9sGS8hlI1LXh1kV+2expjOvp8+AJpFp
	eznEKi21INEvToD8vZc4kRrcGu3MDlR0LLNWTasu2rqmMYR/rm/9VowqTBy3isEU4FVAnfznTpp
	GY4WyH2QX9TaP0Ji/8Lia2MEBI3v3xPTlP8vL5V2vW5r4CnvORtwqO0Dr+0nRCroOt6TTFI2K/9
	zrt6tUHqKWSdBIhj0yG0SgEuhUS0=
X-Google-Smtp-Source: AGHT+IGIU1g+493Q79vIGhbP57BxcXzG4cORozjsE0WNUaw+m77zFEPhKIIEfe6WhON7WEL1UbHK4w==
X-Received: by 2002:a05:622a:5a98:b0:494:b914:d140 with SMTP id d75a77b69052e-4a4aed8a697mr209908281cf.43.1748958546430;
        Tue, 03 Jun 2025 06:49:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772a19sm74189111cf.1.2025.06.03.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:49:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0n-00000001hCF-1wNL;
	Tue, 03 Jun 2025 10:49:05 -0300
Date: Tue, 3 Jun 2025 10:49:05 -0300
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
Subject: Re: [PATCH 09/12] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
Message-ID: <20250603134905.GJ386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144909_397256_8186F040 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 29, 2025 at 04:32:10PM +1000, Alistair Popple wrote:
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
>  arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
>  arch/powerpc/mm/pgtable.c                |  2 +-
>  6 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
