Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A4CAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 04:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uo1dkqyJuqq+/bTxZSlCSjKb+1jYugUsCFt4BZo3Lo=; b=pVtj3YGxc1mVCk
	u3ucGw/CZPILvj5dFP5Db0CWmg9Y1V+MAZvmreekp+Jk7NsSVuatDJ/s63xWv1bCOEqpgZIb/yBfh
	CgXHCZ7Q1HzCYadXhtzFsXb9olnOm0XwioGaUgloT+z8cmlp5aZyA5kuqKmTvlDizv9aetCxDg7jf
	5DH2oddI57O4NPLgQWphNUsjekoRCMDVKMokyjRLYT00oum2qmQHOpHya/e6wv51cQ9PkR+UO+HdM
	4jQ2jQc4jzFcAkr4LJMwZNxbgZYzITd9SNKCpRCma4tbVZoyvCCKgtPZuOFAe3YCIsvw3/v6mkQhY
	QIgOhKbtCQJtzcDwybYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeOl-0000000HXWy-2Sia;
	Sun, 14 Sep 2025 04:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeOk-0000000HXWb-3vVG
	for linux-riscv@bombadil.infradead.org;
	Sun, 14 Sep 2025 04:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sLa8XBqIYw21Q65gF2ZUW0GPcVrHkox5JaYEKzHd/RI=; b=RN9mFC+CkZcqj/QsQ4gFRCYmf3
	0xWfo/k7TzZY0jlTLG7XfdbcArPUOJZBiPYtVQEQaATqk1D74Gl5bMkaxcVsDzk02aV9+a230rlot
	hQOpL32mg1Fo64ZwWbxux7IMzCg75siUXah8tb60YBNVhdOQmioi0HK/gk9+E4Bqq1stQrhaCCIfI
	TU96pv26J1sVij69tgZOU0VIiXEajqTRxHxHX9iNrQkKsfNXgoebb3HZ8ZnkocC22skwcA7T0Earr
	GX3VZAu8av70kbP175GxnCiaZwCylaCSJzH0w0GNKyXg8rO/z+NcFPyrXoAcmYsYhRaZubr1Ljgf8
	95qyW4mg==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeOe-00000006jPq-39d3
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 04:31:33 +0000
Received: from [192.168.0.109] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowABXqIIIRcZoMBfCAg--.61041S2;
	Sun, 14 Sep 2025 12:31:04 +0800 (CST)
Message-ID: <007c08ab-b432-463f-abd8-215371e117c4@iscas.ac.cn>
Date: Sun, 14 Sep 2025 12:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
 <20250914-net-k1-emac-v12-4-65b31b398f44@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250914-net-k1-emac-v12-4-65b31b398f44@iscas.ac.cn>
X-CM-TRANSID: rQCowABXqIIIRcZoMBfCAg--.61041S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4kJF48GF13JF1DuFyUWrg_yoWkCFc_Wa
	n7ua4I9FWkGFWxGF9ag3WfGayxuws5Ar1jv3Z8JryUGwn8XrZrJFyUta1ktry5G34avr95
	GrWxJr4fCr1DtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWI
	evJa73UjIFyTuYvjxUsuWlDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_053131_798391_EB71E1FB 
X-CRM114-Status: GOOD (  10.72  )
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

On 9/14/25 12:23, Vivian Wang wrote:
> Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
>
> Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..33e223cefd4bd3a12fae176ac6cddd8276cb53dc 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -11,6 +11,8 @@ / {
>  	compatible = "bananapi,bpi-f3", "spacemit,k1";
>  
>  	aliases {
> +		ethernet0 = &eth0;
> +		ethernet1 = &eth1;

Hi Andrew,

I added these two aliases in v12, but kept your Reviewed-by for v11
because this is fairly trivial. Same for patch 5.

Is this okay?

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
