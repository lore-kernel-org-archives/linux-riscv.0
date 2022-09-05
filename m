Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FB2ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyFUjSj6oZ2A/ZwrryVUXMGOG+whvzl0z7g+pHz3swA=; b=oo/qrW8nqNWvER
	Xfbbww2gSGCvnZs1dgseBT0vR3orqQZqrozknxcQHfRPWSz4agZhm3LP/rR4ZK+SkYeOklLNogXss
	fC+nvD8pDyB6UXGxozqAtd7PbD6L5sFlZTn88wGzdx4IA4x/aJq/DJ2XCfRJ37D9y81XKR1zlo6WG
	/erW/Krn41rl2n9z/N/NrLaH9WPCktZhCXl6pIFjqEpXrqaaG/TnvycSLBjdCzykotR2TZZyQGNGG
	GTxmiQYYy+L3z9+XNzqJG7zvgj5zO3RVROAwsmgRzbkoX7tH2DnFMkRX0DZuU2rFxLFhnP/J2faD9
	sptU72oHICaanKivu9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVH9D-008h9e-J4; Mon, 05 Sep 2022 18:48:40 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFfk-007LzV-T6
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 17:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CUMIXcV5t7ZQeqthxA5sV3p/yXcIvPxOuRdWJnvekYM=; b=Bgh+hwiypOFveZbbjwinXdyxqh
	Hp9ztqlk0eHMoGBZWeofYXhpoo0Ee+cf9uzkZLgdQzBRXbkrWo3b00pQ3NzloLr0iYjRAbhmOmPjh
	vSUyjE+kabeaUv+7gTMpboCiF0dCTG95SeARdHYuNLpK0OJa12AP/iuUmuHCKxHvpTkM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oVFfJ-00FfSv-Ew; Mon, 05 Sep 2022 19:13:41 +0200
Date: Mon, 5 Sep 2022 19:13:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Xiaowu Ding <xiaowu.ding@jaguarmicro.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"claudiu.beznea@microchip.com" <claudiu.beznea@microchip.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= net-next] driver:
 cadence macb driver support acpi mode
Message-ID: <YxYuRaXxtyMIF/A6@lunn.ch>
References: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
 <YwZA+1z7BDCXZn/3@lunn.ch>
 <PS2PR06MB343298952D34545A7372FEFAF27F9@PS2PR06MB3432.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PS2PR06MB343298952D34545A7372FEFAF27F9@PS2PR06MB3432.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_101408_976611_7BC7CA0A 
X-CRM114-Status: GOOD (  13.55  )
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

On Mon, Sep 05, 2022 at 02:25:06AM +0000, Xiaowu Ding wrote:
> Hi Andrew:
> 	Thank you very much for your advices.
>  
> 	There will be some problems with the clk_hw_register_fixed_rate interface in the acpi mode.
> 	It seems that the kernel common clock framework can not support the acpi mode,just support the dt mode.

It has two modes:

https://elixir.bootlin.com/linux/v6.0-rc4/source/drivers/clk/clkdev.c#L100
struct clk *clk_get(struct device *dev, const char *con_id)
{
	const char *dev_id = dev ? dev_name(dev) : NULL;
	struct clk_hw *hw;

	if (dev && dev->of_node) {
		hw = of_clk_get_hw(dev->of_node, 0, con_id);
		if (!IS_ERR(hw) || PTR_ERR(hw) == -EPROBE_DEFER)
			return clk_hw_create_clk(dev, hw, dev_id, con_id);
	}

	return __clk_get_sys(dev, dev_id, con_id);
}

If dev has an of_node, it uses of_clk_get_hw().

If dev does not have an of node, it uses __clk_get_sys(), which looks
purely using the clock name.

The common clock framework is older than DT, and so does not force you
to use DT. Please look at making __clk_get_sys() work for you
scenario. You should just need to register the fixed clock using the
correct name. Look at some of the very old boards which have not been
converted to DT.

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
