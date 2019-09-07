Return-Path: <SRS0=H4jo=XC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36088C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Sep 2019 04:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100ED20854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Sep 2019 04:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsaPuRNS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100ED20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxysMJ1OLfl2dORTMmpdlvM/pCnh3gTuR0uO3PUB4WM=; b=dsaPuRNSqJayfq
	yicJQA04pmRBuUuwlcXid5/yD8eMU58kQxgL6BZQjkUWd0PAStiDcv/u9GtsvdtWbKiFzZPaOJrEX
	lHQc6SlMn7GxX39z27wRxVV43sFuimWOGzZNujZUD+1bGvJP33wJ7MU3Xs0GtjYfYMn/mH9OKdG69
	RVlxbLJfrHflBhjW/M/5bJaUv45q/U1xAhzdcUv0gOqhRxrfBDqjRbrt1ZxtM5Z3Xe/86vgjURy+U
	Ihw5v6RwTEl6mxB5dJgNPeQ/2eTmkUdojOlkAc6wysefusjsw/phWTLbiX83rhXMH22bxyuQdVstn
	JSJGN7vQ+c98Fr1v3v8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6SWN-00063V-Kv; Sat, 07 Sep 2019 04:40:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6SWK-000635-Um
 for linux-riscv@lists.infradead.org; Sat, 07 Sep 2019 04:40:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 263C368B05; Sat,  7 Sep 2019 06:40:18 +0200 (CEST)
Date: Sat, 7 Sep 2019 06:40:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
Message-ID: <20190907044017.GB21510@lst.de>
References: <20190818082935.14869-1-hch@lst.de>
 <alpine.DEB.2.21.9999.1909061525040.6292@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1909061533260.6292@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1909061533260.6292@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_214021_142957_6D96E3C5 
X-CRM114-Status: GOOD (  12.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org, bp@alien8.de,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 06, 2019 at 03:36:09PM -0700, Paul Walmsley wrote:
> One other comment on this patch:
> 
> On Fri, 6 Sep 2019, Paul Walmsley wrote:
> 
> > On Sun, 18 Aug 2019, Christoph Hellwig wrote:
> >
> > > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > > index 200c04ce5b0e..9241b3e7a050 100644
> > > --- a/drivers/edac/Kconfig
> > > +++ b/drivers/edac/Kconfig
> > > @@ -462,7 +462,7 @@ config EDAC_ALTERA_SDMMC
> > >  
> > >  config EDAC_SIFIVE
> > >  	bool "Sifive platform EDAC driver"
> > > -	depends on EDAC=y && RISCV
> > > +	depends on EDAC=y && SIFIVE_L2
> 
> Since the guidance from the EDAC maintainers is that this driver is to be 
> a platform driver -- which would, for example, also include EDAC support for 
> other IP blocks (e.g., DRAM controllers) on SiFive SoCs -- this should 
> depend on SOC_SIFIVE, not SIFIVE_L2.

But as-is without major changes it depends on SIFIVE_L2.  And given that
it supports nothing else as-is there is no point in making the code
conditional either.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
