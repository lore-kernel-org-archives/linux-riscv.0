Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9ACC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 246D6214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RarFgbDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="JP3ldUWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 246D6214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS1x8iHAnazJ1m53mRszNwDXXf6kJosLgENHjTj9MmU=; b=RarFgbDUAW5ek1
	z4E6BWU5ZCXZWHCjN/UWLEvKJPSt+IM9xUDDRdp9FNbwJuMqsk1RDhAyq9ORnGNZ+OMvwKxewRqWP
	8/8kDSNjdZpExj3TFG5H0sEkN8nWBQqXeLFjIOZeORr9N3c+URg8pf9IU+lu13qxFGGR6FutFRT8c
	etGyTrgqq931QIgvuGrReK/Exic0fOY1nkOKr62WIRTNPB8gKfW6YCF+kigLiVFAm7EKzTFSSKJx7
	GRVbXI1iOpdpiqoSHnI0fUb9lWJ5Gmb8aw96ipZX9WggLj+1CA0UzTBYeRyhX2EIkMdGVpMKyvDV5
	+0mS2rIRPXards+9+tDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3diU-00046k-NW; Tue, 12 Mar 2019 09:28:58 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3diR-0003wZ-AZ
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 09:28:57 +0000
Received: from zn.tnic (unknown [IPv6:2003:ec:2f09:5700:f135:3193:b053:76cd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 26F441EC0324;
 Tue, 12 Mar 2019 10:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1552382927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=wasXZt4wz3g1Y1fQFWK6MO5JGxZ4OlHYf5kdyysXjP8=;
 b=JP3ldUWLZ61kYQrbC9bwtEDx1z55mSvPaGCZbLMUtAdGp6M82xFgHpcBSKAup4V9ilp5oZ
 g96j949yzmz5VWaVM8IShhAzme65Oqn9RE9NSQbiRNMNl9YlcpOGXyf4Kc/bWbs1lrC+7g
 GB1nhyyFqzymRk6Li8eabNPr6TDE7uk=
Date: Tue, 12 Mar 2019 10:28:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Message-ID: <20190312092842.GC28589@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_022855_520680_8FB40D07 
X-CRM114-Status: GOOD (  15.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 02:51:01PM +0530, Yash Shah wrote:
> Add driver for the SiFive L2 cache controller
> on the HiFive Unleashed board
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/Kconfig            |   1 +
>  drivers/edac/Kconfig          |   7 +
>  drivers/edac/Makefile         |   1 +
>  drivers/edac/sifive_edac-l2.c | 292 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 301 insertions(+)
>  create mode 100644 drivers/edac/sifive_edac-l2.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 515fc3c..fede4b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -49,6 +49,7 @@ config RISCV
>  	select RISCV_TIMER
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select ARCH_HAS_PTE_SPECIAL
> +	select EDAC_SUPPORT
>  
>  config MMU
>  	def_bool y
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index e286b5b..63ccdf1 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -440,6 +440,13 @@ config EDAC_ALTERA_SDMMC
>  	  Support for error detection and correction on the
>  	  Altera SDMMC FIFO Memory for Altera SoCs.
>  
> +config EDAC_SIFIVE_L2
> +	tristate "Sifive L2 Cache"
> +	depends on RISCV
> +	help
> +	  Support for error detection and correction on the SiFive L2
> +	  cache controller.

Please no EDAC drivers for a single functional unit with RAS
capabilities. Rather, a sifive_edac or riscv_edac driver which covers
the whole platform or even architecture and contains support for all the
RAS functionality there. See altera_edac, for example.

HTH.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
