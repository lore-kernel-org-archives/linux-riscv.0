Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB5606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nIzrhlgO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pAEdIxxI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nholxY0h8bBSuq15Hl9kNWo/wy91TsFB8wRlhA5C714=; b=nIzrhlgOq5/SIg/Ode0lQExFxE
	/Ed1WNNBUatkQ26ZKESPPZ44ILQYaqOvYNhR6iuI3Qchic8/FYbsHZTTZRI3M06vZs6q79M8A+kY5
	XsSgCcHabczOtzgKu1NQZKIrf1qUkGFDW3gqvq/Dd75vfFEY+C7gjxfAjDaNCftIIL5tLuAHa0Q1M
	5XsIdq2fuWPwCFlTjjC4Ctc4P8uy5VCdPKLLILGj8j0Psi5DdBUGSftfbzfH1596tnXdcrzihD8IM
	HOQAE3buiF0FlSPqc5OiNkBSzNNoY94Uqp84zayxD15fqEqeEqFnIV3wytPdMjc92bjwVw2BLgIFs
	tO8RZryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKv5-0000000Cetl-1gCH;
	Fri, 06 Nov 2026 14:27:55 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKv1-0000000CerC-2VWm
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793975189;
	bh=ies+2HW5mTG1O2fNxFjPMdL4QQNBslFCepJ6zX5a7fw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pAEdIxxI+sv/vZCFW2iSEO2p7nXd507bk4/FWW3GMPIFUSAMOoAmYKpFvJnTIFtb8
	 DwsEjQJweX8/EK6h+KG5rBowKmD9+klaGwtMC0sygs3iwWmGsbbd452DsHp65w5z41
	 PwkaHGgMUgktleso6MYFOgBIIYlT+3qUObJWzi3A=
X-QQ-mid: esmtpsz20t1793975182tbd35ad97
X-QQ-Originating-IP: TXe3qKmdAqKHaOhVsQVWL6itOrYqiQ+KBF3bprKbVQA=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 22:26:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11997525554458896140
EX-QQ-RecipientCnt: 19
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 14:26:19 +0000
Message-Id: <DMO74K2MG3D7.15UUOU1O66K6N@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Vadim Fedorenko"
 <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>, "Andrew Lunn"
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
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>
In-Reply-To: <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBWuQifxIv5b2KBpf8uj++rvDiaU4XvB6Php1CxEZXLCqU4oxsoL71iy
	8Xu5P4MPw29yAfB/T2yQne04rSuQwkA1dI51/CR8gTnJN/TCPgspwmIq9xcFYhxPEeNF/pG
	eZJDGd8Psg0FFlGF7t2NacuW7bDf5zDjkzAFTucTVMBe3Cc3BMPSOZMlYwftK2gakOUgm0E
	NV3cKKWu2wH1Ylc708z448Fj35csoWsOTaecUVB2mw4ctprJRidgkZQAssk4lbhk9PZOKvg
	nR3rZIia00LGlqrAlZsJY/Z+Q8Dk4sj7il+GFRCyKDzst/XQfrN/9wczpQ5A+DzyiuvXyQL
	YXUEWBujpnDE6uxQk1czWctys1Ia8SjZyszyzIeXBjewo33JotYkeOCUiA2jnM8boXzY92H
	iFlVtREuPV2KdJzTGpFDJyjqFMfcxVCyWLkEsWaMzuemsWHM+LMvXMNN3WUxU6Ws+jiIlxc
	75TdP7WAK0yHpquRxdq4cHiOhKCwh0IlU5PIi9/MolGvsDTeSdW4/NpJP7sKKidRmzkpxfR
	b7Zdy2mgWScH8MsEUFwDFnu2eQGQWmDTKSWOSZiYRQOVUPnWyEiP0IwaYGu6goVxAD+TZxB
	F5YRs04N1ATLLGbJ+cN+nqCWEokB6lSQcQS08/z2SQcnCi8H1TAjE3yH4IDAnHd7bJP/B76
	ATI2UjbYShcau5KBIdnfHmzod6GI5/LdXQNnQUtQkzuIUBLOmftZPNGimqdjiyR0vJMJqwO
	ymcZXpyfrJ0yjfM0fMphxXhthFDP4HhWtmKfTOgyKbWSYKsmQCY30Yeb4VJ6XJAo/jHCWkH
	FpTYAxNP78QJ04YhzFfrFLJtqAhuQfP1JWwPq+2xPinN3V2fcU6k8OfFVsSoOAl8dCikLRh
	Qy4ZRS1lXAn6JgMs2s1GJ97nCoiFa+wCr1D+hUhz7x4LaVjXKX0fM8yNIryZ0wNAusbUrD2
	IgRu9rLlFP0nwByDiRQpgUQvHwCNynuWa3H0PMP5hxg5TPwYuqes3VX4G+/n6GYEjZzcSJA
	MNbdiM5Q2F7Q1GzOVIQQ8HpkoSo2X2NIFxLre8+CTcOEI/v5BjXlzMKmU2j+SrEDWgjk6Sk
	iR/99CKTUBXN8wjEdL13xl0Ht1BBLBlMyxiR/CGYj24qYO5n1y574LkjT43+J4Lfw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_062752_807392_43220420 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============6421481142218240856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6421481142218240856==
Content-Type: multipart/signed;
 boundary=dccf64d274bd60cba0fa2d9ae238bd5d3708f6eae0880e28d195f102ba69;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--dccf64d274bd60cba0fa2d9ae238bd5d3708f6eae0880e28d195f102ba69
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri, 6 Nov 2026 15:44:50 +0500, Ali Tariq wrote:
> For the deadlock, I think the correct function to call is
> rtnl_trylock() inside the emac_tx_timeout_task(), which would return
> if the lock is already held and will hold the lock if it is not.
>
> What are your thoughts on this? Does a v2 changing rtnl_lock() to
> rtnl_trylock() inside emac_tx_timeout_task() make sense?
rtnl_trylock() there is fine, it fixes the suspend case.

Looking at it, I found an existing bug though: once the work holds RTNL
it deadlocks on itself, on every TX timeout:

  emac_tx_timeout_task()
    dev_close()
      emac_stop()
        emac_down()
          cancel_work_sync(&priv->tx_timeout_task)  <- waits for itself

rtnl_trylock() does not help with that. Please fix it in a separate
patch ahead of this one, e.g. by resetting in place instead of going
through dev_close()/dev_open(). Feel free to add:
Reported-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell

--dccf64d274bd60cba0fa2d9ae238bd5d3708f6eae0880e28d195f102ba69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau3jiyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9EhwD/bCyatTRIBS+r
zpKFQzPzJykRoAVi4Rh6mDltoPZYzRkBALYRVcX6Wn1PJuX0hMwEF/A7ErpRIC/z
5Ba+Vr8flvEC
=Qi5F
-----END PGP SIGNATURE-----

--dccf64d274bd60cba0fa2d9ae238bd5d3708f6eae0880e28d195f102ba69--


--===============6421481142218240856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6421481142218240856==--

