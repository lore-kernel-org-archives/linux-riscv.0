Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CCAD15DBB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXZS6Z8QDj4wcAxqrEhhvNMyaEDLoHcZdhFq9kGqtVo=; b=BHTM1vxiNrgrE8
	wvRqovbH0cop5IRnXiod09vynAbUtnmolPvA2yPEUxN6PR/I3xrTBlowV3NsfNJD93TB15pEOqrdD
	4xiC/zyPk3pGdPMNyjDz8NmLMfajSbRDLCZGqSFquJkwb00O2JabmMFHTyEgj/jt8M9aD/v8VUlz6
	IePpdQ6e5w5iJrP0RpjQE8C+h8SR4MVklvf0ra3/dliqRjv+WkwJZps0TZZqEv4PAOCQUfda0dmoA
	kgU7GxIz1e+zJS1LpX47WW6A5GpEUe2/1OBmgaVLlnylkyr1fqT78wR2wq+f0gHeR3MykdjL4Rde4
	Rv957pMKIlDs9pdzz3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3D60-0000000AhMb-1va7;
	Tue, 22 Oct 2024 11:30:40 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3C1j-0000000AVkT-0Lmd;
	Tue, 22 Oct 2024 10:22:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so3996502a91.1;
        Tue, 22 Oct 2024 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729592530; x=1730197330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sI849jpnNtz3jUPY9JimvHmQMDeWZfkp6+41mM9VEbU=;
        b=ZPrKGPIAmzdnyV9LrLnMk3a6XxyZvnAmWQxTY7vQzJz4mGj9zWBZizDtks1FC55MJH
         ZD0cn+RVaJK0aEBnn2PlG1TLj44D9JYl/aR2NnK13++EofD0db39uqjLwiRUL1aN1+ps
         XHMAjopQkqivFGtg9Nrjs3ROkzzsYi67IvMKtz8SNXSup+es4m90pgonprp4T+XAHTTL
         YErYC9NeE0fA8TpOGEHS4FUMQVDdbDdLPW861c7sVEQR79HBNmc9ODaLYLnv26x5NJlT
         q+12hLqmm0fqmMGVP3J2qO1ij8I73jIJ+Ewru9qhbpyc1TGk8k4PxsP4I5I+q4eET5qI
         pOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729592530; x=1730197330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI849jpnNtz3jUPY9JimvHmQMDeWZfkp6+41mM9VEbU=;
        b=U6ItZmOaoIlKMXuHMKu3Fs3r2BeqKkFItIJ4qyZZzCqj5qxVszup7GVJFw1rxWh81J
         vT8mcXzIzwykwX3cvpDZtxyTCWr6Z0bSoxaviybLbjPUIJvmI1BSQlEsd2FBdmkvLVnW
         mXmGDRVrKt48Yn8qwmC2KjTI0B96+bqBYmoNk+uf02hsZlXzt7Pr4QaWJh3KU5I2fPTG
         kL0FP4KlhEA36mkcEYZA8lL/4rzxl868fKFvDPCkbJA/00W9nVvLI91cC7BH1/iPPUl6
         ACGyr/nUztHuBHdsqkGmASejmqtKRhs67PNFB/mA17W/Txx1r950Kvj7SfQXL5NPqmIw
         EZhw==
X-Forwarded-Encrypted: i=1; AJvYcCUoQG6U2oI9tLLwbtlc4aYhHCb7IY6ggUVCJaMBFgxcp9XT70/RDSHa7LHoikIwZEGwVX3+IkMrUaYWXv0=@lists.infradead.org, AJvYcCWURJ3/M0Ul7XJdE49zH4aTFtP+T3pYwqUc/OfdG0yi/8u8gzT3IZFZHCDhJH34Xb4PJo6JqdQ04yn/Y2zRgRwr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzby8OfP705gHkoBpLTEupMF7GXwHAysQFju+T2AMCS4GrxECeq
	XCMwCI2bLmTQaE/Zs6OASvqQwr+INJ/u1R0oCh3dm+R6Y2ytw9dO
X-Google-Smtp-Source: AGHT+IF0yrkWnZfHUykTJ4Fo4aQzxqBmdzqmVMi+fptihu1U4ST488NkYyut5AtEoorOS8tcNGE7TA==
X-Received: by 2002:a17:90a:740a:b0:2c8:65cf:e820 with SMTP id 98e67ed59e1d1-2e5616c4202mr17264934a91.2.1729592530050;
        Tue, 22 Oct 2024 03:22:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad517911sm5728653a91.57.2024.10.22.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:22:09 -0700 (PDT)
Date: Tue, 22 Oct 2024 18:21:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_032211_144169_DBC20000 
X-CRM114-Status: GOOD (  17.92  )
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

On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > It is related to the RGMII delay. On sg2044, when the phy 
> > sets rx-delay, the interal mac is not set the same delay, 
> > so this is needed to be set.
> 
> This is the wrong way to do it. Please look at how phy-mode should be
> used, the four different "rgmii" values. Nearly everybody gets this
> wrong, so there are plenty of emails from me in the netdev list about
> how it should be done.
> 

The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
set (a default tx delay is set by the phy driver). In the scenario 
the extra bit is used to fix 2ns difference between the sampling clock
and data. It is more like an extra setting and the kernel can not handle
it by only setting the phy-mode.

This is draft dts patch for the sg2044 gmac.
https://github.com/project-inochi/linux/commit/381cb6000044a89cb13d6d9c839e9bbc7b9d2e5a

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
