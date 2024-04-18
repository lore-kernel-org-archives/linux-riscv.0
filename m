Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF22C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnEZNU6iqUjZQH1EhwVZa7JwWdQbZV60O6/L1A36RN4=; b=3XAPm5EjnZjUU8wFWpM+iO7Atr
	bvWZe+Cw7qwe2T1XcaMT7OHdOcXQLA/7HGEuoiJ9Hezjrnq4hUKNhOE6NBpkvg+wUbQ+7U6c2CMvt
	LzA+Gtk3eDpZTtF5P/GNa0p9SxaYeEHTmrOzxjdeSuQ5IEP5GG7/Pwt48Au0iUC+pJxyPjiklqdDu
	/qrYYO/qmmXjpr8Mp6zgt+IqoCtCsDQb59lnq3oPrAhP1kPlrcgv1JDGamixC6vJ83frMJfJW8Nal
	VNf+0r68VVorEWkwpVFbA2HJTpTQVgoHLYknvfmlTa+4Pt53wnC7G37V2JRfuNxbh+vc+bpTGnnBD
	a/mQg4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOq3-00000001lJJ-1lg9;
	Thu, 18 Apr 2024 10:17:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOq0-00000001lIa-3DLR
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713435473; x=1744971473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvDKZ+glA5qTkrIzDXNuxfHtmsXhvI7/488cGHa/cTo=;
  b=xJ36ND9ZJ8+n6zlPNqFNrDvbSeDvaHDwezthBCG7t/XEYGyHxWPq8Ou5
   +1jius5hEebikL5wiQcd3ps9yBXoq58UbKg04drgTiSO6mmb8J4iGXc32
   PAw1lDCOWkxyuINsn6XpAlROu6Z+NFluOIQTTk1cxzkP/r4NI5L2e+vB4
   HmnraUcwUlZldMeitotV6rP5iFCZSgAhPxALjPRbBgf5bzKRPCY/t03FW
   dHeqdqB9NiVl1bVKCivVMMwok6WTFCYV6h75VYcykEBfsr+bwfrz5XHEV
   9fyC79LWHxCpKbfmU2QlgWYrdccQaP+E2GnZMumNSaiWbo37hZzxVPMgp
   g==;
X-CSE-ConnectionGUID: jdfy0oE/RiGdWMurzhUwYg==
X-CSE-MsgGUID: rBqpnbjgSpK9ZoW0LzlZyg==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; 
   d="asc'?scan'208";a="252389070"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 03:17:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 03:17:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 03:17:31 -0700
Date: Thu, 18 Apr 2024 11:17:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
Message-ID: <20240418-busload-footnote-0087b489b3cf@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_031752_863295_98D351F7 
X-CRM114-Status: GOOD (  12.86  )
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
Content-Type: multipart/mixed; boundary="===============0217321509303406414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0217321509303406414==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mIw8CeNjpzZr3Y+"
Content-Disposition: inline

--5mIw8CeNjpzZr3Y+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:48:58PM +0800, Andy Chiu wrote:
> Currently we only support Vector for SMP platforms, that is, all SMP
> cores have the same vlenb. If we happen to detect a mismatching vlen, it
> is better to just fail bootting it up to prevent further race/scheduling
> issues.
>=20
> Also, move .Lsecondary_park forward and chage `tail smp_callin` into a
> regular call in the early assembly. So a core would be parked right
> after a return from smp_callin. Note that a successful smp_callin
> does not return.
>=20
> Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Ve=
ctor context")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4=
b8eb5fe5730@spud/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--5mIw8CeNjpzZr3Y+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiDzLAAKCRB4tDGHoIJi
0iukAP9gMz9Evm9RpNziRdVt/TZimCbIoydkw28vTA+Bcs/I9wD+N6M2XUvE06s/
90wzbAtNs6iXwmA4DplsxcRv65SMOwo=
=BKna
-----END PGP SIGNATURE-----

--5mIw8CeNjpzZr3Y+--


--===============0217321509303406414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0217321509303406414==--

