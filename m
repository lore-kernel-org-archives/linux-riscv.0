Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04707606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hPqHVXFE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZCJ16S+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XZgbXBZZuD4W/S/3MbRt/4kGnTr4dLHWSgxC1uii5dM=; b=hPqHVXFEfDdfrDaTBgErPn7Lzi
	XjGWFGjgtFx6AUztXzh/sRGFGU0FkF+VBZVbzqaaUcDuG6jDzqBNINPZz+3IZt3yKdinsBo9N8Dwo
	ZcjQYJ7Em4YiZ2Era/H5x013JiFR/Q04HL23Ktj2Y/Z5KjYg9CiiEcB3jT2mErBALVNTlbrJ4qcJa
	jBXWlvaLoHiJzsISCvbXHyX2DR+5JXSNGiYXr0eXIefL4SAzFmZbKVSzL0iSXZUJtmV6Ab4K4CI6k
	8i0Xrm3qMy48iPxNwa6crUI1V9hMe3s3/rhyj23v+9z80KQq+Rz7VNq9ELjQgxLo9xmNO4wUSQ9Tu
	3+6rIPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWi-00000007lWo-0cMa;
	Wed, 18 Nov 2026 05:48:12 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWe-00000007lVq-0cvX
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794980868;
	bh=3Ql1Gr7XMzmIYBbEO+a9ghZlVqPmLxdm3zP1UNICVgI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZCJ16S+pRKus4/MhUuggytURC9+Oy87x/0tUm7jmxCA82pieK2ZUEenMnIbBmbkq3
	 hyLWRAOi8cGUhpwOeSbGMKgbpaoi5AW02jrBpk3v+uKxMxzrsqvFBksbcZUICRtMvJ
	 vzd8D48c30npOfzXbSuxs0bU5U7umt6oQN5L0XBQ=
X-QQ-mid: esmtpgz11t1794980867td74787de
X-QQ-Originating-IP: WqBZLnoXOwmHGTghcgp5ZEgWINbdmL0mzbXNLz00OgM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 13:47:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13421804356627132485
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 05:47:43 +0000
Message-Id: <DMY3M0ZQ168B.2V9AQM1FXCHY6@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Philipp Zabel" <p.zabel@pengutronix.de>
In-Reply-To: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com> <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com> <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYpbVsTx4C81k6RhXicVSquGdMhCcixoLt6YOvj7Cv+KZrK6oOMg23T4
	UFsSreF82J1hoqhkEoW0UxjPrkjPQQ/DRJQ7/DAQ80y3OgoCHGowW/lorBG+DgrvPEODNdh
	Q4H/j5h8DIeZikQ4+liZCnghL52Wi50wcTrPjLaYiAV+WcPBFUuEDvPDFwBm/pq7e2C5ZCt
	HfLKZBwpMH313XipgtfSvv2S+eSZjx8sRVKEj7r1wyVll/RkrCkFVppKPGgU3aADWhact1I
	6VcZO+Wmh/oTEVVxM8jyMMS+1DH4Ty3aJKIO4n4vpcjKcPGwVGBMLGtg+YNt3CJD9vMHbvY
	H0ymnnIuJyKc19K90yQQpp8T1tdJlFsBPIRvh+cexKjZaxbvKaJov3p1tZTHmrxmoMBPPk1
	bExk77hPpuCQBEcCGxOF6d/07T6wlxEDv7ThSAokiqAtWfBls0R71t8ee+V2tijdDPbjbcX
	bsRb2nVltPxELnRYgTzZJOsSxgmqaMDCzRDb9CcGWoftDNVrr46kji1v90KBi0hDYSgIykW
	Z7Ft2dHfZakh5faZAG421rVsIZjCw+aWXzXkoqHizwFbJd18VZz8YIA3AnB0H5DnEqm8yS6
	JntgQC3uik49AiEK8qQ2T243zFJrUaSEM/LxQG7CcwRy+Kc/+9Zyk4n2kzuxFKMJ4CJzdaG
	sxzZyhPAjG/m3npuPYAzatEtnFINcFYiVAyW1ivxM5AGXBbugtOyRdzQaIfxYBlegREwkrP
	0JhU/sGyStCEG7RhO+Z40NSaxr4qo9OgwxC/CcLmPgHjq3NzvSwnH2ZNhGHnSE4m+5KzlCs
	dsUE8HuRRBw/RaoY/PE5h24izDIukknP2aZjr1pWQCI0/F4qjjddoHls3kfW8VBnAVodIJx
	d2Vlu1ezFHqGx+HF187b1kAGprPeXBGUh/WnuXMieYCEDhSjXgD9PC3Ij9vvq3Z+Q8s7yZi
	9fikNyG5tJN9U3ATmLaOh95Ln3r85Qq+NgNJLR3vQJMhnKeDpkZ8/Nn+qhaw8r+9hijTqWa
	YicTLCNBsZwfIBFZyeQ0nqBz1ckMamBYtF5vi69UFymRlt3YZ+VRl7R738NMNuZU98h558X
	A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214809_315578_6821E232 
X-CRM114-Status: UNSURE (   6.10  )
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
Content-Type: multipart/mixed; boundary="===============6831474018671263829=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6831474018671263829==
Content-Type: multipart/signed;
 boundary=cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 17 Nov 2026 10:52:27 +0100, Philipp Zabel wrote:
> > +	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM
>
> Drop the unnecessary RESET_CONTROLLER dependency, the reset controller
> API has stubs for consumers.
Will drop it in v3, thanks.

--=20
Troy Mitchell

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCav07/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+lUQEAthB6oPUi2jXt
IqbHKSVLLDvTw/RU7hb22TAJ38TsUmcBAMLwBrw6KEtlygOnqJaK3gXV/J5oro6Q
qQd0Uc3YEowE
=qCKP
-----END PGP SIGNATURE-----

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370--


--===============6831474018671263829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6831474018671263829==--

