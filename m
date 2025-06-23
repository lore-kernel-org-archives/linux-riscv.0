Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7225C7EE3A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRSeoK6roZI9UBMtWnoq9OnClry911AyTCKmmwP2/sc=; b=iA9Ddj918x3PTv
	KtmBKaw/yekitZAPRIIB9sFLu5LoZt6aZT0Uk69LRgMEx8noCrf/f7SGvPUEwWCDM5yqfKMZcFrXP
	FCIDG6MjqTWFMnTomzRor7GQcdES2bKVhD1ZRbBnyvDIRHxOHss4I12T9Msv0y8utSNv4hJn6VXVN
	s/BihAOt74T/1RKUju/pkMEGs25HjXsayUOtQqwDNXjNEM2Yn9+dDDY0k3Bbj0snd8bGFC9NP9JgP
	cQ/lO9kxL3gIA8GZAZkqWarWgy1c9IlUS+i3dDNk0P8SJRJdE/qZclEkUcrDSw36gJSCux5L4Krca
	k+cbAFdS0cTxJaizzxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscL-00000004Ngt-1wgD;
	Tue, 24 Jun 2025 01:38:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpC2-000000043wh-0gvd
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 21:59:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso4015256a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750715949; x=1751320749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3yB+qOk7ujVR/LBAYKGt7qD8w55PbhtiiJGomEX+B0=;
        b=Poojzdkq8gLahvM4smP+1rUk7fsHVG+xImPLz/zxYE13erBc4VCDUSjj6YuvlgWqnR
         fzy3g/gE3AcGYUxRNDvkY/4Z0e6+Wwi6Tk0a+0KfiFnxVxpF+7osfa8Vba8ZYEf4usFy
         c3jDbzfq+I7a/uXdip7Jlj0NQCkfZ/M29rPA99xHy9ZGchKUZci6dkqYHOs3yCFONKCK
         8eDzJ8eRkNMWRq2+ZtYhGebrgrk44rNWQ8j3xImaZozGZk6hsnMfMesHg7+MOK5mQpD7
         zHGTO5JVdT8r4NwHBA2xmTAWD4uTUmPwqOwj6+bs9yVCRdOrRNjWs13+iIbsDA13Lpiz
         rdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715949; x=1751320749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3yB+qOk7ujVR/LBAYKGt7qD8w55PbhtiiJGomEX+B0=;
        b=t/g3OrLdMIUwm1rCbg562yMdjF5+1x18UyCkVgWpf/Odk4RKeRnnCLcHrJplKocj0L
         BE4girqHHyZSTwZdQd5G3Fe18kFWHQwbZAZZIV8um0I7KrgqW2+Cy0ITnBjYUEg6UHLK
         QVC4YLMoPHZMqPeEALJlzPexaGzo+MJdZmicSm73tWJUpHDfV6xmtiScQy5hvu7QpJdI
         pnEC6m8vVHypOuq/Ep6Y++HPJjSjsvuFr5ya4Y1mf1XTJdtuNa8GSVBCCb4zcNlc2udD
         Qo+e2lVr4quifVoBtktJdb8zMgAfKqdS2qNkXxBkY2c+fkuIDxCm11UGKsfH8e6rqvBR
         Ct6A==
X-Forwarded-Encrypted: i=1; AJvYcCVBQr/9ZjRxthM7yjRv9mQ1p2TJFijy7SyBxAgVpY/xeXTWIs31fvgMvu6gASiHdIxTGTgX4ZKenpKCRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ884F1hZ8ImOSw3VBdBYlhYk/5UvOhBw5MoE3Udjv5nvBnEjy
	t34nxrhO5G45Q1JrmAWdDGrjM+za6GhNKad2yrSAwuEPvcwbYIL6TF22
X-Gm-Gg: ASbGncvPJtFuTpOwUdIHGUh5HGb/NXbTmDS0f50d4SLPiuZcIgkg/d81fWAuir3HZIB
	gW5uGuktM81SgVyo8BLuQEDspKDGcOq8MZOZTdpIR/h/Fgv881OTlNqvlBuEmjoZWEpPzAz4FyJ
	+Xb0StGzbaWfp6+vuI/JW+v563TgXljfxcGU6EV0ZpzGeG76YbEsiCNAzI/bskvPzvJ5EAhDgCT
	MgvAJSJQC9+RxrDNmCQO7vqyGV7XdH9Hy5KnqgGOf7vBEZJvh7TaKMBqPeO7Jhnj9lgel9F+hO4
	eXGJ5BXnl0TF3wYq0nRXz08tg5mlVF7h9Fdy2vAtBHEnq1pEpDV5f/OziIHSog==
X-Google-Smtp-Source: AGHT+IGFzE62qF3LBZw9k/a/Lzh2nlx6tpEsN8z9xHpzhHhKrHLcsX6GHI2IN06+kXkIIoSfeiuGQA==
X-Received: by 2002:a17:90b:4a01:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-3159d62bf03mr19438715a91.6.1750715949257;
        Mon, 23 Jun 2025 14:59:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3158a331288sm12485010a91.43.2025.06.23.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:59:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:59:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v2 4/4] riscv: dts: sophgo: Add ethernet
 configuration for Huashan Pi
Message-ID: <vlolusjs436s3tsp23g2bsr33fngp6vrc2g7vbaeypf3l3gi5k@i44w7sjacahp>
References: <20250623003049.574821-1-inochiama@gmail.com>
 <20250623003049.574821-5-inochiama@gmail.com>
 <bd1485c7-e6c3-4360-8e3c-e584ea0b8040@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd1485c7-e6c3-4360-8e3c-e584ea0b8040@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_145910_203878_65B303A9 
X-CRM114-Status: GOOD (  16.29  )
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

On Mon, Jun 23, 2025 at 09:26:43AM +0200, Andrew Lunn wrote:
> On Mon, Jun 23, 2025 at 08:30:46AM +0800, Inochi Amaoto wrote:
> > Add configuration for ethernet controller on Huashan Pi.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > index 26b57e15adc1..86f76159c304 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > @@ -55,6 +55,16 @@ &emmc {
> >  	non-removable;
> >  };
> >  
> > +&gmac0 {
> > +	status = "okay";
> > +	phy-handle = <&internal_ephy>;
> > +	phy-mode = "internal";
> > +};
> 
> Since the PHY is internal, it should be part of the SoC .dtsi file,
> same as any other peripheral. The board .dts file can then enable it.
> 

Does this mean only boards using external phy need to override the
"phy-handle" and "phy-mode"?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
