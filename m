Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9366FC5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQzrlLjDXLsQWafTe2xxB4kGH3x9ebzy4TV0pyDJGJ4=; b=3e/7qSzSzczq/M
	ogPgVbnG4Lhalzm0YqWGufyCVqDVYZVpvt+9F6mYJK8fGKewTSuRQ6qYSlpKU4/lsTts0+cCcVz4I
	9XZgvYYV1y4pvvRtw7je58JiUFAb8WvokrKuGYDrdpgytGJ+zsTFOGf9Iso6Lnx55xqS8WgUaAZ6H
	x5HVh37BPNsi9gRJt7B9IEPq99G17zUB62KgPtmK47jzRtM1ENUofwZ4jeu6LsIGShvdhgDXQ8n3S
	ySGbDQ4VVW84FMmQmhabc26ccKtjd31aJVqqIA8Xu7FoqktG7PhiKAlm+I5g2cms40XZb79A4Q4mz
	3yfjd2/W4HUyIBjO9dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUKQ-0000000GeqR-2Xaq;
	Mon, 24 Aug 2026 13:03:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUKO-0000000Geps-2k2M
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 13:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3ct6506Qb0sPYJHueF+mC3+i6CnJwRsT9BxuFgK8Ljg=; b=lsPC+KZcrkWtq8gMhRbGTgoNAI
	kleVUabpmWsgOIq1Jwv2A8PwZJBW62DsUJVBQaCB5XEKQLWKEMi21Tn9q0F1yMcSDa89PyDKzCLSf
	RoLqks98BL8ePQk2JTnnzAx6++qHOGYl9KGqsMds/wkIei86ik3W4WZUH+9riybmlh4s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wyUJy-001EfO-OB; Mon, 24 Aug 2026 15:02:38 +0200
Date: Mon, 24 Aug 2026 15:02:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 11/12] riscv: dts: ultrarisc: Add Shenzhen Rongda M0
 board device tree
Message-ID: <d93868e7-00c7-4251-9b23-8b3ed0535185@lunn.ch>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-11-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260824-ultrarisc-dts-v1-11-61ab7aebe9e5@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_060304_695095_7188AFAC 
X-CRM114-Status: UNSURE (   8.01  )
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

> +&ethernet {
> +	phy-handle = <&phy0>;
> +	/*
> +	 * YT8531 RGMII timing on this board requires no PHY internal delays.

Please extend this sentence with an explanation why it needs no delay?

There are times this is correct, but it is also mostly wrong. Without
an explanation, i cannot say if this is correct or not.

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
