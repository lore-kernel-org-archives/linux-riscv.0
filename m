Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B023BC83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4QIgKTd7OBZRREz7daoGAv5X2/IVs7Mu5WWfBVoUfA=; b=CNuueErtk3W1K9
	X796Lvd9gyDOsq0Nz8iQxVdvqsYfAZUBZicd6PPA8Omx9H8fn0B8ZEAMXJbe6TJ1n+UsAne/aD1J2
	Q9zWvjEA+5QFRVs+0+6ZLRSwXc/Vy3hnFM4LClDwWUvCGp4Us9FSHAkd5SxH0KgKrdFDXugpfDQJH
	hewnyDFSvvUvrBvrvUowYVpH/AxmQ8f7L0OLif+EUjgPjiDWwNhq9+j4Jt246gEDCQyzTa9j/lPFG
	8FBfU87LxhEPZj8RhD7yeALqTnEsO/BspTryiaqtmsNaxPHhq82MtBjOVB1PdAIH0KXuTMlFjJccj
	AEzLS0m/dDqsLdKgBoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJzl-0000000HVv1-10Tg;
	Sun, 06 Jul 2025 07:41:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJx1-0000000HVeI-2iPG;
	Sun, 06 Jul 2025 07:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rw4lPHDv7nwh61n8L1sS4Kiu7H3J5SMaCQwqs6E7FAM=; b=vXxICCOaKVxlttHopdBE0sfGcq
	12/JFRTle9Dv+ZpEGXINHHZX6ryDgAp4zfyl34IoGzAl1jraq/vO+HQvTWX+Q50znPezK8MvFliai
	CGW6LPiGD7PH4VeBgyO2S9LvRFmjEogTXdjSAvynOQ9f0oG9yHaaaQKbLVDOaTj6BrQs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYJwm-000WxB-Uy; Sun, 06 Jul 2025 09:38:00 +0200
Date: Sun, 6 Jul 2025 09:38:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705213900.3614963-6-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_003815_683945_457CC359 
X-CRM114-Status: UNSURE (   7.46  )
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

> +&mdio {
> +	lan8720a: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +	};
> +};

Just for clarification: The PHY is on the SOM? I've seen systems where
the PHY is on the SOM, and the magnetics and RJ45 on the carrier
board. I've also seen systems where the PHY, magnetics and RJ45 are on
the carrier.

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
