Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DFEE7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTIz9V2n4gPAoEeLVbhqxPpnOTpQrrbXXG9HXy5+Qj0=; b=a/CAygge+h4mTqcKi10sKSwk7M
	NxX/U/jUwkWd6wQ80nCiLFpGQdr/QDV6qYC8YX2AnsYfIzNYi8DaF+AtBN+7AQ0Aulht14/a1y+6/
	XyHx/c6DzFegpYL+pfMXWKFng4YZnT1VrsZvldfFRDBAruQj0VewRQmgxJqDf3CUOX0PR+ngNsvOx
	1ZkuD8vx8NP6NycMzuT4UuR0f7Mt0hi/ZDpOFMVxd1vOyMGNXs3ZHgBqZkdI9k1lPquVVWxH98BbR
	uHkpOZhVqazmSNUixH4dJWhNFcmljxysBEe+yMWRLfCDb8mWQGW74RGA3YwpEe0DufKqkxAIsoqd5
	Wmbs/1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG2o-00000001sbd-0oyX;
	Thu, 19 Dec 2024 12:54:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG1w-00000001sU4-3pMv
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 12:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734612808; x=1766148808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMmSa0bLbyWI6LR+Lux/stoEw7UMyg9hY3+iFQ+o5oU=;
  b=hQvz8a+vEmX42QsCGTfpSUePg2a52hNLKxf0VcgPoyad1Q+g7JQ1O82M
   wVbaRUraej17EP8p6o9RR7vrAKOhv0GPOLCkzSHkrJXFVH0sg2vPd5KXU
   OYNH6HoIXQ1BFvpyXYErYGEy366D+hvEfICNckmqleGV8StnXAaNXlBg6
   hmYJfzulEIm4jij/JYM5ItDa9u0poclWFTLyRJ6vXIUYysN7FMOVsZJ60
   1Fs/PP2VxrHeWn9H+lv/cXNGj82I3qmnbXGfvLsRYZ7N8RS0lI3VHg9Ky
   0Mmiw/ZHqs6COVSNBGSBVB+eugnvBT2fuF6+4cSEWWtPSYU46lnGgo6QC
   w==;
X-CSE-ConnectionGUID: +BM50oZTTYWcajrV5RIUfA==
X-CSE-MsgGUID: i/AdQr76SxCB+vE4RvMJUA==
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="asc'?scan'208";a="39488510"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Dec 2024 05:53:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 19 Dec 2024 05:53:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 19 Dec 2024 05:53:03 -0700
Date: Thu, 19 Dec 2024 12:52:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241219-lumpish-reach-00c29cf962fa@wendy>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
 <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_045328_952753_4D2AF3D1 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============2169009763485553294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2169009763485553294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUQBJ3RlsIXzsKC7"
Content-Disposition: inline

--SUQBJ3RlsIXzsKC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 08:50:41PM +0800, Yixun Lan wrote:
>=20
> On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> > Add myself as maintainer of SpacemiT's SoC tree, which
> > suggested by Conor [1].
> >=20
> >=20
>=20
> Thanks, Applied to SpacemiT's SoC tree:
>  https://github.com/spacemit-com/linux/ (for-next)
>=20
> [1/1] MAINTAINERS: setup support for SpacemiT SoC tree
>       commit: f187e72262c3245bc032a1a0f106784fb8562a0b
>=20
> The for-next branch will be sent via a formal Pull Request to
> the Linux SoC maintainers for inclusion in next merge window.

BTW, did you get your branches into linux-next yet? I forget if we
talked about this before (sorry).

Conor.

--SUQBJ3RlsIXzsKC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2QXDwAKCRB4tDGHoIJi
0nQgAP9JsKTLeh+9UUsC/uO4H1HkHqdYMZSbxDWyUcB5gyIkvAD/c54edEHIgD+N
cCIV9KcwHlTdQ8jKz+avpjsj2Fhh9wk=
=qq3L
-----END PGP SIGNATURE-----

--SUQBJ3RlsIXzsKC7--


--===============2169009763485553294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2169009763485553294==--

