Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC093CD8C8E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgp6JxjSjX5WliyckvhgdUxWEiqJ+GIFpga2ORrZW4k=; b=FcT1dwD/Sss0Wx
	QGAbcq4vARlqE8ti5/I8Dn8ipF7n0aGetuRVCakQ6ci944ptOKMmd+DeFQ0gqcIGWrBSsmxiYzyy6
	iFNQExecA6FMdOmKL/XgEnB2VBuDVvX9KgFTvCfHe3R30BuEb2xveewb5RO8hPf5IWHqkqS+FIyJ5
	IZFzgsSiPIuHpGEOO6tRuCANMViu+KVQTMOoHeamzXi55lxXvLpvJ/GsDa861XjvSQGyEaQLsxci7
	bzMTfh626exbO7srfV7MwVsG4zAY6kVlPPJqwH+OObXCc1VXb1qipt+qRBDpJleP0bOjpzmHIcChy
	0bIgS/oqsRPP2I/FpgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUZQ-0000000301m-36oS;
	Mon, 08 Jun 2026 07:38:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUZN-0000000301J-2erg;
	Mon, 08 Jun 2026 07:38:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69BFD3290;
	Mon,  8 Jun 2026 00:38:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3393F86F;
	Mon,  8 Jun 2026 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780904325; bh=SPAws/lhAws7/ucS0FCjJ/F5kS84Kk0lmu1Zg1EIo3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=enkpkK0uHHmW8awAneqEDFejZ0kEggRsSBDbMx0mOgu3hvlnfAQsOK6MnZtO7rCyB
	 lhDi55Irjlqw7gBNpxx7yGMk3cH0mwjQysRCNGiFuRiVAUdrgwHq+hzMlQPEJHZ9nP
	 KvljUJERgtgGKShZ09nsW6xZ7Jos1I3Aa1HavV+s=
Message-ID: <aa0e1539-cc59-4d3c-a0c5-a4f7cc1fe7c5@arm.com>
Date: Mon, 8 Jun 2026 09:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl
 required by NetCube Systems OpenNMC
To: Lukas Schmid <lukas.schmid@netcube.li>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-3-lukas.schmid@netcube.li>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260606205452.2386930-3-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_003849_814184_F2639E7E 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 6/6/26 22:54, Lukas Schmid wrote:
> Added the "uart4_pb_pins" pinctrl used by the OpenNMC

Checked against the datasheet:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>   arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 82cc85acccb1..00fddedfa36f 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -191,6 +191,12 @@ uart3_pb_pins: uart3-pb-pins {
>   				pins = "PB6", "PB7";
>   				function = "uart3";
>   			};
> +
> +			/omit-if-no-ref/
> +			uart4_pb_pins: uart4-pb-pins {
> +				pins = "PB2", "PB3";
> +				function = "uart4";
> +			};
>   		};
>   
>   		ccu: clock-controller@2001000 {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
