Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD19CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmG2UZiAziDP5Z1BR55fAvJ1maHPSItRUynpKnjSwFA=; b=bMatxPLSGjwqHR
	Ryw7XQ4gA4u83Jg0+zmtQQdxFi2c5jDQFUgmc4nNwPm9E9Vm6JGkDajxRtmXaR7OjMfxQThPBVFq5
	w9Qp6F1vPbohLeIS9gBmxGBtrZO1gvXya30kN4LI6Y3V/ifDGfHJvyDS0hCmKNcktLUpJRZzXf5cH
	d8fWvYP20NYKMGUMnDG/JSJDQ1srCXnVusKtizY+qvcfc8aK3AoHXkeXQyq6aAYaprVwXeHbRP5/+
	ox1CiZfK20v1pid79AvlZGHNCEap/t1omyio7SHzNP4bi2cWrRkUl44geLYm77n9jXrnczpCkLeYG
	Txj9ALrqvCtZCLf0KuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhm-0000000GAgO-3EsT;
	Tue, 02 Sep 2025 08:49:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMRr-0000000G4FS-0G8Z
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 08:33:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 13EE525B6B;
	Tue,  2 Sep 2025 10:32:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDc4tFKH60vK; Tue,  2 Sep 2025 10:32:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756801978; bh=UY+3EuO5iSP6Ca8veCG94rttJhjLl+bTbCg9SslgRmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZqHh0CAcSFwGFJzV86GjKww5fya1VvJ72UFJkuIXUci3t/IpYQZEDm1lq1ZxHAbh
	 9wmcE5ahvhUbyov07ceEIfJxqSPBr3T2GBXpzJN1dS1tWEbu5c5tRe9ovZM+O0iIRm
	 vnIol0xag8wL+fYc9uwX4NB/jjGJHOpZcUoZjIyC9lkJq3pTw0z7QVCiN7d2QrhhcZ
	 wafoZEGkgE5a5Btl6Hx3jafiNBjm2JyYmotIE/d3OBEDJ/lG3FXSIPn3rTaJ7DNXrh
	 89HJeXtF4c5OgBZ91OX0rciJW/9ucdsf2j1aHzMOuAsfCkej7wshKO9G9pfHV6cBev
	 eiMC0+LDlrFFQ==
Date: Tue, 2 Sep 2025 08:32:36 +0000
From: Yao Zi <ziyao@disroot.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Message-ID: <aLarlSG9tDA-1YiL@pie>
References: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
 <20250902075548.1967613-6-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902075548.1967613-6-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013303_266031_82609A1A 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, Sep 02, 2025 at 08:55:48AM +0100, Valentina Fernandez wrote:
> Add a minimal device tree for the Microchip PolarFire SoC Discovery Kit.
> The Discovery Kit is a cost-optimized board based on PolarFire SoC
> MPFS095T and features:
> 
> - 1 GB DDR4x16
> - 1x Gigabit Ethernet
> - 3x UARTs
> - Raspberry Pi connector
> - mikroBus connector
> - microSD card connector
> 
> Link: https://www.microchip.com/en-us/development-tool/mpfs-disco-kit
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/Makefile        |   1 +
>  .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++++
>  .../boot/dts/microchip/mpfs-disco-kit.dts     | 190 ++++++++++++++++++
>  3 files changed, 249 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts

...

> diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
> new file mode 100644
> index 000000000000..c068b9bb5bfd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts

...

> +&mbox {
> +	status = "okay";
> +};
> +
> +&mmc {
> +	bus-width = <4>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	cap-mmc-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;

I think sd-uhs-sdr104 implies sd-uhs-sdr{12,25,50}, thus the latter
three properties could be dropped.

> +	no-1-8-v;
> +	status = "okay";
> +};

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
