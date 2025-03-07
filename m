Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C9C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAfPwwJkS4a+V7VoNesydorJgSGtXHI9sYV64RZG6OM=; b=zNnqV8vJdM5R8O
	tW8Uv8jxe21qS33BVb65hweRFQjQfvIgS3wcbIHBw+Rp95pKO0toJ/V9UVcnrxJt54XMZ+qIKCDs3
	YuJ5qhLL+yfHwDCxo3jvRlT6uXlffiFkA13lJJGpIaqgCGv4Z5fwKLngVryorwWrgKqOpGK0ZGBbz
	bYCiUKaD4LkqPmPJsH3Pg3UM5ayzz8VGzdjCcOnz7Yz1VxmH4eTxzHzgXv3JAR2Vlb7s9M+TSedKS
	j+c/R5u7RKrI8zR89cZoKReaQzcovgTWR/anmt7EiG4Iif5vmry2WeUZAjVxkZalDu4+YknXnk+tj
	aQ8S43cG8dk7dLIyms7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVLE-0000000DwYb-0Uz4;
	Fri, 07 Mar 2025 10:54:08 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV4d-0000000DtzU-3jQ2
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 10:37:01 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 527AaPBY052202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 7 Mar 2025 18:36:25 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.11) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:36:25 +0800
Date: Fri, 7 Mar 2025 18:36:25 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tim609@andestech.com>
Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
Message-ID: <Z8rMKZoDYmpNosSj@atctrx.andestech.com>
References: <20250305030526.1986062-1-ben717@andestech.com>
 <20250306-finale-chatroom-c620ff284d8c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306-finale-chatroom-c620ff284d8c@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.11]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 527AaPBY052202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023700_248881_DEA8E627 
X-CRM114-Status: GOOD (  24.74  )
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

On Thu, Mar 06, 2025 at 04:40:49PM +0000, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Thu, 6 Mar 2025 16:40:49 +0000
> From: Conor Dooley <conor@kernel.org>
> To: Ben Zong-You Xie <ben717@andestech.com>
> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
>  paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr
> Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
> 
> On Wed, Mar 05, 2025 at 11:05:26AM +0800, Ben Zong-You Xie wrote:
> > The first SoC in the Andes series is QiLai. It includes a high-performance
> > quad-core RISC-V AX45MP cluster and one NX27V vector processor.
> 
> I'd expect a config option like this to come with the user, which in
> this case is the dts etc for a board using the QiLai SoC or drivers for
> the SoC. Without dts or drivers, there's no reason to ever enable this,
> so where are those patches?
> 
> Cheers,
> Conor.
> 

Hi Conor,

We are still preparing those patches for upstream, and we will add them
in the next patch series.

Thanks,
Ben

> > 
> > For further information, refer to [1].
> > 
> > [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
> > 
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  arch/riscv/Kconfig.errata | 2 +-
> >  arch/riscv/Kconfig.socs   | 9 +++++++++
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index e318119d570d..be76883704a6 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -12,7 +12,7 @@ config ERRATA_ANDES
> >  
> >  config ERRATA_ANDES_CMO
> >  	bool "Apply Andes cache management errata"
> > -	depends on ERRATA_ANDES && ARCH_R9A07G043
> > +	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
> >  	select RISCV_DMA_NONCOHERENT
> >  	default y
> >  	help
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450..b89b6e0d1bc9 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -1,5 +1,14 @@
> >  menu "SoC selection"
> >  
> > +config ARCH_ANDES
> > +	bool "Andes SoCs"
> > +	depends on MMU && !XIP_KERNEL
> > +	select ERRATA_ANDES
> > +	select ERRATA_ANDES_CMO
> > +	select AX45MP_L2_CACHE
> > +	help
> > +	  This enables support for Andes SoC platform hardware.
> > +
> >  config ARCH_MICROCHIP_POLARFIRE
> >  	def_bool ARCH_MICROCHIP
> >  
> > -- 
> > 2.34.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
