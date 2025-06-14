Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBF0C7114A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQKi38+pocKrfUQZ9jbz+70zM+GEYFHOqnnQloMVRww=; b=hosG4tHQtD4bpa
	IBzAlPYHwyqsRkwrlqPN/iBuoZoi4rhb6I0NMxAjsp/mIbYBZnRV1948AgPRPF0JIG610KjDWUHAc
	vbMKMfjfgqNai9SlJ1db3tmLSYhI8GhnTITL/RK4ED0qcrxbJ14pdxIOoieJnP/ZzK6hNgORg3AO9
	pCjVzaMFEDX0PznVV9bVPbmKxGJf8jb2MN/9+FuWeENlosxhOAuSmpUnkbPa/J1tOHIaqIQnQ+VMX
	r9ar8koiypqMvaDU2QmeDjrH9XE9heGffAitbTosUmzcGfGZerspd+bzav2n9JdGiH2omaYKCZ4EZ
	cHGrOMOWF/KVzGY6UNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQZS4-00000001vEm-31EN;
	Sat, 14 Jun 2025 22:34:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQZS2-00000001vER-1d5j
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 22:34:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1953277f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749940453; x=1750545253; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eElX0K0mVGFpZdZanLnRJGH007mVfDUZMyXart8hp4s=;
        b=UQ3hyjpYt4taEA+MvVrbAKwSTZlusGSc83gDPaBI2elTUscQIdI3EYVyjyuCKSPpIJ
         9kJp/P3tfxUpMEHIzRQPhiczzZDoxbeH6Pqo/+MJLRE9IxDVfJmaB6Fs8VRzt3dt3sjL
         fa2i2mhsOJUD2AEwVVkdsRi48C8rCiRC8iBG3m1qmLKtOYTmPYwGcCIW7p1+dLSJJziO
         mvZqEp570VdXP7Nwsi31n7lZer4KvueAbGN7p6T4InSOKCsK8Ga3w5Orfw4uRVP+F24Y
         XikLqwojHlgPlFd4V/jYFebkSqsXb4oby1WFdo0Obd0Qu8JxfYCn6+DgfdSVoO4CjlB/
         aHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749940453; x=1750545253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eElX0K0mVGFpZdZanLnRJGH007mVfDUZMyXart8hp4s=;
        b=gO4ed9aRqp/gIOHYmq5wvHUOgXL9KL+xuQ/gFlucIE9ZicOyJbANvHDog16tDPoXYd
         ySwqWMztCXjHTON5AItUZ6GdGWtkMVsITj6hN6MDDLcaxu+JptJ3UJQlzb3p9NUVp3/a
         M7Ikj2Ulz1r2kmh5+kIvFYlBbjV8aZ6Q51KAAwCxtR8CRhyluwMx9rJiFO6smzXnK0DZ
         7UkYvT75ABYwMOUGZZfariir8ELvhxkghWE2Ikq81NSHSVdJPmhVptTLiLpa554d9C9c
         Q4tKHyNkK0ZIvkqUG2Fkso4l+Te3BfO9iIxHuGM1ecFe93Ol6EeuxWAHZ9lZnEFkUZVh
         Rw/A==
X-Forwarded-Encrypted: i=1; AJvYcCWBFRHIdcd900MtRYmg0swWRfRi9NIw65rQTo0TcZWHJLtewu8CwOPad2VioKkxfzByu2x7ckM91cs5Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxehoxW4g1TYBUElIjuh0X73mcJgeCwPR8AdfmSarPFxdqN7u+J
	ol7YSdC4+4bE2uCLiF9vPPFqaiaSpntt8YF6hTp//LBHhhpy3Rz93YG6
X-Gm-Gg: ASbGncs6dbX2gCNYtt+O32WUzOZSWYdiKtp+cdMWt77+iDhCZNm9Dh1DUiVBEChBjax
	zbBESpv6i8I2fuJoIqmvpmOily2CYmU5CCP180ggB9zk+H1HghbeOoOB0awt+7bSdzknM38TQWm
	YnsIFU30Et8UTMqLRT/Rj+pXXELRBvAbH2ffq4e1L0K5VPECQvwY+4MrbVHf/pBcGMbxWoJ7DJg
	mJEb3CNmGANDhmO3ajeeQD6w3TA+LG8W7ahO3bst9fSgTRz97KM9Fy8uBdInVVdHl0lnCEeziEo
	yS8jCwdkgmT5sbdolTvsNg9dJ5PG0kEzX7rydU7A8VLJ4tUzK/NIdrrGOw1LcypzrSz+BnrLzva
	tFAIQvw==
X-Google-Smtp-Source: AGHT+IHUSSE4wReaeDL8ecMX9RxikoVG4MsNqeGENvR2wr/CiqJiGVOf4JzoiiQACFFziT0S6EILMw==
X-Received: by 2002:a05:6000:4308:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3a572e7a032mr4130209f8f.34.1749940452671;
        Sat, 14 Jun 2025 15:34:12 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm92955675e9.0.2025.06.14.15.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:34:12 -0700 (PDT)
Message-ID: <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li	
 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 00:34:24 +0200
In-Reply-To: <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
References: <20250611080709.1182183-1-inochiama@gmail.com>
	 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
	 <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
	 <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_153414_447813_903B56F1 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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

Sorry for confusion Andrew,

On Sun, 2025-06-15 at 00:20 +0200, Andrew Lunn wrote:
> > Also ethtool seems to be incompatible with mdio muxes :(
> 
> Please could you expand on that, because i don't know of a problem
> with mdio muxes and ethtool.

everything seems to be fine with ethtool and mdio mux!
(I accidentally mixed up host and target consoles)

# ethtool eth0
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full 
                                100baseT/Half 100baseT/Full 
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  10baseT/Half 10baseT/Full 
                                100baseT/Half 100baseT/Full 
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Link partner advertised link modes:  10baseT/Half 10baseT/Full 
                                             100baseT/Half 100baseT/Full 
        Link partner advertised pause frame use: Symmetric Receive-only
        Link partner advertised auto-negotiation: Yes
        Link partner advertised FEC modes: Not reported
        Speed: 100Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: d
        Wake-on: d
        Current message level: 0x0000003f (63)
                               drv probe link timer ifdown ifup
        Link detected: yes

But we do have some troubles with the internal PHY with Inochi's patches
on SG2000, the above "Link detected: yes" is actually without cable
inserted.

-- 
Alexander Sverdlin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
