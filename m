Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDB8C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:16:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4327C206ED
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k6fwD4I/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="McKic9AM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4327C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQDO0fa2dMNJpX4tm24wUqS6Ncex59NDJKau+verCZc=; b=k6fwD4I/XQgMPavGxTDF/wZ73
	7+BsRAZJ5HD6LCNbszKoo9hl1j1OwAKpBIlzKJdWR/J0OdQqfEvMWBSQhySUhI8iHOj2WWd2nzUol
	hMc80e/DQuyJkGVROLXKlpQXqoyxmcswYiB7IkJKsII5KxYzg7V761okgI+ERssRz2qMHbWiJST6U
	me2JkvgIJIZn7Cd1C7dM5z6SZkX1XTptby60bLEXRB7DPvetwjMfe97iAMFmuuafUmYUIASA8YBeJ
	DXKG6ltX/MODK1xc5fkLWWLCAiD15JQ9xFnrur2K/9z8L/8W2HTRsG4FOgK5fZcEr1OyKQIzjQEEs
	6EPVUmibw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7xm-0003Pj-S4; Mon, 09 Nov 2020 14:16:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7xj-0003PH-My
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:16:04 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB914206ED;
 Mon,  9 Nov 2020 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604931362;
 bh=En9Ed05eGm/mVXemcKM0+v+qUqkketwqoNTG9zmUgq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McKic9AMlk5ie8beb/Xzbfn6jBvWtBX6LbQjd3Kv8c7DEMYvXVbM6FKyRcqnA0vU8
 cgw/f/iYm5OoAdXuNZ3JxEz12UhM9e26T2Nwrhut0K5Mb/Az2dNFgo42flFbVBjrkN
 jnUUghXs18eVMeOfbOBCDyfUdVbB18Vk0Y1DFdsw=
Date: Mon, 9 Nov 2020 14:15:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Message-ID: <20201109141548.GE6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <53859725-ca0b-5f57-9147-10346707b3cb@gmail.com>
 <BL0PR04MB65145CB4FC66106B62E179CEE7EC0@BL0PR04MB6514.namprd04.prod.outlook.com>
 <db97cbfb-0d42-9c45-e770-37a3c38d79c7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <db97cbfb-0d42-9c45-e770-37a3c38d79c7@gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_091603_900898_59E171DD 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============3157426770441967606=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3157426770441967606==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 08:52:24AM -0500, Sean Anderson wrote:

> I think if it is detectable at runtime it should be, instead of relying
> on compatible strings. That way causes less future grief to anyone
> porting a device possibly using DFS_32.

Yes, runtime enumeration is generally preferred.  Having the compatible
string is nice in case some quirks are discoverd but for things that
can be enumerated there's less that can go wrong if we do so.

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pTxMACgkQJNaLcl1U
h9CCzwf/SOaVjDOfJ3WO2PcRpeRE277pJrANK1utzq6zRVou8PJIN+wBkqgHEYcr
P2w4049o4LKkvZOCXYn69ZznYDkM75uV7oWtRWOOu+ltmyWTYNTf1bqxYJVuVp98
ZJdHyesJpsVgVvKW5athUt1+zh6A1cOBNel0Klu5E3pY6i7JHQFMp+E33sFV+wiC
KGEx3Y89sAkQRMLmrlbTctOMhODPxQuEx+a/9Yjgg39AYrikjOijlub7mPHE4PcB
IEEuZUBSCtwhJ2s0W3DL9ycrfrMSdjVduXNK9X6MJafqNP1UDeCW6LsqKZVgSBWG
Yh8sK9idMtmFzUG+lU+5JZVq9f9bnA==
=GnrL
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--


--===============3157426770441967606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3157426770441967606==--

