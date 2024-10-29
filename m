Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C6D5B865
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 03:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx0v20OsDcwtpcdDLfTdqTTovZqsokmRbIviPBC7+Ek=; b=Y4nmXYxKow7C4O
	FI4fFBHRkHn0q2NyiC+INvzZ2EGx1uA28bfcYKPYxL63ZRlg5M4SkWD7RbsClDvVVrH6no/zRNB4c
	8mClMJTzBOqgym+0h2IBomiRCfV0I4QXWccpfQL0dpTuSpqnZqm3gyDcXKieqhPY/Q/FQhLWWUpVL
	4QmcgAcYQWmGe8m/JDg0BvXLPReq0q8dsfIcR9BamUPZgzKy5olqGNTpl+tLeULMaSnMNeAryvyEG
	RhSz/4SQ8ugjpsFXWsO/nMW7XRMRxWBTf9dlTgngd873UIcA67qAEEZ1tAzJHtn/ERxA055/4b+ZX
	izozUkB1B/BfmOL2hGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d2U-0000000D6NE-3r57;
	Tue, 29 Oct 2024 03:37:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d2S-0000000D6MY-2150
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 03:37:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20c714cd9c8so50351445ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 20:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730173019; x=1730777819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EgIs46VKTRXxZFzsmboe1Vla7wwZ28w6yjRfWTTcG7E=;
        b=kPGjmfNM6yhzjatD6Cm336F81EeDKsGFtj0BSKvqjHzHEFsV/Z/nqiQh7Z+O5zzXV1
         1xk5Ih2EWWHk45QhFjwnuRwBlpX/VsKf/bwU0EEHH6iDYzyQ9C3lYbbCLG1aDzBIPoK5
         wdJUtdOCWHofbg/rEEIwN4rVn2femnEh6sr35+EhHylgEftZdgqmviuanO9O0+Jdet3J
         l9onIae7GVnNJy9BruPJrndXBIeh01LKd0tETuBBHF7fANoKo/4zO9P2JpZXmi+4I2Vn
         fV3B1VQTK1omvrRe/L4Xa/wZCebtLePl0vVLT0OpsgFVrWWw/sFrI8OUThPCOBHeEhw9
         AuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730173019; x=1730777819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgIs46VKTRXxZFzsmboe1Vla7wwZ28w6yjRfWTTcG7E=;
        b=T4Cbunz0sr1IR+z7yqAekUEoinFLNKxA7H2SjzM4F8SO/Ytgm80VpZmvYH+K74nIyZ
         jquYY91Prx0qt9KRHbgGrKmY3Ys4ex5zjpMaBuh0DUEPOUyAtjZsJBiwyg+Ailyhh2FC
         Rct52k9COxjwGUMXvOXHWmVBmcj2r1LXdcE0Px3nmAdW+jBo5Bm36ps55RzXfhEhOPi0
         sSqKHOuwaAxrEzAF6A9gafHsTvpkHKun2b3LhkF9cVdq/Oy8HsN+doaPx+C0OMFS/NtU
         OX2bcn0VUpNLo44Cdh63cwHMAt1qWmMozj6h0k0QsG2noPYK8fQzk4VK4TX+iMUQpuEH
         eZHg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Iy6nI0yEB/RzHZPOzPJA+w0GZy9PpzyudrfC9GKu9Iop34AQCpc/vPu+GRCiOXumK6b+GKVauiYeAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvxhqHZhqdnQ2ueUkwrVTmmSKy9q5kfX+UzhqjTpkUAI7xoxRQ
	HLN7dLRG0XKRVihBtycnAY1KS7lzNCsnB1w+VHTSzY+Jci0J+X/wHAXfRg==
X-Google-Smtp-Source: AGHT+IH7E5KOZwH2Aycp5b0wrZCV4lKGbdlSkydNAi8Hwl/gm3YX6Bjuz/Jj61OCVDFj7QWo+41dnQ==
X-Received: by 2002:a17:902:dace:b0:20b:a41f:6e48 with SMTP id d9443c01a7336-210c69ed062mr145051695ad.27.1730173019540;
        Mon, 28 Oct 2024 20:36:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc013405sm57944485ad.135.2024.10.28.20.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 20:36:58 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:36:32 +0800
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
Message-ID: <4uzr7ubzy6x474a36gevlzw5s54yemrfnoimjk3dlrfwizljzr@syo5hpafkeju>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
 <ab0ed945-07ff-4aff-9763-e31f156df25f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab0ed945-07ff-4aff-9763-e31f156df25f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_203700_546990_32DB3D7B 
X-CRM114-Status: GOOD (  23.03  )
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

On Tue, Oct 29, 2024 at 03:50:41AM +0100, Andrew Lunn wrote:
> On Tue, Oct 29, 2024 at 06:43:03AM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 28, 2024 at 02:09:06PM +0100, Andrew Lunn wrote:
> > > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > > @@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
> > > >  			status = "disabled";
> > > >  		};
> > > >  
> > > > +		gmac0: ethernet@4070000 {
> > > > +			compatible = "snps,dwmac-3.70a";
> > > > +			reg = <0x04070000 0x10000>;
> > > > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			phy-handle = <&phy0>;
> > > > +			phy-mode = "rmii";
> > > > +			rx-fifo-depth = <8192>;
> > > > +			tx-fifo-depth = <8192>;
> > > > +			snps,multicast-filter-bins = <0>;
> > > > +			snps,perfect-filter-entries = <1>;
> > > > +			snps,aal;
> > > > +			snps,txpbl = <8>;
> > > > +			snps,rxpbl = <8>;
> > > > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > > > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > > > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > > > +			status = "disabled";
> > > > +
> > > > +			mdio {
> > > > +				compatible = "snps,dwmac-mdio";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				phy0: phy@0 {
> > > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > > +					reg = <0>;
> > > > +				};
> > > > +			};
> > > 
> > > It is not clear to me what cv18xx.dtsi represents, 
> > 
> > This is a include file to define common ip for the whole
> > cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> > 
> > > and where the PHY node should be, here, or in a .dts file. 
> > > Is this a SOM, and the PHY is on the SOM? 
> > 
> > The phy is on the SoC, it is embedded, and no external phy
> > is supported. So I think the phy node should stay here, not 
> > in the dts file.
> 
> So this is correct when the PHY is internal. However, this is normally
> expressed by setting phy-mode to "internal". The stmmac driver might
> however not allow that? If not, please put a comment indicating the
> PHY is part of the SoC.
> 
> 	Andrew

Thanks, I will try "internal" and check whether it is OK, and add
a comment if not.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
