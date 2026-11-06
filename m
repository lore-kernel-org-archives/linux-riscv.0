Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832E606A336
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mf08Mf2f;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=A1WzslVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l3EljGJt3LujdDEHy5iEgUOAhUCfJ8Ntm9ohjcWUtUU=; b=Mf08Mf2f+VVf5l+YzyNbCR+Hf9
	YOnz564Nz95TV2wNRl0MbXp5jTaMc+UH0zP8c0ZRN7oks+W5tb61eN3gL4R3biixxiC+NOC5Wlf/G
	A8uPQlMivxehCqWPpTmgRDnu7SKd6XKIaAUjOJ4lTfl9oTU9d/fbdpJ3DArLdcf2hH2Zugcs6pPZI
	ldMct46VdJ7rXzTN0voY4ImDxj0dHdb9icWb/LsPDTFIhVCEeU+WupJNZYSxzGlH1IgRnLZVlz0sf
	shYiAOZMy5VxIwGWu7VeOLnCvx3IBkRjF9d9svYTABtdm7LpKaR1jrckH6AMJvKdjv/BmD/NFuPAE
	r/w+m7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKwW-0000000CfLT-1QaG;
	Fri, 06 Nov 2026 14:29:24 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKwS-0000000CfGh-44qR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793975344;
	bh=vzMC/t7/9F/wHvk0dCiUSdp5ZVi9RLoAVmLD5Z32e+M=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=A1WzslVdCUQ/WJRfgyBj3jhc6Lkume/x8blyh77ieCLwqzcI/nARd1gSrHWLm18ko
	 jIHf/fMUK4r2wHT7dS+UWEwwJvRCFYQNW3A5gmk26iRRdFyNmWl4t02uHbsia69AkQ
	 O5GrC29p8pB7S3kia/RQF0FYIUdlUCa4MI0Y/wPI=
X-QQ-mid: zesmtpsz6t1793975342tfca03cd3
X-QQ-Originating-IP: FXWx1J02SNiwq6D76KpE+jmmvOYqfA66DcWE0D9isCM=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 22:29:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11635340926689287876
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 14:28:59 +0000
Message-Id: <DMO76LFWHRFZ.1CQNNBZQE9X10@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Breno Leitao" <leitao@debian.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, "Ali Tariq"
 <alitariq45892@gmail.com>, <netdev@vger.kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>,
 "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <auyG7hGJtMzV0Gbi@gmail.com>
 <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
 <DMO12HWY5N64.2IJ5XMUKM8WWR@linux.spacemit.com>
 <au2_yS85zJYqOaYm@gmail.com>
In-Reply-To: <au2_yS85zJYqOaYm@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MeLso3b7zQmNLST0XqVNLyTWsfrX11Z1ePc5yBgFMtG6Jii4wFCUA08P
	7iGs5Ucx6CvC7foE+P0Zb5lfTDmPaG1PBsvsMhYW0v/ENCoWZlhnwJXm4U8I9uiXJ/PEMaZ
	k8FyAvoUp1/qgV971kTDIYKePrkaQ35xZ6RdBnfNCwF6mX3y3DP30OmcpcYsPBf1ON/NHzB
	5qUWuFoOzHrTZZlVFQEeGlQzTeXPwUIVCxIwprQmwMQcNKtEaJ7S+5mdca4wwV0g6E0k4M9
	04ggUgr6859hzudETy/mKWc2mEVLsBPodx5IUNQZ++SxxCswUkqpzdOUiseiU2l2W+hPgDR
	BBahmOQM7JO0Cuonc0t4Ebo0fP5Fa2L62sUU5pVQ0vzsEI1mlSH/9BpnswGwuFqHLKOZest
	3NjUOjL/ZXonkvq3p4fbE0UlY/jpgemH25xZU1foK+qWtNhKMd735BxiwpgsDuUkE6LW75U
	QiE5GYOm7fDsIurH9vk1t0d/L5lSxssydvez0i1KGoEl6lxQIWr82Yqe199BCBKbrnG5aD3
	X+Mwl49OaXnC2544rJteJCwHqTXyWb8Ftj8Ha8ktY5WYYJ083h79cY5BQRVCL0vTLn7rDZs
	Q16lFu+mSw1K9wLewUqovbWIAVqeOxxkK1+7eRCdYUNUsdJz7InA4DJvD0PwhnBL7wZF3U5
	s0usvguG2/PeTU6zRCbXmcBsm5rWLQbfVFF62JDwutk8HuTXJKkgRMLxmbPKwgquhSiwFAo
	/CE5MZ1NkpwbITLW7GDxpNbHtX1z/IzLwq2+3fG59+E8+w2glitGex50D9x75l9v9ru2IIH
	bR+OXtD6nqddxkeqli9CmtZmdM5fjV+Zw9vJLnyuhWItU9Tv71+k/vyhFTzirGATj8T9tLm
	NJsCpOdeSgitIyyyCctH2kwKRltkt71M6nK6uqNpgJghWLbtloPBULiLLP20V9wcwY7AQ6G
	+RhCw/rWreJxovNJ6y8KA9nT7Jp3WWZ0GzeG4+Md9pWU8pUOaNCCbE8PuIJ8sllmRMpJNDa
	kmfJ3gb0bPr+P9DblJAw5IjzSpil5ap9QGc/xkqsg4WPxbePE7ORiugOnnnVaBQc9ncrRAP
	R5Cf8XyR/GPkjdayTNpp27YRzBKEwCKGxqfkh2iM5HxwTu02eiMdYT7X67J/7cWdHD5RbrB
	qaAYY6r9JTRXgfURGXAutRj5mQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_062921_813880_4FDC1C5A 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Type: multipart/mixed; boundary="===============8351136845644747321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8351136845644747321==
Content-Type: multipart/signed;
 boundary=2e4d8a39a2bea6f818a63b3ff9e25a3c00c3087051a22930243346653cb5;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--2e4d8a39a2bea6f818a63b3ff9e25a3c00c3087051a22930243346653cb5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 6, 2026 at 11:54 AM GMT, Breno Leitao wrote:
> On Fri, Nov 06, 2026 at 09:41:31AM +0000, Troy Mitchell wrote:
>> On Thu, 5 Nov 2026 23:28:31 +0100, Vadim Fedorenko wrote:
>> > > This would work, but I am wondering if it would be possible to call
>> > > rtnl inside the _open function, when dealing with the PHY? in other
>> > > words, shrink the time rtnl is held.
>> >
>> > +1, especially in emac_open() rtnl is needed only in error path case
>>=20
>> emac_open() and emac_stop() are also the driver's .ndo_open and
>> .ndo_stop, which the core already calls with RTNL held, see
>> Documentation/networking/netdevices.rst +214. Taking rtnl_lock()
>> inside them would deadlock on every open and close, so the lock has to
>> stay in the PM callbacks.
>
> That makes sense to me.
>
> Reviewed-by: Breno Leitao <leitao@debian.org>
This tag is deprecated. Version 2 will use a different approach [1]

Link: https://lore.kernel.org/all/c55c5878-d9c1-4863-bc55-99d334ba2ede@gmai=
l.com/ [1]


--=20
Troy Mitchell


--2e4d8a39a2bea6f818a63b3ff9e25a3c00c3087051a22930243346653cb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau3kKyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8XngEAvtzBFhWPFmid
I0DRo4WtvPrX94+31sqkjSWGVgnTIfgBAOgNph85ce2o+93QlLRtOrPDaCJBz/OQ
/EOLlRcW7+EO
=qdeh
-----END PGP SIGNATURE-----

--2e4d8a39a2bea6f818a63b3ff9e25a3c00c3087051a22930243346653cb5--


--===============8351136845644747321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8351136845644747321==--

