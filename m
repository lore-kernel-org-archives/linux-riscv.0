Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBB606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ZDxmXz0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tNUoeoqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fnUkKWFrUeUZ+LiWRxay+0WlEEP7jPSn/cmKD7AYcEo=; b=3ZDxmXz0htCl2UUz7+OkiwClJ4
	q7lhTTD0UNLn1Dbcwnq5YD80CywmAZpcS1VMipcvFvsDjmGt2sg35Ul1vnrgnFQhnd50F9uKcW9KH
	aAl4EPt8gFXxKRfwzV2ttv6Hj3przyP3vgljb9zbyOyWqehjB2Nxj4kmpj/kd5cpURRepiwJvcgMk
	8facksFLw6bJzr9kR8+yk+bS6EfE8Ft96e8o0Rnbl/xnxs/ekhhJTrI7j6Hlse2Z8Ny4D4qkITMFs
	da/RkMXkKLDD4EUo7dQOnWypEBiaWqv2MwkgBl1BJ/c5o74/BWDwBgw16VLQ2K/eDHF5CuZ7GU/1F
	OcJB+xNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ1m-0000000HW0r-2504;
	Mon, 09 Nov 2026 06:38:50 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ1h-0000000HVyK-1e6V
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 06:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206287;
	bh=CR3tvAfi/vhuKX2kubcVJ3VNLkta73TBFdrMFqobo34=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=tNUoeoqNa4wA9S9m4DBhVEGO5Cpv558U6ybNvQ0TQzFl7XXVHvCc1nmfmy9I9WlnG
	 M+HsP60llAOcGqLthINaxrlJCQNwAV/R83zWhVvChmHpdipYQcqpwWgkC9zGNLgBHb
	 AlESYVbztRdVcRdxWz8L3bEQ8hoKnjBFs3WBKxKM=
X-QQ-mid: zesmtpgz9t1794206285t825dde49
X-QQ-Originating-IP: IwUfJm6QB9d8NP+i4b6UrZEEoyyhvenPAmFqfQ3k46w=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:38:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15929030815488421648
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 06:38:02 +0000
Message-Id: <DMQH1N9VV1IY.2Q1NMMIKR2MIN@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033240.361416-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033240.361416-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSHCtT0FCjNonoUS38tup7qoV7fkZLU4pU9zA2YNDpCpPph1p4IGfk8z
	VfNYiSjWB9BuK/wb16J2gXqNhWGcGDEBu0bzyEMkZhyzNWzzlgzUE4TPZVr/W7kxEb3s8Oj
	hD9RPNou+7en59iP6vGNpY4Oyf/EMV4+lF23rBqSOLXZzD4epYoNqhN3NWrQz747OYl6NaD
	Vc+ryZkmP2mD7C56lMmzKHXCwRuIYnm/gnM5Q9ASwv8thhK75RDxtbnJsJ8iYP9TUhKvpz4
	P8iolNnCEG0lJi1TzUJ+0OS9wFONTqMZatJsZwePeJ2GC9xq4C3yfPO2qXzGx/35Y+mncpn
	KjIFySMiax5YXgwEl6Anig6joTK8EKXu07pbq2GLnhEka3zlUE/FgciQEyypd02de3frakG
	jDorUBxI4SuoCe+HRw0qjwrluJsxTlZ6oZIs/X6DIsApVcSVfhVKsAcFbr8lYMvSBnkbe/r
	RFdISNni4sgw+6Kxjn3EvgMKhAYof7RS8WVnnEmIB5L6jv2/97YeYeZxb625uPCNSj7ayet
	TzibmdJ2d4vB11uEolR6uSQ1dZ6peIw3p3lRSFl1yrea/YSQEiY8WRDc/X1+Pu/PMq6o9Rh
	8wKBhaG5gNhWgRhvucsaoEwGpe4YZCzI84pThNhSuskcXT6++3JVbZF/huNc/oG2yBOtzBy
	W0B4VqTVwrTUB/p+0i0l5dxig8IQJnPmiI/YPlQX5GYsdEkRdOdtCOuy2XwDbI1WE2KnVC9
	GGC26Q3g8UTxDrvszHYgONSmem1/io8ycg0av1nb6YeiL7V8z48vH8QtmD/GGQN9VMBGUIi
	otRR4qYJjn/ea0YaB6QVfYzaiY6NDK3fkUsx44KpSo6gd9j23QjI6auR3TxFND1uBm9shhn
	MYoc3lIRtMrkGbo8b9evmbIFn3CYfLflKlN0Q404lnKdEPEXcbf7fIzqNsJeK6XsJfPAA4V
	jbg91SgdR5zCH45W4LavaS4WTpsVSI3ks4mi7C5JvmkKsGamcYKttSv7zZMhGNry4mCp73A
	acyUjh2oJjBiNsgAa9OgZCHcIpXwzDigHpnUvTN7GfzJKU+O7QeekjHO956G9zFZ5h2xSIN
	bqIQCamVHq5gOnXEs9VEDAg59X4eErx/bDlbEja24KN
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_223846_089924_C1B10A01 
X-CRM114-Status: UNSURE (   4.63  )
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
Content-Type: multipart/mixed; boundary="===============3964256454985440266=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3964256454985440266==
Content-Type: multipart/signed;
 boundary=a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:32 AM GMT, Sandie Cao wrote:
> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 boar=
d
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFqSiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+cawEAmuTbJIBqSbKS
j8uuHL7iWjyMcnsLj7MKWkndH8HZa/IBANz9W4bE/oiXueScqETBLZGFyktM9kC8
/G7QkwtLUPUD
=s9s9
-----END PGP SIGNATURE-----

--a45515cc26bb2c3e16f7ddb138529dcefe17028f2f8a02fc6d43a5237aa2--


--===============3964256454985440266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3964256454985440266==--

