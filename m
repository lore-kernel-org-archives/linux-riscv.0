Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79CCCDE031
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ix9sIm5c2I12L5JAWlesC6FZCoy86AQjS2XMV+lLso=; b=nOK+1hTf9mZsoT
	fvafgBbkRCETGOsguvzP8MDmJFpCYhpdzZocj8QvcSg6oG7Ta3sm11GVkwJClZWV63mVdmQd27Q3j
	DhfPhsXmlNxYPUuBMhwUSNu4eL8rZlv1TcucO5alllO40IxdHMqHsPqr2n7GbA4lnUQCZpQBrG7Ar
	ugtKIsjghMC6lPr5INyJI+De5kocwKpjndpo83J1yHyikCHw6vLN3m51xTQaKB1y4iRDraRkmdVlz
	6IEmJc18rCUro9tJ8/9NrJeb8k4vk7Horro4e81RNZbNNFyCPl8+6c0iJ05LJH3BKLV6aX2zo8PJT
	rN9kI9xSdiIMVUieUqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttwV-00000009DFv-0fHZ;
	Thu, 26 Sep 2024 19:14:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sttvJ-00000009D7y-3pZ1
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 19:13:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206aee4073cso14069995ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727377988; x=1727982788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y4WZTo6nI26Bhfdln9Gf7wFMawvUlUInYNk7SP122zU=;
        b=cmBqgZcJLvvum3ztj/+BBWhwUDqbrhBsK9iNhwt0LVuxnXrp8+Xvw7oF8UWtz5U+tI
         yxiIBVrE7YNDFyspJs5CPFIRT9FHSbNYZl5Mf2Yr5ssJJqHo6H5gm04IRYMiLQ8DBq6K
         W8tHhqEfAJqqfP3ng7bmqKkyz0e6zdhEsBqhtm19oQ+cipYCpIqRfrAp0gSEFVpL2wBr
         TD/0LH9xxvD56aTWgrEJ0rZ8lOnjJxI8DwZzKNaM1ZrBBQRD6+7qcAwpW2wIdqrrDBe0
         Pa/oKWgH1eItqoh+AHShmCt0EBmFu5x+vdU5WlFsaeeB3V4YYNCPNIZo2/kBVaiEnJZf
         g5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727377988; x=1727982788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4WZTo6nI26Bhfdln9Gf7wFMawvUlUInYNk7SP122zU=;
        b=GALYc33yJpxpX/gNFHhukdcwneO20Q1yHW+PUT0/obtoXHi9YS2eAoqL5xj+4dFQ60
         p1Eb5DjiDNk+6ECntK/63y3bse4BAkD6+aF0p+9qc0U8qD2CKGQtSqKEl080kIWamjff
         ecjHxAO7SldX/MwatE5bw4FHn6H3qdxXYfh5rjZvf5/4g+PA1t2fGD3wr6aJ07ut84DK
         VIRpE3wu125uaGSfRh4vlJe1PedYGsVjt/Qwj9bPx21EklnZJe8zofDByXyONmEms2T1
         wkAMja7Vdr3sesDtcBECa8P+4+31+JahyMbY73WifRFZRk/5D9gKq9ynXIqG8Thn8uar
         DCGg==
X-Forwarded-Encrypted: i=1; AJvYcCVckYpCD8HqA6gjsmORD0KtTn32Y5lTE13uIEcbUxr2LIXEFnNeUSRK0cfCShIcRIIeeKfUMA2Tek65eA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0/9i8SRVoyOmzC6wDtILvLvfgW2Umbr6p6b14eOb8df8gecv5
	Ib3aszMxGswkphQkQ+pYdgJ2tRfTO1uWbCcxzVaxBCBN+BUMsMBbgL3kN4FPfRz9n882fGurBy5
	v
X-Google-Smtp-Source: AGHT+IEMklrWdPx+X7c21DcecTVJ7lxpddUaIsHWWZy+aOWGUu3YS5G/It5NPJNOcBI2+VtqDMCCmw==
X-Received: by 2002:a17:903:41ca:b0:206:9ab3:2ebc with SMTP id d9443c01a7336-20b37b7c063mr8647165ad.47.1727377988323;
        Thu, 26 Sep 2024 12:13:08 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e543dasm1740175ad.258.2024.09.26.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 12:13:08 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:13:06 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <ZvWyQo+2mwsC1HS6@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_121309_965979_B0D611E1 
X-CRM114-Status: GOOD (  14.59  )
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

On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > +&mdio0 {
> > +	phy0: ethernet-phy@1 {
> > +		reg = <1>;
> > +	};
> > +
> > +	phy1: ethernet-phy@2 {
> > +		reg = <2>;
> > +	};
> > +};
> 
> Two PHYs on one bus...

Thanks for pointing this out. I will move phy1 to mdio1.

> 
> > +		gmac1: ethernet@ffe7060000 {
> > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> > +			reg-names = "dwmac", "apb";
> > +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > +			clock-names = "stmmaceth", "pclk";
> > +			snps,pbl = <32>;
> > +			snps,fixed-burst;
> > +			snps,multicast-filter-bins = <64>;
> > +			snps,perfect-filter-entries = <32>;
> > +			snps,axi-config = <&stmmac_axi_config>;
> > +			status = "disabled";
> > +
> > +			mdio1: mdio {
> > +				compatible = "snps,dwmac-mdio";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +		};
> > +
> > +		gmac0: ethernet@ffe7070000 {
> > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> > +			reg-names = "dwmac", "apb";
> > +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> 
> And the MACs are listed in opposite order. Does gmac1 probe first,
> find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
> probes successfully, and then sometime later gmac1 then reprobes?
> 
> I know it is normal to list nodes in address order, but you might be
> able to avoid the EPROBE_DEFER if you reverse the order.

The probe order seems to always be the ethernet@ffe7060000 (gmac1) first
and then ethernet@ffe7070000 (gmac0). I do not see any probe deferral
in the boot log [1].

Thanks,
Drew

[1] https://gist.github.com/pdp7/02a44b024bdb6be5fe61ac21303ab29a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
