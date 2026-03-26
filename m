Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA310AB82B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpgaWh3U1MIwrl+9jx/9AgNRk0Wowo7CiXKpo9JxWjo=; b=bUdyDD+kgWs5l1
	Z+VQ2xtKS/YvezNS77Ua9I2T4Y5J6JDZXska9JxNfqhtYO9ceQqq6sUHikeNGmrgIY3wTJpKxDrIP
	yYAehjj4HU4/Q02a2Z0FdpndiNzwiy4Hl6fhGWgDMNJhtXWrPUsXnbc3q32MStZLF9tRMzpI+wzHZ
	SF70L+xk+cHbInt/sml/sJmQsnu1FwO8jPFbw2Q4dsHBMTEg3jEoKPG6LhYChDzjFqFlqEfQe57NL
	8KPZ9xP8V5a8NMqbAH8Uku+ABouWI016ts0Z9EGEpLUYZPZq1OOIzJD/X2vmLdRz2CZmJwaWypz8n
	7oZfO9iCZ/GwIeE+1MxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t6a-00000006Jh0-1qkk;
	Thu, 26 Mar 2026 22:23:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t6Z-00000006Jgp-32xD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 22:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E07D60054;
	Thu, 26 Mar 2026 22:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B46C116C6;
	Thu, 26 Mar 2026 22:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774563786;
	bh=ROCHNfrbiVNl5Zqs4yioqi28PWLJ543gNykCvWuEADI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIWyTSD0T/3wABk4ooxkzUF574ktOvykn2aryCP3u7klsq9jEusnhLa6oukJffs0/
	 ILiyudB+C3dg9zvHm/DyzoqIdXN1TZbGXXnjFgWkNRa1Ekk88VeKZzNmpma+0mg2eZ
	 9UEF9QoUqsHNsCHi6V6MC2mQqGEKwhE64xAuIi9ZlcRGOvbg8mgS+SFxINzzxFOCMo
	 g72Rpt3Q9Zb5jb+Xeyotj65zN5W7RfKr0Mp4j52VOc0uVYzZV3pic6IWRrF0ntsLrQ
	 /1XHnnHfudzKwLr3MSK2LgOF0vWSqe/Qh3UDoOXNQTJmGBZjwqxpub8TFkHLheCtEC
	 A3d5LMj2AeKgQ==
Date: Thu, 26 Mar 2026 23:23:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <acWxqkR8Z0rwe4hI@zenone.zhora.eu>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
 <DHBSTI0A3SOW.PCIP544HUYP4@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHBSTI0A3SOW.PCIP544HUYP4@linux.spacemit.com>
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

Hi Yixun,

> > +		i2c2: i2c@d4012000 {
> > +			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
> > +			reg = <0x0 0xd4012000 0x0 0x38>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&syscon_apbc CLK_APBC_TWSI2>,
> > +				 <&syscon_apbc CLK_APBC_TWSI2_BUS>;
> > +			clock-names = "func", "bus";
> > +			clock-frequency = <400000>;
> > +			resets = <&syscon_apbc RESET_APBC_TWSI2>;
> > +			status = "disabled";
> > +		};
> I think we should add a comment here to explain why there isn't i2c3.
> Otherwise, LGTM.

are you going to add a comment here?

> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
