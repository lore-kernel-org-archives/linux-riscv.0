Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD8C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTSq3khxuib/rNb5YhjBV1wsMa49henQZFp+71OEyGI=; b=QCHzO1TcWsPdu6
	z2YaI87ghHOqgqHLS2mQ0exbWfeurJNPmSZttsBXfw5AZz98ISb9fMSRmfi3pqYoSrANVWFxl9MjU
	d1mL8G+SJNU9mzXSL0i9EWqEGl/IpE9EiM+OO/e9+pRrU39tNgfsV6lC/mj2A707n8QC0CPqkpIzV
	dlCNaaVwwJdVl5MtBsR9fXDgWwKNz4Ba3D0pdStednH0OMd0zRAVrvkJVH5vAVg4MLwiL68mX4PdE
	LQIgIwb9FMLqkMoR5Zw2M5ixYl+hn2NAsruI6aFbygorev8/d9JmYmw/Lm7Wk0xECIk02s4vICvyR
	9dZT8kvvwEheH8oJ2R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGXG-00000007Nax-0o29;
	Wed, 25 Jun 2025 03:10:54 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGXB-00000007NaV-2WvD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 03:10:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bRn0S3Zv3z2QTyp;
	Wed, 25 Jun 2025 11:11:36 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 631A7140144;
	Wed, 25 Jun 2025 11:10:41 +0800 (CST)
Received: from kwepemq500002.china.huawei.com (7.202.195.240) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Jun 2025 11:10:41 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq500002.china.huawei.com (7.202.195.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Jun 2025 11:10:40 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Wed, 25 Jun 2025 11:10:40 +0800
From: duchangbin <changbin.du@huawei.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: duchangbin <changbin.du@huawei.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
Thread-Topic: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
Thread-Index: AQHb5PtyjCfzcR/e2EWBZK4/MCSYmLQRvi4AgAF1PoA=
Date: Wed, 25 Jun 2025 03:10:40 +0000
Message-ID: <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com>
References: <20250624113042.2123140-1-changbin.du@huawei.com>
 <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
In-Reply-To: <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.110.54.75]
Content-ID: <6B6D87550F0AC946A7F2343632909A59@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_201049_969553_D09DAA01 
X-CRM114-Status: GOOD (  25.27  )
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

On Tue, Jun 24, 2025 at 02:54:32PM +0200, Alexandre Ghiti wrote:
> Hi Changbin,
> 
> On 6/24/25 13:30, Changbin Du wrote:
> > Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel
> 
> 
> Your above config works fine for me, I guess you meant FUNCTION_TRACER &&
> !DYNAMIC_FTRACE (which fails).
>
Yes, it's FUNCTION_TRACER.

> We were just talking with Andy about this configuration (FUNCTION_TRACER &&
> !DYNAMIC_FTRACE): do we really want to support static ftrace? Andy should
> send a patch soon to remove this possibility as IMO we don't want to support
> it. Let's wait for this patch and the discussion that will follow before
> merging your fix. I'll keep it in my list for 6.16 just in case someone
> comes up with a good argument to keep it.
> 
No problem. I'm unable to enable DYNAMIC_FTRACE because GCC_SUPPORTS_DYNAMIC_FTRACE=n
and CC_HAS_MIN_FUNCTION_ALIGNMENT=n are set. It seems that my GCC version (13.3.0)
does not support the option -fmin-function-alignment=8.

By the way, this change also eliminates an empty function call.

> Thanks,
> 
> Alex
> 
> 
> > panics upon returning from _mcount() in the early boot path. This occurs
> > during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives().
> > 
> > The CC_FLAGS_FTRACE is only removed from alternative.c when
> > CONFIG_RISCV_ALTERNATIVE_EARLY=y. Therefore, no function calls should be
> > made to alternative.c during early boot in this configuration.
> > 
> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > ---
> >   arch/riscv/include/asm/alternative.h | 6 ++++++
> >   arch/riscv/kernel/alternative.c      | 4 ++--
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 3c2b59b25017..c670b0cc55f4 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -31,7 +31,13 @@
> >   #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
> >   void __init apply_boot_alternatives(void);
> > +
> > +# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   void __init apply_early_boot_alternatives(void);
> > +# else
> > +static inline void apply_early_boot_alternatives(void) { }
> > +# endif
> > +
> >   void apply_module_alternatives(void *start, size_t length);
> >   void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index 7eb3cb1215c6..5406c3301627 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
> >   	apply_vdso_alternatives();
> >   }
> > +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   /*
> >    * apply_early_boot_alternatives() is called from setup_vm() with MMU-off.
> >    *
> > @@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
> >    */
> >   void __init apply_early_boot_alternatives(void)
> >   {
> > -#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   	_apply_alternatives((struct alt_entry *)__alt_start,
> >   			    (struct alt_entry *)__alt_end,
> >   			    RISCV_ALTERNATIVES_EARLY_BOOT);
> > -#endif
> >   }
> > +#endif
> >   #ifdef CONFIG_MODULES
> >   void apply_module_alternatives(void *start, size_t length)

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
