Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C48C83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9NEiCWc5TOWqWYD3rmEvtBwECoSy96qDV9jyl2sG6w=; b=Dre3NV0AL2Jg+z
	QYXM0r6MUs4u0JRPejqJbz00w1lUiSp2+eBmAhI4eo3R5Vasso+lzYFkbb4jLcgP7bTJUmREAOed6
	4Z1uX4XEmaM43GowQx71pBO+y/+xV0xQoS2kGcyChon0T6//tMVA3bAln3Q8Dvw2y45oaxmkT82pC
	XNW/V7ftwXabg/cHZQmizHGMQHp04NnWriTg9xSf8qQ6g36YMmsVI6ubx4kzEcYcE8qhAKhi9lvuy
	bwcMPiYuwM3F8bVFeqOlJ340pRewOrau6g77SZSFuqYc2s9RpBtxbHbbaqw/qz3ooMCfRMhWQ2HEs
	+Bqmasj6JuUMHhYWQXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJxS-0000000HVfv-3fJq;
	Sun, 06 Jul 2025 07:38:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJuM-0000000HVRm-2lpP;
	Sun, 06 Jul 2025 07:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gv1HUJnOqcclkZ4FplUtalCiTMkMRTJ+aR4w+vz1yg0=; b=V2voYMJUWgVyz6eS4ODSlICWyG
	Pez+lVqti34ZammDtip+NLzyhbMzOY5ls7FHEAGVlLdkv3qtyCxTAOUx49Rwcvy5S1TU7+lyLqhJb
	R6R777wfhYLIfgxJrEl4W/r6Bhk54kqp5/evaY5l1zo0yW0DrzAVnQ09HCuqspM+tcnk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYJty-000WvW-OW; Sun, 06 Jul 2025 09:35:06 +0200
Date: Sun, 6 Jul 2025 09:35:06 +0200
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
Message-ID: <4ffe4afd-6162-4756-b473-8ad0c10bb59a@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705213900.3614963-6-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_003530_694404_73843B64 
X-CRM114-Status: UNSURE (   5.80  )
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

Indentation looks a bit odd. Too many tabs?

	    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
