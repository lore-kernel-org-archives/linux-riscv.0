Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66BBC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weYT7wBZf0tDvVShmXGL06tNcrUE8YuJNCP2dmOxig8=; b=kTxmJWKAC7GCZT
	tPUUjM0c2XMeGh+hDhdMYxAo6lA4/1vTB4btuH5NemZDZp2cZGv22yu2VtkM34kYxk2J5NwSHH6/7
	NlqN807o0gG8bUB5u9hRAuTh5kRrNVjFha4j9MvKjBLOKQeqJ6o7ZVCEq7WqYNoqmBJAg1QBHO2zR
	H8GQiFbVJZ9IudZHK7kfzpMFPsD4GhWwIGwsZ/7sjo1jHrxrI8BoxY6PbqKtfuztDm8K/F//X137Y
	+si+k7EFaL8xEDdLl88VXwHB656+4z+EodaSxYk7YNLLik40PtJSMS09g6RJRL915OvWd8ku2xp4u
	VWFSYd/j4JWcwme8sOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9t0V-006doW-UQ; Mon, 26 Dec 2022 19:19:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9t0S-006dnJ-Vv
	for linux-riscv@lists.infradead.org; Mon, 26 Dec 2022 19:19:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id t17so27582994eju.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Dec 2022 11:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IswFThAcgimEglWvx4Cd58NiatVnDCYGqZisMYNWnKg=;
        b=Wkj0OHEV9MWxiI/f7K1l34Q90YidiiIylXiym4PzjFCkP/ibtmHonEuRrmLPdHkCr5
         chab+8yKzx+ep3erPrLI5Vbc7XUxx7Pr0b7/m6AE8ann/h8pcXVxyijeP5zNsxnLm+3m
         /6DCli1GGop1e+0sPyCBVWqtUaaEr8mjHQ/GTHFoAC8hvlHNAZxEpPC8Y75nozuH5Wh7
         A8znHYSNLWQjyFgIWGniP2DENjhqjUZ0R825GcdfbStvjxpuAdycTLBv/B/mUC+M+jLl
         xT15+egCh3hiuvtgW5oBw5X8MXiWiJe8U1uatlwoFQjP+6p6Od1FcuXDW/wrs02V1VrH
         Ht9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IswFThAcgimEglWvx4Cd58NiatVnDCYGqZisMYNWnKg=;
        b=Sxny7nX5HidfVk6mDdNMpou30fxs6Vr7EueKPn75UL/MFovzCeBRh23VpqkTKZXgsj
         nYyoafNz2Lbi5Aguc1joGrvowibTLApYTvvmzQrGKkfS6VJwPPr/xDT6tnwxUlVW+fIy
         qxRpN9E8QMuC8cUFwYsjnTM1ZwKHfoXPxvb4WtE6R9iYisPRwVM5xW0wKmbSJ0scCRQj
         bLQiHiGiFFgnVN0ldaLrFa6xobw5oq4D9eL5aXjsTLEdJvMBgGot1YSb/rFCbuHv8iAP
         xr9TQhXNlNK1FVg5bDPOGuNebUE29tQ2jhX4Q1fDjlbY5PXE6RtkwwCMZdRjpuClvDjs
         ijmg==
X-Gm-Message-State: AFqh2kpNifS2AAyzdqg5d9cvpe1E+PcVAFZfxKTI0+Mfd0eATYgF8rKS
	fnTz9tFijGTu3kYqrRG42aSPlw==
X-Google-Smtp-Source: AMrXdXsCD6bnbPFi7RV3oN36KxudVt4eBCJ86IEmpPAbyidNSs44+mj0uHqIc3p5JX1CFz/7rXowHA==
X-Received: by 2002:a17:907:b684:b0:7c0:a99c:485c with SMTP id vm4-20020a170907b68400b007c0a99c485cmr17499714ejc.68.1672082366743;
        Mon, 26 Dec 2022 11:19:26 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906309700b00809e33ba33dsm5219050ejv.19.2022.12.26.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 11:19:26 -0800 (PST)
Date: Mon, 26 Dec 2022 20:19:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v11 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221226191925.5crjqnpinsawfwc4@orel>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
 <20221216062109.865573-2-panqinglin2020@iscas.ac.cn>
 <Y6Dc4XNQmKtTsXom@spud>
 <20221226152213.crknhcpysonhq63c@orel>
 <Y6nql5IUhFnHv9sr@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6nql5IUhFnHv9sr@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_111929_048587_9053CA49 
X-CRM114-Status: GOOD (  33.06  )
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

On Mon, Dec 26, 2022 at 06:40:23PM +0000, Conor Dooley wrote:
> On Mon, Dec 26, 2022 at 05:01:29PM +0100, Andrew Jones wrote:
> > On Mon, Dec 19, 2022 at 09:51:29PM +0000, Conor Dooley wrote:
> > > On Fri, Dec 16, 2022 at 02:21:07PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > > 
> > > > Add one alternative to enable/disable svnapot support, enable this static
> > > > key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> > > > option is set. It will influence the behavior of has_svnapot. All code
> > > > dependent on svnapot should make sure that has_svnapot return true firstly.
> > > > 
> > > > Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> > > > to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> > > > 64KB napot size is supported in spec, so some macros has only 64KB version.
> > > > 
> > > > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index e1a9fa47f012..25c230e3bf61 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -397,6 +397,25 @@ config RISCV_ISA_C
> > > >  
> > > >  	  If you don't know what to do here, say Y.
> > > >  
> > > > +config RISCV_ISA_SVNAPOT
> > > > +	bool "SVNAPOT extension support"
> > > > +	depends on 64BIT && MMU
> > > > +	select RISCV_ALTERNATIVE
> > > > +	default y
> > > > +	help
> > > > +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
> > > > +	  time and enable its usage.
> > > > +
> > > > +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> > > > +	  of contiguous virtual-to-physical translations for a naturally
> > > > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > > > +	  size. When HUGETLBFS is also selected this option unconditionally
> > > > +	  allocates some memory for each NAPOT page size supported by the kernel.
> > > > +	  When optimizing for low memory consumption and for platforms without
> > > 
> > > nit: Does this make more sense as "When optimising for low memory
> > > consumption on platforms without the SVNAPOT extension"...?
> > > Or does disabling Svnapot save memory on Svnapot capable systems too?
> > 
> > Depends on how we define "save". Disabling RISCV_ISA_SVNAPOT on HUGETLBFS
> > enabled systems will reduce memory consumption whether the svnapot
> > extension is present or not. When the extension is present, the memory
> > consumed may serve a purpose, whereas, on systems without svnapot, the
> > memory consumed cannot serve a purpose.
> 
> Right, thanks for the explanation. I'm sorry to be a bore here, but should
> it be reworded then to "When optimising for low memory consumption on
> platforms without SVNAPOT, or if HUGETLBFS is enabled, say N here"?

I'd prefer we keep the instructions as simple as possible. Basically,
"Turn this off if you don't plan to use it and if you care about memory
consumption", which, IMHO, is how the text more or less already reads.
But...

> 
> I don't really care either way to be perfectly honest, so as I said in
> my other reply "don't bother resubmitting unless someone else asks for
> meaningful changes" ;)

...I'm not too worried about it either, so I won't complain if Qinglin
respins with your suggestion.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
