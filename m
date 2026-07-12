Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72875C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=En2HJWnbKEw6B4AMpFPlptrxFPKFu6dRF+O5Zmsfsv8=; b=mzHn5wuX1kxBky
	5CYIZx+yIMpQFfmzkbokoQFri3Aa/mt/+wLj5Bx4jizhbfMGjv+tP1o9Vr8w6Zw0/HH5gUQ7zF4+O
	9zdObl7J1XUpbjj9eVGhEP7vsPfUVnYF7CS59VQBuWOm0AL2qJztKNMgEuh1Ppp1aK33wzdbdDJdW
	HzTdo29HBpFRCV3+jSmXiLb0KT3v7mTL432JegVVcVH/z8IN6X2qNX+dImVGikxwX6uo1geairvrH
	JfmK3aTnlxnLdrka/JRAEYzrXs3uoHVexrdBPaXrY/5hk6x4cUYC6jAAaNC+osnZIBG+NJipd7Qhh
	rKf1z8GRTswE1LbhbHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2jC-00000007p8w-2Fxw;
	Sun, 12 Jul 2026 22:32:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2j9-00000007p7l-2m1k
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 22:32:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2127482a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895567; x=1784500367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=OWMDliUqcwPv52xH3BWv5+jhmlhyUJ4QsHK34SAMdwRLYKhRsnGYY40F8BNBYWsoh7
         Ku7laPwj2hIfk0Nb5PDLuNdB8k1+h+tSPUKjZaIu2uD3F9WOjOB6HwsECcR7cwn8f5py
         WZ0U8+w/QeRATGgV1Ai4KTTiFV4DapTPUD3/s242G8dizaIwVwFGTHjXTjP4P+LaSiyg
         oUDKPP7OIeuVC7yVgw8WdKg47/f5ZOwhECTQYuFLxCyJiyu28UHFnWHE+JwVqadONuVv
         FHYBTEIHEr2f9CyNtl2DMit44M4odQqslFL+U+8BBszr78o0D+MxzQq2rl6jet10fbre
         XVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895567; x=1784500367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=FIZgze6siMOK9Z/fDmPvdSvQxzYrhVFlFu+pCx3CR8gngJSmEgiuwHhnZc5VTzH3gT
         vdZFGk4RhPE3ZFAwTyruk6MhB5L+JfqubsY1dgf6ay3BWXy4wAwrh0BQyIy5cA+NsXUD
         GMMNj64uJEqW9GxyeRKy+9m/4pAuQwwzgYP2CTQZJVHAS1wxDU7iqColQGgkmP/MArJ/
         GRngvIDAbiDMd5U4AoesnZoNyACgQaPJdqLqwXUFh+7GVOtvtX1wMcbHYPZfvBuXhg3d
         fG31AjZ4KWFmrfvNc6nDwEn6zFYu3douk3lEW+7SccH8lyCZAsAZx4qdbMpbWhJzOZFV
         VmWw==
X-Forwarded-Encrypted: i=1; AHgh+Rrjy50oWCNf8ffW//dy3oRwyOdPZeJqYod7lb02UsaalD8itpTRRBLJyptAr9fSEzJ3o1kqBGk1slvlPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3+lC27/37ECjfzoCT4KFu/xq/sn1i45EflThfJBvBeJjCFRfu
	0xK+Thk/IxeZSeFt31vwHm7ll4c0emZk3CqlFWjK8h0dFCAzIFF7Gl1H
X-Gm-Gg: AfdE7cmbJpHPRE4lIcHeiZyU+GNPRZgZ1fkPCqIPRn0Jx9otSgrgzNCMUGKFiaQnPjm
	EICAL+CrgDS+1HZYjm6YOmqGskZjuYAk00xD75nPIBw/FeghTSR9sxPtDNQrA5ewJ37Vsnw0yFH
	uusUnoal8jJuf8qC3gmyBgJYWYkpNITXnSS0kOAMyodR7JZvDe38uI/n3O3I8xYMPEZ+v5nEIG+
	mam+uAVxHGFMWhQY3hqq5UFAlegstGs9XTbxQc9/kBQJht+9Roc7Q5Du5Q74HFcWOa3Ps0GdHag
	FsYx0+PNdqLInqOI8vwoJLdClM1CF34/l2o+MTaiRI8Ox2eySERd+up9i16Ui4kbSB1II/7uDiE
	8MB7YyTZHjQZGO3CjYsNs4QlWGLlF68NBxJbobR1DwqQLjXlmmmR3SoJ7Pbs9ihCa
X-Received: by 2002:a17:90a:da86:b0:387:e0bb:5800 with SMTP id 98e67ed59e1d1-38dc7ba7310mr5970904a91.39.1783895566751;
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm61166210eec.3.2026.07.12.15.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVg3QqoIdwGEmR@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_153247_730503_32496C7A 
X-CRM114-Status: GOOD (  18.63  )
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

On Sun, Jul 12, 2026 at 10:55:51AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 7/12/26 06:52, Inochi Amaoto wrote:
> > TL;DR:
> > 
> > The DWMAC on Spacemit K3 is failled to register phy after the reload
> > the driver module (rmmod then insmod). Because the reset-gpio is
> > asserted while unloading the driver and is not desserted before reading
> > the c22 id, which leads to a fault.
> 
> You're not the first one facing this type of issues, this is a long standing
> source of issues. The problem is partially hidden by the fact that often times
> the bootloader deals with the PHY reset (like the case you're facing)
> 
> Take a look at these discussions :
> 
> https://lore.kernel.org/netdev/cover.1761732347.git.buday.csaba@prolan.hu/
> 
> and maybe more intersting, Russell suggested an approach on how we could potentially
> address this here :
> 
> https://lore.kernel.org/all/aTBeVTlsElGXUCSN@shell.armlinux.org.uk/
> 
> 

Yeah, I have found these links, but it is something more than I want,
so I think I should deal with this carefully. I will have a try if I
have enough time, but currently I will send this workaround to dlan
to solve the problem....

Regards,
Inochi


> > ---
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> > 
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> Indeed that's merely a workaround :(
> 
> Maxime

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
