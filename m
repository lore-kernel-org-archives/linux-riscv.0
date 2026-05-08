Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C2CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AQ8FvHrzb1177BThifHP/Vhx/0x/x2XJfAWZyO0l0M=; b=okquLC2ryzl9kf
	B2ph2lraOva6rJkKCS8m4dKLHz/MQli3HeCBhyqi6+Z2ZNoje8l7iiZJMvSES6qWtKKJUU5g7ap9d
	X2OcZzgOhGY4RAREsmEvOnBdv8U8posq2+x10yEkfqpt5oh53L/Fpqbpp/2D8xA5Wg5P91GN7OCDG
	150qVbIWCKdwRQ9I9S+fe2T4kiqRkNEFqQEOWkVw64p7btlIgo4O7PT8lYfDsXmrYjuxnr0qeTilA
	BOil6AX/ldiFCTNcWE+VfqWih34pf+mwdQ+6keGVuRd4A4UZgKpJTfh/zOB1D5M+YU5xrT4eXl9KH
	deln5OQqeSnu3CKjwA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRmb-00000007SC9-3Oco;
	Fri, 08 May 2026 20:26:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRmY-00000007SBa-3LAT
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 20:26:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso1345ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778272006; x=1778876806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODbVXyQBYTWUs0NYAxrrYfv99hBNWpudjtexIbDyTrw=;
        b=URScTb9bnj9oVvKS/eaXCL6PuOgtLEvgRCI3qQg1VQJM0z4mFSflkUPa1enWGf3hAm
         ++duuXGr9hQ9O+uGChbGLWq8KtNk8+6NYa9hRLYxFjYKTXEISzx2trWI30UYdsAzRFmp
         QvssdLDczgQSmbfF0UBIQ1bZNp9aJmlo1Ypgfhdz3SQsOoczy6FNvn8UHeT0EOu7Xfi1
         Q3gWiBf56xV5iDB14TEQBa+eM1OqG2yuUkNwLrViqZVn4a8mB9bkS4BkVYhFefz8wqID
         lA7NSZiC8nc+wALSL3n+xtCnHnPrSNWFH+CdVXJzOxB0F2q93vdLf5J2iGTfjZd1+OtG
         nzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272006; x=1778876806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODbVXyQBYTWUs0NYAxrrYfv99hBNWpudjtexIbDyTrw=;
        b=mEhCSXcUhzUzehKkkr5BVlgpns4ebPrjKzimGZQP6Pkjb4yamodVkaXcrqJN9i61Zd
         CS47aZb5vaHsL24p/gKmZRbMYijbF+piNT3wu3kkpaU1sv0UeuKYEsgB16zUgT52iS0N
         HI/Wy1+1Hm9GI3VGTlgneMnLVgiGaLb3sbtyl2Jy/NEmPF2P2FkmTRteYw1pAZiRt2b1
         LfztliTKE84zLf/IngERCoFWxmI8U9B+6J8JYtdRAgUglAkyGLJrOtfht+zPLqxxZ3To
         yoEBDgRgRpsnGiEBWMwTvZgaWU9JfZ4uAFrK7/6LCC8Q2snSuo6We/VeHhDiznsL8qyB
         YKcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mMHjODgN7qe3eU8qafnU+tVE8A7uupZ0Kvrc9uvHio8OuMt7zEoEBugF/Ow7JAJ3G23xuWOzWpZSSlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Tylmsmy/XtT5SBdI//nDRDGPgmkcFY4GNmZmYGbYmYIs6ecN
	Y04dlEx2zWzULQOmOsS/2SiyB9NJZTPv5MEqDxv6Yme5vcAfDWDtGBdfSSdbOT6Buw==
X-Gm-Gg: Acq92OGxztmiaIQhCiO7E4doByFzt6hgNiM/MN4c+HEo+fGhneXMkryBsI7NCk87OrI
	QzF+1u85wcUusccvMEBGa8qBrCE1HVOjvPSulGSr6WLIUenp7VrqCE2u+Q7hiBpL1DS7Qft/Pky
	cy4DBPH5xOWLgjTvHnRymRLiPLLbsOQNCyDQJ9SoHNRw4T1xOW3qiOzU+H8eituL37O3SjUsg0C
	q1chcuO6rXY6VBhEytPhCz0e8zMap/dnAH8yZHCwhJkMY/z7RY4KnUhBKsPWomtVOh4VbXmlRqP
	VmwRmnmCxZWUp1L6yGxAC4N46MYnQ7KeKOVAWlZ//tH0n2JWCyrhzKV0ZZ82mo6kSw5j1xrZ84n
	TBVDs8NQKGUGHAa+ER4Zs7ah6tXdNatDnPtUUOcaCIqxgK4o36c26HKBouACuaUUyZJ1YKtRSJB
	43hmtrP+qt1dmgmSoorPCcxMiQbm3+Jj9OVuuZEJqEhC89oABVHIGzydCtEucfPVazHaXD
X-Received: by 2002:a17:903:46c5:b0:2ba:4749:c9a2 with SMTP id d9443c01a7336-2bc746fc446mr864515ad.2.1778272005075;
        Fri, 08 May 2026 13:26:45 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c23464ebsm680997a91.13.2026.05.08.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:26:44 -0700 (PDT)
Date: Fri, 8 May 2026 20:26:38 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
Subject: Re: [PATCH v2 2/8] iommupt: Add struct iommupt_pending_gather
Message-ID: <af5G_j_Y4dUUc6aZ@google.com>
References: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
 <2-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_132646_840561_030917AE 
X-CRM114-Status: GOOD (  13.49  )
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

On Fri, May 08, 2026 at 11:53:01AM -0300, Jason Gunthorpe wrote:
> Add a struct to keep track of all the things that are pending to be
> merged into the gather. The way gather merging works, the pending
> range is checked against the current gather, and the current gather
> can be flushed before the pending things are added.
> 
> Thus, if new things have to be recorded in the gather they need to be
> kept in the pending struct until after the gather is optionally
> flushed.
> 
> The next patch adds new items to the gather and the pending struct.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
