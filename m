Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B49DC61CE5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT0xKeI2Wu4xez4K9UW3UjoGVwT+qRN9ALRtddMHPds=; b=YMbt7670oZ3soF
	XIGmQh5Z8X2WN74jY67ngkcI14ItYehlMhpmFRpkqquQjuJDK+zgNpm8otHhkQnfkU/OGiweDfncN
	3tAKl11ePoRg+zCYdRNzQZj52HZDMPnPVfJEoHGjwxQKUNZqhdOBtFmfk18dQS/jb7glph+01yzpW
	GHGNgwbtGMPyqH2O7tYaIhY04wHM/2BMaLzHR5RjW+4aHaLYaIJDyVqTRHQtxur7YIdMCEfA3HrF7
	1qyIWU4Ik5BqCKWT6cjzXLj+4PFM4dUqQ5pvwI5Js5Vb2BMCpngAHWzcLkmdpT1/g+QDQ6BROVh+S
	K1uolWYqZNRM69AezvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRzn-0000000B50e-3Qad;
	Tue, 03 Jun 2025 13:48:03 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRqh-0000000B3t4-3apD
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:38:41 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a58ebece05so20448401cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=lgLRUSRUUt7iEwhP+FBp7JWXXMi1nRPFPQzwF2IX/HI4PZEjAGT3u016LT3lzNPX3c
         VuzuDVL+ptmppZ75DI72V0xgFcgBEpWovu/sfymD2ybf9Qte1LvlFUyVd/RUha1nOA6B
         vmNx+xg+pPFjiihtWAr72TMLVm+GXSt3s8TxHoRZpjuxE5nXDudvTobIafnUzCBV8uqq
         iN1iK6FnrgeBEPeFc8ZhoLhMjnQzq7Jq6nOH9fRCyTC+MR3JM8bh6bKkm8vWFgaUB9Fk
         b0KqmY9F8FjidOyhAfsM7FDThHyjWWutn1Tc2B+KRjmwgN7+3lP88VfmJkHpLLfzGOaZ
         CvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957919; x=1749562719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=WhLiJfL0r1B6VM2TgimPkJB08e/Ro7xjkNeGLNvF3eLFS8lthVjmFm5eVWgO4+7Up8
         GqXTOYUBRGP19C78B0BqsWrpPHSSkSqY6CpREmv4J9OGxz5wmx++5aGASol2T3x7hrbu
         C6P9zc4Oalz4wWI6PRN17wJG+msQH7YiS4lxVmlXR+ceEuuUWKT078wuEaPNvQuYkD/7
         6nmraSW774inN8Bgm2pn0Ax/itS7VN+Oamwrvc7l11oImwamrmV//zhyd0fjvh0Xwctw
         LVdVNpP8r8YD3JM3N9hwEKi8tpVN5Z1ODO5n74PAa8P5yBV1HkP5LnbnilzIW5zziShv
         rnKw==
X-Forwarded-Encrypted: i=1; AJvYcCX52k4FAAzZjbm1bgGE7BdTjBUyp7eAuMVpFMVuU2vuYCbUNSt2lYqV4YLFutX6+GoUYdG/HhHmw6b1Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ENm1HdDMJAQ3LmEXyhsdiwP7daDfscOFtQXQi5qWbEUClytu
	IQKnqJI/68LYOBxuyR0KdTmYjFc57zJsglEkmOtt1tpZH9FgMt9/EOYrBCmUP3ZGMUk=
X-Gm-Gg: ASbGncurwM1+nJVzMnV+C54jXGQH6KeLOPbbwdJRNlpa5TTHvIvpUtMEG8U67aONOu1
	5+BXNO1zir/2Lpuj0q/Gl02yYS0KiyTqPcy+hmXqY6FUn/k0BESIwNHE0cMb031un9LbwHR/ca5
	hIK+J8BE/02/qlSObpehN7ahKU4kbsEe0I9lepeeXR+dJnJ6aigXAHW+EalLAcOYuZrTL5rXEJz
	9nXqlXlM7fa2Lp7s59Qrp2IjDVZ/bsGNXzM6JIZNj0uaEq0LCmYrnjnD+GtJJEgfY/dLg+rlu7L
	OHzTH3CUHi4yzEo/wV5BGfNDnX2xg/ZmJc0WMuaAt6VDdxwFJ++Z0Zg4OSPvMrHiI1DcGL5KV7z
	mcZXuo/P//GAihFAex6QyUI1jPjg=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424;
        Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRqf-00000001h6M-29EG;
	Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
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
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063839_892329_B32FE264 
X-CRM114-Status: GOOD (  13.81  )
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

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
