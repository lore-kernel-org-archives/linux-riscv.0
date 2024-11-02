Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9A3E6F09C
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FDF2Q5DJjxmW2rN1ZpU1b1ozoQOgC8IH8OCVYV6jGA=; b=YCK4Zazb/AYwpa
	qo7s0/F3ynOmWjPyi1lWR02jSsyvOcaVTlqLssoM7BsW+Bs+qBbKEo/lkdPO2HbFfJ9l9+sDilpoZ
	xeuePzFTdVwQrYh+d+MG/lcPdiPB75bBpuvLTcPCM5MeddG6T0bU7+EAZ/7zBSTp4gvBxKip/Soee
	o259UF1hXYyfpvpwM3elMcfKZfCH9Yk8wn4JxGfyQBkFIh1bmx+AZHmSsRyxJNracjH5RLgslm1yl
	AX3Vd5KFykduShdygOr1CgHJE99ybeXR2jwRXZ4hC6b8ca/+mLdmtbZ7eRUedcvKVwJIJmxywyggz
	S1fCCHQJEE+zA4TwDPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t72L2-00000008dZ8-2swh;
	Sat, 02 Nov 2024 00:50:00 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t72Kz-00000008dYg-1Etq
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:49:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2226556b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730508596; x=1731113396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXIAuR/51D0pou43bt+LOMQQ2AlEuDQoocShKXn+15Y=;
        b=c3I+4F/QudkwlcOm8g6DOo1qA4f8X5MWR9aUXGsyD/XKuS1tw5beqiTiHn2eID+usm
         WZyjPhr5o+xq+uzc7ZszjbOYIdy/bVVi8cKfmuSy2xlDUJelJY8hazwwgF4Wioqngwnc
         bkIu4jEV/Fhp0lyvNh1E51MjQ/2GcklYbs/DUi+hx2Pl4cxlpQptzpu2ZDHmKR8sn654
         QukG7sjRCTAJfnpIcPRNV5d3rRRs8Li+kvfv+2dxRz/ccUpAFAEdLao0LgUGGDIGy3GO
         ksfoywyydB65SwSlm+6MMzUAx2iKgJVCN7qECFn/eg5ttfvs3L7VcdYfow6FZGjJ2ea0
         R6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730508596; x=1731113396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXIAuR/51D0pou43bt+LOMQQ2AlEuDQoocShKXn+15Y=;
        b=K4uQgzxGux4GyEbqf8w88ojFvLk5fDOUf60+7kDO7Ls07AA+6/Wd9ysm5iOwS+dNT0
         xATdnBJLZCRv122rL8vVwbm/rSX7o/6pYQdmbOyP/ZeCa9BZ2RiPFty9YGDxDr9tKGp1
         jp+RV+yaA5mbPcDPSd2ealcCcARXsb6jOOT9RA9RZPaq0AkRxRCiuSYvB2s53kXVsbIa
         uF4pTzv73iOP5hZNqqPAYZfTovshpT94wkewcNBSSgALnygofbw9c4xyIvyG9XjAKCJg
         tTzqIDCSeRwixlmVw1XkXmu7fh8s1ZPqbUUUeU0VcfsYF3fGs0hZLq7U1SSaDEuBVSel
         6Bcw==
X-Forwarded-Encrypted: i=1; AJvYcCV5BlQPyvkH6Nu5+JaQioeF9EOQPf8m8LstlLK9O5cD0m712gdgdH5+KPBoxp557ii2KAYbqiJr/QDDMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF01Sjlg88UZPy2ksLPkW82DnV3HicAohBR/CRQypXWJvDlQlf
	DiJuxlgrY/6oXwZbVlDgrQeUqQOee3ZgwMaPN2rsDACggv22hY5Q
X-Google-Smtp-Source: AGHT+IHbrS7Zz8aqhA9iNJ6BENNi1qi8TjZ5N6MLO9abZP6T/0eW2eyn4Dxkv2ihng2PAT86PcvCUA==
X-Received: by 2002:a05:6a20:b40a:b0:1d9:29ab:9b49 with SMTP id adf61e73a8af0-1d9eee1e129mr15296159637.32.1730508596196;
        Fri, 01 Nov 2024 17:49:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f9050sm3127263a12.74.2024.11.01.17.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:49:55 -0700 (PDT)
Date: Sat, 2 Nov 2024 08:49:26 +0800
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
Message-ID: <nrpyz7kdbcx2zlrgtqd7fkg2fb5n2s4matjj6ouy6jxcubcwzy@vwnlhrgchgm3>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
 <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
 <e389a60d-2fe3-46fd-946c-01dd3a0a0f6f@lunn.ch>
 <nkydxanwucqmbzzz2fb24xyelrouj6gvhuuou2ssbf4tvvhfea@6uiuueim7m3a>
 <5b08e092-c302-43a9-a04d-3566bec96e94@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b08e092-c302-43a9-a04d-3566bec96e94@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_174957_359914_4BE6DBE9 
X-CRM114-Status: GOOD (  31.49  )
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

On Fri, Nov 01, 2024 at 01:40:00PM +0100, Andrew Lunn wrote:
> > > > > > > +			mdio {
> > > > > > > +				compatible = "snps,dwmac-mdio";
> > > > > > > +				#address-cells = <1>;
> > > > > > > +				#size-cells = <0>;
> > > > > > > +
> > > > > > > +				phy0: phy@0 {
> > > > > > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > > > > > +					reg = <0>;
> > > > > > > +				};
> > > > > > > +			};
> > > > > > 
> > > > > > It is not clear to me what cv18xx.dtsi represents, 
> > > > > 
> > > > > This is a include file to define common ip for the whole
> > > > > cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> > > > > 
> > > > > > and where the PHY node should be, here, or in a .dts file. 
> > > > > > Is this a SOM, and the PHY is on the SOM? 
> > > > > 
> > > > > The phy is on the SoC, it is embedded, and no external phy
> > > > > is supported. So I think the phy node should stay here, not 
> > > > > in the dts file.
> > > > 
> > > > There is a mistake, Some package supports external rmii/mii
> > > > phy. So I will move this phy definition to board specific.
> > > 
> > > When there is an external PHY, does the internal PHY still exists? If
> > > it does, it should be listed, even if it is not used.
> > > 
> > > Do the internal and external PHY share the same MDIO bus? 
> > 
> > They share the same MDIO bus and phy id setting.
> 
> What do you mean by phy ID?
> 

It is just part of the MDIO mux. Just ignore it. It is just
used to show only one phy can be used at the same time.

> > When an external phy
> > is select, the internal one is not initialized and can not be accessed
> > by the SoC.
> > 
> > > I've seen some SoCs with complex MDIO muxes for internal vs external
> > > PHYs.
> > > 
> > > 	Andrew
> > 
> > There is a switch register on the SoC to decide which phy/mode is used. 
> > By defaut is internal one with rmii mode. I think a driver is needed to
> > handle this properly.
> 
> This sounds like a complex MDIO mux. You should think about this now,
> because others have left this same problem too late and ended up with
> a complex design in order to keep backwards compatibility with old DT
> blobs which don't actually describe the real hardware.
> 
> 	Andrew

Thanks, I wiil design a driver for it to handle this mux.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
