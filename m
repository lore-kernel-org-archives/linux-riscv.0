Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84051C8B4EA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 12:41:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418172073C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 12:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3E3Blo4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HK/xfacL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 418172073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2Jjyfh7aTqx4k6xgrPqv3YrqQ94ojtKjiisWA4zBLk=; b=a3E3Blo4Z/SQmuS4xE81LlUfo
	Lef5nWO2+lS24RdUIHpSq6WpDZhcbpbBEd6OSW9LxCYEFocAJGQvScHocADTBPhovM41/0ZBOPprm
	JUsHdLNQR4AgF4QHfAAQePCxxU2KDGSIA2h5au+5Ko6WK+sxveuPpidIcj+g02oGLOUgpir9RaUrP
	4uhV4Kng4SIDUM6vBJmHvhQRJTiiVf2S5sFYb5sXD0JBg5OecJUxshxqVYtFzAYKVOmT3LjyhAnpV
	9C51TOhsQLk0Oq9kT7DOsFpMs72XpqYHZi9+ae0N6zxOhqXXJ91BZpBQUrct8ZjEWSnq5QjtpNr1j
	VdZK9Wefw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kedhM-0000F1-SC; Mon, 16 Nov 2020 12:33:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kedhK-0000Dg-Ef
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 12:33:31 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D40F206D8;
 Mon, 16 Nov 2020 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605530008;
 bh=e8/VTfxGQssIIRXhK6YulGsoXbXfiFst8cUFK7vjU8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HK/xfacL/GMIV0YAt9cDrec21A34c5vySwI9RcUqj7oFfzxkBbesVh2yJD42BnUKW
 yvlCVbi4XvbBl76BWOa2TPlaKJiLzAEcszOlkxZ0mbleSFVFZhVr0A/iuzr/b9gSLq
 nErgIli9Roz6jNOXhbQnySH+Re4illiEb3dVjFSI=
Date: Mon, 16 Nov 2020 12:33:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Message-ID: <20201116123309.GA4739@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
 <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
 <20201115160146.efxcdjhm7f2nmivo@mobilestation>
 <BL0PR04MB65149D8B62167C11B26E0EA7E7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB65149D8B62167C11B26E0EA7E7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_073330_559654_B0C3BC66 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Serge Semin <fancer.lancer@gmail.com>, "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: multipart/mixed; boundary="===============4169453270414366347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4169453270414366347==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 07:47:47AM +0000, Damien Le Moal wrote:
> On 2020/11/16 1:02, Serge Semin wrote:

> > Moreover I've just taken alook at the MMC SPI driver. Turns out it
> > has already been fixed to send ones to the MMC port when it's
> > required. So If you still experience the MOSI-level problem
> > then that fix might have been done incorrect at some extent...

> OK. Thanks for the info. I need to rebase on the latest SPI tree then. However,
> scripts/get_maintainer.pl does not mention any. Where is that hosted ?

You can read MAINTAINERS directly if there's some bug with
get_maintainer:

SPI SUBSYSTEM
M:      Mark Brown <broonie@kernel.org>
L:      linux-spi@vger.kernel.org
S:      Maintained
Q:      http://patchwork.kernel.org/project/spi-devel-general/list/
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
F:      Documentation/devicetree/bindings/spi/
F:      Documentation/spi/
F:      drivers/spi/
F:      include/linux/spi/
F:      include/uapi/linux/spi/
F:      tools/spi/

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+ycYQACgkQJNaLcl1U
h9A3cAf/e+CAnK183KkMz2xKprNRhYUu248F8nYK4ZUjoj587uL6DnxlO0M67f9Y
cTaFO94jtUHWLwVX2na0qY1WBg7ygPDm9SUyEIj4yXq7+rvvqhZSGKe+FXD40Lkw
sWZgW4XNMu0mdH3TXxWVJpZFUS2qqnP6+YKMAAgMTGpBpW7XKnogBdNIdL4dWf5Y
79h9HGcvlGAneWyttFhS3/Q3izYLrtQ2u8TbslgiXSMRF8uIPsr/Kt3tgPss83Zc
95k7yc0jPiU1FeRfrGrXSFqH5FL8vZ/DjuDn//GBm0BV1MwX77KTym7DHvhVtsjC
viCA2ZSWKBZDxPp7Byv4ovbJL2LaWg==
=xuTA
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--


--===============4169453270414366347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4169453270414366347==--

