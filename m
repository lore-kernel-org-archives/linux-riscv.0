Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A321C71135
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3bHzIJJKdb+WhvbYlEff2AFoXL2MzB/6KBfFReHBZg=; b=rFjlXdqc4yPDuQ
	B9pvnnHvhB9kh1dSbMKHlMaGcmBKMxGVDb56ggHerPNf22aCy4F8XaCcV5j/iKh2zsWA0USx81jsM
	2aQjDae1gIFs4QVF73P10s06vmEU59Ru3vpHiQvySWGZ7BlLojbTj0KltjyLz5kfDvFQBsML853f7
	XQI2vTy+8WwEqIGqPtah5E04tIKuKwNBROeeNFt59chdkPH8Exow7FNsZohI9aL2wetWWQwhMvX/B
	TXqgkElMadFcx18IPm1Ial37H1HjPtZchcp9wDgvn62BjfiNaCQlYHcTMYLstA9/k2Tntr/eqvLNI
	PGtsBPW76pIo7aMhOVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3ZA-00000003XWb-0qd4;
	Mon, 16 Jun 2025 06:43:36 +0000
Received: from kuriko.dram.page ([65.108.252.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3XO-00000003XDp-2BeS
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 06:41:48 +0000
Message-ID: <7a6074c2-06e2-4c08-b005-a151bf74db69@dram.page>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dram.page; s=mail;
	t=1750056102; bh=Pyd55uUfdSE64vBohqzEWCLeu2Vh31odUeCFfrMdC8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PO4Bnw/Wxij7aXdYbg/t+bYg9m4y4lbFT+hZZOUosh4J63TwJpMAc0dH2YZcETkKI
	 2hIl2KXM7MbxDAGKIBXUVRudeDPDRGpRAfqt9eyQo9lvit9CEamA9n77fimJFK7t/X
	 o35qSePJo4HUSKPv0nKZvVopspSxDz/PHNF6YmhA=
Date: Mon, 16 Jun 2025 14:41:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/4] net: spacemit: Add K1 Ethernet MAC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
 <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
 <aE-6tPMpMfRD1Zgu@shell.armlinux.org.uk>
Content-Language: en-US
From: Vivian Wang <uwu@dram.page>
In-Reply-To: <aE-6tPMpMfRD1Zgu@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_234146_731219_97D9AC58 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi Russell,

Thanks for the review.

On 6/16/25 14:33, Russell King (Oracle) wrote:
> On Fri, Jun 13, 2025 at 10:15:08AM +0800, Vivian Wang wrote:
>> +config SPACEMIT_K1_EMAC
>> +	tristate "SpacemiT K1 Ethernet MAC driver"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on MFD_SYSCON
>> +	depends on OF
>> +	default m if ARCH_SPACEMIT
>> +	select PHYLIB
> This driver uses phylib...
>
>> +#include <linux/phy.h>
>> +#include <linux/phylink.h>
> but includes phylink's header file? Does it use anything from this
> header?

Thanks for the suggestion. I have misunderstood the purposes of some of
the header files. I will clean up #include lines in next version.

Regards,
Vivian "dramforever" Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
