Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B06D15D8B
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvPnH6uBDr0VPjWlIDklaeIx4wze1vXH7+7zezuVZRs=; b=TqLzjAPygOg0vL
	uTwhHHN7LASwEq8VbW6PXb0FDoXf3yoVDrFctnIAhlMKbVzq2m4ROwn7lRHJaNgJnOS5Fi2W4JSOE
	CBBCu9L6hoNgYontw2UnnqTaEomVxQMWN3TyYB0JPNXU6MTxoqPwd9icjtwHiKPEnYgBNcYdvqFm8
	QLqRBo/jHW7+3OGHKv06sLp+s6MT7uPzjbseVrE3eEXcTdv2b35mP+6fdl2xmHMv3+M0SGbEiy2Rv
	+ln0zENkhbLzE0kDbTW3MG88tsujYQ9+esznfeMW/e0ye+07XvgNOAQugryESEHxxDEqtQYxj6Q/C
	/iW7Lk4RLBbRPc47yCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rji-00000007IMp-2Q4y;
	Mon, 21 Oct 2024 12:42:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rRP-00000007DvB-2q0B;
	Mon, 21 Oct 2024 12:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wCZNacVnsn4uhYNBEOtyeQPuRqMb/JOuMBBq3Fhgftk=; b=LbDJhrz2GgPeF78dlJUpDlQnnD
	9m+iixgYUt1cF8XEFfPefpYjaktfh4SNRriv44/3JITFv2bta2KFfd1wWR+8K6WMqvGGfZTjygLde
	3iNB9YM0tbym37bVdZrUvq/SJr0j1o7980aexiK3GyG9LqfS7GIwv4F7yWUYNwV7l9NMyReG/f0aM
	/Li2ue/Yk4l/bO/jYQD9ihnY8Smorv2xHx+87KfovZNdLBxl2wprDdLZpjWlG09KYWK9sacdFLm1B
	eAkksTKYpMQS8pz243vTripvzkbJ5fwu4UhXrRldg+/FLh5rCMgh0110oI6yMgUC8Yt/EKACGdiv7
	K/2PMI5w==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rRM-00000007uo5-3DY3;
	Mon, 21 Oct 2024 12:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wCZNacVnsn4uhYNBEOtyeQPuRqMb/JOuMBBq3Fhgftk=; b=OEnyOhpI2IM6s9X6FJBNmFxk+w
	4OqDLjt3Oa7VMOP2HqUEkx+9vfhD1lnCgE8tmSlTtSLRyBwXhZDtnxrb9Fja6djO2gjJSUcmpWJK8
	U4TvhRAjV18BpTkOavR+HJ6J8lGgc3iolSqYz/oQ9E007pXWvRMetETkFAkS6obQKBzo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t2rQt-00AiYl-Hp; Mon, 21 Oct 2024 14:22:47 +0200
Date: Mon, 21 Oct 2024 14:22:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_132316_903561_922776E7 
X-CRM114-Status: GOOD (  10.96  )
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

> +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct sophgo_dwmac *dwmac = priv;
> +	unsigned long rate;
> +	int ret;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +		break;
> +	case SPEED_100:
> +		rate = 25000000;
> +		break;
> +	case SPEED_10:
> +		rate = 2500000;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +		break;
> +	}

There was a helper added recently for this, since it appears
repeatedly in drivers.

> +	ret = regmap_set_bits(regmap, args[0], DWMAC_SG2044_FLAG_USE_RX_DELAY);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to set the phy rx delay\n");

Please could you explain what this delay is for. Is it the 2ns RGMII
delay?

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
