Return-Path: <SRS0=7IGV=XB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70024C43140
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 22:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 449A02082C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 22:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvojudVJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U4aVJDu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 449A02082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/e354OkilaTBMENAfdpy7Eh4Z4pGDoNYvOuuxnora+c=; b=VvojudVJKl1NVL
	PzEcTZElzcbfV7APtGpgHnL7/3LJJOAwL19EQgwfY153u/KVvtuKz98wbVR0dgfmUiwhVmC9p1UBc
	znmXtf1hnPlb4t21PFgBJkfu2QYz3ihJ00uj/hGExlShOlXMwYzjQom7WHuZQhfE3yAU0UNndpbHq
	ELecARO7tERZtuVXTuaa/ptN6BR+k7helXeO7qkJ5lI88Ro5jcKSbMnj82OU3dOoMLvdqeeWBUG/b
	mSqWkoOMUIfJBUKJrMWidIkzAwaiMW4Vkx2z+32IL7ijBudg7NnSpbsiRSeSOvTRuKKSgvg8hYlMn
	zpNL4ScYcdL7wybHJjgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Mpy-0004YJ-Ur; Fri, 06 Sep 2019 22:36:14 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6Mpw-0004Xv-MA
 for linux-riscv@lists.infradead.org; Fri, 06 Sep 2019 22:36:13 +0000
Received: by mail-io1-xd44.google.com with SMTP id f4so15660819ion.2
 for <linux-riscv@lists.infradead.org>; Fri, 06 Sep 2019 15:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/OtDkC3pdZM2krctzGQ+0mwUr2A4Fs4btQ+iI6by6RE=;
 b=U4aVJDu5VXkgoIzNl4rkJ0nf2rR1BtS2JRC7srMfDmAux89pa3jMXCPQ+73gGP4pQo
 Fb6D2ltlQysy5TqKEABHdV+ayc4GTots+ylmlZ8aSR88vtlI4wIP+51mF7gDrjl1I3vb
 4O5WhDwC76LXCOkjNL+0FQRq7q8YIQVRKzBdI/ORwFTDo5PgD3CfM2FFCmGCjBE6Iz3W
 hZFSoXNEQMqtrToRHblAMK5u0Rd++k65C3zVKL8whgA0qN9mPt6L6fWeyb4MQ1SX/2zw
 w3/cEkDJ7QJAXrSsjya9DcI/Lc/UotopuyJ4alzf+dl0dV8OxKidh9YYMgKS6zkIR/cS
 IRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/OtDkC3pdZM2krctzGQ+0mwUr2A4Fs4btQ+iI6by6RE=;
 b=D2OzQ78Jn7UUdKRRvzxqs9wfKARcGy70lhR/VQYPPUmitcgNQhB9VnhTHEe/0uGNl7
 VNir8yiO4kWsvPlSTpOZJh5ezwYh95mEAr13yZFcY8z2j4XplObfD2jZePXhbiB3GHmo
 kIL0HYSdN98loKMbKOY68y4Gi05IdFtugMC9mstj5BgZc9YbyXCtsuNuNxAxQAsIZEpi
 RBffkf/oAsKmBz40nKtg71Ex+iwZti1kLTQufTPHEbFyvHr3noNGCUngQptQkLwobIko
 HR/mneXUpLAzdhANm2zmi35Su71O5Xrr0MCYPQx+NdKIsfVEQwtJE5UJEOGkO1E2q+lI
 4ByQ==
X-Gm-Message-State: APjAAAVmRi5bfPMZtvnC3mTVqrPmseaRtZoJ8UKGeXEKEbXYVMGpNCQC
 ly/i1ySz5znjtUa0Fv74oK76vg==
X-Google-Smtp-Source: APXvYqz4MaleudQolCZG/PjbQC417j+Ug7KgFVxamxGmKjA3pdAN9qsIdwzmJJTiIGhfUx+hi+xiBA==
X-Received: by 2002:a02:c546:: with SMTP id g6mr12808435jaj.59.1567809372001; 
 Fri, 06 Sep 2019 15:36:12 -0700 (PDT)
Received: from localhost (75-161-11-128.albq.qwest.net. [75.161.11.128])
 by smtp.gmail.com with ESMTPSA id d20sm6201253ioh.2.2019.09.06.15.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 15:36:11 -0700 (PDT)
Date: Fri, 6 Sep 2019 15:36:09 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
In-Reply-To: <alpine.DEB.2.21.9999.1909061525040.6292@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1909061533260.6292@viisi.sifive.com>
References: <20190818082935.14869-1-hch@lst.de>
 <alpine.DEB.2.21.9999.1909061525040.6292@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_153612_719332_4C5B14DC 
X-CRM114-Status: GOOD (  10.22  )
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
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

One other comment on this patch:

On Fri, 6 Sep 2019, Paul Walmsley wrote:

> On Sun, 18 Aug 2019, Christoph Hellwig wrote:
>
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 200c04ce5b0e..9241b3e7a050 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -462,7 +462,7 @@ config EDAC_ALTERA_SDMMC
> >  
> >  config EDAC_SIFIVE
> >  	bool "Sifive platform EDAC driver"
> > -	depends on EDAC=y && RISCV
> > +	depends on EDAC=y && SIFIVE_L2

Since the guidance from the EDAC maintainers is that this driver is to be 
a platform driver -- which would, for example, also include EDAC support for 
other IP blocks (e.g., DRAM controllers) on SiFive SoCs -- this should 
depend on SOC_SIFIVE, not SIFIVE_L2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
