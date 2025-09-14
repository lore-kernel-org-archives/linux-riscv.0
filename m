Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7EECAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfwpN8EKP0JFs7qJmFY0ZrQLA+ZLhmO+4A6pqjaEejw=; b=KlBKKqnp8zA7w0
	PBXpo+dwRr0Bqz2f3oIhWWGEwn83VkpOS6tfCD6mwHNtysUSQ2I3+Zv+U4bRSf/sdtNnf2WNM0u+t
	eJCF/9EmxUcE46vm9Xatzh/abANUbrJq/aM74Zf+0U7HnISleLKOchUQwPHsCOkfoilaje7qUmP26
	kEkyygCqrK+mJ1uRCX1YospMPpkm+4kiSuvobVr6IFlIQDpTyRnx6r6J/xdHTokc0JLxyKmKBQ7MG
	MXxzxycWRYVXuUdkJK7bZUbEiLrDsxxRmR2n0sV5EDshgyy27cpDBPPb/+r/SPcQ0ohzOjSFQAThq
	38JCI3siC3+L+XZrBjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxk0e-00000000p1T-1QMJ;
	Sun, 14 Sep 2025 10:31:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxk0b-00000000p18-3Kqa
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 10:31:03 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E745F340EE4;
	Sun, 14 Sep 2025 10:30:58 +0000 (UTC)
Date: Sun, 14 Sep 2025 18:30:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v12 0/5] Add Ethernet MAC support for SpacemiT K1
Message-ID: <20250914103049-GYA1238190@gentoo.org>
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_033101_860570_CA20C675 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Andrew, Jakub

On 12:23 Sun 14 Sep     , Vivian Wang wrote:
> SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
> Add devicetree bindings, driver, and DTS for it.
> 
> Tested primarily on BananaPi BPI-F3. Basic TX/RX functionality also
> tested on Milk-V Jupiter.
> 
> I would like to note that even though some bit field names superficially
> resemble that of DesignWare MAC, all other differences point to it in
> fact being a custom design.
> 
> Based on SpacemiT drivers [1]. These patches are also available at:
> 

I know this series has been iterated several versions, and Vivian is working
hard on this.. but since it's quite close to rc6, I'd like to query if
there is any chance to take it in for v6.18? don't want to be pushy, so I'm
totally fine if it's too late and have to postpone to next merge window..

P.S. I'd just want to see emac/ethernet accepted since it's last bit for
a minimal headless system..

Thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
