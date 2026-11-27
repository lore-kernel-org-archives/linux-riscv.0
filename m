Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72F606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TO8lc/lU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SjWbyELg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eP9rUmcVDCJMbTTEISMFC6pcIiu6qee+L2m2dT4/jjI=; b=TO8lc/lUDKXD6aAd1oKKM9cY4P
	cuDaNo101Ag9+9f+hCZhOLD0PtGttmA4xvJepDLaiJTqzjlN/B50MI76sXqbhHRt4ubsqJdSVHjdB
	Kwo6JvGuSwT83boBz60bSXI8VDwRidt0jRWSZJmuhix7ipIRlwoi4LAkx4gZEfQ1jwLM9h9aGj8cK
	AOIyehqLdre1GTAnvlH27yBGRmOna06WXp0/qpKlLQSMda86b/LDLvKWezc25mbSabfzFclWjAykB
	9Zh5OlHDpkTZU26Oz5difzIGfmkA//aDtGAvsI2RzRk4d5W03osHpCminZfCsXKtH3fZrPHZ0mun5
	qb90YVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp4v-0000000F042-2roH;
	Fri, 27 Nov 2026 06:05:01 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp4t-0000000F01Z-1h3L
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759440;
	bh=6JumvAHOP2AK1HGwC7E01j70Ya2ecZb8F2RHmqR9Yyw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=SjWbyELgTsWeWED3jYmyArOL8yB1+WDYq+9RBmOewKxunZh2NytCzai5KEfDfB0Ug
	 s4zqxPYS2Sf7JLEsp4dHdXWi1lcg/wDrioOfiGWOPLONq6pQoaOSId08PvGMtku1Wa
	 Ia+E7vAb5VcxJzA/74dUR8ttZ+jUOj5drKj8MaLE=
X-QQ-mid: esmtpsz11t1795759439t27ceb795
X-QQ-Originating-IP: XwpB4emc8zy9NTegUDS57CqD1DRQzcVkx6sNW/aBB/8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 934310561638399512
EX-QQ-RecipientCnt: 13
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 06:03:55 +0000
Message-Id: <DN5RLC1L2N0Z.1ME02BVHS65GB@linux.spacemit.com>
Subject: Re: [PATCH 2/4] riscv: dts: spacemit: k3: Use Pin Macro
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OdIVOfqOaVcrmUNXitjS6/aXuZkeD+O5Viuy63Ul8Kw8M2DoJGz9VPB0
	CPUcqyoEzyEpJ5qwdp1NFOAuAi4Yx3M7dQoxCi3rnqEtuiS+1SSMA3Ciskn4GG7fHSENBbo
	tS1oDp2ctJWxYLp3T4g3BtNd7U/45fZVoxXC7Sd0gYripEVQ8xvzoFp5DYyDg8xSeXhXLoz
	knwmZHxwAL5ADuN0kVFAJ7+e8hltbCPgVZ9TMHtq1ZjMWUVt11OuhfCdfs64ppp7jkdFXaK
	m0v8u7Mb0BpttOSN7s3PeWvzumjYVG9bH4izPpx7PtoGxtoWq7cthz+89argfIGGw6uWg3V
	v897SvxWeJXYdSszoR0BGK8UU2UCyMU6FOcEa7ZKpv/QDD3gJLQxtTB1SNk/rdlfsdZps+e
	8NnjckpewPEB5lkOIatS1pO7yS/6l21Taerpodt/R+KFsTuRFvCEclEBy0D6rwKCt4IZjUw
	+mWXUrRKxsYlQVz5DKCJjd24NQkgXYSBKGvFKkpaCnMZHPxBPOSSb9kdOUcdq2TSaYo/2mZ
	S2COtGL7ZNEGmTwSQkrtjcTW+nRmbSeno/rd4Rfg3IaAeF4qKnyS4lCtC+LbflRqfnDR4AI
	TGivqW1Y0ZPLv6LG+7Zlf2vf6e3kqJCkbtyBqvS928ddCHHRI9+0tZwii+QGLxLFgu/4qdt
	sSdQ1IfLIEWHMOqCif9TzeHu9wHq+DUZRn8puPYOB+Pg2h2k9KOdimFtsi5wuopNRLBOFb5
	amf4r5hTgSUXRJTCFe+Tzp7fzMF26mPp6i7OsDz+bFKEro/oG1m1wZS8SA3cOb8a+fOYUef
	bywOS9m1PQA4g2/WPtYzQEkxHIjjopYqkBuwd0Y57lm8+DaM/6X9jBL3QPT8lTLOy5VQkml
	9yNKilH+pDaA7MEOT5yPyH/jDA8L8jrOD+jBwGG9n92PAqFdOYg2LcImbz/GYjdlcTlrc9E
	SQNzDnwt9EyJuEaKMjXdQlc/UZIfd8SU4GtKM+oV8Sig3FECDTPUDFi4paqLxxx3WdBMx7x
	KaPYG2bHoJbdrSr5Uyxa3hp3EsCGCSP5733YCaz1/gDY3Yp91BoIcPXthebLbT0hkgp/V9r
	V5+hq9ptSaEiVFxZhuJfeDc9BhCOtvCmIXImpcdy/tZ
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_220459_824980_B02E0737 
X-CRM114-Status: UNSURE (   4.77  )
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
Content-Type: multipart/mixed; boundary="===============4518011381493096615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4518011381493096615==
Content-Type: multipart/signed;
 boundary=bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Use Macro for the GPIO Pin definition, which match enumeration from
> pinctrl driver and make people easy to grep for debugging purpose.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdSyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/PhAD+MjsNYLaaUSS+
jnOaXI3bd6fSlgrwHfaHd0YUBnotjDcBAIENH5z4d1y4JP/lnkqh0ElpBLFje1LC
PTNC3ih9fLwP
=j3if
-----END PGP SIGNATURE-----

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6--


--===============4518011381493096615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4518011381493096615==--

