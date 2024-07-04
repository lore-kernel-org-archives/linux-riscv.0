Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C08C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEThWY4dQyGogZ+rrSVjSkaloMoB+SzwmuIqnK5LtoI=; b=TkkEdFdXg2KJXI
	n/fwiYly02ZYgcBOXe9x/Dh4IJutQXWriypIQ2aZ51OChz9HdR+ZRdYgFX80zY8K/jJfYxqfXvZVt
	dNFLYifXANQMc/di75nEosmq1wTTz0Hy91VzcQXZcJwivbcoI+lGVWB4t2dh00lvcPRLBTQniBZah
	9QyMr7pYqslNmTkbFEIRYYth2uZ4b9/BpngL12JWLfj0kWvl/0kNnj3QjdCyGwa8GXWoJV0sBiCZS
	Ym6XbU6GWV7rLxaOugsyZNUAABt10zfTaRFTqAafri25bj6D1z97CjQ7ZcAMsjjrBLt9HhSymemKB
	KQuO4ta52/zTxu7QiYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPns-0000000Du4m-1TlL;
	Thu, 04 Jul 2024 16:59:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPnp-0000000Du34-0Bak
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 16:59:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso3390605ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720112363; x=1720717163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbx+rexi+bkisDvN1JHt83FrZQeG/TdSXxtwh8uu4R4=;
        b=l6xYZdnl3/g3QYnuJzzLBoZj0uz0TAFaFQoaP7L8N2dMEGnOZdyVK11R0J9U8oKOlz
         NKKywGa2KxdWWCYT/t+uzkDuLrk0ggpTurfFy937vmSF6x21lU99coqVd2Va3MaOE8Zj
         U6Z33dTogBHI7ayvhSr/ZLLMv0128+CT4LeV/DfErXPEqoqhwdDgl9Xmahieay3Fh/+N
         nEa7hRjmPGDDlB7BAv0CV/IcgIrVaedmEhnAVaMBIH/7u6UxnRhvmfSgu+ubSeQrYRGY
         3sinUHuESjJpJje/4S6shT6Em7SukRE2AJNAwv3TyD8sdfsshnK8oWtnrwKvYJAj4Erd
         hrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112363; x=1720717163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbx+rexi+bkisDvN1JHt83FrZQeG/TdSXxtwh8uu4R4=;
        b=l9mgd0NzHnE+vPHlojl8fVqMh+bdelfMhgbmmn37Gv24tbT/ciqaU3QqilsVKt6KAH
         smGA/NqyVxMda6mT05GSQTRdj9Uo3oaAQL29h5LSblhiA7isrKJJPrbxb/gCWuunPR87
         XfXb2kOGpoORfb1yLtsu3cBaZB1OmNfidn+HgLUJhLdsIPY/s6gZN9yP0EGuQYGGihWt
         lAKXof9FRkkzIe6Lz/pWIb/wL6ALYB0eEMglPXF4BDFpGwFbpiQuJcEH3tyoOlinN7CM
         yxeCtkMWxoZlWZIYSCcwuUecMsbN4Cc2Znsz7tXVl93+80D+ARwvkjXGfE7FZRnBZAMo
         OGfA==
X-Forwarded-Encrypted: i=1; AJvYcCX7aufwZbm/ieHbhh21skYRdJADDtrxNd1BMbBhalLuj+vcg68OOZa+pPFYeJgIYM/tvo1BUCcwGZzPVFLb1CCPFLBTFmeodiavb1MiAh3V
X-Gm-Message-State: AOJu0YzxdpFQdXeCNrUrOZ0l1/I6Y702lMrGh/1H/87DeoFNsdjdEtEH
	GHIxd7CZ5cFCKlXITI5KUSTZJALdfFzPWcxN0A3DOBVAdMfQf8cZ
X-Google-Smtp-Source: AGHT+IFpNMXcHa+uUusED4LID/clJgWo2VKFAANu9IISFIFSGHyMQF87TT1HKT00VSFY3N8gXegW3A==
X-Received: by 2002:a17:903:32cb:b0:1fb:1a0f:44d3 with SMTP id d9443c01a7336-1fb33e94f14mr19752315ad.39.1720112363237;
        Thu, 04 Jul 2024 09:59:23 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1a596822sm34936475ad.163.2024.07.04.09.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 09:59:22 -0700 (PDT)
Date: Thu, 4 Jul 2024 09:59:20 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
Message-ID: <ZobU6K/R3pfHrK9c@x1>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com>
 <20240703-juice-refreeze-62c468a56ea5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-juice-refreeze-62c468a56ea5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_095925_122641_1FCCFBCB 
X-CRM114-Status: GOOD (  30.27  )
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

On Wed, Jul 03, 2024 at 03:45:37PM +0100, Conor Dooley wrote:
> Kanak, Drew,
> 
> On Mon, Jul 01, 2024 at 05:43:54PM +0530, Kanak Shilledar wrote:
> > created spi0 node with fixed clock. the spi0 node
> > uses synopsis designware driver and has the following
> > compatible "snps,dw-apb-ssi". the spi0 node is connected
> > to a SPI NOR flash pad which is left unpopulated on the back
> > side of the board.
> > 
> > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > ---
> > Changes in v2:
> > - Separated from a single patch file
> > ---
> >  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
> >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
> >  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
> 
> Didn't you say there was a flash on one of these two boards?
> 
> >  arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
> >  4 files changed, 34 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > index d9b4de9e4757..3103b74e0288 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > @@ -17,6 +17,7 @@ aliases {
> >  		gpio1 = &gpio1;
> >  		gpio2 = &gpio2;
> >  		gpio3 = &gpio3;
> > +		spi0 = &spi0;
> 
> "spi" would sort after "serial".
> 
> >  		serial0 = &uart0;
> >  		serial1 = &uart1;
> >  		serial2 = &uart2;
> > @@ -52,6 +53,10 @@ &sdhci_clk {
> >  	clock-frequency = <198000000>;
> >  };
> >  
> > +&spi_clk {
> > +	clock-frequency = <396000000>;
> > +};
> 
> I'm pretty sceptical about adding more of these fixed clocks, rather
> than waiting for the clock driver. Drew, what do you think? Should we
> just add one more to your fixup list or would you rather delay? Guess it
> depends on how long more you think that clock driver is likely to take.

I think the clk driver [1] is in good shape but it has not been reviewed
by the clk maintainer yet. Thus it is hard to predict any timeline for
it getting merged.

SPI support doesn't require any driver changes so I'd be inclined to
allow the fixed clock in this case. It will be simple to change it over
to a real clock once the clk driver is upstream.

Acked-by: Drew Fustini <drew@pdp7.com>

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
