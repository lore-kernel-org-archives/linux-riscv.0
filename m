Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CB606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VkWWze+N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mjG/+kMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HOVL5F0b6OGhwhtDAhT9d/kxOfs9ukeZQpl0mYNqY8Y=; b=VkWWze+NsDz3pBifdIX/o9WLOk
	+UK+pXDkMPen0Xy37gFEHC5ZfaFiGyytTuKk8gZWY3mUOhxaTzKejusCr6SZwQAGmC+7QnHAuQ/bt
	VfH2Iwiq3V00NG2syBaf877nyynUTNiL1FL7qv98iFhdIGBGPJ9m3iyCZpAJp5Mnb5L1UeZvYxmZt
	S+gApSnCOU0Q5ow2BwWAZjhZyNGuohLaA4/HFS37/469vShd5Eep0d27or3XCvZQdbJXylvEX9Sjp
	QYtrScHH68DB3hjp511Hv6dmEZ9WPzRTagD8sAEWjJ/bcLZIPBeQqhrrenUAo0bLxg05YslfJZmCs
	Ywg6sD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR50K-00000006Fth-2Lbc;
	Wed, 11 Nov 2026 09:52:32 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR50G-00000006Fr0-2CWl
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794390726;
	bh=DG1BenR9t2CnTlPb8/ogURcL1e6BMKuUq7sc1gbDGHo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=mjG/+kMnUZWetaFV2Vgby66+o7QHCPRGnJHM+Bh/iaW6tWiRlrgQtd2xeCaAP0gzZ
	 j4KvD70sugn679HzzhTC/Izg5XFeaR4rjKNu0b7IuYdxgeddjVIdqJ13P3Xj2oNdZ3
	 3n3ngqxTuJ3xejINVe1W681A6WlVncjidL7IbWUA=
X-QQ-mid: esmtpsz20t1794390724t563d4722
X-QQ-Originating-IP: fXB4PNbNwEfDwLguUILLu5oL1M0xcKGD1gmFw5eQsO8=
Received: from = ( [183.48.246.46])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 17:52:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1931649316664943864
EX-QQ-RecipientCnt: 19
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 09:52:01 +0000
Message-Id: <DMSAF9BN11D0.IDM8IS01DE6B@linux.spacemit.com>
Cc: "Vasily Khoruzhick" <anarsoul@gmail.com>, "Alistair Francis"
 <alistair@alistair23.me>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <linux-bluetooth@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
 <20261111094557.443481-3-frederic.mahe@cirad.fr>
In-Reply-To: <20261111094557.443481-3-frederic.mahe@cirad.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQATRXU0qUVPtMJGdV/qYTqHVHYqtOb/+8WoFrBTaqq+ETn+zwvGt12e
	jAap32TdQuikSDDRXc0uznT5uAUwCr2P/ZUlr8iJ2rwGTb6V8BgJE+iFrPcBHulhC4X9EbE
	D3u5LQXFmzXULkNAyslr77brZ2cFoUDzPRXgamKRGyyoWlhhe5fbSty5LYarOKSnmkWdEVC
	YqHnsSZ+VopkKAGHvPFLpUT/UMGwQoyu4WSnuS6JHbVKJ7mxQ0ZQv+9M3mSLTsaBhUBrP4e
	CLy5s6grLFbF7VtffsL01J2w/q6XcoSIOOrc1hBzG8dO743sWUb0YtFDBn9+12MT4gHDnfB
	lFv/gbBFWilS8far+1/DVtLzzMEWGs/NKPE+zniTOnL3ePPLutoRh00fXYFbf3XCfFimA0T
	Y0TN7KRfLh7GuyIzrLyUqxpmbiSn8nuPnfet1Z7wsrB22XY5UdbQsMXAw1EHONLgXc0KY3Q
	/DknF6ft5eBBTr2fAVx1ui7OdzE9SVDOfXW/LNzqfTEXwzAWBIgLVhq9sfN90l2MbJ2Cjay
	63BJJWLVFrefBmXYCfr+dIzGdR2GxY/iN1y/SNlcpHTicnZkjp38Gvr78G6v7snFLvVV3L5
	pJui0ETk8VGkhBXBRMfnPL1gx1HihvLz7gJM8eLXpMDVVJtz0K9XBzVbbYodB8pliGyS487
	Z/4DF8i/G0CIWQgNzTrvDz0RfmFa3+4OPdL9G45kaUCd4XbSoyIZ9Yg+r4PJuCN/DKnShAv
	VlXu5JNP7eCS61AwCGOrCZV4jbywshcnD1r5ccA3N6+ToABYB6awhv9xUV1oNfuxJ81m9MF
	mQmKXS2kOgH6o7eqd7vbhnFA9dxB/hTrJp8qEU8CT8cbbybKPq3HFIy77BNVa6MfuaA2qz+
	pn6tO+0UmnPRBN23OlKh/q+o88sBmF/p2KijUYWuhftFrRXRFT3YFWFGXVHHw5+YxmW0jWM
	mqpkrX+6kJC7oSyCFdwYYGF8VSgfufvomqgF3xN51P+ZU/X3yZQdvPSpuR+nfimVLUYRCv4
	YKdwFdW5aJO061sef03Y+2+nk25uNf+44pNE3ZK+19rmWVJViKlnfThxZMEZ1XXTAYd3WS8
	wt5nFb17B84g7MNTSISy8Q=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_015229_520991_777B3A25 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: multipart/mixed; boundary="===============6132221111097204620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6132221111097204620==
Content-Type: multipart/signed;
 boundary=6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 11, 2026 at 9:45 AM GMT, Fr=C3=A9d=C3=A9ric Mah=C3=A9 wrote:
> The BPI-F3 has an RTL8852BS module whose Bluetooth part is on UART2,
> with hardware flow control. GPIO 63 powers Bluetooth on and GPIO 64
> is the device wake line.
>
> The firmware config switches the UART to 1.5 Mbaud, so take the UART2
> clock from slow_uart2, set to 48 MHz.
>
> Tested with a laptop: scan, pairing, and l2ping in both directions,
> including incoming connections while the UART is runtime suspended.
> An 8-hour soak (an HCI command every 20 s) showed no errors.
>
> This patch was prepared with the help of an AI assistant (Claude),
> which also ran the tests.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavQ6wSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+EYAD+PVfe6aNSkOPl
AkTo/K9XuL9d/7QM1aSnDy4F1QOkuwsA/36C73njG07WkyEjw5wg2ulhtMmt7wNc
2/e/DVeUUG4B
=v4s2
-----END PGP SIGNATURE-----

--6359a66ba761be3e5a04adee6e9d479520c40fb2731af54d02b8be3e9469--


--===============6132221111097204620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6132221111097204620==--

