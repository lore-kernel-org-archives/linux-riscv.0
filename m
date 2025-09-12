Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79028CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTjPqvUM8BlzItT20RdefNSj1k9MdhkArfeLYajXutg=; b=UzDUgG8tQ2puSz
	NVl+XuWpYVqZKyjf4If024SlvXQ1e/C+XsmVTP0YMc9a4Dg4qcb6UjOKRBBoN6sOBnXNQKNJPemCH
	bt6T3hKTcX/a8q84BcsAGfXKKAtzFLNK4Ys+3NrEu1u5z8vxifW+TUOEOeGwrMcvWujTCvY6GG8gr
	ICk5Cb4KB/9+sg+rlbLFoIKCbLYzTvLhV6CdWdK9kLalKBS/3XNwRC15zh274bzy1Tpl+rGmJenl2
	hrSOrv/0eeUVWcfd/RSZ2loCeUIzylSdj5whQU0dRx6S9vxKlZ8mOl05fl0ynMPlRBoRJfcuytWJS
	c68Ix2t/ciAkjLJI3GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB4D-0000000BaHS-14zt;
	Fri, 12 Sep 2025 21:12:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB4A-0000000BaGF-1NFl
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 21:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rNdLjeplPkqfEmRszEB/ZVAWbTLvcxwpkaHxxGJD3SI=; b=0ehj3ZeMD3fcpWh2loBYgBjUez
	H9MB68zr1Au9biTqYNu2WceM5P4YqFr4CuBKtKYE6hry3sQCb2+FiXIBESG+p0z8KD2TeAA4a/BX1
	7woJpvBOKIABRSOFhD3RjvSQFBPW6Zkc2+HPDrJwzfdSc9rAT7CJdN/S+6TkGpr4tZTo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxB3u-008G35-BA; Fri, 12 Sep 2025 23:12:06 +0200
Date: Fri, 12 Sep 2025 23:12:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
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
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH net-next v11 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
Message-ID: <0df5d251-3c2e-4b5a-8fb8-b5a6d00383c2@lunn.ch>
References: <20250912-net-k1-emac-v11-0-aa3e84f8043b@iscas.ac.cn>
 <20250912-net-k1-emac-v11-4-aa3e84f8043b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912-net-k1-emac-v11-4-aa3e84f8043b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_141222_364178_E51DE83E 
X-CRM114-Status: UNSURE (   6.63  )
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

On Fri, Sep 12, 2025 at 02:13:56AM +0800, Vivian Wang wrote:
> Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
> 
> Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
