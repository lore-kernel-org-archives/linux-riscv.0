Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41995C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Dec 2021 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzslxN+b9OOT4VErqUnwDCAIxKWNmGcRz/1hdNg+Hx0=; b=Qc2YvAf/l7UDFW
	4Rrnkmq4zBex9S+GTu2WC4AS0vp/eGHJEpLXkJ5XfVD052406PQJZybJ8Um6B5l2RDSTlC42/dprh
	IgwOlw6pArMUCTjePvi/jGkhK2+3W/KDr1P5FTo4TIiSZqcVF8qcZGv1NHG+TWgUik+g0qQsFVnHW
	Xj9n1hrR51bGOcQUFOjD3CFVlE82fyk60lj8ooliGMybg/VbPjRIvPT1pgQqAhS7cIxBjFI/F7ZLU
	e5XypJnedBdFXlDpm6iJje+N80R06HK8mQXSfod/AfkLb0oenO/LlBiM8hYOpjsfdimLzGRskWKDU
	/VzXrloGusvZJ7l0k48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Ojt-00FLJJ-So; Sun, 26 Dec 2021 08:18:45 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Ojp-00FLIy-Bo
 for linux-riscv@lists.infradead.org; Sun, 26 Dec 2021 08:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=0UhNzxT9Vlw81dA+elTicyI9XerVlvhOGP
 OKLmgF/eE=; b=LCP8e3WUPymwrHGJA1ZMN6wq9HMwMm8ED9Hxe8SIHnECNqn0aI
 PHThwZejbk1qQjfgo8mBnaEvyhEPObyi6SuGfArde8d0vyLYFFMYfeZOfB4wpwwu
 610hWAdrzQu+jxenfi7E/XyD36dqIvWnptyOMPm+PTdu8QC27q22m8D70=
Received: from xhacker (unknown [101.86.42.35])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXSGVGJchhY3_CAA--.2281S2; 
 Sun, 26 Dec 2021 16:18:17 +0800 (CST)
Date: Sun, 26 Dec 2021 16:10:56 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: fix wrong phys_ram_base value for RV64
Message-ID: <20211226161056.5ef4a5d9@xhacker>
In-Reply-To: <baa3e6dc-cfbc-c491-384a-639867734a7f@ghiti.fr>
References: <20211202153641.1961-1-jszhang@kernel.org>
 <baa3e6dc-cfbc-c491-384a-639867734a7f@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXSGVGJchhY3_CAA--.2281S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zryruw45GF1kZrWftr1DZFb_yoW8XF1xpr
 WxGanakFW8Xry8ua9Fvw4rWF4DJ3Z2ga4Sgr4UCry5uFyYqr47ta1vqw12gryqyFWxua1S
 vrn8Cryru3WqyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_001842_128908_C2CECAC7 
X-CRM114-Status: GOOD (  18.10  )
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

On Thu, 2 Dec 2021 16:52:08 +0100
Alexandre ghiti <alex@ghiti.fr> wrote:

> On 12/2/21 16:36, Jisheng Zhang wrote:
> > Currently, if 64BIT and !XIP_KERNEL, the phys_ram_base is always 0,
> > no matter the real start of dram reported by memblock is. The original
> > patch[1] is correct, I believe it's not corrected merged due to lots
> > of #ifdef in arch/riscv/mm/init.c, I plan to send a clean up series
> > soon.
> >
> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007650.html
> >
> > Fixes: 6d7f91d914bc ("riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address conversion")
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/mm/init.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 24b2b8044602..3c0649dba4ff 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -187,10 +187,10 @@ static void __init setup_bootmem(void)
> >   
> >   
> >   	phys_ram_end = memblock_end_of_DRAM();
> > -#ifndef CONFIG_64BIT
> >   #ifndef CONFIG_XIP_KERNEL
> >   	phys_ram_base = memblock_start_of_DRAM();
> >   #endif
> > +#ifndef CONFIG_64BIT
> >   	/*
> >   	 * memblock allocator is not aware of the fact that last 4K bytes of
> >   	 * the addressable memory can not be mapped because of IS_ERR_VALUE  
> 
> 
> Good catch, you can add:
> 
> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
> 

Hi Palmer,

I noticed this patch is missing in recent riscv fixes pull.

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
