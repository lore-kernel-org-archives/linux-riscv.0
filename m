Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F35CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hFNScZwg44gbvV0eMY/HMsXZNobREz0lJi1g2pwZlo=; b=XbAnFx39eEVlpu
	u66J0LWbnbnShBwn4OMKk19K1F/s/MP8q8vWA9h4N4kuULsnEh1yFklRamudh4mW5KkctSZOCNEeX
	P2Z2/HGRi9rPlBEAy2N1uV7WO1pV6GcSts8MOsZxIm07sINtvvDtKHlVHTKs3/Og98Bgh4+9t2oCo
	8KNbiR3H/nlZmdlfAqLr/cnxA59m04hSp413cFyGJPq5GF6y5HITcfb6gapvzOwEki5iwht5QjOrr
	J1/ALSpmyzuz692Rdv/nAy2R0gcWj9UgqGGnrHem0fzz8pCyjm36gyM8V0BieUtkHv/PtTrmSFz1E
	kSydLO6J8+YU/yEx5pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRuq-00000007T2j-2Zf1;
	Fri, 08 May 2026 20:35:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRuo-00000007T2E-1wjs
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 20:35:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba180a022dso1325ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778272517; x=1778877317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SXlitbk32WOyBlu30f95rRaQhj+JA3b3XmJB516F7k=;
        b=hY4a9BzOjOLmlCxBdGaAKq4dVLwE4z4oHzhUBAZckoJSnscssvE42VXiV6rRFuXI8p
         kKjzlJijWITIuHdFSw2L9F1wnR6bjuT8ijLfttmnq43YYf/U0jizuKyVp79dDqytkLTx
         OIT1tpRJns1DGAadPW9rgCaFhgKng1+BeeKnfwutMdGhEN8aS24wSv59BVz23t09bbOK
         uyM3GS14S95Kify8XfaeAW1M1JtBS/q19UqEsMMSPsNQr/mhXRzoSiUrAVvAX5zsbZ5C
         Ii76dSJLZ2GeuBh6zSL2I1K+gocb5m/UPzi0YKqjw738w86nyLPuU7qCxTWt9CT5LxvU
         NXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272517; x=1778877317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SXlitbk32WOyBlu30f95rRaQhj+JA3b3XmJB516F7k=;
        b=OcmxChAMIdXOm69FICRfPh1uCYEGZfKO21n3yANTSkLle/uQn9RMvftzg1m9V/xDwA
         qHS+1wKmSAtxBxUNeh62E8GKJdEATMnRl0WOabVoqGf4c73E2zJK8VPkc2HKYvzb0/n9
         fy8TcfcnUFhmVzKXLQbF84M4hU3kIIYpCBtxFXiZxRB9ujnpbjQBDH0sJ68XTRVWXgmk
         uT7HZm+QXedo3GLi7f02LofgaPW0IKvS4y4DBRN7Bx9aL7IdOOrk4tnTI/lsdJ+Z/u/K
         xA/kKOAK+xzOOcIx0x7Ik3N3bufTH9JQ62p89zTUsPPQqH7R/9GrDaoZ2m/gizQmMEsq
         65qw==
X-Forwarded-Encrypted: i=1; AFNElJ+ertKcQJB2v2lPjI+N/ZZ4zT7znyumxoU24oaMIY3/7+Po8FBrHKe7/Wf0d71Is9iO+urY88i1NOdH9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtmE+pur3uBUEOzO+ZG+e2n+IqLLmE7J0+Ot5AsSTIu0z8xzBn
	rPDObYJWP0Sir4L+CvIgQzT+cUT6mqqUDLnwrskJ7WxZx0uJotYRV2lmKHQ6hC7mJA==
X-Gm-Gg: Acq92OF9qO/n6d8lo4+GiL9ILxvNRJ98apet8/PlbcI591Xbx9hU/xP9xcxLUHeNIuw
	YplchQPCFwaDpqesB4ixsfQnMHSTcKXY15xTEUaXoGJe3sR4B9I+AR+bv1+qy93Xt8W6wAj6iBw
	JNZu2pOKnU3rfc66YvZ6StWqk4+hXpHV3/2slYAsgZv6utX855ohzumxs9ykY+KvoQKS1oYMWuy
	75ma/keHae/CQKHK2HanMPFHZLZ9Bg8UZCSwbLgYLJ0oJm5d9FZUQU9D5JknEUFpyAZGGnPiifK
	67c7XoGihmddd7OQIdhi3MCQjAB5m8NGc0rqqG/Fwv/t5hl/ReF8g7UnCt/vSUVaOSZ3y88h/i+
	9pa+nXMhMVE2C6WP+Q2iWrng6fa3uSyfEb+84sqV9B/+U8gJpM4mZmHZYaHsEDmOH7R0JRZ+4fG
	+lnL1UaSjSZyFJsklaozM+9CHTurPQANr9rS9O27LQd5pNQnIiN+L3l/+SXHb4LSEYvzmG
X-Received: by 2002:a17:903:3884:b0:2ba:30f:33e0 with SMTP id d9443c01a7336-2bc747f25cbmr741565ad.20.1778272516852;
        Fri, 08 May 2026 13:35:16 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c1f48517sm689352a91.10.2026.05.08.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:35:16 -0700 (PDT)
Date: Fri, 8 May 2026 20:35:09 +0000
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
Subject: Re: [PATCH v2 3/8] iommupt: Add PT_FEAT_DETAILED_GATHER
Message-ID: <af5I_Xps4Ma-qUDx@google.com>
References: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
 <3-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_133518_988886_270609D1 
X-CRM114-Status: GOOD (  12.65  )
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

On Fri, May 08, 2026 at 11:53:02AM -0300, Jason Gunthorpe wrote:
> Generating the ARM SMMUv3 and RISC-V invalidation commands optimally
> requires some additional details from iommupt:
> 
> - leaf_levels_bitmap is used to compute the ARM Range Invalidation
>   Table Top Level hint
> 
> - leaf_levels_bitmap is also used to compute the stride when
>   generating single invalidations to invalidate once per leaf
> 
> - table_levels_bitmap also computes the ARM TTL for future cases when
>   there are no leaves
> 
> Put these under a feature since only two drivers need to calculate
> them.
> 
> This is also useful for the coming kunit iotlb invalidation test to
> know more about what invalidation is happening.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

The conditional gathering via PT_FEAT_DETAILED_GATHER looks nice.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
