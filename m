Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E1FCAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+daKRlXiBoKtMZPzha7u53yufQizgjKNLJZI1Y4E8VQ=; b=iyqY0X7JNqYMLJ
	DX1CAeqpBUIN9UondQnAXUyUDJhiG56zrFEtprFsck+jy3701TmZhulWtDpIk/QF+f9Sip0zeRYEi
	IkP8q1Faag2l+fvKcnRvnnXsxmTNuyYOR7J2zBEaGPglT8/8Ju2XzRjw/iK2bbd7cbXxuIEKDknv7
	cb5yo5bjuoiuxv+lpmWh5wyrOMqSnsHVUFa5iIjrCuOwVHR6phwYF+zbJltDxl1o9JlmHo4rSZF5K
	55dwo2WtI0LAJ8nFmNuP0yPOzRRy/LkIUrH2awagmNLeXlzIhtUnAMQyUcr7vJ/nuv0FO1MPgO25m
	pQbkJo7LnjjZ7szVWh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB4X-0000000BaQ0-2T0j;
	Fri, 12 Sep 2025 21:12:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB4V-0000000BaOV-168n
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 21:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TfJdEgDmeeUA7mwuQnthygkn+bVIL1msXKFYrsESfP8=; b=6VHkYe/GCoc7e7EUIDpfMvO/7Z
	9sOIlLmXo0w9xUU4qPsIgcS+ZKdA7KvUn4YcVFP0B623GFQIVCpNC+doiq4PwPCrfpolT0ZwKhosJ
	Vy3Wm5f+8aC/p87emgEe8mQLfP3Z4m5bUHlxsn5d49S+m4QN7OTr0g0FRyma3DCuKHS8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxB4I-008G3r-H9; Fri, 12 Sep 2025 23:12:30 +0200
Date: Fri, 12 Sep 2025 23:12:30 +0200
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v11 5/5] riscv: dts: spacemit: Add Ethernet
 support for Jupiter
Message-ID: <12583aec-4499-4cc1-a487-9c7b8d8efb01@lunn.ch>
References: <20250912-net-k1-emac-v11-0-aa3e84f8043b@iscas.ac.cn>
 <20250912-net-k1-emac-v11-5-aa3e84f8043b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912-net-k1-emac-v11-5-aa3e84f8043b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_141243_299652_0AC62468 
X-CRM114-Status: UNSURE (   7.12  )
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

On Fri, Sep 12, 2025 at 02:13:57AM +0800, Vivian Wang wrote:
> Milk-V Jupiter uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
