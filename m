Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7E7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLKuE54qTtNFQoTcs5ptM0ze8c8+Cdd4wwwp6vPJT0I=; b=XWdi11bhL55cgJ
	6WO+9m1+7bHq6Jab2iRawPv+uV5AyrQGkPymZDPlFJtHgl36vCVh+RPbt+hbo9wDBRP0wbR8pjAom
	veRy9AfYUhOcJJH5rDV/b5WeQwdgeowgsDlZISctSCPSOsb5GOBWgarDJ9G/G58U2I3k0tgnsmJ/H
	8IsLNuN8XwvScTvEP9mw7pOadp6urgxfpQQIMwIN5t211bG6URgebjA2zkNUJPa6w7X0IVoMYXLHv
	BK0D9tKjgO4yny1qB1Tbv/7mE6+VIiEh7Jpjnyl0jmJf4T+A4Rt4NtTMUhtq39iN/W9RQgExeQIGX
	JUZw1ZR/rtApOOcv0Opw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtFh8-00H1Z5-QJ; Fri, 03 Dec 2021 21:02:14 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtFh5-00H1Yc-Uz
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 21:02:13 +0000
Received: by mail-qv1-f47.google.com with SMTP id i12so3956873qvh.11
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 13:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Qn8OGxN0mJ4XVtOk0dKCgNrTcXxTzqRnKO2MY3F8Sk=;
 b=uuZ5Jqbtf4I1DOrKw2gjHWHrkzI2/eo8KnNL+FAXDVEp7QbHmr82Ibf6mEnfGvpGqF
 QL5T0dxwGY+8DoXyGv3NS44fOsbwNv1caM0bpBxFrq9gUiWPDRo7MdiARg7A//ZVE2Ho
 ejcgI47Vteg3YKrKtScQeDLSeMr2NLrASwr22J0wCL+QhD7XvAdJwBID+4VGyw8nX+ms
 MYa2AvC2vQJNl5tEqOfTJljAk6fTAw49W8RAf8E1z+oMVOu8w5u7cfchrlNg30thjsma
 jj322LaVy/NxOq9Ln/qtU6emtZEsLiXVNRsE10qV9FanO5hIk4EDQLMU/BXC13gqfsj3
 /8hQ==
X-Gm-Message-State: AOAM532rnsW0UmEHN4GMD4TbpPH7Qcd5ZgJZJ1pDEg1O/gOTGwRjODHI
 fz1z+i9CMOX0vkaNJAXAieU=
X-Google-Smtp-Source: ABdhPJwVSd9Ncb8R9IUZw28uewtm6Pr4Gucg24jRcXLaX+SLJpH7xPFJoA4D8MSy7KkJE2ZtK6aqJw==
X-Received: by 2002:a05:6214:27e9:: with SMTP id
 jt9mr21965622qvb.131.1638565326487; 
 Fri, 03 Dec 2021 13:02:06 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id n20sm2988821qkp.65.2021.12.03.13.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:02:06 -0800 (PST)
Date: Fri, 3 Dec 2021 16:02:03 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Dennis Zhou <dennis@kernel.org>, linux-arch-owner@vger.kernel.org,
 linux-mm@kvack.org, tj@kernel.org, cl@linux.com,
 akpm@linux-foundation.org, npiggin@gmail.com, hch@lst.de,
 arnd@arndb.de, linux-sh@vger.kernel.org, dalias@libc.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
Message-ID: <YaqFyznA5hab3PUA@fedora>
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com>
 <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_130212_048871_4DEFC50B 
X-CRM114-Status: GOOD (  27.71  )
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

On Wed, Dec 01, 2021 at 11:51:04AM +0000, Vladimir Murzin wrote:
> Hi,
> 
> On 11/30/21 5:41 PM, Dennis Zhou wrote:
> > Hello,
> > 
> > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
> >> Currently, NOMMU pull km allocator via !SMP dependency because most of
> >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
> >>
> >> * may lead to broken build [1]
> >> * ...or not working runtime due to [2]
> >>
> >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
> >> use percpu allocator on UP too") so restore that.
> >>
> >> [1]
> >> For ARM SMP+NOMMU (R-class cores)
> >>
> >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
> >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
> >>
> >> [2]
> >> static inline
> >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
> >> {
> >>        return -EINVAL;
> >> }
> >>
> >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >> ---
> >>  mm/Kconfig | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/mm/Kconfig b/mm/Kconfig
> >> index d16ba92..66331e0 100644
> >> --- a/mm/Kconfig
> >> +++ b/mm/Kconfig
> >> @@ -425,9 +425,8 @@ config THP_SWAP
> >>  # UP and nommu archs use km based percpu allocator
> >>  #
> >>  config NEED_PER_CPU_KM
> >> -	depends on !SMP
> >>  	bool
> >> -	default y
> >> +	default !SMP || !MMU
> >>  
> > 
> > Should this be `depends on !SMP || !MMU` with default yes? Because with
> > SMP && MMU, it shouldn't be an option to run with percpu-km.
> 
> IIUC these are equivalent, truth table would not change if is under "depends"
> or "default"
> 
> SMP    MMU   NEED_PER_CPU_KM
>  y      y    !y || !y => n || n => n
>  y      n    !y || !n => n || y => y
>  n      y    !n || !y => y || n => y
>  n      n    !n || !n => y || y => y
> 

I may be wrong, but I think this is slightly different as we're using
#ifdef / #if defined().

> > 
> >>  config CLEANCACHE
> >>  	bool "Enable cleancache driver to cache clean pages if tmem is present"
> >> -- 
> >> 2.7.4
> >>
> > 
> > It's interesting to me that this is all coming up at once. Earlier this
> > month I had the same conversation with people involved with sh [1].
> > 
> > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> > 
> > I can pull this shortly once I see whatever happened to linux-sh.
> 
> Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
> to the same conclusion, right? 
> 

Yeah, I don't see anything else from linux-sh. So I'll go ahead and
apply this with my change if you're fine with that.

> IIRC, RISC-V also have SMP+NOMMU, so adding them as well.
> 
> [0] https://lore.kernel.org/linux-mm/20211130172954.129587-1-vladimir.murzin@arm.com/T/
> 
> Cheers
> Vladimir
> 

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
