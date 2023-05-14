Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D539C7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtUNSUCGv22ft2c8g65NxW29dIOsa71s2io8K2PEztQ=; b=HAcFpGvyXWTRUa2lzZtwMOi9WG
	+VpXc6+6txPGYGzOxrhjjrD4lL4jgcwjRVLTXnH2UCjVVAuW91SZg9eXXMCXlm73QYC2NNisEIBME
	BLEl9HOK5+SK9gg5CMb6zkoAPqSc3m1Ad3/3NcmQz9NgPk4+1f/zkXq9UriIBhpBSleQvNiqyPFSL
	dP8XkoSvAxpONXft80Z0wRrBAcvRJwX3dOtvL2+zwQfU8QpQgUNIkxx4BMDBg2UzBKw8D/Hk40Qak
	9Oj3F0VUKVgTF/NgPt1BJJYXjrbGvKDl1iivVygXhGadpzDgZF6KD3vFU7KBB2REWpYap9GGKR6e1
	Ke7UENzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGXT-0003w1-1A;
	Sun, 14 May 2023 18:33:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGXQ-0003vg-3B
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 18:33:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39BAF60C90;
	Sun, 14 May 2023 18:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6259CC433D2;
	Sun, 14 May 2023 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684089223;
	bh=5sZVQgWGvQsKpb5qnI//dwgKe4KvZL+15lmnta9+UHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hmfg0RsBFozwL9i8/UC4K7hltUKQjCRojGz35CZ1HJSt7RZef2bMlVbIvHX0U10ic
	 DDjnO3ikr3BgnRwGIdSMKPnL9bx/jTYKOoni/ABjmeVT/Pl+/IeM3R3ocee/gEfOFL
	 1MqEECOPf57P3s8znfPeJz6/femGj+07mkkVjQFxwhIW9zH98JmNYpPmtnAMdwOqhw
	 XMxd6PMGn3VuPiVevDF4pvpYdSbf1SnVGO1gHlcXSssEE0782cTHizveZZJBzHINjh
	 Rx7fibhnd5vCWYJstdRDFYI/7b7Oltgqn2QbQjzFpEyjl5SBv+3pnWSAAIhzmmRiMY
	 s48t4/nwEEh6Q==
Date: Sun, 14 May 2023 19:33:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add
 bouffalolab bl808 plic
Message-ID: <20230514-duckling-mooing-fceecc375372@spud>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230514165651.2199-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_113345_061787_DE69D596 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: multipart/mixed; boundary="===============4158845480749185661=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4158845480749185661==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aocPV6+AhBbmVr7k"
Content-Disposition: inline


--aocPV6+AhBbmVr7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--aocPV6+AhBbmVr7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGEpgQAKCRB4tDGHoIJi
0rAhAP9UE6EyQUZTG8wUYzjm4J7EtsDJlSWF2yDAKfzDjFNDmgEA7JLDWmie/aQr
mvViMEJ+Tdd7GDPlZ+Bzi6prCBdtZQg=
=Ybds
-----END PGP SIGNATURE-----

--aocPV6+AhBbmVr7k--


--===============4158845480749185661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4158845480749185661==--

