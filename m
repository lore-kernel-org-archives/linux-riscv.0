Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6EC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4guY5e2sn3EXUf6vDtrzaoNfn3nTO9xB7cGDnObLyxY=; b=P6A/DVIEX8PcPK
	vqi/PgXA9nrpedem1yvyzOSxJ0vU0/grFcVBUyW1VatzSMAw+rMC6hVlKMzBBi6RkWaalXnu6OXcK
	jflwXDn9cZq+UloF06xr6ZQngkefdzBaesv51AOpoWPJi+KB6b2vjWiuYgobCKq9vkOhgpm77l7wK
	r+2ybk8QxZXXpWdcs2NyCtnizEc9ke1otvWc17MPyCmse3nlUw5gZ5i63CSAkSfmdND4i5PspDWgU
	uIWAXjXtYB9b59OkkbYFNhMdXlPDNEitMlRuIBTDHRkb2O3dDdGVdiAivPy0QLFUIlrAp+lUej1nP
	Vczxbcj6iECeEs4AUruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPij-00000003oqI-40cz;
	Tue, 01 Jul 2025 01:23:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPih-00000003opx-0igf
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:23:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so4918099a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751333014; x=1751937814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6DtZA4TeVhHJ4LgQPcp62/OtINngczo0Qlp10jTpvs=;
        b=dPoreBmkTPqzf1ZTqGSVPAMnSOijXmGVg11E9VhwTGzt2RGcn9+qFEKVtDnlF0OiN+
         mH8aLhF3s27fQfrXexZd7wda7aYxA331/lnuS8io4Tahzo4fw5pSxt+Ys3fkba74o7O2
         tayUYWXNSALHtw7cJOGf7BEvWFdfR+4t6IxWGeHnOcWj7gycmB/cxsJr4favuOMUaQzZ
         b4fxCAokOOhMZH65lN2y/fAc/zQUppgpsgfsZhE+Z5V8yqCnO++0a6Ro8WitjFmaLBCL
         O9grpMzmVKduRvUdCecJ/FatoymLi2Jj5XwFB48E60h42riKP5S9sGxeP14dq4YzNo+L
         2wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751333014; x=1751937814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6DtZA4TeVhHJ4LgQPcp62/OtINngczo0Qlp10jTpvs=;
        b=pUlVznzv7pQlAdTgXfDYs2l/gBQ/Thw/gPlVg0lwi5StRJBHgfeuaI6FB740YsiZ0q
         +gyJAcu9rvrIs7fwpd1JDtxSkF8yjLluM729VrMZR+E0hKpxa/d7PPukhD/WMDOf1HML
         DqwBra1KINp2V/AVnS+D1Ek+2eYh7SAZjVRofeUcJA2NXGTNhtG3ZCkvbUqHyFybG4uw
         Ne0PC3gzu1Ra4R6MsXIz2S1QfBe7P+o4/Cv3UoASDnQMVxoKxT1aNY+7AuE33fXcbTft
         ehFQ6n4wUDukAcU4JjzWXHBifS+UBATcxaB5RasIIJivvXJpp6UcAdxdqub/RI2bqRiF
         Vs1g==
X-Forwarded-Encrypted: i=1; AJvYcCXx1AvCCJsBYAVUvNOH6Fvhne1yrbgO7jWiPXrN0BPJWMULTEEF7E3XMvpfQMmWYVuy6qUK+Ewv2rwSXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6LP7pgpeuZSmtOjKIJ2fmPQINPx9Uhr7RSte0o0I5zZ1guPd8
	gVUKdP0n/T2HRNOFOUqts8+N44d6+eacpQF/0c2c9r3SOZt98pawqF6i
X-Gm-Gg: ASbGncvV1/vdO3ZsVRrUMoWUcQ+XD+m0FPvx5xIedIXbBV0B2gYHK6uAP21KZEKM1gi
	eki7gi6onBNjRkHGv17whclFkUA7bFBoJrGS2i5POc09s0TkaiG9r+ZlOIzDBInqxlZ5StbuoTg
	EyzlGvz7l1iZ/t3/IvyLnfcP/W3vRgj9qbNP8derJh5zgTDbd3qpv1zfQ4ZN3KPQ17hgvocf5JK
	8Lc56GhMv8mWuYpnqOOqlsIcaGzESB4kM+X7l9TdJZmwZNzjN0ieFNpRn1ytKXTLyUhBVdLYkmm
	Uhjilt0wUhwLEX21PiH3mml1cMqh7jh6idbAGRqd8nohAr1+5M0c7fwF96rwUA==
X-Google-Smtp-Source: AGHT+IHBfzg5Sx40TE02hAClbOF6eEZK4Q2Z0GmTczaAMMCBaM6R3MFw6f7sjjsS70ov9TvAF6LTsg==
X-Received: by 2002:a17:903:1b28:b0:235:2403:779f with SMTP id d9443c01a7336-23ac4682496mr217436775ad.29.1751333014268;
        Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e2423sm91648245ad.37.2025.06.30.18.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:23:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <vxnvovuetfd6rzgaenwplpkhxm62fhw6t3vi4wkyigul7p4bkx@pwlprna4pyul>
References: <20250701011730.136002-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_182335_233241_3717CBC8 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, Jul 01, 2025 at 09:17:25AM +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC, this dts change series
> required the reset patch [1] for the dts, which is already taken.
> 
> [1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com
> 
> The patch is marked as RFC as it require reset dts.
> 
> Change from RFC v3:
> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> 1. patch 3: change internal phy id from 0 to 1
> 
> Change from RFC v2:
> - https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
> 1. patch 1: fix wrong binding title
> 2. patch 3: fix unmatched mdio bus number
> 3. patch 4: remove setting phy-mode and phy-handle in board dts and move
> 	    them into patch 3.
> 
> Change from RFC v1:
> - https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
> 1. patch 3: switch to mdio-mux-mmioreg
> 2. patch 4: add configuration for Huashan Pi
> 
> Inochi Amaoto (4):
>   dt-bindings: net: Add support for Sophgo CV1800 dwmac
>   riscv: dts: sophgo: Add ethernet device for cv18xx
>   riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
>   riscv: dts: sophgo: Enable ethernet device for Huashan Pi
> 
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
>  3 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> 
> --
> 2.50.0
> 

As this is mark as RFC due to the reset dependency, now it is OK
to merge it as the reset patch is taken and this patch is a minor
change . I hopeif anyone can take the binding patch so I can take
the devicetree patches.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
