Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D21CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq1QLgqQDQQazaA92rV3I8w+s08Dh/NBh3ve/jTWNAY=; b=iq2uKTnUJvaxNaztf5YWcUFcsk
	7NM9I3sxW+8mH5zpJ2Aa336kAPLAzZleAjQhiSqdYlIE8T5tKsNEkkJbDi+Gl3qcSPhGeHAVzTIZf
	+5/q10NyC13TTnNEqwaLuWtKYpJXHdyUnffwAnqT4VDCy6OKkK6ZGMOCWcZWd7wzHLQCZKfLLROZj
	QLtUdXQ6rPfSnKJvfVsjkUUZwSh82ig8/SU/dqLf2+OsO67ukV4hEPpCY8Vpis6D5NaJ9jy6QThS0
	b+/1kGTDZV+DdOcjL0OPAvKj9wYOssgI0DBBxmOMQsi2DHXmVzJO9oIOS+0DU+XA+PV1ya36srMeU
	Vgx15uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiiD-00DxUI-2f;
	Mon, 25 Sep 2023 10:21:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkii9-00DxTZ-0w
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 10:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695637266; x=1727173266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYdjOlD1VTnveMwZiWaqVgJ+r23UlkzqDe6dKTfCN4s=;
  b=2Y8oI1SZBAgy4qtfOYdW+1lDx6khfsQkyO4rjXrotv7zYTwtIAgMOVnm
   BoTcmo5+K4Wr8707R516/AH1LxwCvO0Z5mG9bKL3dPKVaC5f+ajl3r2Ow
   8IrXqQ3xbg31EtCIDYYpDgzgHNqsm7o8j4gnidzEeLIMH0hutTMKvj8KC
   qG4ZJwmdf30bsLdBMGueOYuOkhQrgm/O0DsQAkPNNmlHSa3EACG0xnydw
   YPkH6NkSa5MIYX7b/5idaCHI7R2y7Nhm7WHVmiF0sm9FftDUGeVycOSLd
   9HJqNG1FqqO9en4p2gpUlncvti9DWK9CkUh3lxI/7mMO57HyAF3m08ZCo
   Q==;
X-CSE-ConnectionGUID: Qh4ak2qkR92n/PqzHNXvzQ==
X-CSE-MsgGUID: rjHIZEEwQjGvRo9ERwmgEw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="asc'?scan'208";a="6420900"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 03:21:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 25 Sep 2023 03:20:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 25 Sep 2023 03:20:57 -0700
Date: Mon, 25 Sep 2023 11:20:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@pengutronix.de>
Subject: Re: [PATCH 16/40] soc/microchip: mpfs-sys-controller: Convert to
 platform remove callback returning void
Message-ID: <20230925-confined-tibia-9982d3267806@wendy>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-17-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230925095532.1984344-17-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_032105_404275_3DAE4261 
X-CRM114-Status: GOOD (  14.03  )
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
Content-Type: multipart/mixed; boundary="===============7743946501069863510=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7743946501069863510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fhIKodJZR77/42JG"
Content-Disposition: inline

--fhIKodJZR77/42JG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 11:55:07AM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Applied with some cosmetic changes to the commit message, thanks!

--fhIKodJZR77/42JG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRFe9wAKCRB4tDGHoIJi
0sRnAPd/gyGabk4lGCe4J7YKWSTYZfskMdTlLKF9+WtCvbAGAP0QkTt5FibnWb20
vR0++rV3JV25XYlsoixT5xWl+2wOAQ==
=IruO
-----END PGP SIGNATURE-----

--fhIKodJZR77/42JG--


--===============7743946501069863510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7743946501069863510==--

