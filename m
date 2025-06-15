Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560BC7114A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=382x/QeqI/TV2siCMb15yiXiwpnALfF1SXsgf5IHv9A=; b=e3lt6yLf7QEb0l
	M8JU6kb6ctmkBgnPaXcKzL/XmSBWWDSfdVtFsiGerK6WSp4sc4LxJKTFnc3FEOp8Hiq8JfJRjleNv
	IKnB0GP4UYj2RBiSPgTCxqCbbNu3yTep9DUW9evZrkYu9ZGHkSoGpj4r6QH8sgmuFRnocQxOyOdN+
	uX6KvVtu3kGglC5lNwJhh/zfZ+8eybK5pin0G8++wDH+0Hanc/OrVcATgDLhSNXgm83I0nU+VzJMq
	+JNkMIVvlWsb8SHHpcQhnnToj6yaGHFU0IQbCg5ntiAPQgwc4KK8UQlkElGhnMqkcV3wT6XUECyMd
	loRXgCcsQf5NVWmyxBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQca4-000000027Us-14SG;
	Sun, 15 Jun 2025 01:54:44 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQca1-000000027UW-1pPP
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 01:54:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2f603b0f0dso3193144a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749952481; x=1750557281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6qcLpg2zNBg5kLLZmOuaMXSNL8jEGcJ0sEklYczzuM=;
        b=UFtUbJclmaPk4I9g/gBRP3uvIacsY6lHM0/Q+MvfnWuK97V/sTyFNOk6kNAHqvyeWO
         H+aFBnMbG03YUupWTfK0C0OH2belW5REjYrfsrFWfuj/Wu/0bA5tSGB++rV+o4FuY/Dd
         NkI32OvPX/DiYXKWnFUcKfa72ObCtEn7aqcLNVjt8ZTUXr8fFRC9Nhf8vvPnyI5Lik+e
         4E7rfSnB3Yp9fzUlb6hs5Sz0S2gK08AxMSv6Vc56ZQxCRSUtxsJOEoZNRBgH/60/ts2J
         pWVA03dO0uufSGUDXNrEPH509oz1Ogb5wRE+zGIADxNO8C7t1HX2y3ll/3cfkKCFbhYg
         +rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749952481; x=1750557281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6qcLpg2zNBg5kLLZmOuaMXSNL8jEGcJ0sEklYczzuM=;
        b=ei6JULitsFhbgfAZ24+RaiEeLa02y/PA2971Z9LKBTMvBdWqXhjQLRwbt8Jd9uH1iI
         5mHPePMlHhLKV9+zVML8HriK9neV9v7MwqlsiZEsfwTIa5OI4LgDLFGyahk2YxZaAwdh
         8gYArtxeqLvUfvVDxFJdwGxTs8iQ+dPCb4xMjODiXjloxoGflBY6ukulrmhlKco2cq0F
         qwBOwepiUxsrNpfi1XdEsgmf2wIgDoKylrTHOJp06oPSmiLroa8zkFOhisUe6trGG5yB
         C0L6hl0KQ2gp6oJwTcbmwAcHx+1+I1NUcoxzNmPpZ0Nl1/4X4SSuwOg0QUhYM3NyyPFj
         XiiA==
X-Forwarded-Encrypted: i=1; AJvYcCUlUXNxe35yzFLYqE4RMNzo51MXqdWhBgNQ8XyiqxsgyslyM8ezl0zRYTs1u7qMY8BDL8FThCrwMXPmTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs14KypSlI8FOS+jaFyJguE7jiC/BAm6V04VJZW+3BISosWhoE
	R6fpkDchcpI055FGmp0EgmTrebdVJJbHgwHsFkrrKymWIOE91lKAlMPW
X-Gm-Gg: ASbGncsCh7SEnQ3KB005fp2bv/ig7CTejkOWjXFEhEAtrqozT2WT60Q7WLWoUmiM+pc
	hARXzgDeYp0gTDuzw3Ei8UDFOQtBt/PyEUkj746NhjCXbck2rxVeOz74eaulX96dlR/+RrYIjjp
	B40h92Jb7SSlNJXoARWO/EZDbeg/rdQa5Vd/7xPWcDnahz6hNV7PGVxUDStaQcIzeCS4+Nxj1GD
	saRt+CfeWazyMdnG+333xX8p/DyqPvYiKG+1AO885AX2AaZAR+yH5IbA5nBXNJrbxDSzGYsay1g
	nZfaip3P/2FYsW5r8L02ys34L2ut3gHasA+RpFREbWUGVVmbApsBIi5eJ8nHcA==
X-Google-Smtp-Source: AGHT+IEfbkfcZRq4LtMkAB1ieDknj+ZtHn8ASi39Vjkgb0xAmI76H9GASGCBjwsfab0bMI2SVyGiQw==
X-Received: by 2002:a05:6a21:328c:b0:1fa:9819:c0a5 with SMTP id adf61e73a8af0-21fbd55aeefmr6746644637.11.1749952480676;
        Sat, 14 Jun 2025 18:54:40 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe15bb83asm3467761a12.0.2025.06.14.18.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:54:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:53:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <risysfu5twua4won3jajotsg36ua6gpevoqnsawny3m2n5bj3g@srls6h24kmw5>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
 <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
 <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
 <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_185441_474565_8D0DAB37 
X-CRM114-Status: GOOD (  15.98  )
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

On Sun, Jun 15, 2025 at 12:34:24AM +0200, Alexander Sverdlin wrote:
> Sorry for confusion Andrew,
> 
> On Sun, 2025-06-15 at 00:20 +0200, Andrew Lunn wrote:
> > > Also ethtool seems to be incompatible with mdio muxes :(
> > 
> > Please could you expand on that, because i don't know of a problem
> > with mdio muxes and ethtool.
> 
> everything seems to be fine with ethtool and mdio mux!
> (I accidentally mixed up host and target consoles)
> 
> # ethtool eth0
> Settings for eth0:
>         Supported ports: [ TP MII ]
>         Supported link modes:   10baseT/Half 10baseT/Full 
>                                 100baseT/Half 100baseT/Full 
>         Supported pause frame use: Symmetric Receive-only
>         Supports auto-negotiation: Yes
>         Supported FEC modes: Not reported
>         Advertised link modes:  10baseT/Half 10baseT/Full 
>                                 100baseT/Half 100baseT/Full 
>         Advertised pause frame use: Symmetric Receive-only
>         Advertised auto-negotiation: Yes
>         Advertised FEC modes: Not reported
>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>                                              100baseT/Half 100baseT/Full 
>         Link partner advertised pause frame use: Symmetric Receive-only
>         Link partner advertised auto-negotiation: Yes
>         Link partner advertised FEC modes: Not reported
>         Speed: 100Mb/s
>         Duplex: Full
>         Port: MII
>         PHYAD: 0
>         Transceiver: external
>         Auto-negotiation: on
>         Supports Wake-on: d
>         Wake-on: d
>         Current message level: 0x0000003f (63)
>                                drv probe link timer ifdown ifup
>         Link detected: yes
> 
> But we do have some troubles with the internal PHY with Inochi's patches
> on SG2000, the above "Link detected: yes" is actually without cable
> inserted.
> 

Interesting, I have tested this on my Huashan Pi. The link detected
switch to "no" after I pull out the cable. I wonder the test step
on your board.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
