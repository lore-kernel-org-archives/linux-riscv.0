Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58140C001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxKITNmPjmDCOAQSnjAuoV+tE8ZWr/YkaGuu0f/XPow=; b=IqhrjZljxHdAPo
	6Q1zuZVd2FY9LJXSraTrBf2KeZ5BIA2i32gd9LIbx73FceOcHVh4OY7jw9Xj091HzPixIKvMw7r5Q
	82RKBy9Fx/Y/a/lBebIDBn+98ptg1a1ruNpQBdrD8xdl3nZnCRL2solinFT2zRohIx0rJ0ARAnZWK
	xTRXPGnBkYxIWNLqPwHl6LOTXPjhkJYH5scOngmx723TkcWbBePgl7Pvm97J73TPI2KD1FIpEx5Zl
	7WHtTpLaR7UuszoH82NyKvbcXGTicFaf/ea4BVJuetxP7bb5CWh60lbNLWJ861lOpCOj6TsHmCas/
	ThIBUWJ81aDUbyFPtuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNVF6-000f5z-3D;
	Sun, 23 Jul 2023 09:19:09 +0000
Received: from out-48.mta1.migadu.com ([2001:41d0:203:375::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNVF4-000f4X-1u
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 09:19:08 +0000
Date: Sun, 23 Jul 2023 19:18:33 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690103938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IO21JPPuUrj/PlAXDeK+XBpU+sX32D1I5JxlNyZ8yxY=;
	b=mcwgGlOY5K72c1mv4IEZ+ALhpmQdPQLC1UgX47qkA5/+JSNYwpY8Cbd4NhspuL3PWggka9
	+Tp2jHAzGIGtZ+JuagzBwKyIzPP4siFbdcgs9wfpdyem9y9iriwEX2r/aqTGuhjvxzxVc8
	ffa1A5ycZ+NBiAjPiudgTs4V6MapEdVyYxclJ00yN+6eNL1aELb4lfhWFJ1WSBK6Ym3pvX
	iHirF0aGQHxKYK4bD6TTz55DuI0c8aHiu3JIsxqxZyBIlO4uLbCcLECpeLw+D+a9YodbAA
	1kEm/i/2HNZZMAsB1qWQpVcPCfX4wgOS3u0c0vrGCvo+vo7rBRMASZjEesF1ow==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller
 nodes
Message-ID: <ZLzwaQlS-l_KKpUX@titan>
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-4-contact@jookia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721221552.1973203-4-contact@jookia.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_021906_795204_9B2FB82E 
X-CRM114-Status: GOOD (  10.59  )
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

On Sat, Jul 22, 2023 at 08:15:51AM +1000, John Watts wrote:
> ...
> +			/omit-if-no-ref/
> +			can0_pins: can0-pins {
> +				pins = "PB2", "PB3";
> +				function = "can0";
> +			};
> ...
> +		can0: can@2504000 {
> +			compatible = "allwinner,sun20i-d1-can";
> +			reg = <0x02504000 0x400>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CAN0>;
> +			resets = <&ccu RST_BUS_CAN0>;
> +			status = "disabled";
> +		};

Just a quick late night question to people with more knowledge than me:

These chips only have one pinctrl configuration for can0 and can1. Should the
can nodes have this pre-set instead of the board dts doing this?

I see this happening in sun4i-a10.dtsi for instance, but it also seems like it
could become a problem when it comes to re-using the dtsi for newer chip variants.

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
