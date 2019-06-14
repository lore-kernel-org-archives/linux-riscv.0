Return-Path: <SRS0=/FlE=UN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84345C31E4B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2019 20:58:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C8A2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2019 20:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYSHSNJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C8A2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkNAogwiDQQZdEIyzrsBlrxacNBNLuYbd5XCaHdApOs=; b=BYSHSNJEJ96ypA06iFWSzuF0l
	dQHuTleuxMVmriebeJqJg2C5wHGZ6oCgqhSJH153t4FMGH3uAui/rr9hG+VygFe4+YTrl6ePH289U
	hvvL8ufgL4NXlGDOMwUalHUhUFuv+/ZWhqRNzvA5M89nHTCB9AhAiOp/UJ/TGJBz3oG1LJXRqkP3o
	m6BiqTHGbUovTzjw/HgjVo6MU9/jvcRkhI1oCvObGAGsgL3HlzzfIWNsI1ew0Gbgv9Z7XDL5GMcxy
	qcZd1zA9EDz1nBgFjPj0uyGvJ/un4YeZOEoZoBt/Kmbw4zfShiO2NQZo6v8IWkA9UIiCy3e5zgZeQ
	wAt/Bkj6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbtHe-0001QK-GQ; Fri, 14 Jun 2019 20:58:50 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hbtHb-0001Od-6z
 for linux-riscv@lists.infradead.org; Fri, 14 Jun 2019 20:58:48 +0000
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
 by pokefinder.org (Postfix) with ESMTPSA id 887D14A2022;
 Fri, 14 Jun 2019 22:58:46 +0200 (CEST)
Date: Fri, 14 Jun 2019 22:58:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH REPOST v8 2/3] i2c-ocores: sifive: add support for i2c
 device on FU540-c000 SoC.
Message-ID: <20190614205846.GD17899@ninjato>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
In-Reply-To: <1559369475-15374-3-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_135847_408829_F1BB4D34 
X-CRM114-Status: UNSURE (   4.77  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, peter@korsgaard.com,
 devicetree@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2505542207986947528=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2505542207986947528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 11:41:14AM +0530, Sagar Shrikant Kadam wrote:
> Update device id table for Opencore's I2C master based re-implementation
> used in FU540-c000 chipset on HiFive Unleashed platform.
>=20
> Device ID's include Sifive, soc-specific device for chip specific tweaks
> and sifive IP block specific device for generic programming model.
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECoYACgkQFA3kzBSg
KbZncA//eWbyOsRWDI1ivLjGr5LHGf287LZ5FaaXD5xse31wxiWmSniRKi7NDK10
wypljEvTKDvbG10DllABXn8XgyxRtBNRAzdLqFFTOmX6dpIds8Rqmd+J4sS0lQKV
00TCpBCKYNI519/eGwNWFHIYM+HuBdM6xX9yNJKygvLfz8zD7vJPoSlabA3iKY4o
+iWwOAxrVtEUMseiUUXXlpuFy/aPdJesxo4tzaj1bTV+yAh2jqrog7RoQebbNKe+
rrb35JxIJmJtOcys5dTymk7eQzbQMqWnwMslRnwkPBR+Mmjb6ldLGC2IWdHTUkJt
JO6sf/trxQVmoZkO9GGMZBAZHrLlvY8HMMAtzf7KUdqK7eaGmDNujbND2QUaSebB
HKMRVVv2tOzOvtCAiP1YgozZoOm4a51su0GkMxzyoNLu0bBN2TY0pfBPaTjrfVep
IJ/DYy4eN3FORffr5iBrJQMhFAD1KxXOKbxqW23ibGXjnLb8I2sp4N0zbi6808XM
atKpgpqMJMXGrg1MEFrkv0JWM9XIWCgMRrwKcNGnsRBEaG6pMuwv+zKU51M2oYyW
6I3gy4/REKWhyJF6v09GxGeASLMzbjaa/T1VFxIL4SDcM2OsUXAIFKL6+st8YbUL
tBAE8nnK0uRngRDEaCesK+RK4hUhzRDJnHj2hJiH82PSO5XIb3A=
=AX75
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--


--===============2505542207986947528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2505542207986947528==--

