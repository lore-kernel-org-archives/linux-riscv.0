Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638BE606A335
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Xo2XWPY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=LFI8XWKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FrBkEieFyBCCduf3Py3+wlTs/Phn/kKvt+sqOeVYVAQ=; b=4Xo2XWPYp9V3RaUt/utLB84GrF
	1/ug51bR760W/KS+4gTzBt8WC0oZG68CioZj93vY24LQESMt3fzUY90LToXYGhEDITNfKi3zodMNX
	HEyDPvplIDU49M06hz6KLXu6XdcZMHA5Hy0b9G3z8b8OzlcNNq2RdFtVmSPlZnHI9/0IAx9QXJxoM
	8b/rOrnlXX6ujAObeyG5gmNnVhk/w9U/6mqB6C55hP4l+YFCAiVWmEptO9M8njasHUzPo/j3/pzdK
	wuOsjvGQkxzYEeyDOtj64B0kvCUkUAyrGLLC6zMnOq1lHQAxkxE77zF5ubZsB0hC4ezGZ8BlCYuQT
	H/mTf5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGUg-0000000BnQM-1f51;
	Fri, 06 Nov 2026 09:44:22 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGUd-0000000BnLi-3EKh
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793958205;
	bh=9/DtOlqcnZlR+V7YT17eJeJ5DWSpW+gyRGTq+hXLQi4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=LFI8XWKjagsIEWY2kztslJ5NT/cdkkTTZErTMsLNFuUmmi3mekfMiP+eYlbTwRKqw
	 nz9BZcXMFzAKUS21K0kWD8lP0YZkoYSnm2mR1BDDTnTtGncWyTPkRvziuMfF3TxKh+
	 FjrGlV5ZknmCUeKsCwS8Seytc2XTZ7hqgEmWYvMY=
X-QQ-mid: zesmtpgz5t1793958197tde09d153
X-QQ-Originating-IP: SSnJYTmBN3BhoxreIb1kPVMxIhg0JADN7bMGfACzEgM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 17:43:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12871150989678230177
EX-QQ-RecipientCnt: 19
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 09:43:13 +0000
Message-Id: <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Cc: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek"
 <tmshlvck@gmail.com>, "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime
 Chevallier" <maxime.chevallier@bootlin.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>
In-Reply-To: <20261105123441.2524171-1-alitariq45892@gmail.com>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzZqz+taJMIt9SZKFNWImxRRAgVc+h7Ws1Z+YWOGTgzf/gAmB7h2Z+vC
	7ya7owyEkVzrUS6OerFYKnbgmxjXklHiwTTHb3dQf4RCHpnfLKK/QQQ+DstHiyqVyXTXYCT
	O7YyApiICUDpsFseMG8riEC06BCOdRPNHJT02dp2SoL/GPycejYAkMGqkEQxL5VTxKBqShf
	V3TZfLBYx73ToV5BdVG/0RS4yrNVZ34KTH00OQ4pgtZSN6B2CQBKjFXq9Xr/Jf6W/KxwqMH
	XGOe45P8P4l0505rUuFFS/G90MZZElpKrY57J0rpLR1e/BUv+5dodRv2NyjjUt/lTWAjLty
	qDwB6p/xKfuIWDLbpgt5MWrOXIYoW+wsf9yFk60f/4IZ4q4zCwUrQkRFM6VJbxkSkT8AvNY
	28JhO+5YJtR4oTQK8D+HtUJMpcWYQFvyvtdO4GvkKgs5JsTKse3o84eJpvhlRecjauUstpU
	F1EKgFkBfC6F3b618T1hOfxNVscAbiN6pA8CUs4LONEdMYr3jn/hcFE1R+tfPyEfyYIHVej
	WoejMGkDWnKc1d6QMb6S/7Z9YUZNCAndXbSVaq6gXYzstvfb5+SQSfFFqZJdONKc8BRZkbU
	UWJ9gKe6bOT7o7XbxGHWOtfIBXqYZiXzUmV/y5J05UIHHj1ZvMDRSlzX4x4NzI9suSzKEFn
	bk+ixysM3xUbgf9sSQAV3ZxWhZUKGYXRgqj+S9PmvohJlr47mUojyf5zOz5Z1k2T/u5Y1hp
	8CZJq66eGxxbIXxpVXLle6t/RJPI5F4lKmq93wNGMRg2hkiswADVn6e6gOLcC2ECygsVc/J
	Gv5yn8gez+SXvzwJmRIr33eTmoq//CTclwJaktkD9ShwaPea6MG0cnQGug6ZHkqbUhH2PY0
	QwmkB0DYS776Fi3sL6dryr7Gsjg7koh5Dljxz27WSEH5MWPydnsiy2KAvIyj+hqFePgdmEk
	sTpNstbhLE1UN/weZYoqghVQokVyqEWXL/xtwi66naaG3isWoVTOs9I8hM4KNSYLVTDZLX2
	ymjMQONZKAvKsa+6g9fEvpZoL8sMZhjZf24ogIogUs2xReCa7oBgco8oh6N6sg2YIj1RAek
	OBV5U/hBQY1
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014420_158135_58768B2F 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: multipart/mixed; boundary="===============8018452920040211119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8018452920040211119==
Content-Type: multipart/signed;
 boundary=f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>  		return 0;
>  	}
> =20
> +	rtnl_lock();
>  	emac_stop(ndev);
> +	rtnl_unlock();
> =20
>  	clk_disable_unprepare(priv->bus_clk);
>  	netif_device_detach(ndev);
This can deadlock. emac_stop() -> emac_down() calls
cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
emac_tx_timeout_task() starts with rtnl_lock().=20

--=20
Troy Mitchell

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau2hMSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8JlQEAndRU8NMombSV
ki0R8/v7iIuQ+4g0XE3owkq22upYmUgA/1pcBD9aP0bGv/WS5y8ksJFFjURLLOBw
QJMXWHSubnoE
=s+my
-----END PGP SIGNATURE-----

--f1f8309b4664d3b53368ed8288ac3d7ae208ce6bdd6cde5c5354fa748c09--


--===============8018452920040211119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8018452920040211119==--

