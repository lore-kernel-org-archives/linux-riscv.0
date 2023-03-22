Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18589C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQgXFiH7gTD3/6hK7JmaLsc8rizfZcPm8/O0b/vp1Ss=; b=dD3H1n69WjiVjr
	rPjXRcwW0s31c1fxCDGB4GrQ4S3EJA6l8yHVPrhEbWW8uwsW6N//hTEJHq7dHxQkzvjXTotURIyA+
	Mv76I3AmWzRjl/2mVSEThBR18lKioKXjbmkxCWZu0eMIamHHhDwtBi1uQuFm+4oY8YVBwYG+0rwQc
	9Xz40NngGoO07TAft+aCcTmC0y6SBNzE895nEzwNaFXrNJVqhqALUBncURawTqdC2sDRhC0YJV0FA
	/Tz/sZOLVTAor160hz4b3GaNN6cA/sGK8kPss3wpkyuUTsWsy/KvhCGkpzh3EgA5NeeFTfOjgrOJh
	gkR5/h0K0XvEvTLQh0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf46E-00HBJT-1V;
	Wed, 22 Mar 2023 19:26:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf46B-00HBHs-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 19:26:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id eh3so77324862edb.11
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679513172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TC6eNLv6iVcM+dLqVd9h+kHjsMmIK0cHmLbQH5XvCQ4=;
        b=YWt+tkLlfdne2Kd0Awx/G4k2qdpzdqxUYDyTBl1Ztnt2ciLuzV00hGhXgAwtJraOta
         foR02SN4g6mrdL4klrVO+c7tFOawmQREXUGb39aqVJgplHebbVKbDKt4rfoJICjBvCMu
         wBK2gDh8hkB0IAhJCytrzvJckPBgh5K8Bt8+sUhwVZuFARuNc2HPfnpZAWb/gZhAHBHq
         kdsvBwn5zagJhUTI8/WriLqEs0UsqOBQ2L8AwQN8ZEYSgKvcT+c7MRTTgCRjZ+bdh0qB
         sZ+7dpMJR+G+PGeubi3mV2QNhg22WsB2UIRYmJqmyL2COl0dZwD8v2RsGie0Xjj8WSpI
         WVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC6eNLv6iVcM+dLqVd9h+kHjsMmIK0cHmLbQH5XvCQ4=;
        b=osiEnUvRN4BLi+j3B7VtmbhRjmDaud6I+GDWNQBR9fWzoBvUt5qxkKv+qNmCljvBoY
         udes5UVCEC6eItqYlWtRnvkU43dWVcG/2eOJvSg82gjHVwmJq7ZJ9Ora3jQ1JcXfp1QE
         AFWVpNRM6kZoO01gVTpyXkX/eLTIdXEGu6kuIHFkcLAjrLBJWXaOBE7fPuA4/rVubE+L
         RZ8gRmLNfG+KtqIJCCNv9607GhYz3PGgKlF9zb5mYQik7pkYKqb4fJi1Ypkte4+KYNTf
         b6Nmdnt0YwUqB144VZRUljxKstF0hyrN0RmnPpCqvXScSwfQ5CpJP5fLwpa7q856iBCi
         72Iw==
X-Gm-Message-State: AO0yUKXlCz2I79onTQnMjdJ3fyRl9IstUDVCwcNoZU5qjOk9Qun14yt5
	W3r9Bd4j08Fsn/9f7wQ5Qr4NEQ==
X-Google-Smtp-Source: AK7set/uwReF6l3N0b+QrVmoQo5JsU4Z8X/6Kjo6ne/T8bhKCGGJPKxX52G9T9KTbzd4uWztJ0Q8Ww==
X-Received: by 2002:a17:906:c257:b0:932:6452:2396 with SMTP id bl23-20020a170906c25700b0093264522396mr7250972ejb.74.1679513171843;
        Wed, 22 Mar 2023 12:26:11 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709063fd300b00928de86245fsm7587557ejj.135.2023.03.22.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:26:11 -0700 (PDT)
Date: Wed, 22 Mar 2023 20:26:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <20230322192610.sad42xau33ye5ayn@orel>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1884bd96-2783-4556-bc57-8b733758baff@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_122615_856203_9BFE044C 
X-CRM114-Status: GOOD (  25.96  )
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

On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> > On Wed, Mar 22, 2023 at 01:09:07PM +0100, Jason A. Donenfeld wrote:
> > > When moving switch_to's has_fpu() over to using riscv_has_extension_
> > > likely() rather than static branchs, the FPU code gained a dependency on
> > > the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
> > > when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
> > > work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
> > > selected.
> > > 
> > > Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
> > > Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
> > > Cc: Jisheng Zhang <jszhang@kernel.org>
> > > Cc: Andrew Jones <ajones@ventanamicro.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for fixing it!
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  arch/riscv/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index c5e42cc37604..0f59350c699d 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
> > >  config FPU
> > >  	bool "FPU support"
> > >  	default y
> > > +	select RISCV_ALTERNATIVE
> > >  	help
> > >  	  Say N here if you want to disable all floating-point related procedure
> > >  	  in the kernel.
> > > -- 
> > > 2.40.0
> > >
> > 
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > I took a look to see if we missed anything else and see that we should
> > do the same patch for KVM. I'll send one.
> > 
> > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
> >  can defer that wedding a bit longer.)
> 
> At that point, the config option should just go away entirely, no?

Ah, yes, and that makes the idea even more attractive, as we could remove
several ifdefs.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
