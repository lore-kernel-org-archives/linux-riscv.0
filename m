Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A7EC5DF7E
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz+JtY73+ucDyQi7F9lwithF40dE65NGe7qC0Blk0N0=; b=NLWwGKpnkaETtP
	UdPJtkv+htY1PKu5XNaiM6ekWUZTCUKRB3jgdbnaY/9Urshk4VHN2JsSe3QvuJscBmivou+iDo9P3
	0+XnOA6EyaQOpQiSqfnW95Zl2y24jtcdvlpEVMmXqQlJh/vQpNCggR/w9hI3qI8YtH3K267+tbQ61
	gab/YdaJNuSrGVsM6uiD+3A2AEMmysgkkXoESs78AoJR1niZd7lsjnsBBKFNXYUYRAQbBAecDnn+G
	QxJWnFZhQtS045P5SesURpVazdS4jEKhggjrwSQXxpo1HrZzvbO40E8TkS4dvQd5pnrj2m643EVLi
	raXLa6ndjyWe8RWR37yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJds-000000081LR-0X2p;
	Tue, 18 Aug 2026 13:14:12 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJdp-000000081Kw-3N5l
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 13:14:11 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c8e2e39easo43900501cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787058848; x=1787663648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSsbR6ewr2Y3TGcc2GiG7vLNi19dvlUEWfugzFhClyI=;
        b=CUyfsxysA0KzoOGhYbAh3a3t0VxOweGkxVW3ssc6gfl4P73r2IGD2MfbymSSan3AcJ
         cCndWMYEIBO/1VF52vBin9tQFoeUXEn4+xhXyr6QrGEL+Vd9HaZPq/PzN1mwGodY1OYH
         XpwW33gCXP0Hdb9owJq1rgyCKEf2nvi5Jw7SNDRzQzrJVs4V/hE73LsDkIOowN/NBF2E
         PY8pZvTsjG9oXQNxdaCGZioK3jJAQlpPGPgamFDWozhnowVbcZW/rUwcN8PxbQKNk0/u
         nDs2zdPVDPOLGVDu5E7nMC4zRh0JsuO2MnzUVhPvjWWS3iqTzBXzu9/zauVRVeWlKVXq
         TMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058848; x=1787663648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSsbR6ewr2Y3TGcc2GiG7vLNi19dvlUEWfugzFhClyI=;
        b=roEcWaz8d2VrcW+OOMTzXOIITGS6JlQiiQl4AybNCbljqy0V4lFcxNJXea+isURKkO
         HRSfVa5BaPKPD8hBVjStnOzi/pT5qgoy2GHv/cDG2P/0YFARAqZYgRrdsj+PXc9M2VK1
         /bHU2ASZ+Hga7e6mJmAfM1q+IFcgg4mqDUuIeNmLFfhoX7CTZunRvnOEIMrcskrsVgrB
         6C62zdJzfkAoV8DYsNkjjlY4eDZqK5l/cTXZ/bv0cVsUzS1iCh5oM3r44cMOdi5AX5tv
         e5sD3GZlvRmHjz0JIoyXqFaMFxUPcKslOoXuAwTDi3TH8K9tezyPFl4rlUZlsyvA+QpN
         vrdg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+GdzIjw6TKpI6DLo4bjHVyWrVwrt8hFFWZdFdNe3EdQCQBohT+yRgQJL0HVy1b9jVayBXC7X20LfNzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96SpVTS7Xrz4Tqpx9W871GxXavE1Q8fYiXiara2iQT9oL+/E1
	V+Ss6i4ArvofRCAS+4kSdv4Vr+ETX9jtJFBishTaREQWCJyAgAKOqqQ7uNm6Xa/pSuA=
X-Gm-Gg: AR+sD13o6Y40HFWA/wHvTsh0lzAF/1xBmPqTak23bKC+fV7XKW67ONmPB1+e6iIvGw1
	7vEDXnK5GEccfZAYdRBqnYM9EkcQqJRB0lNHJmTUwb3dxlmY+gAawnxTnO/d+sUFclOOqLvqt4a
	LKa1HArmpG4AD/v9hlbzsmBw7NyL7Ux0bj/rY81yy/ql+3AxEA4T8sJ0lumZcgk0p0uyz/JOiGl
	kOQaB6fSJiQWyqsgtgNefxVsl4WC9wAtXn2mfFMaYlIFaUFnMzh6kss/SE66VOF+r8cZCvV2Zyn
	apxCYDri5f6xnLzi/cD7pgXjYzA3wigVLXZOkKtiAdi6/PvY9qArO3H4Pgs9dPg423W3lLKQAAs
	eFQavARdHtnL3qrX2KeFCY+W1U0Fe4IziYPwr2OPO7ai/n7O/wj2NINwIo6d0zf3jNU6XrEwK5B
	obvN5eiwqHfpYdUQELs2L8d9vI/8K9hK3wSdeAnuLgXw7AHoiTqq+7Q0HVtN9PAWJZ6erhfd6Ei
	vcKb49Iq/2g7PolbEfjkO+MQ3D2s6iFWAH63c0fpmIQOQ==
X-Received: by 2002:a05:622a:64e:b0:50e:635b:5579 with SMTP id d75a77b69052e-52d854313eamr337878081cf.19.1787058847779;
        Tue, 18 Aug 2026 06:14:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4580faedsm32357436d6.1.2026.08.18.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:14:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wwJdm-0000000021o-24fh;
	Tue, 18 Aug 2026 10:14:06 -0300
Date: Tue, 18 Aug 2026 10:14:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, fangyu.yu@linux.alibaba.com,
	tomasz.jeznach@linux.dev, oro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com
Subject: Re: [PATCH] iommu/generic_pt: Fix the RISC-V supported feature mask
Message-ID: <20260818131406.GB5482@ziepe.ca>
References: <20260818092444.42755-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260818092444.42755-1-andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_061409_849817_CB6FA4FB 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, Aug 18, 2026 at 11:24:44AM +0200, Andrew Jones wrote:
> The RISC-V format advertises Svpbmt to its users, but omits the feature
> from PT_SUPPORTED_FEATURES. Add it there so configurations which enable
> Svpbmt pass generic page-table feature validation.
> 
> Fixes: f196a8668797 ("iommu/riscv: Advertise Svpbmt support to generic page table")
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/iommu/generic_pt/fmt/iommu_riscv64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
