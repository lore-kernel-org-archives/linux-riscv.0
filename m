Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA43C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXKu9Bl4Kx/G2EqMCfySRdw51OKU0Uck3p1SAbQzLjk=; b=GmPYLlCVhieRAv
	He+uPbEOpo8Zg2W02CA6aQVS80qhsR8hX74Xls+G45jOaJarocqwHn0mbARlhP4QRj08zXlHw99fz
	XsAIbtQcwvVRn3cH7414Si20gGiW7/scwlZ7LE2SbKajzzS4n9Pk5D3JD7k8BfE0zObOgj+30CeLO
	EanIf2Sph6mZ7K3xAuRInALbgZEPHNjldilgiv67sorNg/nmHiJqgZtlnS7wG55GioJvAlChdallz
	uvslPmICTbOaT740hBqsewKgHtHeBTWf9NLP1PNehW/RHPxvT5WhaKMFJ/sWfZEK/Z6eRurtKuu2e
	hOT5mP/+oWYnfGlGkhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIND-00BM6H-38; Thu, 24 Nov 2022 19:59:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyINA-00BM2A-HW
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 19:59:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyIMs-0007eH-Pe; Thu, 24 Nov 2022 20:58:42 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Thu, 24 Nov 2022 20:58:41 +0100
Message-ID: <4801607.MHq7AAxBmi@diego>
In-Reply-To: <Y3/LgZkR1hkblJ8D@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y3/LgZkR1hkblJ8D@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_115900_606996_3A993B52 
X-CRM114-Status: GOOD (  25.41  )
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

Am Donnerstag, 24. November 2022, 20:52:33 CET schrieb Conor Dooley:
> On Thu, Nov 24, 2022 at 05:22:01PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Introduce ALTERNATIVE_3() macro.
> 
> Bit perfunctory I think! There's a lovely comment down below that would
> make for a better commit message if you were to yoink it.
> Content looks about what I'd expect to see though.

Also both the comment on the original ALTERNATIVE_2 and the new ALTERNATIVE_3
should probably be merged into a single comment explaining this once for all
ALTERNATIVE_x variants.

Especially with the dma stuff, I'm pretty sure we'll get at least an ALTERNATIVE_4
if not even more ;-) . So we defnitly don't want to repeat this multiple times.


Heiko

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC v3 -> v4
> > * New patch
> > ---
> >  arch/riscv/include/asm/alternative-macros.h | 94 +++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> > index ec2f3f1b836f..1caf4306b3d6 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -69,6 +69,34 @@
> >  				   new_c_2, vendor_id_2, errata_id_2,	\
> >  					IS_ENABLED(CONFIG_k_2)
> >  
> > +.macro __ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> > +				  new_c_2, vendor_id_2, errata_id_2, enable_2, \
> > +				  new_c_3, vendor_id_3, errata_id_3, enable_3
> > +886 :
> > +	.option push
> > +	.option norvc
> > +	.option norelax
> > +	\old_c
> > +	.option pop
> > +887 :
> > +	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> > +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> > +	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> > +.endm
> > +
> > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					CONFIG_k_1,			\
> > +				  new_c_2, vendor_id_2, errata_id_2,	\
> > +					CONFIG_k_2,			\
> > +				  new_c_3, vendor_id_3, errata_id_3,	\
> > +					CONFIG_k_3)			\
> > +	__ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					IS_ENABLED(CONFIG_k_1),		\
> > +				   new_c_2, vendor_id_2, errata_id_2,	\
> > +					IS_ENABLED(CONFIG_k_2),		\
> > +				   new_c_3, vendor_id_3, errata_id_3,	\
> > +					IS_ENABLED(CONFIG_k_3)
> > +
> >  #else /* !__ASSEMBLY__ */
> >  
> >  #include <asm/asm.h>
> > @@ -135,6 +163,36 @@
> >  				   new_c_2, vendor_id_2, errata_id_2,	\
> >  					IS_ENABLED(CONFIG_k_2))
> >  
> > +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					enable_1,			\
> > +				   new_c_2, vendor_id_2, errata_id_2,	\
> > +					enable_2,			\
> > +				   new_c_3, vendor_id_3, errata_id_3,	\
> > +					enable_3)			\
> > +	"886 :\n"							\
> > +	".option push\n"						\
> > +	".option norvc\n"						\
> > +	".option norelax\n"						\
> > +	old_c "\n"							\
> > +	".option pop\n"							\
> > +	"887 :\n"							\
> > +	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
> > +	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)	\
> > +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> > +
> > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					CONFIG_k_1,			\
> > +				  new_c_2, vendor_id_2, errata_id_2,	\
> > +					CONFIG_k_2,			\
> > +				  new_c_3, vendor_id_3, errata_id_3,	\
> > +					CONFIG_k_3)			\
> > +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					IS_ENABLED(CONFIG_k_1),		\
> > +				   new_c_2, vendor_id_2, errata_id_2,	\
> > +					IS_ENABLED(CONFIG_k_2),	\
> > +				   new_c_3, vendor_id_3, errata_id_3,	\
> > +					IS_ENABLED(CONFIG_k_3))
> > +
> >  #endif /* __ASSEMBLY__ */
> >  
> >  #else /* CONFIG_RISCV_ALTERNATIVE */
> > @@ -153,6 +211,14 @@
> >  					CONFIG_k_2)			\
> >         __ALTERNATIVE_CFG old_c
> >  
> > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					CONFIG_k_1,			\
> > +				  new_c_2, vendor_id_2, errata_id_2,	\
> > +					CONFIG_k_2,			\
> > +				  new_c_3, vendor_id_3, errata_id_3,	\
> > +					CONFIG_k_3)			\
> > +       __ALTERNATIVE_CFG old_c
> > +
> >  #else /* !__ASSEMBLY__ */
> >  
> >  #define __ALTERNATIVE_CFG(old_c)  \
> > @@ -167,6 +233,14 @@
> >  					CONFIG_k_2) \
> >         __ALTERNATIVE_CFG(old_c)
> >  
> > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +					CONFIG_k_1,			\
> > +				  new_c_2, vendor_id_2, errata_id_2,	\
> > +					CONFIG_k_2,			\
> > +				  new_c_3, vendor_id_3, errata_id_3,	\
> > +					CONFIG_k_3) \
> > +       __ALTERNATIVE_CFG(old_c)
> > +
> >  #endif /* __ASSEMBLY__ */
> >  #endif /* CONFIG_RISCV_ALTERNATIVE */
> >  
> > @@ -202,4 +276,24 @@
> >  					new_content_2, vendor_id_2,	\
> >  					    errata_id_2, CONFIG_k_2)
> >  
> > +/*
> > + * A vendor wants to replace an old_content, but another vendor has used
> > + * ALTERNATIVE_2() to patch its customized content at the same location. In
> > + * this case, this vendor can create a new macro ALTERNATIVE_3() based
> > + * on the following sample code and then replace ALTERNATIVE_2() with
> > + * ALTERNATIVE_3() to append its customized content.
> > + */
> > +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1,		\
> > +					errata_id_1, CONFIG_k_1,	\
> > +				   new_content_2, vendor_id_2,		\
> > +					errata_id_2, CONFIG_k_2,	\
> > +				   new_content_3, vendor_id_3,		\
> > +					errata_id_3, CONFIG_k_3)	\
> > +	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1,	\
> > +					    errata_id_1, CONFIG_k_1,	\
> > +					new_content_2, vendor_id_2,	\
> > +					    errata_id_2, CONFIG_k_2,	\
> > +					new_content_3, vendor_id_3,	\
> > +					    errata_id_3, CONFIG_k_3)
> > +
> >  #endif
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
