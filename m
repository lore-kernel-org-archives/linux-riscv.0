Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6653BC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFHvOLMWyTAu9RHIVAJEqsE5kAq/3DVM5vXBhgDcQXQ=; b=VNnsbre/rtufU4EYbTxQMkNAST
	Ky/Cn9PP4KP18jfgsfTyW6wrx2nwmdERQWdgERl1H4+EQu2SuiMrHEUn72SaYYmEAMJxkMVA8sYjb
	DxX5CSS39Db3Lc49nfpc+D0+9hhJMPtvtSij/rDqo58Fs/gNCxOKtZwOiarvnV6rX4rJ6LIfGmwJj
	CzPSEF18CcardedKKYr7Mqx58RL3AW1qU9ANvkTeKTi0EUdIyKC73M+Q4tdI+LNd6N8vNfqvOSDR9
	oOeNlaRDI9ocxHkTRzP8wzdFTdnnR99yxJmBU+OVTP0XrISCJwQ8Op4F2ABMteZMzu1aoGmsJwv3V
	1GH/wufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q587n-007To5-2X;
	Fri, 02 Jun 2023 16:59:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q587l-007Tn7-0k
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:59:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82F3763040;
	Fri,  2 Jun 2023 16:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFE3C433EF;
	Fri,  2 Jun 2023 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685725175;
	bh=ZWc5cZxtTS+a1oL1ydW5dbNhJFyKN9X07jEjL3vo4F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yr1ixOHRpeMSDtrK7hRUT1s/0/qLRE2e3isq8Mfa3h2oRl0Yvt80e8hhTMByt+lNs
	 0rVtjxaj6u0ZMI00E1cEVmq5Fh/Erh65RD47dR8e9CVp232dlueC/mcy0NfTqa9Q8j
	 QtacFTzHjCSq9Cfmhke84byQZ5VEPFgsPMMQqx32TkjNwezziZCKDy3xg1r2qtOAG5
	 6KIbWxykc+s4dN+rEYRKyXLTw4dexOfSy2rd94UX+P0IqBoQqL4xXzyIpEZvAIRiKQ
	 yiV8ighGjFeAewoOGgQGegtHeDatgmDsr89MmcaSuWOP5J4EGGfubZp3u+DMuO0jQ+
	 sEB3gCeVKXWYg==
Date: Fri, 2 Jun 2023 17:59:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	yanhong.wang@starfivetech.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Message-ID: <20230602-wise-entomb-975a2474d97a@spud>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
 <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
 <20230602183922.649b8e88@blackhole.lan>
 <20230602-drained-wheat-b6c5ea009f16@spud>
 <20230602165713.GA27915@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230602165713.GA27915@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_095937_321153_A018AC01 
X-CRM114-Status: GOOD (  15.58  )
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
Content-Type: multipart/mixed; boundary="===============7629094752781486490=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7629094752781486490==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gTOiipfmNTlMqeKP"
Content-Disposition: inline


--gTOiipfmNTlMqeKP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 06:57:13PM +0200, Torsten Duwe wrote:
> On Fri, Jun 02, 2023 at 05:43:25PM +0100, Conor Dooley wrote:
> > >=20
> > > Can you _please_ point me at that "PLL driver" "in Linux" ?
> >=20
> > It's patch 2 in this series:
> > https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@st=
arfivetech.com/T/#m4b2d74c36b3bb961a1187ec5cda1a0a0de875f0e
> >=20
> Unfortunately, it's not, AFAICS. I'm looking for the driver that
> will control the PLLs' parameters, grepping for "pll" should yield
> results, to start with. The thing should act on the SYS_SYSCON iomem,
> at 0x13030000. Ideally, a DT node should point it there...

The driver binds against a child node of the syscon @ 1303_0000:
https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@starfi=
vetech.com/T/#m882de9210850eb6f871cafc3418f3202ba915de8

Am I missing something?

Cheers,
Conor.

--gTOiipfmNTlMqeKP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHof8QAKCRB4tDGHoIJi
0iZeAP94HgEHJBXSFHCDIA1ukvah1gLeQDcWwDzLZAjguwUY7QEAm10ukzpdoakk
IyPtDFhAnVt38/uZdD4pShSOPC8IUg4=
=9Kxn
-----END PGP SIGNATURE-----

--gTOiipfmNTlMqeKP--


--===============7629094752781486490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7629094752781486490==--

