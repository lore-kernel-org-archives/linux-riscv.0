Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2934E6748C
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 22:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcERKbnEerprrafyGsimCYbX3M0VxHLZXlqulWdT2NM=; b=MywdJN+Eog5qTQ
	w1Eu3DPbU1v6tXgxdTj7PxTjeaFcPq4SRzIjCN+AuqhVK5vmN+jhFScmHoZgRi8Zz+7wz9CysJM1X
	tjNfOPB1zCxAln7MYQYonSXHrh2iYqRatli+uFyK+6JbXIph5JDBwxbmiuYAdhYsNerG8P587e8fM
	5nPngqPqeOzuKIJS8JLDwq+GDlNLx1YB7i7q2LcWX8yZA8a/p8OP+i0WohzxZsJB9cYVn5CXG+1Il
	SInrN/bZJClviGxfJH91ZHYXp5sq7w30x7U7COzVKDQWixU7psFiPVVciu/gfaRPanbXfNh8NJ4Gt
	qnONdxufU+nqq6Emazgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6dwh-000000055b3-05MX;
	Thu, 31 Oct 2024 22:47:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6dwe-000000055Zy-47u1
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 22:47:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso13818925ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730414831; x=1731019631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQCrudqNvXdy7lrxuF49N08JEGcOIqKAEAmppY5ECKA=;
        b=B+7N003WVjMDe/7Qsx2tUXj9pbjeEM5wShqRiaTAgkP9Frw8S6l+QTsqBs9z+tammm
         atWadPnsM8TEFWxNF7Q/AOyn6jysT+pMFgkMOAbZrS7rvuk9F8uwruwq67hs/PXsUzJ5
         WXy3fiBwXlk4rIpYcUoI4CnIZPEfRMdWRF+WZSttNy7Zzk/mn8nqWkWevyC6ziUXXk/z
         o2gSQuHKsU+LHRV4iIneHvpkZVVfr4qt7fuL3bRkR2iJd/+mCpZdnDleOxuB5LYbOCNQ
         yHCjj9lx4JesM+GigN8z9FWSXFbo694onhFZeisplVvSsj6nr/5UhxOHv+8nmWDnJLeO
         1dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414831; x=1731019631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQCrudqNvXdy7lrxuF49N08JEGcOIqKAEAmppY5ECKA=;
        b=EKehlJimhyvryCIMPfGprKudUZRGx77FPulJgvIKdYc0gK6n+HEJE48/U8PO0i2wZd
         XbSEsjz6DZl+ah9nu2YnFWo1KNeZYyroJt3G4ZJvufJfezdqHzF1iom9TssBK2INMkUc
         bFLDgqzgnjgMVWZNO57xk00Q8xrGOJpmBLdAGw3g8wwiXK0UWr5M8ir7QCbe5/Am3MJb
         2Cy+1bxWUvEWnU1kAti4J+liYaOIDjJMuYmMrfggak1MlN87/ZY1JA9dUBN7ZL8eUSzG
         yu7aXmpm1j6Y+Pm0FF3nazS3S3+n5st88WvwACCrPfsv3fXFVxDhqDe7H4ZJL5JSLg5a
         96aA==
X-Forwarded-Encrypted: i=1; AJvYcCWqbEg1rSWiamibFZ3x8No5lhsDUIq910LTMgkz9ieaGObTm5OutLpwx7EB7faYxw5DXvVytaKAQVws4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGLO01rvAgWyzc3RAl33AlZSiqzsyFzo42KG3dfGm/RPb0IClX
	QEP5YBBTIHWp3UYApZVy1c0H0CmewFQ4uNSvuolgC1e///ELFDjt
X-Google-Smtp-Source: AGHT+IHG/sKyN58dDIoIT5G3OVlXe0NhTIIngTp1CVkh2jnU+eHCNSuLvxChS6xstMqP1z4RZCpBEw==
X-Received: by 2002:a17:902:e5c2:b0:20b:6188:fc5e with SMTP id d9443c01a7336-210c6ae9baemr269872565ad.28.1730414830985;
        Thu, 31 Oct 2024 15:47:10 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93daacb29sm1700296a91.14.2024.10.31.15.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 15:47:10 -0700 (PDT)
Date: Fri, 1 Nov 2024 06:46:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Cochran <richardcochran@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: Add ethernet configuration for cv18xx
Message-ID: <nkydxanwucqmbzzz2fb24xyelrouj6gvhuuou2ssbf4tvvhfea@6uiuueim7m3a>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
 <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
 <e389a60d-2fe3-46fd-946c-01dd3a0a0f6f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e389a60d-2fe3-46fd-946c-01dd3a0a0f6f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_154713_049652_CA33E442 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, Oct 31, 2024 at 02:04:31PM +0100, Andrew Lunn wrote:
> > > > > +		gmac0: ethernet@4070000 {
> > > > > +			compatible = "snps,dwmac-3.70a";
> > > > > +			reg = <0x04070000 0x10000>;
> > > > > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > > > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +			interrupt-names = "macirq";
> > > > > +			phy-handle = <&phy0>;
> > > > > +			phy-mode = "rmii";
> > > > > +			rx-fifo-depth = <8192>;
> > > > > +			tx-fifo-depth = <8192>;
> > > > > +			snps,multicast-filter-bins = <0>;
> > > > > +			snps,perfect-filter-entries = <1>;
> > > > > +			snps,aal;
> > > > > +			snps,txpbl = <8>;
> > > > > +			snps,rxpbl = <8>;
> > > > > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > > > > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > > > > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > > > > +			status = "disabled";
> > > > > +
> > > > > +			mdio {
> > > > > +				compatible = "snps,dwmac-mdio";
> > > > > +				#address-cells = <1>;
> > > > > +				#size-cells = <0>;
> > > > > +
> > > > > +				phy0: phy@0 {
> > > > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > > > +					reg = <0>;
> > > > > +				};
> > > > > +			};
> > > > 
> > > > It is not clear to me what cv18xx.dtsi represents, 
> > > 
> > > This is a include file to define common ip for the whole
> > > cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> > > 
> > > > and where the PHY node should be, here, or in a .dts file. 
> > > > Is this a SOM, and the PHY is on the SOM? 
> > > 
> > > The phy is on the SoC, it is embedded, and no external phy
> > > is supported. So I think the phy node should stay here, not 
> > > in the dts file.
> > 
> > There is a mistake, Some package supports external rmii/mii
> > phy. So I will move this phy definition to board specific.
> 
> When there is an external PHY, does the internal PHY still exists? If
> it does, it should be listed, even if it is not used.
> 
> Do the internal and external PHY share the same MDIO bus? 

They share the same MDIO bus and phy id setting. When an external phy
is select, the internal one is not initialized and can not be accessed
by the SoC.

> I've seen some SoCs with complex MDIO muxes for internal vs external
> PHYs.
> 
> 	Andrew

There is a switch register on the SoC to decide which phy/mode is used. 
By defaut is internal one with rmii mode. I think a driver is needed to
handle this properly.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
