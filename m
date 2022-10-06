Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBE0C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ND2/46Vh1btczOXJGxbQQajRt36OY/+Zh5dilrVrt4=; b=gxSacYB3CrUYfJ
	G+hh7kACtOGEQ2UDmjRDccCxRK7zDhR0APGZjEubHNIfjCOMY1jk2SzofFUfLk9EDJ0OypSXt7DtJ
	0dhXQ4H3OP5I/NwBHJdiVA2avx38M5Jo6OvPINAL7jewWlepmh8mfWSP/c6ZyTWXwXYb/Ub9Xs0dj
	og3vGVyHSXZv3QtPoyLhTx3nv33H1es94sExpuQGgirQlYcqi2unqWqAmxf3Efp/RmGLvhBorgGms
	POhOi5hPd3td+GcYoe912zdDR7c/yBB5+ZYt/YEybgjTE92J9Y2R4hspHrG0bB132dlCQppoyBlwW
	3ZP0JxHoleAeeN76k8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUwR-004G46-GJ; Thu, 06 Oct 2022 17:45:51 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUwO-004G0h-Or
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 17:45:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a2so6148927ejx.10
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezmq/iaY9rDfnbpCghNhiuX5IKh0tJNMj1kyoFb3wBM=;
        b=g1lsjZQG++PqVBbu8Wen596e/vDbUstqf6bUX84DA+/yiJK/fAzAgNFQemsqSZgsLO
         BC0CDS/K7Bu+6pHs5w4R9XfXovqAmr2ImRJ6Apsv0H+pP4LHM6z84LzpR5HUJ0VAUWid
         mv0gGo7p8GGbKUIzymnuTYZ3KUqCywo/eOoXiuUhNXBlaKC44lN1IQxkQkGwvU7Oy+tT
         DjTFhHlWOqUDG96pMrnfWUh96vIUfAAh1cfSMm3QKIx3OFu1q8jRMvBydrkfg5zILhnf
         H0eXEFeVI++4+yQhSkoQKeNbM8arFOrtJFlYOQjlZmTGFEeqWPN0U76u6wpBt5OSI7Ol
         wyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ezmq/iaY9rDfnbpCghNhiuX5IKh0tJNMj1kyoFb3wBM=;
        b=A+2ocvj1C3biIBvQ+FspgB49tEskZoA3jLcq4YB1fknmuJnrbNLiUJC7UCk3JN+pJ7
         VhswF0l5qXRfkxxjqX4UTv9eohdZbO5JUdX3Xii3DzUmTcXj0LKREmwsDFGII9AZRXRZ
         +fKuSBG4BTQijZdfW2QIDnc8FjYFH1xg7oNdbx9M1deC1rIhkBSFboN70UMfnIJwHbFB
         3l5Fu/7UbQe5wYT5AVMtTYpldBSJmv/Wzw2Xd40Hk9XO59dzR9TSEBdpEjokOD9LJWIP
         wYeqqyXeQKvGP5fs20gGyenb8u+Xxlbh0VEv6EGrjYWKmUQsbyB7EMFb/F8LEBLEO4M3
         arZw==
X-Gm-Message-State: ACrzQf3mYtSt6EsdrMjVfhojG1kwtcuk+nfIUKf2bQUKNjXEIh6dCSFg
	ORv/sdLo1qe1y/v5tcZcPnWQag==
X-Google-Smtp-Source: AMsMyM5jhIiUUmEwIkVxQc1jomKmXt2Fyt8sivIhvinl/NnHvHfZi8dxE6r9gJMEXnQchGEreugbOA==
X-Received: by 2002:a17:907:6e90:b0:782:a5ef:89a8 with SMTP id sh16-20020a1709076e9000b00782a5ef89a8mr799737ejc.639.1665078344359;
        Thu, 06 Oct 2022 10:45:44 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709063b5300b0078d4c72e2cesm21813ejf.44.2022.10.06.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 10:44:24 -0700 (PDT)
Date: Thu, 6 Oct 2022 19:44:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of
 ZICBOM probe
Message-ID: <20221006174419.ey66tfvpynjixmah@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-2-jszhang@kernel.org>
 <20221006131033.jfb62me2zxz67gfs@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006131033.jfb62me2zxz67gfs@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_104548_835195_63A23E03 
X-CRM114-Status: GOOD (  19.89  )
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

On Thu, Oct 06, 2022 at 03:10:33PM +0200, Andrew Jones wrote:
> On Thu, Oct 06, 2022 at 03:08:11PM +0800, Jisheng Zhang wrote:
> > It's a bit wired to call riscv_noncoherent_supported() once when
> 
> s/wired/weird/
> 
> s/once/each time/
> 
> > insmod a module. Move the calling out of feature patch func.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 7 +------
> >  arch/riscv/kernel/setup.c      | 4 ++++
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3b5583db9d80..03611b3ef45e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -272,12 +272,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> >  	case RISCV_ALTERNATIVES_EARLY_BOOT:
> >  		return false;
> >  	default:
> > -		if (riscv_isa_extension_available(NULL, ZICBOM)) {
> > -			riscv_noncoherent_supported();
> > -			return true;
> > -		} else {
> > -			return false;
> > -		}
> > +		return riscv_isa_extension_available(NULL, ZICBOM);
> >  	}
> >  #endif
> >  
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 2dfc463b86bb..1a055c3f5d9d 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -299,6 +299,10 @@ void __init setup_arch(char **cmdline_p)
> >  	riscv_init_cbom_blocksize();
> 
> I think we can move this riscv_init_cbom_blocksize() down to be above the
> new #ifdef in order to keep like calls grouped. It doesn't matter though.

Please ignore this comment. I see commit 8f7e001e0325 ("RISC-V: Clean up
the Zicbom block size probing") specifically moved riscv_fill_hwcap()
below riscv_init_cbom_blocksize().

Thanks,
drew

> 
> >  	riscv_fill_hwcap();
> >  	apply_boot_alternatives();
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +	if (riscv_isa_extension_available(NULL, ZICBOM))
> > +		riscv_noncoherent_supported();
> > +#endif
> >  }
> >  
> >  static int __init topology_init(void)
> > -- 
> > 2.37.2
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
