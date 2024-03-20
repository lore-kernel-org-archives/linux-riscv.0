Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A964C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 03:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLQsOBf076JuzojzGfA7FDwjJuRzkYn/P3SHj+V957A=; b=uhrrG2B0BKB6lk
	nlh8fmXtb1tVcgrbZp+aE8BZZrELgyu6D6t0l+l/wTeaH/HDE7bue6mzPjTDoOGPPdG4kJEGJMBUb
	Qes/Aol/EuOpZyitssOcw65P/8a5Fb5bTxqIx3NCNhuvgk7NNHKndbPgzr9Dwt9s8+DLiyopux1I2
	xgizBVg+XUICdoFwoko1FP5Id6Fc4rTCeHrerwO5JjtamzYfkiCXONdx1h3hKjaxT2szkR2wOi7Y8
	/Wmtd9tiM6hc4TNZPJrVm1mWnwj55R31HTBfD26nGus+92c4vQUwJ1m2DxKTmQOycK13wtnX6athf
	dljKNy1S6eVBB7qZfX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmmyJ-0000000FHrt-2vNd;
	Wed, 20 Mar 2024 03:50:35 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmmyF-0000000FHqH-0ijn
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 03:50:34 +0000
X-QQ-mid: bizesmtp65t1710906586tp2f6pfr
X-QQ-Originating-IP: ox81Nrupdyl0zdBekLqxnqdZYKJsG+1Wmht5/U+355Y=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Mar 2024 11:49:45 +0800 (CST)
X-QQ-SSF: 01400000000000704000000A0000000
X-QQ-FEAT: 5q30pvLz2icV16dWzMxpWQz4znvu9bgI4WfLqgyFYlBMRPt7iNpzyVaIbczF9
	WEZ0DOJGNY/yB6zSpkD1wyoKcUhQ0Pgcl03s2EUIGazZ5Ou0r7cxHxgN7uunmKu4KEn2XvV
	0Flj3o72P6eEL7vRjvM6+ADVrG1AQPPU/YLqtIIc9IhuI1Si9zrZFjRbEzTzbNGBeFStUK5
	t37xAgb7zTyZ5im0JCDI4dDgtR2C5hZFZyeZMPVgeRoQ+x/tJuen+0nENoBY6+kOqpYGexw
	HTsQgn2K4Q0EjYGtMcCz6vTAnxFHYuITAGlOf0VpISBoPtX9mk7iTSjo1gy5Coj5NiTYPAD
	KkvkU4lAPEGHAfKkEiohcyqlO1ftieofiW3j+02jbEgANQ4e1BAIrusRRUkzg==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11659824290670290864
Date: Wed, 20 Mar 2024 11:49:44 +0800
From: Dawei Li <dawei.li@shingroup.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com
Subject: Re: [PATCH] riscv: Remove redundant CONFIG_64BIT from
 pgtable_l{4,5}_enabled
Message-ID: <1F5AC099870F5765+Zfpc2MoIn7EU38rs@centos8>
References: <20240312085005.298657-1-dawei.li@shingroup.cn>
 <112ac071-71cc-466e-ab13-f624edb77bb9@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <112ac071-71cc-466e-ab13-f624edb77bb9@ghiti.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_205031_880026_7EF889DE 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Alex,

Thanks for review.

On Tue, Mar 19, 2024 at 01:36:13PM +0100, Alexandre Ghiti wrote:
> Hi Dawei,
> 
> On 12/03/2024 09:50, Dawei Li wrote:
> > IS_ENABLED(CONFIG_64BIT) in assignment of pgtable_l{4,5}_enabled is
> > redundant, remove it.
> > 
> > While at it, annotate pgtable_l{4,5}_enabled with __ro_after_init.
> 
> 
> I guess this comment ^ implies that you need to split this patch into 2 :)

Indeed. I Will respin v2 as you suggested.

> 
> Feel free to add on both:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks,
> 
> Alex

Thanks,

	Dawei
> 
> 
> > 
> > Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> > ---
> >   arch/riscv/mm/init.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index fa34cf55037b..204cdf5b829d 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -50,8 +50,8 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
> >   EXPORT_SYMBOL(satp_mode);
> >   #ifdef CONFIG_64BIT
> > -bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > -bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> > +bool pgtable_l4_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
> > +bool pgtable_l5_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
> >   EXPORT_SYMBOL(pgtable_l4_enabled);
> >   EXPORT_SYMBOL(pgtable_l5_enabled);
> >   #endif
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
