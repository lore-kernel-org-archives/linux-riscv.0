Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E5C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghGGXAPdi39lJDvoo7LmJW7FUyo+tjU2wOqqOiBjIeg=; b=GDbGQM7k5hG1wVxxnc9BEl2s3w
	nXVNXbScXdRw773xKY3aZCVs4JEcLk00NwLKN1behRyjCfQdIFnyj3ME0RAXomrSrSH0eua+Y5sIO
	NBg7xoO9eVo0mcevOa/7EXD8uoBfaa8lPtM8othBGGaF+Qvq/UFEaQQBuyMhSyjMW2B4rR7xBybXL
	rqae8MN56lwXeE9bMBlNGIlALRjvOmx2DvxKCDb662UpEa2TKcB3ktYd2lEZil8h/YRKYFBpjffUo
	hJQwaOb2816HgsrrqI7hmUwRMgdVodwvjSuSBBFIfct0pTxSt/eVettUwPs1ncdvp/xBTB4pAVQIH
	jbwhnP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5Lh-003Q6M-0m;
	Mon, 04 Dec 2023 09:34:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA5LY-003Q56-1g
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 09:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701682476; x=1733218476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+j7cDUoUbhZgg3CFqMSvC7LEHqMyVmx87LysErGNBg0=;
  b=kKL6R0q/l6pXiNtfM/4CLgvoM4dP2OgCDIb0dbpD4O7o2Mim5gkzpaM6
   0UG+DtIc8Dmx9AA5+JZjYjW+Y9EV5xypo+K1SkGw70hNkimmzZMznt8hh
   yV3mdAOPcZ3cBqP0ZQ04c6Jg+hy/OyeVjlJAZkunennGJIsKNu2AF/Pyf
   VDR77Ybv8Qfzle9Rx4kR4potZsZFgHAsafJt4051ExrS0AkooZKH396la
   7wo48UsC0BWiBnrH91GqPGxFzwRz1WBXaoW+fX2QskcjU4iqlcpEe742R
   lgNjR974blOY3cQNfRVLa5isabq0YnmNOhfOH8JSMJYnJNyIr80I4fJ3k
   g==;
X-CSE-ConnectionGUID: LI86M10uTVibW23RhRt8lw==
X-CSE-MsgGUID: 6MsAR5MTRiiJ4ozhiHII+g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="asc'?scan'208";a="12709204"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Dec 2023 02:34:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 02:33:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Dec 2023 02:33:26 -0700
Date: Mon, 4 Dec 2023 09:32:56 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Jisheng Zhang
	<jszhang@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231204-crane-wolf-95f32865db62@wendy>
References: <MA0P287MB033290A6C8B15202E31E43CCFE80A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49537B177B6F3614D8D1E3E6BB87A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB0332AE2378D633B8A2DCFB77FE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332AE2378D633B8A2DCFB77FE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_013436_588763_37AA0B42 
X-CRM114-Status: GOOD (  25.80  )
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
Content-Type: multipart/mixed; boundary="===============5524960798095883226=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5524960798095883226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="McIyWL/yGKMUQDuC"
Content-Disposition: inline

--McIyWL/yGKMUQDuC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 05:15:36PM +0800, Chen Wang wrote:
>=20
> On 2023/12/4 7:32, Inochi Amaoto wrote:
> > > On 2023/12/2 0:21, Conor Dooley wrote:

> > > As far as I know, sophgo's SoC product names all start with "sg", whi=
le products starting with "cv" come from CVITEK (another chip company). CVI=
TEK was acquired by sophgo a year ago, so now many SOC product names that o=
riginally started with "cv" are being repackaged and changed to start with =
"sg".
> > >=20
> > > For the cv1800b adopted by Duo, Sophgo has made it clear that it will=
 not change its codename.
> > >=20
> > > But I heard that for other products, such as the cv1812h used by Huas=
hanpi, sophgo may change their names in the future, but sophgo has not offi=
cially confirmed it yet. Looks like sophgo themselves are still in the proc=
ess of digesting cv's products, ;)
> > >=20
> > > Since we have just started to support cv1812h and have not done much =
work yet, I suggest not to merge this patch into the mainline, and wait unt=
il there is clear news before doing this to avoid introducing unnecessary m=
odifications later.
> > >=20
> > Hi Chen,
> >=20
> > There is a update for you. The cv1812h does not have the A53 core as the
> > sg200x does. Maybe we should treat cv1812h as a trim of sg200x, not just
> > a reband.
> >=20
> > According to this information, I suggest to preserve these code for
> > cv1812h, it can make upstream the new soc eaiser. Also, adding a new
> > compatible is not too hard, and it is necessary if we have new soc.
> > Otherwise, the one with Huashan Pi now may be confused because it have
> > a old version.
>=20
> Thanks Inochi for your info, let's just preserve these code for huashan pi
> now and keep watching on what's going on then.

Could you explain on what you mean by "preserve"? I'm a little unsure.


--McIyWL/yGKMUQDuC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW2cyAAKCRB4tDGHoIJi
0iWtAQCTE8NoHTJcLy2WVDAg8jnv9rQILz7SbYqbBacA3DtmgAD/XtNuvBNLfda8
3vRc65P/zhIlckuMqFgMuwxMxDUS+wo=
=aCtm
-----END PGP SIGNATURE-----

--McIyWL/yGKMUQDuC--


--===============5524960798095883226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5524960798095883226==--

