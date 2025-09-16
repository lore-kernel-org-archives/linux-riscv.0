Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6BCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXP7zwZH731q0W2s2ekQnV+anOc0OimbVFUNM8Y9UNE=; b=udvHx1nzJTAxkq
	KB+hpCvJNoVwHCC2Sv54Vh9ZR0z5nXW7id2eLooz3IPvongkSAe1kvmOJkHP+cGWeaf6dSIHO2KhO
	MbCp0kPNMJRbd1xsfTqVmuo2UTnaHsLLbNLuggjC3be0+u6qirV0rmArbL3RzXEGcQq+PXY1kMyJK
	ZXbrtrVcFV9E2OCdfutV7TMx2o5fNHJYKPB+LjfddjRUneS5gn4vAy9RujQBOYlQWiPQ2stj+Vl5x
	e/TmOOk95HG0muqWRmHostRe2N+R1XSIB2N/ANuOyMrpE+IAC5t4np8QXhyU70MitMNFP3a8wMOPJ
	URwPUCbdx8fh8Pna/MZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUfq-00000007kSf-1uyE;
	Tue, 16 Sep 2025 12:20:42 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUfo-00000007kSB-0Fhv
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 12:20:41 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B1D73340DBF;
	Tue, 16 Sep 2025 12:20:36 +0000 (UTC)
Date: Tue, 16 Sep 2025 20:20:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: pabeni@redhat.com
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, andrew+netdev@lunn.ch,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	uwu@dram.page, vadim.fedorenko@linux.dev, junhui.liu@pigmoral.tech,
	horms@kernel.org, maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	troy.mitchell@linux.spacemit.com, hendrik.hamerlinck@hammernet.be,
	andrew@lunn.ch
Subject: Re: [PATCH net-next v12 0/5] Add Ethernet MAC support for SpacemiT K1
Message-ID: <20250916122026-GYB1255161@gentoo.org>
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
 <175802161326.713595.16381910315366172301.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175802161326.713595.16381910315366172301.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_052040_122263_D0A9F672 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Paolo Abeni,

Thanks for taking this series, but I have one comment (see below)

On 11:20 Tue 16 Sep     , patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Paolo Abeni <pabeni@redhat.com>:
> 
> On Sun, 14 Sep 2025 12:23:11 +0800 you wrote:
> > SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
> > Add devicetree bindings, driver, and DTS for it.
> > 
> > Tested primarily on BananaPi BPI-F3. Basic TX/RX functionality also
> > tested on Milk-V Jupiter.
> > 
> > I would like to note that even though some bit field names superficially
> > resemble that of DesignWare MAC, all other differences point to it in
> > fact being a custom design.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [net-next,v12,1/5] dt-bindings: net: Add support for SpacemiT K1
>     https://git.kernel.org/netdev/net-next/c/62a12a221769
>   - [net-next,v12,2/5] net: spacemit: Add K1 Ethernet MAC
>     https://git.kernel.org/netdev/net-next/c/bfec6d7f2001
..
>   - [net-next,v12,3/5] riscv: dts: spacemit: Add Ethernet support for K1
>     https://git.kernel.org/netdev/net-next/c/60775f28cfb7
>   - [net-next,v12,4/5] riscv: dts: spacemit: Add Ethernet support for BPI-F3
>     https://git.kernel.org/netdev/net-next/c/3c247a6366d5
>   - [net-next,v12,5/5] riscv: dts: spacemit: Add Ethernet support for Jupiter
>     https://git.kernel.org/netdev/net-next/c/e32dc7a936b1
> 

Generally, I'd expect the DT part patch (3-5) to go via SpacemiT's SoC tree[1],
so, this will avoid potential conflicts..

Can you drop patch 3-5? then I will take care of them, plus there is one more
patch in my queue..

Link: https://github.com/spacemit-com/linux/tree/k1/dt-for-next [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
