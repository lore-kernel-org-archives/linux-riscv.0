Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34489C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WTdA0J5STUgykVWa9JErujOrmcjOp43Zl4mnoobPAs=; b=Xarkk+av4dHKOj
	ZIHWInCMzQK2eO7jzWqq//8XDtt+XoGtK1o+8y6v4D+OliXsHYCLtxliw+DvJeYhkeprAURGKyhc8
	TVEPB0wQiawDydVX062EZF/5kBGR+JL+YicEWQ1oTx8c7Mi+b2GioLsTdclya4LVSqnypLRRh5Tq/
	Z33nVLzXMpiC3pfDA09TBp428uGgvt8eXimtXhsKx1KbKHyaMxbo4ZYx4AutfvuMdMJT1LKXwgNTi
	LO6S+NWCzPTzrRKrusELWWw2O11wdOHBijn97rdGYC94A/3jtLXvLfYUCwRxZcxUAjpV57+bN9vSu
	7AQX+1vHHNrFtibZLl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dLX-000000026yt-2cMR;
	Mon, 21 Sep 2026 12:42:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dLX-000000026xp-03dI
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 12:42:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B56743C11;
	Mon, 21 Sep 2026 12:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94321F0089A;
	Mon, 21 Sep 2026 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994530;
	bh=f+qMWNaepi83wEdIu8Qj9XEItvl/uPB1JxblYtoeB4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KrJVG2q4gZiF5+VAXs9MAKVgKWbecIdsXQU9VDXCKpS0kkJ26mYvBG3tV1TFJJgHj
	 pvC9x4wj8djTYwYa8PHFw49N2eSa+qpk6nMA+o/R0r+XkaBqbFC7kPRciHoP0JxuPc
	 hfPirJO7dlCUA6stF255eifKklgNYMQh5HYAlHc7aBWxfSPvbUZUvMDfbbKnSQkqvy
	 s7eS8HoWVTEIkAgUafUV5rUo1P9/8TFWKLZBNgwdLQn3vSliNg2O/HmzrbDWbhTSAy
	 Yt1vCC9a1ehcIl1WRG7CwPrJ+OiA7Lp6VAshONAKjOBt0JpyH8bPeo6d5Cqi8issid
	 8RXj6+y4gzucg==
Date: Mon, 21 Sep 2026 12:42:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20260921124206-GKI297024@kernel.org>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 18:00 Sun 20 Sep     , Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
> Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
> Ethernet alias to avoid U-Boot patching incorrect MAC addresses.
> 
Could you point me where the u-boot patching the MAC address?
I'm not fully aware of this problem..

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 8 +++++---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 7125f2882ce8..073cc975135f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 = &i2c2;
>  		i2c8 = &i2c8;
>  		serial0 = &uart0;
> -		ethernet0 = &eth0;
> -		ethernet1 = &eth1;
..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
