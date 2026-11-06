Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C48606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXKnF9Rd;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fguBcwZu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=atPrEa5IkoanTdoK0kgaOvTNHet3RN/qFlfPHWMNPXo=; b=FXKnF9Rd3htGbWxnTtoXAfgEw5
	ohaGCSd/hh+EgZr+qjqECLj0JeO7uYLa66b2dtAQwF7J02Q7etmqNgbWXCUh6tf+q706djjoAZzAR
	53v/gsAzAkwmhfntIF4EnCv+YOVMyA/wRkxFIb+Pet7iZ5y1FbMLboGi1mI37F5U0bnDzeiN2QDjZ
	d8UkcrUWUNikq46foWXVBsSSyabOxS+wNtUcwSmR+hRzAl6CU7kGb9bbJpd3rYe5clIYgIwwsbfev
	nxDT5SbwgwYaCAB9yq/igMyDi/NNXPhRURu5InNOjMHooewpSOjWYfgNY/EQxNTiRbYC7VYSkCcLS
	5uNhoYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGTz-0000000BnC0-0VLp;
	Fri, 06 Nov 2026 09:43:39 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGTw-0000000Bn9t-1UaH
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793958204;
	bh=blMJGbxMwm6av2/iDvDL9moahXaJKRpPkibjKFYQdkI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=fguBcwZuma/+ZTYPeBCBS+YwpzOB/uE6cevPzKfZJUSFEbY6XwfJbNJbEXCJLmLY+
	 mKGW+Lhby4ramecbS+iIUioq+YKNeaTiFGSbivos/UzPTVy6f94sWZhaOo6KIY1DH/
	 xb4E+ZF9OB1eQVXts7u40vw1rCVnlq6hc4Z40rKY=
X-QQ-mid: esmtpgz15t1793958202t3e9cd9d6
X-QQ-Originating-IP: jIuZSmu909T2mXIbvXI+whezccbjBGBVhrC1Z/FFRxU=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 17:43:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8979647044632498265
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 09:41:31 +0000
Message-Id: <DMO12HWY5N64.2IJ5XMUKM8WWR@linux.spacemit.com>
Cc: "Breno Leitao" <leitao@debian.org>, "Ali Tariq"
 <alitariq45892@gmail.com>, <netdev@vger.kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>,
 "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>
In-Reply-To: <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <auyG7hGJtMzV0Gbi@gmail.com>
 <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nt9jTSMqbQyw7EzQ8rBzq4Z9Zp4Alencx3ESmXDi8+V3mLaZZKAMQxag
	eMH/LEvUPhGMVz7ZJLR824JShUJQPkUwqRJrIqVQR8I+1vO1nnybph8pvo/4ASeUSejXE9s
	Fmdyu1SlYhXey1BW+R8MtZTV7/MepWDoy/+A9mLyPstGL8fXZznbExmEe7WVV6+1Mq2pmdX
	ukmf6WfY/X9MtRoJWdOVnOWquAk/TPWndOik7BoV8QR5kzbYGK1P/sMgffHeN1giaUlByfs
	02qFY+770r7A91OYa6+i6wWHeTnhrNFp6N3xJEVTb67IekgpUAsdIHn6b3JGAF/80WVJw00
	OTtwMp13ToR+CSXODrzteBTBRSZ8USDlYEb3UCzrYN/b7amLZkudY3wy6DcniHPRIJZg7es
	s4B4jB5euwKb2KFCPGw6vFmcKRGnsapzAKw5A36UQQwk6ApnwnH75rwyXvA3KrmYQFcLUlc
	Ll8gRK7GZvfzrJZlXkqX1b5nkAfDuCU+wvaEMfOUSqO2IJ/Z2j3I9AQb0afLUrDwnKpviY5
	dDeWAstsXz1nLcrZz+oqDVC9kX08NjUtwvSWeOiokRZYFUXJRiBD8mMbm8Ah0MTAxq3jabs
	XFh6IgD/Kbedgm/oqfEQZODcAadSNlzMeRvhJ19T+aIRPJYprZUsLFmm3kFMgNWTNNP2Pku
	0lUlAV1Ti/Ee0dQuIpHd7Md5HvfFnj0m3tHcqSrxJwQ65jDTPlQGkBA+qG3F+OqL+kysm7i
	cHvxRnUO197e9QnSMFpzqAD/j9YUHB8UZ/zRDlB/0CecNnzlRghzXULKm/uk2gsel2HvtUI
	K1bItrZ03usGjV07KDUAbRuttFUnzgyyavWvkUHoSv0UwVzumMoqk0mWccv2SBJeA5GzBeh
	k58gg+4IdTIXdOsvjm7zxaQUSVIN0lTE7GAXvu9iaD1IkAUIrgyTCoC/SZx5iF+Gzc2eSaN
	vWGf9+uMDzvoiqhzwcNgO6LWC94e59IplSC0rOixxp3HbPg7JiEH2QV3oD3OF35/uKcMJ57
	JQ7CM05sUha82fzRAIKckKwM/G/8pvpEVaGVQePkn60bZKdeVabLFCkfspO5VsqWqZkICvN
	agVX6jrGf0WUHwL39XMBR7++mlRm4d0CY5RZRvb0nrW
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014337_198508_FABEBC13 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: multipart/mixed; boundary="===============6821690854874953764=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6821690854874953764==
Content-Type: multipart/signed;
 boundary=a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu, 5 Nov 2026 23:28:31 +0100, Vadim Fedorenko wrote:
> > This would work, but I am wondering if it would be possible to call
> > rtnl inside the _open function, when dealing with the PHY? in other
> > words, shrink the time rtnl is held.
>
> +1, especially in emac_open() rtnl is needed only in error path case

emac_open() and emac_stop() are also the driver's .ndo_open and
.ndo_stop, which the core already calls with RTNL held, see
Documentation/networking/netdevices.rst +214. Taking rtnl_lock()
inside them would deadlock on every open and close, so the lock has to
stay in the PM callbacks.

--=20
Troy Mitchell

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau2gyyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/sYgEArnzrvoEorz2G
Y2hnIBkthr/roqcA3mN1Myib4RGNrAgBALHeFO9LRWtQPHq465XKysk/b8m4tfA+
3Ot7ASy+eIcE
=2hA2
-----END PGP SIGNATURE-----

--a74825bda5efc2129772b0dfb928ded8e9c9b2e043bd604a7be0814b50ab--


--===============6821690854874953764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6821690854874953764==--

