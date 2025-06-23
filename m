Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B655C7115D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 07:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wItZqnaVA/ew5T410GuD3qeYjA6t2UBDYeOzzHAHZ6U=; b=GRsmQxDkjz5Qi4
	yuuN9+Yb45Brl+s9Ld+B/Pswit1myC6qtFJhMWL7jwotqd32gWJBuIuBIncsjhmHDjZUfnotv6BBw
	ktw33LUj2r0Gk4FUpC6hQl3D1JgDEkhpdy1lt91odMveOAZ912thUJSk6HccT8QpBKkh9iN+ToT1O
	wG4s46GUO5IgBSAafw9jlqJ/y0ykIQ/Ehi34cgAL3HUQfvRIeuv410mRYXBLJTz/UeiFKhswj3jjZ
	4gUF4/VtW/Edae1wNqSvW+GlVGvh+FuCVE+jt6CblvR39Meud76cX2wtKsm0MNDLmecT7cVerDHQT
	iFhHTrc5RGssdY0SZuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbYg-00000001rNV-2Ana;
	Mon, 23 Jun 2025 07:25:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbYd-00000001rNC-31TS
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 07:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cd3lQ68F49FcJhWhZAZYZUquvzxLE9gTxVzwWcJXNf8=; b=sg0HsJvWfvJwCHkDvTM+OEva7k
	6Se526NxBlBc7oZ+nx903RVvTiutVv2rjAd0L7HmnprxnbY5EqljKCYfSxlpSUJ2p+OWlA0aKs4Hs
	noPlTAhJMeVxLLwK9S0HkDh95hb/a/kZ1e/+iO3V2LL9q0I6LlIUOUvIdK5/DRTCgRLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uTbXw-00GfJ5-6o; Mon, 23 Jun 2025 09:24:52 +0200
Date: Mon, 23 Jun 2025 09:24:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v2 3/4] riscv: dts: sophgo: Add mdio
 multiplexer device for cv18xx
Message-ID: <48769988-9ece-41d3-93fe-607061d68fff@lunn.ch>
References: <20250623003049.574821-1-inochiama@gmail.com>
 <20250623003049.574821-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623003049.574821-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_002535_757402_E230C08D 
X-CRM114-Status: UNSURE (   5.43  )
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

> +			external_mdio: mdio@1 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x80>;

Since reg is 0x80, the normal convention is this is mdio@80.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
