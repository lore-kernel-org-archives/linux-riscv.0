Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA947D5B847
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg61FlCW4GyVsTyQQ23t6Vov5rK7qrYAgmLYLKNqlNo=; b=rvN21JfUyBvgJ5
	SS3pb7p6bjkx5tRDUkh/Wok8Tc+v2xZ3C7RrPraQh7umJaeBl31Yv+WIJMjgmdEhY6k2bHT1i95f3
	mQ+52VYPHETeuzFqdQEF2rAW4WncWp5MLD1nW4wDcpPODpNYvg68JxkGwBSFywpFMeb0l0xF12I5u
	AQvmmo4LhtSNDH/0qy41r4ecrLbgtjvy5DUsQQiv53tpG19jXBxt4FzyZYNlas/XucUx63ImcD9oQ
	sHXdK9UD8QRQdnPluFbmdUT39uvZcJb8ghm7wVsZvlNRFSexFidXYIgdav7ywZcT8Z+iqxQI9KvJQ
	zFgdUX1uLgjqQ9q2f0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YVU-0000000CYx8-1O8n;
	Mon, 28 Oct 2024 22:46:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YTS-0000000CYda-3WlV
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 22:44:36 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so3890928a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 15:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730155473; x=1730760273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgFwSqKxZi3FF7UkmPRYG9KwHiHgPKv/2vs0tc5OzUo=;
        b=XtZ+5Obna3aABT9fAOExPOzw/4TK6Zc4s3STJjlvXfhjMEZOMkluyjLoa9rWReM1bV
         rmj7UBMBNuxQa3m640TiSVSh5fvHGBxRN8PpkSbJdv9isaJqDdIkwJI7fr5QI25qqIbM
         HFXqYKEzx26Wp41qNr7SszDVxVGf2fZdB0pf6QPGax0vChB4W5BYFLeFf2A2WyHVt1Vn
         aFvhS+fwlGWymvpNdNtzriDoBI9TpSuCIMKh+h19zvU7yxjB/LE2Z3XXoohzGrS2MCe2
         UFhEDJt3xFeOzeorlHmqgx9Pumx1JnuhlRmp6otubovvZgp42RCKqa/na2w5r7mZD881
         bbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730155473; x=1730760273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgFwSqKxZi3FF7UkmPRYG9KwHiHgPKv/2vs0tc5OzUo=;
        b=Pn5vI1MfthQq01L8uy6M13tNR4XKUcxotON8hukxOLFVuVnqVHejMbSSUzvxdPhvI2
         IXt5tIu6J+YDpbNajqimZmEg5iO71jMHtziD49MkUzGQLXqmH97TS8l2DziUpd3dGRgz
         rN0YrV/u0ogyYSSCg7Vt1iXWW2aQrUO1BifP9IWoHtxzX43gIeZjC6BpZ2IHyUen+d2i
         jMHqosjtwI7K29F/YJSGO6+YU62gGdf2ERfv4Mq0E08dqspo/FGCF/mod9usQLAWDRdo
         0uJAvY0BQ4a03SgbMAdhVErsxeeQH8eYHETKohVO9UV0DJ9Qk6+0Jzi4Fgi/a//XGpNy
         SR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpvNEjG0Acp+ST22beaTQq8qnLpK4GKZ5gTKI28CxS2eli0X52uu5r3yUt5jhauQaTbXxaDu3zZGeGmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc1+x/Pu+j4m7n/uUDzsvFwh+OvtJGGEZV+zB53gboEG/5UG3Y
	O4GgBmhLwzWXNwlgbzKGrAuJdz6mN9vv45j85X0E67By3E+cuk/G
X-Google-Smtp-Source: AGHT+IHe9JwtrfAxRCZKliVLyemHgefPy4SbHNg75z53OjoVcWbOJ47y7AP7JlSm9J6WnP1SMot6OA==
X-Received: by 2002:a17:90b:19c8:b0:2e2:b44d:119d with SMTP id 98e67ed59e1d1-2e8f11b9703mr10455615a91.39.1730155473542;
        Mon, 28 Oct 2024 15:44:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4e631esm9895493a91.27.2024.10.28.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:44:33 -0700 (PDT)
Date: Tue, 29 Oct 2024 06:43:03 +0800
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
Message-ID: <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_154434_901568_1DA9D22E 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Oct 28, 2024 at 02:09:06PM +0100, Andrew Lunn wrote:
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		gmac0: ethernet@4070000 {
> > +			compatible = "snps,dwmac-3.70a";
> > +			reg = <0x04070000 0x10000>;
> > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > +			clock-names = "stmmaceth", "ptp_ref";
> > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			phy-handle = <&phy0>;
> > +			phy-mode = "rmii";
> > +			rx-fifo-depth = <8192>;
> > +			tx-fifo-depth = <8192>;
> > +			snps,multicast-filter-bins = <0>;
> > +			snps,perfect-filter-entries = <1>;
> > +			snps,aal;
> > +			snps,txpbl = <8>;
> > +			snps,rxpbl = <8>;
> > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > +			status = "disabled";
> > +
> > +			mdio {
> > +				compatible = "snps,dwmac-mdio";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				phy0: phy@0 {
> > +					compatible = "ethernet-phy-ieee802.3-c22";
> > +					reg = <0>;
> > +				};
> > +			};
> 
> It is not clear to me what cv18xx.dtsi represents, 

This is a include file to define common ip for the whole
cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).

> and where the PHY node should be, here, or in a .dts file. 
> Is this a SOM, and the PHY is on the SOM? 

The phy is on the SoC, it is embedded, and no external phy
is supported. So I think the phy node should stay here, not 
in the dts file.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
