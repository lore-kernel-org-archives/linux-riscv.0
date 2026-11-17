Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF7606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jI02MLmC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=izwbJya4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d5JxQNj2ERgHcpNpNY541WFjRRmwIKr5pHg0fulwtW4=; b=jI02MLmCM6nY/uod1Oocg4fFtS
	u2Hf5i/uvBxgwH3RYlutzUOYtX9RcHAyZS21A02tOpByAJOsiVQhwdYzeODEtdUbTK5l6crKCqTyS
	eId12nzdXHs4fh2J8OkurjIcz7CMneNdW6mmbr7E0vmOiim7LYiyCDOiSJ9ExtdcrIyZhLuw81J+R
	PkQo2suYEXFur6RH3y5Y+WamWmYNpkFY/gRC5juoWTgeYF1eWRxzVUL93iqYJYY6hd0YDolIx8+XZ
	ZQIwkFfb2DKx8/cPP/qgS8oVdfEtqzWcalkfCxjUqvj2dnOzPKj7oZibICC4KnhCzU7H2DitZlP/i
	7K5TrsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCxZ-00000004gvO-3T69;
	Tue, 17 Nov 2026 06:46:29 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCxV-00000004gup-1lX2
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 06:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794897969;
	bh=Q+gF1IpQxY3Ah+YgluhpyTuzIbzQciSEK4mZyW1nqNs=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=izwbJya4Pxyd3RK3GSchVQ9kH6RHkXfc/xKaVRxklhelB363uhnKDHzgoxPW9th4r
	 UgCFxTCvcsfff4tCipY/+pTeUDf6waKV7F/nYCBRNY0BU8SXAWphj/Zl4SBhL96VQN
	 4k7V42p0wiwxumILpguiN09ILkeYSJVQbjevkraY=
X-QQ-mid: esmtpgz13t1794897968t2ce933a8
X-QQ-Originating-IP: xAtSpxecaocUxTGnDA10G8x8aHp91+CaQjY0yRXZ998=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 14:46:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10056131255817741553
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 17 Nov 2026 06:46:04 +0000
Message-Id: <DMXA85POOYLH.3L9L2Q53OUJ1T@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Sarah Emery"
 <sarah.emery@canonical.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Guodong Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20261114082802-GKC100523@kernel.org>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
 <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
 <20261114082802-GKC100523@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M49ymMyQ5YfuZg6AHji/LxP0UDNTO7r2jo98+M0qvUX4dif67OklTrti
	6woR+EJMu/y5pS6acK8mM6gXVqd6TEVKgyiGUEzYSV6397JK+J3EtEAyZOGiInLruUkmviS
	sVjVrcNqvU1DlJxspttEshw62Iuv6HJN6DJ3iMwHeXwvqcTcEvHwcrPi3gOfya7x//uJTcz
	xLJNBDpM9Q2SbwQrYfar5BwWsquhJUIqtLFtK1co7fK7hx0RnaWpGEKETDY2HDIG4KaaoqB
	Za9tJrDpxzdGHsHiJgXlJWBbsjybGyku6fE9zTdAtn6CXriUReGAgjav1TXE1tfeJGZ+2MO
	7DMXvphl6+nWBITujelevxOLpRYXdpUOjzkGfbM7xTgp/va9EUmVdREED5vrpLrZ96Z9xl6
	J3fp477KVkKq1ukC+Y25FpkfHJ3jWeUZ32g7aVperHtcvYOu/yijnFtChQY2tj6Ykb6Xbqn
	98xtt0E4ADM2CQ0ZvO5Rd69BF7q/kVOz+GRkwMJ7u5JnJmFOAa+NkOq7Ko4DymuVrhNQ0/x
	HzmoZ5U7rRlmx85VWQqaeBr4Bi+7QqIdZt/+AHDR1VZ9Q5aHbAyVQcGXTahmleaRhy2WI7R
	Ha8TxNhMibgihLs8DIbGotj+f34/VYR32C4EEs0dsK6PSyj9vbiChQSADJx5asY3w8yFWbb
	VT7Rr/QLjjRIOWSHX/Rb6kFCn+nsRdCjnENV3saFnYgo3pdyY3PGFiLz59nw5BaKJD4Lawg
	+IApcur6J/oCW1bKIcrFy8bYiwKr/YII2Xy1vrKuPiuAbJty3+vsQCnNZ14DSF/JGgBz+v6
	mHTLcFVKkjz1zYhhNIS1vuWwPPGQKLwgxjg3X56S9EmpjILCYPTtScgGjx5GJjfWPJzBzuE
	6np4hkGGQpi+1MNt8K5VsLgUtEzJjxZ/yjIBSRBP0CnXnht1JwMI2cLGRodXw1/Qh++2uaX
	wuVstoJ42krnZFBYFsYnCgAvL0hsD/KVwsteeJg9c6R/GAKkF8bbbTcIZc+W4PdEYDsA8pm
	C526P5oG8r22tVTq+AhryMMdbEoGqtB+dZIbGI6XPdhwoRs5gVznhpguflHUhZzEPN1Tcgr
	yF8ORU5FLmn
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_224626_813184_95BE82C8 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5342019430801880620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5342019430801880620==
Content-Type: multipart/signed;
 boundary=7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 14, 2026 at 08:28:02AM +0000, Yixun Lan wrote:
> On 08:39 Fri 13 Nov     , Troy Mitchell wrote:
> > They are the same carrier board. The only difference is the power schem=
e
> > of the CPU clusters. The bootloader programs those regulators at boot,
>
> If they are physically same carrier board with same CoM260 module, but on=
ly
> the power setup configuration is different? then no reason to introduce t=
wo
> different compatible strings, if still need to differentiant, please find
> other way out?

Agreed. v2 will only add spacemit,k3-com260-tq and k3-com260-tq.dts.

Once the regulators are supported, I plan to describe each power scheme
as an overlay and build the other variant as a composite DTB, i.e.
k3-com260-tq.dtb plus its power overlay, so it keeps the same
compatible.


--=20
Troy Mitchell

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavv4LCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+fyAEA32fW5Y/DoYv2
3Cu2McB1vRv5wspPyKSABjOcL99SY0cA/1W5fQ8Axd/DB/a+Y7vunNMxiHzELf2l
tN8+CTlqC5QL
=RSI3
-----END PGP SIGNATURE-----

--7b521a11c60c864c881ef5d8eb32564a68a084993eb79986689971bdd4fd--


--===============5342019430801880620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5342019430801880620==--

