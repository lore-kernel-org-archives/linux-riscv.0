Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C6CD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/E6GKUJ7dexyyXxU3u+NJ4fANk3DFWtm4gvPPRuvHc=; b=KOw8lqo1T70Eue
	wjtmZsqcfJ3NhO/3LKsw52ucj3sLjWsVY9m2VMNnL2IV0Zoek8zuLmdIQhCXbTb/74wk3ymahcJS4
	u4o+HuXMiEsLEGad+KjzujxZ1Gm1/z/NSRxJi3X9Spukc70DfTiMwM+sq1Lw2SR5TayGTMJ7d8jJL
	2TscYPB8coaJNUxMCarWQhPrYqTlma9VYZSYq//hsOyR6JxtvimTJnWuA6e7XtBqBfjwtXDbR7VwP
	OAxFX22yqVAQULs/APfPWXuPvBqi6mYDeOc/S9Tgp9UEC0UMLJD8PWVmtboxBbruunN8m/FWEPyhT
	nz8GPbvTMOALr2mj261Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMomU-0000000HAeb-1w2J;
	Tue, 12 May 2026 15:12:22 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMomS-0000000HAdp-0jN9
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 15:12:21 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8ec37d52c0dso795990785a.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778598739; x=1779203539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5QZGcD1HP6wx7LkGFPePizbOfmssvqTnXeHIaO3M7c=;
        b=lYuX9QPU9uUQ1Y51BvxgSpnkw1XCWBLLHc8HnxLWdr9Xzvk8Iz5o61uq7IxGzagML1
         zIPzLnn+2Aa0o8gu10rr93NqC+fFmmYsHgqBtpGQBQvDs357+kUFBK1l1jDygQIXeylF
         dhXbvegUTzEv7do+hKL7XK4FAzMqhEK3YlCwmgArpNHx0Yh8u6W7YIZpnWCp2oEUCOyc
         mdoLo+lADTVERy2yqZjOdkQokeRmusvNZLCzQKlCWs9XDbBpPxZsiM7+2TjOD8RxZdNY
         7TpTx3bj/ZeLowEiaY8Ifq7RLXi1J6KhdvLmwJ2UUhUag4BR7B/qzfO6aH7TtFL38KYC
         2+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598739; x=1779203539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5QZGcD1HP6wx7LkGFPePizbOfmssvqTnXeHIaO3M7c=;
        b=ixc8EH3+EcfZu7N86p9LudU7omjAr9BEozcXUGoJaxdx1QwW5m3ze9PSPK6S1ZXID4
         HnhiTgtV+d3bTBmTzFl7g9gt4OriviUZUfXNiYRh6WPpvsiDtOTspssJl5RxdgJcvPB8
         cJlQtt49x4OWG0XHUOTbHbO2rfPA7RgNZz3LN1Y1DGKSW8v/5aQ62JaqJlgsyZ/sH/ty
         KfACoZRaYD8WKvGCTJHvmkT51VrAXiWIJd4ZFflJZepQFypgq2eKHx+Vg0nyzH2E6MWr
         oN71QyLMA82hzFC+i3009uh9pt3U1IM8xeIYvycgVyAt2UQ/UCveCt1WJ5mw9yhtO4GE
         S8/g==
X-Forwarded-Encrypted: i=1; AFNElJ9zdiOjd8PyLQrIF32a0o935K/TXMu9uGYievlKtSkulkce6GEyHybXbQY/yBG6vy+dGARjIfQ4UdTDKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8mWCggaKDIgbXuWi4zW1Y0vu1v4KQKPyl3yeKEw60gUBY+e2t
	USRYoJMGMWqpvc2tgadA6OuzFbLTpFrQGvwQVlUQaOJ5ZZRpaoYeyAF/PVpP84v/6Sk=
X-Gm-Gg: Acq92OH6rjPC2GdivZN6wpZHdgPxgaUYX6pSDPvSDdMVQ21LHR7zVbLUcMeUSZmjTZ5
	n64qihbCnD3w+s/IV47bCy2mbfSrwS9kuVshoFWWT2dlE4eA8SAtpm7CQyxu178yJ1eaXs58Oxk
	xc0FTZPe/guDqHm0tdrT6tLsFBHRiAS7BzyJ34DAkGimlnQHsiV5QWqF3YySgG9AuJdOznIcnLL
	Agq/n/Dq02LozVpA7F6XuDq1+Em/O0AkQhTBgqZYV2U3x+O626UjEzgeKAwotIY/AGzUA49eQyn
	KqHpBEMOrUTMZlLsmC8oVQpfrB9I/QhHrvSxFDPlLQli4sIzE89TxGWwcafXtk5eyR5ylw3DrWZ
	WxT18RfGUH63KYhbVHDF7SZA0mWWxMLbHYFmolgJ8pRCXPWTM4DPQ6e+qVyGpxydfs8VeX6Fnag
	fJGX6FdJtIPb5d7BAv9/iO1EXRNDdyuaXIIyXqJmpdMXLJSFLYxiYBGfhxO47jN63UH9dt6OgtD
	UDjOg==
X-Received: by 2002:a05:620a:29cf:b0:8ef:ba6:1a42 with SMTP id af79cd13be357-90cfd34cbb9mr453281585a.29.1778598738983;
        Tue, 12 May 2026 08:12:18 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9286171sm1410125485a.12.2026.05.12.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:12:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMomP-00000000AVF-3i1q;
	Tue, 12 May 2026 12:12:17 -0300
Date: Tue, 12 May 2026 12:12:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	kevin.tian@intel.com, nutty.liu@hotmail.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] iommupt: Fixup build warning by using BIT_ULL() for
 RISCVPT_NC/IO
Message-ID: <20260512151217.GF7702@ziepe.ca>
References: <20260512144330.91113-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512144330.91113-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_081220_218161_EBB24761 
X-CRM114-Status: GOOD (  10.05  )
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

On Tue, May 12, 2026 at 10:43:30PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Fix build warning on 32-bit configurations by using BIT_ULL() for
> RISCVPT_NC and RISCVPT_IO.
> 
> Fixes: 6c21eb174c6c ("iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605121350.wZxB51k0-lkp@intel.com/
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
