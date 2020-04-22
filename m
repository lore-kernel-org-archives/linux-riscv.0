Return-Path: <SRS0=xrvF=6G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7612DC54FCB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 18:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492162098B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 18:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLhlXcFs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Drf5l8Wk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492162098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LPiZPZ4smiMEL9c0ymPNiSA+3CkWZDGeoAnvayV0dQg=; b=NLhlXcFsH3NMZaxiMtG/2gHAQ
	F8bYDNUjpzzaiOTELBzYRIu0vrrVhXB8f42Snn6sLaSrhGtDBbDRL2dA+F//N/lTd1b0XbtRvrCN3
	/n6Ri6ppVtAgpyrvf14JuBa0j77l489wxhJ167s1qArhEs2OyoWdRsv+oN5iGHSrxaHKtWtpKhQKL
	QR9IATpIRteovbm8oVcPJ00TtVyHdje+PO0fimN6Qt84cQTTAFC/BXy60sA5RoaptDc9isT3eW23w
	dJ8BkFBBQWJPSMinOguq+bVhTo8jEw7CClkxyXa+lF64Ryjh7KA6NiMefDGG7aSIY8hrWLpicYkKO
	+kQ9+K17Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRK35-0007K5-9L; Wed, 22 Apr 2020 18:24:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRK31-0007Io-98
 for linux-riscv@lists.infradead.org; Wed, 22 Apr 2020 18:24:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id e26so3549447wmk.5
 for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2020 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LPiZPZ4smiMEL9c0ymPNiSA+3CkWZDGeoAnvayV0dQg=;
 b=Drf5l8WkqJyzNv04jh7oTJk3eK7mcxArH+WTzrCwVen845veUD8vKD1HUiWDr5wkm8
 wWS+AZUE8O74f5epTWMToRN1UUUDw8LPnHJIhPOSUr19LNoYhEf50gEXEpWgK2wU7o9h
 J5OYtBhPD4rfgEykjMLvILZ0yfTlogy6/+0quLb4W3AayhrtnFb1KS46AJIHSyGB7lgJ
 8yY9OHq2goFcumJiry3ORbVjgNrA6g4wmyWntPq74Tgky47Hd/VGtc0c5Uq7NwCqp50D
 SjAByVMLt6SFLvhihRuBTNbgh1djO+hgTaO62nGHVK/WarmGHPngQf20xGwgTFXeoOLq
 NgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LPiZPZ4smiMEL9c0ymPNiSA+3CkWZDGeoAnvayV0dQg=;
 b=oUdlYgfHnDCH1ARbHn66YCU42ul/nYB9mXnCcpE/rpnmU15BRmV+GA5R2WlpSrW/Ej
 2bAZAj2OCoPwx0fJKVkf3JAF7atfln1mwIRZ3l31Aha5DazngNSvD5rGC3Oq8fxK5gCD
 wRFs4r+uVVVdrMMxWPI5WAFm++kezeXpfk7YUo8rAk4AMNw/LAuppLN2qiHzdUADbsC7
 2Xpcw+egX2UfvUYnX5Ms19nC1sTkfZKewk497+mHjaFhgo0y6xxakR3ei2FsMNioennt
 7qHUdJH9xAJYUueKgiDdthht/Kz3FPrHi3lC0y4q3pV1Vnc45RBSHbRJODvCjo42M+Y/
 8wgQ==
X-Gm-Message-State: AGi0PuZbLa5rZX7b3nhKhEvCkZHJi4NFoczSUFUXHGKltn2+CA1PxMX2
 3Br76PHPq4gyu6gz56IleM0=
X-Google-Smtp-Source: APiQypLOFEZkUdo8OdVyeGbhlHafrcVHN+UPugQD/sJlN747qrM9v/80wVHNx0En3s7kE73VbiHxZg==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr11942200wme.139.1587579873780; 
 Wed, 22 Apr 2020 11:24:33 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id c190sm178370wme.4.2020.04.22.11.24.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 11:24:33 -0700 (PDT)
Date: Wed, 22 Apr 2020 20:24:31 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH] riscv: select ARCH_HAS_STRICT_KERNEL_RWX only if MMU
Message-ID: <20200422182431.bc74mg4prtjabciz@aurora.visucore.com>
References: <20200413090449.36777-1-damien.lemoal@wdc.com>
 <20200422182200.7guafjri2oyda23b@aurora.visucore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200422182200.7guafjri2oyda23b@aurora.visucore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_112435_327559_74D065BD 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 22, 2020 at 08:22:00PM +0200, Wladimir J. van der Laan wrote:
> 
> On Mon, Apr 13, 2020 at 06:04:49PM +0900, Damien Le Moal wrote:
> > ARCH_HAS_STRICT_KERNEL_RWX is not useful for NO-MMU systems.
> > Furthermore, has this option leads to very large boot image files on
> > 64bits architectures, do not enable this option to allow supporting
> > no-mmu platforms such as the Kendryte K210 SoC based boards.
> > 
> > Fixes: 00cb41d5ad31 ("riscv: add alignment for text, rodata and data sections")
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > ---
> >  arch/riscv/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a197258595ef..47691a9e3fd0 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -60,7 +60,7 @@ config RISCV
> >  	select ARCH_HAS_GIGANTIC_PAGE
> >  	select ARCH_HAS_SET_DIRECT_MAP
> >  	select ARCH_HAS_SET_MEMORY
> > -	select ARCH_HAS_STRICT_KERNEL_RWX
> > +	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> >  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> >  	select SPARSEMEM_STATIC if 32BIT
> >  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> > -- 
> > 2.25.2
> 
> Please include this fix, I came up with exactly the same change.

Reviewed-by: Wladimir J. van der Laan <laanwj@gmail.com>

Wladimir

