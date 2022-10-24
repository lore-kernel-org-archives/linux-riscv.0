Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8C4C3A59D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 08:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLPVfHLTOkB2uBxBkYZN6gO2utBOUg2mmGnU3/FEAy8=; b=CDFa3hOL722tFE
	Rn0Ta4HpRedUH12yMvsSnkzjg5qYtqBSIhlEjNBaXEfVcAKhZFARgX5emAGGtwpV/DbtGLHzSvs86
	rnO/awRiAY17qHs/cV1O69nxX7Hie6l4hIO68q9dZ91WeXM4O1n7ykf0/l9ZADryog+4B0BbEA3Zn
	18qkaxVZMzRIUzfH7VMwd4WfJUw0hMShPZhjiRssMCiF1vq1kEOrmid0WRl9NmhDYCB9c7ZhjPzQJ
	q+zfCnQf94kCCNpfzMw6P4rTU2chXivoblXsdhJqAEamYmabW4i0oGmWzqVON8KzKdP7YpiizJ7LN
	6/RoxNyVc4ukt6Rf7f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsfN-0003Ei-Lb; Mon, 24 Oct 2022 08:18:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsfJ-0003Cs-Ik
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 08:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666599513; x=1698135513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wg7PlmDnuxgWykJC13LMNKAdwVUFS0jMbEgsXKczxuM=;
  b=TcTpevmNSBrvr1jv2vHPw4AnR/zHeYB8fVACkWYZui1eIL/KYDucgopH
   khZIsa9Vs0AnLhf4torovN371avXnEvx7fdQIWKH/YSj12Xvp/gRrufog
   +r02YZyvWvt5Ce3/wen09pQ15YpcyZTNHwpEij6zKmlDbkue2FQqH2R7M
   f3gb9p5TodCXtaC8xyt+ck2nu5oZY0H0mzLHAamipox49K4iSjhGulGpw
   rUNzv06/Kr0FVgAuhyt+8zInn004FHBZ8d9th1mbr2f8rFK95IF6RvRxB
   toEnRON1KrUfQyhZpOfzlAzvw/Z6YO3d6eZLqe3hvdGF48zYzaV7ArZM3
   g==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="120037753"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 01:18:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 01:18:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 24 Oct 2022 01:18:06 -0700
Date: Mon, 24 Oct 2022 09:17:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Anup
 Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <Y1ZKLjC/ZnnjSNy2@wendy>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-4-ajones@ventanamicro.com>
 <Y1WYT97IQy3Q6BhF@spud>
 <20221024070935.ff62bcjl6z7i4flh@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024070935.ff62bcjl6z7i4flh@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_011833_742956_718C8F83 
X-CRM114-Status: GOOD (  42.56  )
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

On Mon, Oct 24, 2022 at 09:09:35AM +0200, Andrew Jones wrote:
> On Sun, Oct 23, 2022 at 08:38:55PM +0100, Conor Dooley wrote:
> > On Fri, Oct 21, 2022 at 12:59:05PM +0200, Andrew Jones wrote:
> > > When a DT puts zicbom in the isa string, but does not provide a block
> > > size, ALT_CMO_OP() will attempt to do cache operations on address
> > > zero since the start address will be ANDed with zero. We can't simply
> > > BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> > > size because the failure will happen before logging works, leaving
> > > users to scratch their heads as to why the boot hung. Instead, ensure
> > > Zicbom is disabled and output an error which will hopefully alert
> > > people that the DT needs to be fixed. While at it, add a check that
> > > the block size is a power-of-2 too.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 220be7222129..a4430a77df53 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/bitmap.h>
> > >  #include <linux/ctype.h>
> > >  #include <linux/libfdt.h>
> > > +#include <linux/log2.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <asm/alternative.h>
> > > @@ -70,6 +71,20 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> > >  
> > >  static bool riscv_isa_extension_check(int id)
> > >  {
> > > +	switch (id) {
> > > +	case RISCV_ISA_EXT_ZICBOM:
> > > +		if (!riscv_cbom_block_size) {
> > > +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> > 
> > Maybe I've missed something... Why not check if !IS_ENABLED() & return
> > false immediately rather than doing it inside the attribute checks?
> > I'll be compiled out of zicbom is enabled, so not like the non-error
> > patch will be penalised with an extra check.
> 
> Ths IS_ENABLED checks are only here to decide if we want to complain or
> not, not to decide if we want to add the extension to the isa bitmap or
> not. As we've decided for the KVM compilation fix for Zicbom patch we
> don't mind the kernel knowing the extension 'foo' is present, even when
> it's compiled without CONFIG_RISCV_ISA_FOO. Indeed, for Zicbom, KVM can

Of course, how did I forget last weeks breakage already...

> still offer the extension to guests, whether the host wants to use it or
> not. So, for this code, we can't factor out the IS_ENABLED checks since
> they're tied to the pr_err()s they're guarding, which are tied to the
> sanity checks they're inside.

So yeah, this all makes sense.

> 
> Thinking about it some more, though, maybe we should unconditionally
> complain, but with a different message, one that doesn't imply the kernel
> wanted to use the extension. Something like
> 
>   if (!riscv_cbom_block_size) {
>       pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
>       return false;
>   } else if (!is_power_of_2(riscv_cbom_block_size)) {
>       pr_err("riscv_cbom_block_size present, but it is not a power-of-2\n");
>       return false;
>   }
> 
> I'm still not sure if those should be errors or warnings when
> CONFIG_RISCV_ISA_ZICBOM=no, though.

My initial thought here was along the lines of "why care about the
issues when it's not enabled", but I went to get some caffeine before
replying and had a change of heart.
IMO, it'd be good to tell people that their DT doesn't describe their
hardware properly when it's gone wrong in a way that we cannot really
spot via dtbs_check etc. I'll go away and have a think about whether
the DT checks can force cbom-block-size if zicbom is in the isa string,
but I'm not sure if that sort of conditional is checkable.
If either of these error cases are hit (regardless of whether you set
CONFIG_RISCV_ISA_ZICBOM) then it'd cause issues for KVM right? That
would imply printing unconditionally to me. The level at which to
actually emit that is beyond the scope of what I care about though ;)

Thanks,
Conor.

> > > +				pr_err("cbom-block-size not found, cannot use Zicbom\n");
> > > +			return false;
> > > +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> > > +			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> > > +				pr_err("cbom-block-size is not a power-of-2, cannot use Zicbom\n");
> > > +			return false;
> > > +		}
> > > +		return true;
> > > +	}
> > > +
> > >  	return true;
> > >  }
> > >  
> > > -- 
> > > 2.37.3
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
