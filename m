Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B734C98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 02:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QphvD9P3pvKpdDohT0TQvzcTM0xE6qBXFZ/i98HM0Po=; b=Ht8BSj2Wu6g5h1eiFtOBAN9xjt
	Ngkspi9AlBe2iV4ctZ3uFeZqKR3Zkaogby4ZF2NfxD9SqhNMPnHNTVS5f97AsvLUnIMA73Pd+/v9p
	jowkl/oFLgWDfUlwiX7JipJowBxPjhaO7cy/51l5xDnrUIoHqEhwk5e1VM9ee23d+zNPOANyXcuQr
	RqnW51elMs4jOz6wqr6wirvUyPpDJSlCQ2aQSKdCsHWDTejsDKwYpovYSExnvnU+0DgNk0pfLk9O/
	lSZZHU8T9cyz0wYaVFF6IJsKdLBrjqFrFMg8a+2ezQ165AgEt+FGAteNh8fL5xoYj1MB/AlrtNVvu
	j7FW4FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CZn-00000006vDk-04xZ;
	Wed, 23 Sep 2026 02:19:15 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CZj-00000006v8R-2B4H
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 02:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790129895;
	bh=HsUHDmsVehcHWKUK7oJBtX9pkySO3eKim9u+3rp9Bko=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=rJdQikeejBuSo5reflZegyaGrtBbC+TXu03wiWZ2pRrz/V8CIL1Kwfy4ENzDWm7QC
	 0HEM8A3G5UumQ6nyB8PhEjIIPUBZWlw3PDNyOYn/mNYpFuLlkPnSWLFG0WUdosMwQI
	 gpaI8ESXLo4nX5P6MfbGFtOd1Cgf010f7JsbDXQA=
X-QQ-mid: esmtpsz10t1790129894t25376d77
X-QQ-Originating-IP: 0Lfhv4AIErF+dHYAdIw4Ywjd5xgJufwHFdrpdtg487M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:18:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12085916592293753369
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 10:18:09 +0800
Message-Id: <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NRN3UPsLzYKVeqioKSywiECEiHFakRHpwHEULszG3Udkdw6ha6NKUiUy
	BUi+QSorgTdHEI6FYceNiXBFfwucE+c9d2kTLAFa9KFLAe1VbSe+My//AGv3JuU2vdN/QP4
	86J77UiXNOC9oC22sCCKksVNBbDpQbFbgJ1++YxF4KaNjLyhYcakO3yflA69TMy/I2/k4RM
	f08BEZ6miGbOs+9ur5JYxIgiTJtlAXpBKW94sfiBZZ2ItqtyIBp94j6kLVhtnLsckTczRH5
	HJHOII8cxqT1yaNFYzdGPgrkChQOstJZPTCvVqdwMTRlolaD1k7aSHUD1Fo7WZOKq/tXqOT
	IF/QbD3MkurdIcXexN+WfuYK/rPmQBGgSZzQMMEnYDw1vL+GrR58SqUTm06kYywhUZ8VyQv
	0bzOiv78RfUm0UwCwon+FeAVRehsh2UAJuDsVWJx/KQv3+L5K9M2lnkQz3t77WcpabGreNN
	8/ikg14etG0Dtmtkfr/JEAzy/yKpfTc5Qp8PvzjImnwkUGES16+SlN66NExl5RDWIlRuvlU
	Oa0e2P1THNmsguI457LxIgblePGak2f5t8VW6KgCIaHKWLA/KbQyt7TNBwB8bxCIkJPncAW
	XuaHUTvY5dIdecsI7m+S8Grk6R8Qqmx1TElSpfZw1jNsQmWiO5ceARLhOWZW2U/LYRulVi2
	0IgzpgR29TbsnM6PbvfA0V0GmSgWFVLUbXY4A00Jn4QVjqENuuFJdKwGEoAYi/FHereJLJa
	aW6LgZtWbRCxudbfOs/1gADsaqVJhRs1+h826IrQU3rrBr8bB3xMSKd8RBbbz/zSWqixd5v
	+6Sa6vJ4DGI2JMgQIPPdbUwEJJo4uF3Jl6G26jY6GPk7hS5i+jRshcsoS3Yt6DZiTpGLeA8
	TtHUi+Q9ensztPMzLG9jnwdzZRRXDf4GBJG5Xtf5/0xugmO0sc4Z51Km0ZL+bP92W0Sx1s2
	7jk/QwNyyL0xG0bAKbn111Z0yrXVvVpy3LNY47+72wHhqyi9zYhrka4SxqJoG63Qv9QidEq
	njL+5ocC70p6CvXUEUSAjvSEq6z11jj0a8p8pHwhJG7zcBUwW8YcbfIpkdPG/F1siyxRJnf
	FV5r+jigDJf
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_191912_040502_2572B7CA 
X-CRM114-Status: UNSURE (   6.72  )
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
Content-Type: multipart/mixed; boundary="===============2346949495128395754=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2346949495128395754==
Content-Type: multipart/signed;
 boundary=57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:34PM +0800, Sandie Cao wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> [...]
> @@ -441,6 +441,72 @@ soc: soc {
> [...]
> +		usb3b_u2phy: phy@81500000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81500000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> [...]
> +		usb3c_u2phy: phy@81800000 {
> +			compatible =3D "spacemit,k3-usb2-phy";
> +			reg =3D <0x0 0x81800000 0x0 0x200>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB2_BUS>;
> +			#phy-cells =3D <0>;
> +			status =3D "disabled";
> +		};
Should these use CLK_APMU_USB3_PORTB_BUS and CLK_APMU_USB3_PORTC_BUS,
respectively?

--=20
Troy Mitchell

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM24Q0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAmYA/iFLvoo8oOH/IDlcVXEOznjisdfEqNwOm+oJljGB
ZmcGAQDPw3wYW5xpApTx/6vIfixeGWSBTL26yVlHUBqZlx8QBw==
=zTrC
-----END PGP SIGNATURE-----

--57b5d87d32bc9ece3cb6ef40e4dde09507a22fc2dba109df05cb5c4a9b74--


--===============2346949495128395754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2346949495128395754==--

