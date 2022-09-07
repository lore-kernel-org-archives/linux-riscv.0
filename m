Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD247C6FA86
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzZpAU5tRbbHqAiPLnUgpXNIEDWaAn/IlKWA0KfNfPw=; b=OkBLvH+rvS48Ea
	1huwHMDOduke1fRGcfx7AwgWGpj5+8YGE6JRf0ImqpXnOhhC1jVDZG6FGKJP7X883+5OzWn1VUPcE
	YFEETnIpuzIdSh5VkaDP3MFMEJ2rt+3Vm9PhhX5Uobw8yMGF1EKXWPRhdj1KPTFk1oUJW9bxnpI8f
	b5AVRdpAup/xef8J019i+gZ2tmrj38RWZbbVB66FEZIxvhWxIDvkQ8zK5DeBwGqNAn8MDW87NhJRi
	ECWx6VPNmNavV9vh3bpF8Clqoba6Hjar7aMSNNn9WaTiqetyp3Ar+fqPJW0fQWSJ3vZo2fbugphVt
	3JmvI5HdBLCcRsEY7dHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVzKN-008Pu2-Pl; Wed, 07 Sep 2022 17:59:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVzKL-008PsC-AI
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 17:59:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVzK7-0007jl-Qw; Wed, 07 Sep 2022 19:58:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
Cc: samuel@sholland.org, guoren@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH] riscv: make t-head erratas depend on MMU
Date: Wed, 07 Sep 2022 19:58:51 +0200
Message-ID: <3490524.MsWZr2WtbB@diego>
In-Reply-To: <861b6cf0-c120-212f-43d8-3431551fe871@microchip.com>
References: <20220907154932.2858518-1-heiko@sntech.de> <861b6cf0-c120-212f-43d8-3431551fe871@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_105905_377939_E3109322 
X-CRM114-Status: GOOD (  23.04  )
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

Am Mittwoch, 7. September 2022, 18:35:50 CEST schrieb Conor.Dooley@microchip.com:
> On 07/09/2022 16:49, Heiko Stuebner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Both basic extensions of SVPBMT and ZICBOM depend on CONFIG_MMU.
> > Make the T-Head errata implementations of the similar functionality
> > also depend on it to prevent build errors.
> > 
> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Fixes: d20ec7529236 ("riscv: implement cache-management errata for T-Head SoCs")
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> In case anyone cares:
> Link: https://lore.kernel.org/all/202209070536.lIefsBuR-lkp@intel.com/
> 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/Kconfig.erratas | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > index 6850e9389930..f3623df23b5f 100644
> > --- a/arch/riscv/Kconfig.erratas
> > +++ b/arch/riscv/Kconfig.erratas
> > @@ -46,7 +46,7 @@ config ERRATA_THEAD
> > 
> >  config ERRATA_THEAD_PBMT
> >         bool "Apply T-Head memory type errata"
> > -       depends on ERRATA_THEAD && 64BIT
> > +       depends on ERRATA_THEAD && 64BIT && MMU
> >         select RISCV_ALTERNATIVE_EARLY
> >         default y
> >         help
> > @@ -57,7 +57,7 @@ config ERRATA_THEAD_PBMT
> > 
> >  config ERRATA_THEAD_CMO
> >         bool "Apply T-Head cache management errata"
> > -       depends on ERRATA_THEAD
> > +       depends on ERRATA_THEAD && MMU
> 
> "Random" thought/question:
> These two (and the sifive) errata all use oneliner depends
> but the PMU series of yours has:
> config ERRATA_THEAD_PMU
> 	bool "Apply T-Head PMU errata"
> 	depends on ERRATA_THEAD
> 	depends on RISCV_PMU_SBI
> 
> What's the rationale behind not oneliner-ing that one?

probably not thinking too much about it beforehand ;-) .

But yes going with one line is probably nicer, so I transplanted this
comment over to the sbi-pmu patch, for when a v4 might be necessary.


Heiko


> That's obviously orthogonal to this patch though, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> >         select RISCV_DMA_NONCOHERENT
> >         default y
> >         help
> > --
> > 2.35.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
