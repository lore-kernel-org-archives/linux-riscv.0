Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8063BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Oe6YYfDPGOnB7P1IRJLeYqk7md+Ur7LTG77I83mecM=; b=Zsfd9y4ucMyGpU
	1TZzcLjmISF7YRLVQiye+NkkNuQJSoPI1XIFMvEDZcGHfyezJgONAhcRdRp4LuPZyhCxNBMC/cO77
	bhA9iDGOM7Z0r3WQMAE5Jstfw6vWbl1tGtzKGv6IgDM8nAKNl4lCjtKK/oE2qOweUPH498IqzEJMV
	ndrrXT9bP4jHcqWmKFOrcDIXuVh2dXBaB4z6N350a4xdOVtiYhHEOqathmMfZTTOxzIWc8HgHmyYO
	rOz8f0jUWQKuZHGiKEn4R4ARgvQyfR8VmaI7qebwXA/8colfodOrQNEf37kyv/YAur1r5flSGz08T
	MXhieKWw81qjxL2/4jDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dp1-009pVX-QN; Mon, 12 Dec 2022 08:05:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dox-009pQ5-Hz
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 08:05:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id t17so25889536eju.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZVWRfYrTsy5XKpBePpRmSyyDogrKcK/aUFm2YQ4FP0=;
        b=oN5ZMtH+J57+Uxm9tFQxa5/WJMVN+LrX3CrkGU64yTedH+XtFR62w2DEOQmUy9EKoJ
         R1+gWGfRIcDqdQ5aqdrTq5sYHu9iBHz3HU811HEazWzABhRIyuHYuDrv+x/0OYDOymzf
         fSYt0YFP9W9ZdwITh35Q7gjaBbx0JtUiNbt+HzHgI95/GZMomSUyFaY8TDLg/cq3gSCv
         o4uRCwLaUfetTmYWm+8YZWu7J789ZPl4J1dFbcEx8qtWz/wNC1WhT91nu5vhkBKZogZo
         9LulNkNyq88+VhASPSYHffu9hj38Pyx7w+qzsWaVvTOIg40wBktc9XZnhBVKiQd9A/as
         xndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZVWRfYrTsy5XKpBePpRmSyyDogrKcK/aUFm2YQ4FP0=;
        b=rlJVWU/sUE29GwGFpoERmPy3kiObPcb6xCnw6F3YbgbrlsIHe7pVBzO2ieufwKK2e9
         4w9EjEaDMUjCuj3Y2gUAUxPi5bJmyljv2RN+PZ/ZHaSFJiV9tzXEWYbufrLWJd5Nt34V
         tfBvAJaeOz4a/nQ5OfOD/aTwLUNpwDFGzFDdk67cPsNXbgT0CnVsPag5MWcW9sB6AcYK
         cu6Rvo/y+LyPh/LcAYiZEj5SjCjgH/S7/Shftp38EUP0gLWAQR1ark7k4dw1tAKssLOr
         uM7ZxTXQsbcOmvYWBDPuaIkm3SuKLuMrlPTg6yLRgZbfr0j7CNSYmXANV5UpNAVYMdMF
         EPjQ==
X-Gm-Message-State: ANoB5pmT9qsNMDu6tEensSU0/aHCyrboTGu7cMplpguM0FPHz5DWgf/O
	wvrsXVnRssE0+SPPzQXg8J6OSQ==
X-Google-Smtp-Source: AA0mqf6Xg+b7oAfXxqJ/f6iLWDJNzeMUDao8t2E8dxHWXdMaXkBJg1bGwnfsBmu2xTn4nKfLUXnGqQ==
X-Received: by 2002:a17:906:fcd9:b0:7c0:9bc2:a7f1 with SMTP id qx25-20020a170906fcd900b007c09bc2a7f1mr13392239ejb.34.1670832352772;
        Mon, 12 Dec 2022 00:05:52 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id kz14-20020a17090777ce00b007af105a87cbsm2957626ejc.152.2022.12.12.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 00:05:52 -0800 (PST)
Date: Mon, 12 Dec 2022 09:05:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org
Subject: Re: [PATCH v10 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221212080551.3aw4mqbgyfnuiv35@kamzik>
References: <20221212065526.805233-1-panqinglin2020@iscas.ac.cn>
 <20221212065526.805233-2-panqinglin2020@iscas.ac.cn>
 <20221212071802.o7cobfdvsp26xoq7@kamzik>
 <64354d3c-04c8-ac2f-968c-bf8af2ca1f8b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64354d3c-04c8-ac2f-968c-bf8af2ca1f8b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_000555_700856_73644E50 
X-CRM114-Status: GOOD (  30.56  )
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

On Mon, Dec 12, 2022 at 03:34:46PM +0800, Qinglin Pan wrote:
> Hi Andrew,
> 
> On 2022/12/12 15:18, Andrew Jones wrote:
> > On Mon, Dec 12, 2022 at 02:55:24PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > 
> > > Add one alternative to enable/disable svnapot support, enable this static
> > > key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> > > option is set. It will influence the behavior of has_svnapot. All code
> > > dependent on svnapot should make sure that has_svnapot return true firstly.
> > > 
> > > Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> > > to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> > > 64KB napot size is supported in spec, so some macros has only 64KB version.
> > > 
> > > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 67ef08d33d3a..4b5bb719bc6f 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -397,6 +397,24 @@ config RISCV_ISA_C
> > >   	  If you don't know what to do here, say Y.
> > > +config RISCV_ISA_SVNAPOT
> > > +	bool "SVNAPOT extension support"
> > > +	depends on 64BIT && MMU
> > > +	select RISCV_ALTERNATIVE
> > 
> > Hmm, shouldn't we also be selecting HUGETLBFS?
> 
> RISCV_ISA_SVNAPOT is not dependent on HUGETLBFS, so
> it may not be necessary to select HUGETLBFS here? :)

Ah, indeed. I got too wrapped up in the HUGE_MAX_HSTATE analysis and
forgot we actually don't need it. So, either the Kconfig text should
point out that memory is only consumed when HUGETLBFS is selected, as
I've edited in below, or we should add the warning to HUGETLBFS, or
maybe just drop the warning altogether.

> 
> > 
> > > +	default y
> > > +	help
> > > +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
> >                                  ^ the                              ^ s/in/at/
> > 
> > > +	  and enable its usage.
> > > +
> > > +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> > > +	  of contiguous virtual-to-physical translations, with a naturally
> > > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > > +	  size. Without CPU's hardware extension, turnning on this feature
> > > +	  may cause some little momory leak now.
> > > +
> > > +	  If you are sure your CPU has not SVNAPOT extension, say N.
> > > +	  If you don't know what to do here, say Y.
> > > +
> > 
> > 	The SVNAPOT extension is used to mark contiguous PTEs as a range
> > 	of contiguous virtual-to-physical translations for a naturally
> > 	aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > 	size. This option unconditionally allocates some memory for each
> > 	NAPOT page size supported by the kernel. When optimizing for low
> > 	memory consumption and for platforms without the SVNAPOT extension,
> > 	it may be better to say N here.
> > 
> > 	If you don't know what to do here, say Y.

 	The SVNAPOT extension is used to mark contiguous PTEs as a range
 	of contiguous virtual-to-physical translations for a naturally
 	aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
 	size. When HUGETLBFS is also selected this option unconditionally
	allocates some memory for each NAPOT page size supported by the kernel.
	When optimizing for low memory consumption and for platforms without
	the SVNAPOT extension, it may be better to say N here.

	If you don't know what to do here, say Y.

Thanks,
drew

> 
> Your expression is more accurate. I will resend the v10 patchset with
> thisparagraph in it. Thanks!
> 
> Regards,
> Qinglin.
> 
> > 
> > 
> > Thanks,
> > drew
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
