Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF68ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nduAzvLLd939gwFl/6jdjL+3Z26dN+GdyZPksNBWb1k=; b=C2ivh3hh13CeTY
	tuCchQg2SqP+ll3Inz0KjWJM6acLaAHlFaM8re25DAmJeiI1kybVf2Ej3p4JduoknzYRkivft1foH
	Ia2z0VLNOyoRJzuWhpkWY+xUwh6G8rn1UTcDqldGbkfhHTAWKH4KIecqttoTWBenYTMI6O+OYyUZM
	+0dBIkfpM6efr0AM9sWtBwgnDYe779zf1ZmKVn8uq2YPVDIq273uYlD8wnWoKP84/hgivBkuFB8G4
	4XLmgkWuF2epwCNR2Ame1DcaOQ1MfnTz9ZnbVjQxk6sI23nDhJOVYjQprmJIOOKkqbvDxy1ZwYWDC
	brFJCA72zB60rcIwn+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfla-003bj9-TR; Fri, 23 Sep 2022 10:18:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obflY-003biK-D8
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 10:18:41 +0000
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1obflV-0005l1-VU; Fri, 23 Sep 2022 12:18:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Fix crash during early errata patching
Date: Fri, 23 Sep 2022 12:18:37 +0200
Message-ID: <3805269.R56niFO833@phil>
In-Reply-To: <b012edf5-60ae-a45a-4da9-823cd0fd1e93@ghiti.fr>
References: <20220922054743.30159-1-samuel@sholland.org> <b012edf5-60ae-a45a-4da9-823cd0fd1e93@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_031840_470243_E0938FB7 
X-CRM114-Status: GOOD (  25.53  )
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

Hi,

Am Donnerstag, 22. September 2022, 09:31:56 CEST schrieb Alexandre Ghiti:
> Hi Samuel,
> 
> On 9/22/22 07:47, Samuel Holland wrote:
> > The patch function for the T-Head PBMT errata calls __pa_symbol() before
> > relocation. This crashes when CONFIG_DEBUG_VIRTUAL is enabled, because
> > __pa_symbol() forwards to __phys_addr_symbol(), and __phys_addr_symbol()
> > checks against the absolute kernel start/end address.
> >
> > Fix this by directly using the underlying kernel_mapping_va_to_pa().
> 
> 
> I'd rather fix __phys_addr_symbol so that we can use __pa_symbol and 
> then take advantage of the address range check. Instead of using _end in 
> phys_addr_symbol, we have access to the size of the kernel mapping, so 
> we could do something like that:
> 
> diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
> index f981b1f95fa0..150691aef058 100644
> --- a/arch/riscv/mm/physaddr.c
> +++ b/arch/riscv/mm/physaddr.c
> @@ -22,7 +22,7 @@ EXPORT_SYMBOL(__virt_to_phys);
>   phys_addr_t __phys_addr_symbol(unsigned long x)
>   {
>          unsigned long kernel_start = kernel_map.virt_addr;
> -       unsigned long kernel_end = (unsigned long)_end;
> +       unsigned long kernel_end = kernel_map.virt_addr + kernel_map.size;
> 
>          /*
>           * Boundary checking aginst the kernel image mapping.
> 

so I did the whole set of original code
- works without DEBUG_VIRTUAL
- breaks with DEBUG_VIRTUAL

and then applied you suggested change to __phys_addr_symbol,
which fixes the breakage. And I guess making this usable at all
times also makes a lot of sense, so

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> >
> >   arch/riscv/errata/thead/errata.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index 202c83f677b2..83174f13783e 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -76,8 +76,9 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
> >   		if (cpu_req_errata & tmp) {
> >   			/* On vm-alternatives, the mmu isn't running yet */
> >   			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > -				memcpy((void *)__pa_symbol(alt->old_ptr),
> > -				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
> > +				memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
> > +				       (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
> > +				       alt->alt_len);
> >   			else
> >   				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> >   		}
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
