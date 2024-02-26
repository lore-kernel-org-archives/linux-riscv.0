Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D8FC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GrAAZGfCRHxvgW8XJC+3e6uH3Ny9HYHVD7PxQ+4MDQ=; b=YduCafdaxT4AAeEefkBkU8T+fp
	nQzWiigRTH48+CuIyM7oBNIv1QJnfv0v6+U3uyCDaXQKxwOgpe5Lt7XpMepMFZjMMPBBxuRmACg2E
	s9bHzpk28tQCYd9xrPpbLsnhuUhTabw9dKvhLDAyuQu4idX+PnQysPYCXTXhy7u65zojtvo96xUcF
	gg7edyiVt0CvIbqUynUBVPPWpnPRKCGb34jIdizjKMeGMyc1x/Ba9HdgyIwazBeCU+BA1ukns70oq
	nMXuOwMwvGxwLTvR/VzkTWA9TlVXgOpUsUJnfB5K9l0s6MH1YHHxcEbT/Zw4rSrce4ZdejamR5wJc
	C8stJWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXuO-0000000HXos-038f;
	Mon, 26 Feb 2024 10:08:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXtU-0000000HXdE-1lJe
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 10:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708942053; x=1740478053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DNebHSY35bj2aTTlomFot9W8ge7L9kuaM2+VvG/w0cQ=;
  b=N7v8Y8+Jt+KNDE3a0FbRNPiXnPOXEOoFkIisnQh93w7kabMXoR2ZS/TC
   EFvLUK6O2NBpCJzsZmXYOS2LtBTK+5VqtKSKtC0VO1zEVFPmX+H1WLBn6
   QWzL3ly+9P2NRsEuIyX/hR6yKonRv0mRmbF4vwEZfLMm1JmnNXt0PsOxC
   ZB5os06qZDsMm3kLf1wkT7UomcbfDj1TCA6uaLUqow0sK3I9/nVGERutV
   0YWy0nSNW3QMDnk84ERwFDUk9oitBlVnhnGW4wUEHs/uypNPHaIbMTHYH
   C5nVFTPf74f+PHgRX5LkVGyKNArixTXa5AKnlHYxsotLTQVdHjq12ANlr
   g==;
X-CSE-ConnectionGUID: VSJxsAsaSlyrhJ5T50LSuQ==
X-CSE-MsgGUID: QEGURzX6Rn6dwABcqO++nQ==
X-IronPort-AV: E=Sophos;i="6.06,185,1705388400"; 
   d="asc'?scan'208";a="247564532"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2024 03:07:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 03:07:07 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 03:07:04 -0700
Date: Mon, 26 Feb 2024 10:06:22 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
CC: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	<linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: pwm: opencores: Add compatible for StarFive
 JH8100
Message-ID: <20240226-hurt-cubbyhole-f792a9e8b25b@wendy>
References: <20240226033945.816974-1-jisheng.teoh@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240226033945.816974-1-jisheng.teoh@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============0159888801842592193=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0159888801842592193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O/w1adAHCIQ0qVfg"
Content-Disposition: inline

--O/w1adAHCIQ0qVfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 11:39:45AM +0800, Ji Sheng Teoh wrote:
> StarFive JH8100 uses the same OpenCores PWM controller as JH7110.
> Mark JH8100 as compatible to the OpenCores PWM controller.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
>=20

Applied, thanks.

This should've been a b4 email, but I don't think the old copy of b4 I
had on this machine likes UTF-8 encoding in email addresses as it
generated a pile of crap in the to field. I'll have to see if a new
version fixes that.

Conor.

--O/w1adAHCIQ0qVfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdxingAKCRB4tDGHoIJi
0nImAP4vdfnl3n5CXRLR+1UVkwBvzjbGYeIeN699Lwxtm34nBAEAqrsi/qdEuw2a
QrQux1Bc7Q30vbEzVEY8CwRVrQjdwAw=
=I55z
-----END PGP SIGNATURE-----

--O/w1adAHCIQ0qVfg--


--===============0159888801842592193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0159888801842592193==--

