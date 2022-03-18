Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE46C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htKZarpn/IK4+kh/aaohN/mgvWIlhT4x+v+kK7+Znu8=; b=ofEQYZr6lL4k3g
	Ej9A3hJHyb/8deGTmASm3JRyM7/r5fBfd/MUbXudZ8eWV7AoBYuNEuebkvZ8CGFMZdU50AGmDZsEm
	QRBw5EEXn/+W47p+TGrUA34UX2MXfN69xwXAl21p/SJwbGy1kXwakBMtCpI6vproOvDMwU2bzrlJl
	t7exYj18dwoxcg/LVrbXig4Tsx7XASatDOnfakdDj9poT6073lclF8C7ZUzQd+JdFkkZg19pr1O48
	cwk2o6xnVgTeMjhLSTstNbURuFkjt7bC7qISj2OX8jCpCwYdZJSXSfixrBuoDwyMLgP558i6TcJDk
	nODolpgm7zZlkQdUvCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBjk-001Zs4-Fa; Fri, 18 Mar 2022 12:29:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBji-001Zrb-4V; Fri, 18 Mar 2022 12:29:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICSYai073187;
 Fri, 18 Mar 2022 07:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647606514;
 bh=KVsqL5PONXeXTdj+ZWnKXa7WklM0B/Xva47rW9IApys=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iBq2kHYVzgORaY3vqIOx1325CGnw6+e8oRtJ/DInwlaM16jrRMMtQp7bna9ytSWJ4
 UdenPNBn4yHgn6S75W249YxWadw8KDMnHvZPIUPx1EABzExmQFBnX06+Jqy5tYVXKd
 vc1ehuqnlDwwho6wDz1z/g5y+yEz8gGOFi5w16sA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICSYIG026518
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Mar 2022 07:28:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:28:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:28:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICSXcB009772;
 Fri, 18 Mar 2022 07:28:33 -0500
Date: Fri, 18 Mar 2022 07:28:33 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Michael Walle
 <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer
 <daniel@thingy.jp>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Tero Kristo <kristo@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Cristian Ciocaltea
 <cristian.ciocaltea@gmail.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Jason Cooper <jason@lakedaemon.net>, Paul
 Burton <paulburton@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Birger Koblitz <mail@birger-koblitz.de>, Bert
 Vermeulen <bert@biot.com>, John Crispin <john@phrozen.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-actions@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <linux-oxnas@groups.io>
Subject: Re: [PATCH 18/18] dt-bindings: irqchip: ti: include generic schema
Message-ID: <20220318122756.7jvpf73ebpo7qtdy@parsnip>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-17-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317115705.450427-17-krzysztof.kozlowski@canonical.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_052942_304005_258F980F 
X-CRM114-Status: UNSURE (   7.82  )
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

On 12:57-20220317, Krzysztof Kozlowski wrote:
> Include generic interrupt-controller.yaml and msi-controller.yaml
> schema, which enforces node naming and other generic properties.
> The schema requires now proper naming of node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Reviewed-by: Nishanth Menon <nm@ti.com>

Thanks.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
