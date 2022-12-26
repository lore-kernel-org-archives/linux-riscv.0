Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0992C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pEnAcG8xnK9eyudbXIB5VXes1S5JoesuhOLnzRKqPs=; b=X9jXocU6qaZX7O
	oEJ/My96qaswrOAeYkX5Y/EyLkC+76eY4j1I+u+E8G/CMRiPmxgcsrDXsg7Jd82RQTfCE66XLatAC
	qp7ybOMo7lBWKjEAvPV49SHXgFY/F82JyDkbTnJ2vuEvEpYqYbubKmFIQ80YyhnkGfsK7H6fQpPT0
	85YuK32W+1bIVxacy/bxQgZEQCxfcdKYBHlaSZ2o6Q04jSVKtqRTk5oWkfnKvumWUJu3leaPwKYsd
	cKEm9Fq9WVavwBG8llaz9rYacrQh8nq62/x1m4Bz2oIMZNu/4nAk6zDHhoEYFmNvuE7k+rC8CP2WS
	sNtGTGEMj/e3vR9wnswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9puz-005NNt-Su; Mon, 26 Dec 2022 16:01:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9puw-005NLN-Sw
	for linux-riscv@lists.infradead.org; Mon, 26 Dec 2022 16:01:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id x22so26664803ejs.11
        for <linux-riscv@lists.infradead.org>; Mon, 26 Dec 2022 08:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aA+MIyWPWYpP0B15kfj/bgcjxH7BijZdqkScnoJwGVs=;
        b=D01qll6UI2LXZj78ILs3TwcbfGeHMpbx0j2M4QzegZmJ/GAAkMqL+9/3I76IKJ9SBy
         7vn3hH6UZc7gytnImf1gQ64pqnWoA0y7zd2m/H54K0R0CEx/KB0n06H6oJORjSrEK9oG
         iA74AvlaVUdZGVOeh0GUk0o6uMsFqfGKhL6rYts5HhEW/5OSKQQyIU13sYPzleCP1Djy
         EWNgyzVFu9N5tFv2bVluijzwF4tRATPBnmUr8SpupMhvlzAn3IE2TtDDuPuyVBSCZV7N
         NOOB8N/CAGhEkKFBEBv2IRADi50fP8TNorYIOoRnU1AozsuqetyLsz8k5El1HCnVBt3W
         O4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA+MIyWPWYpP0B15kfj/bgcjxH7BijZdqkScnoJwGVs=;
        b=hwd9ydbcKb2c0u3+enBaglKz2Jax5YBp9QVtIEHRpjfRmNFWApwcgHGmFxx3wg+eBd
         QNKXMV2lDWpEt2M3GPgYI3oV4Ej2Wo/exdp77CEI8/9E1gauAort4LG99ow1f+T/kXea
         e3r37k0P77/fRPabguzIayVUoJum4Ja3eC9Odwj6fPB5DZwQaDco3wc1/tbq67kEPTfD
         C9oJjLwiWsoUzhavLudIYBm6GeQUNGwsjZO8qZm9v0At/PVWoNTYri8Z/51sUhvU3k7+
         eEjyNQ0d+7jlLZzwwLOCl/gcx6r058Kz1lzQInMhxxn5Igloao0Z6JtLs6twPMrStqPg
         Innw==
X-Gm-Message-State: AFqh2kpBPV/b0LKVLL2KpaErpWGAATW+kox11cuN1dEt8l/Ousnhk6o3
	W9/8pxK5MXJJTaV+qJyECdQAqWK6SAPC9MJn
X-Google-Smtp-Source: AMrXdXtwZJp3BMuJp2wkmDQgo0c/79W9ZtpL+iYaMpSAfQsKZDKtSE0tlHgv7GRMvw/tWTM7hIYBXg==
X-Received: by 2002:a17:906:414c:b0:7c0:d606:c570 with SMTP id l12-20020a170906414c00b007c0d606c570mr19556468ejk.61.1672070491525;
        Mon, 26 Dec 2022 08:01:31 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w15-20020a170906d20f00b007bf988ce9f7sm4923522ejz.38.2022.12.26.08.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 08:01:31 -0800 (PST)
Date: Mon, 26 Dec 2022 17:01:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v11 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221226152213.crknhcpysonhq63c@orel>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
 <20221216062109.865573-2-panqinglin2020@iscas.ac.cn>
 <Y6Dc4XNQmKtTsXom@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6Dc4XNQmKtTsXom@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_080134_962360_C7EB2312 
X-CRM114-Status: GOOD (  25.50  )
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

On Mon, Dec 19, 2022 at 09:51:29PM +0000, Conor Dooley wrote:
> On Fri, Dec 16, 2022 at 02:21:07PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > 
> > Add one alternative to enable/disable svnapot support, enable this static
> > key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> > option is set. It will influence the behavior of has_svnapot. All code
> > dependent on svnapot should make sure that has_svnapot return true firstly.
> > 
> > Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> > to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> > 64KB napot size is supported in spec, so some macros has only 64KB version.
> > 
> > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e1a9fa47f012..25c230e3bf61 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -397,6 +397,25 @@ config RISCV_ISA_C
> >  
> >  	  If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_SVNAPOT
> > +	bool "SVNAPOT extension support"
> > +	depends on 64BIT && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
> > +	  time and enable its usage.
> > +
> > +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> > +	  of contiguous virtual-to-physical translations for a naturally
> > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > +	  size. When HUGETLBFS is also selected this option unconditionally
> > +	  allocates some memory for each NAPOT page size supported by the kernel.
> > +	  When optimizing for low memory consumption and for platforms without
> 
> nit: Does this make more sense as "When optimising for low memory
> consumption on platforms without the SVNAPOT extension"...?
> Or does disabling Svnapot save memory on Svnapot capable systems too?

Depends on how we define "save". Disabling RISCV_ISA_SVNAPOT on HUGETLBFS
enabled systems will reduce memory consumption whether the svnapot
extension is present or not. When the extension is present, the memory
consumed may serve a purpose, whereas, on systems without svnapot, the
memory consumed cannot serve a purpose.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
