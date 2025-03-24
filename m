Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F8C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opWFR4jYCsDVuu/XAhV9y4+rc76yyA+KMDylfJ+cCso=; b=0hn9etXW4ih/LP
	EcutemKiKhYzHpp29rDqzwRi7wrZCgx6OgWRa+WB+9w8rzEJDNf+h0ttYg/6/udqMtoYcRrnKaVLX
	qTtGtnNhXbqu4kHvH6m7BUWDi0pfZj2ArXqTDqOdxOmgiu27ZV38QD4U/JnrWtoMLuq3eqpn/Bnw6
	EkUzVN3tb8z3owrOT8v01QpZLLQJ+SeVmG7dlhgxn2U4AyseDYL+a9Xa3uWxFFGOxduyTtGRQr/q9
	9ccZEvUqP0awDKd4DaST7Gwx4TyMaP/IQ/HmNGmZo6M6AtmpFm1L3PSbqTMP+rtx1GvY6AelGEqBo
	kIAOP6NZ5jGiaON8iNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkj4-00000003euw-0FAe;
	Mon, 24 Mar 2025 16:32:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgd-00000003eQ9-0ajd
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D6543465;
	Mon, 24 Mar 2025 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370F8C4CEDD;
	Mon, 24 Mar 2025 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742833802;
	bh=WvkpUcMN3vInzzbGLg8lMVtx9rUMhLM25v7I0hur7lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4C4eundvBapMbUkgTpHlunXo+CDTXYqi27do+EwQbqFJ2XFJL1FWrjfl/STnVFp+
	 J5Puw9UFKkvlov9VuV4QQAjpkr5Pt1KEMY1CzriDj9YsHDtF6q25Yz2gJzICJM8o7h
	 nvTYBzqs5GaTh0AuhXjnMmeAveDwvZa4ZHaU86V8APyIPML6YBWVHxxW5v+apw7m6e
	 sASknFsAUDZnbUHJqL8XZPBtRJYS9aSTenLjkC9Cgo31fSZpt1ybIAiat+DDWu1k90
	 CvIMJGXzp4EOZvCuGMkAtLW4YgZARedNUsXmWvOucPwso9Ph8b+vO+Lgp1+Pflyy5V
	 oiQltfj4rUY1g==
Date: Mon, 24 Mar 2025 11:30:01 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 02/13] dt-bindings: net: cdns,macb: allow
 tsu_clk without tx_clk
Message-ID: <20250324163001.GA272324-robh@kernel.org>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-2-537b7e37971d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-2-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093003_197000_1855C1D7 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 21, 2025 at 08:09:33PM +0100, Th=E9o Lebrun wrote:
> Allow providing tsu_clk without a tx_clk as both are optional.

Why? Is there some new h/w? Where's the compatible for it. Or this fixes =

some existing user? Which one?

> =

> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Docum=
entation/devicetree/bindings/net/cdns,macb.yaml
> index 306d14958778df1a80a15e24d8ed5409704613be..36fcae1b20d757b3ebe615a9f=
c66068000ded56d 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -85,7 +85,7 @@ properties:
>      items:
>        - enum: [ ether_clk, hclk, pclk ]
>        - enum: [ hclk, pclk ]
> -      - const: tx_clk
> +      - enum: [ tx_clk, tsu_clk ]
>        - enum: [ rx_clk, tsu_clk ]
>        - const: tsu_clk
>  =

> =

> -- =

> 2.48.1
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
