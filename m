Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B66606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZnFAvgF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gW30Pkey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Ei4MVty+PkHzg4GqKcb1WzGlK3WE2TjcGTkDgm7PHQ=; b=EZnFAvgF8CCXsxgNrcapEYIhg1
	rWUd2WJ/WA2LA79/UQshKxppxmm0P0yNV33KjVuKoOpKBOuu2U+wTJH18Dy76BGmbK7caFrSFFOij
	yM26VfVV31xJrmlQGdlkcfPIWinJ9MxwQGeTJnnp8XNFMAsTH75liog28vPOCO4Cili/S6mWYoiot
	ccOX3ydGuG8rycbSOJqqcKfdJmbiDCy6lVgbk5n+zgrirGwYAJts35h6iavqbBQFF0r+QTQFk23x/
	LPWXjSI1qDvvPaQzEIYRukmOk6qVVomftUNCl5EiCTgYYE1FA1kmIDlFzrFq/LpXu7udQglf126Fq
	ixNK3Wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlvl-00000007Qe6-2oeV;
	Thu, 05 Nov 2026 01:06:17 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlvh-00000007Qc6-1Blr
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 01:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793840750;
	bh=Z6KzLUrXAz/7ezwxnktJkotKAtm3QpIuW+6JblMcjgU=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=gW30PkeyylzigtFyedAgvwjpTbVkLmAYMIL7NBkSYjCJZDyS5Byd2gd+ARZUFYsGl
	 ZPiasFCzbL8Yo8rbK64ln1YzDpoPRE4eCYR8jNq8BELz/K8baWEVSJ/GP5u0bLSmM2
	 uJG82FG0utuoXWscvdgPUsfwPU78EB3xIQ32WGCM=
X-QQ-mid: esmtpsz10t1793840744te03083a1
X-QQ-Originating-IP: f1iOjw8CoXrK9BH5TL6CnZ6XmusYLHJuBDVeTopfVro=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:05:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1357862901825971351
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 09:05:39 +0800
Message-Id: <DMMVGZBBQYU8.29I5BD5M9Z92Q@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-QQ-IMAP: 0
X-QQ-SSF: 0000000000000000000000000000000
In-Reply-To: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com> <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
X-TUID: fCS71Nn8OH1k
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkLA2q2LD229lrTptkMGgc3LgSv0NORU3hyi4g8YZEoQ0JrgUVzEAP9P
	GMgTehFb2YFC5LHAljXetK3oQtyWvztbfDl0fW/MWCkLEJ8L/aBEVQCXeQnO+EfbaKtXkSV
	WbPGOKkLvnz3AxJDVRb4E681HzmQbYt1hSGD6lFgmFenFETFPu39c4Funr0I1NKMu2xaD4K
	ARClesWr5T2RVKHslcofSzsol4K02efQToZgfIgJfKAIAcBEPdFM93QQASsbXOtXxb4O4HI
	YbTJUvRdnJU15qZIPZXv2Bbd9Dwdp6Z2vPvtE5/2HoV1qcABnKcddjOfJB/ldAaPb39JmMP
	qamLIJBPAeplHraw5xIFUjDER33MGl+tqIZ/ZbxLtH02ysgLqNXpamgI3oPY1NCfXq07RLP
	96hvw9SOp3th14X4dzGtXOOmeZ8T0NKY9HyLVsa5AKcNv6oShBxApLNgfGRE6BBIs7oWRph
	KeS3zOC/byftJGef+m1TbFMfsbyA+L2iyTSqeXPX8NUtZLlCzFtybvHokp5Wfo9coh2BLTl
	mf/rs3fITvJY1w9xG/FEOaOXFo56QZ5UQRvOGugO06EiXjNvPQ7a3fWuwrLXd12hRHCUTgv
	yUb3VLAMy5sbfHBQux0AlWRZs35G+Cz2IoHmdOzCvNTjaIiO/XTlUELxsdqKBx49D7pvxll
	qOz89fyCZ+eGGsDtVLxLtvlTqbpdtDugjEybBwJClw/gOG87MlheAa0tWdj65f9zTRhgRJV
	xhXsnpyKH8x/PmgqlIb/FcLejjyOrFPoFw60GaiLE/B/8+jfkid3M+i3Vk271ai191Dz5+B
	hxkFI4izv1q4HRG2Kt6crTYyf6ijyxz/cc2SLrHFYV3SIpJW2J/Rx9bJfkJ8ucmmBfujNVg
	nCS1MZW9hzJH6hdzOAJHtVDAdhiwsftDCIMfRmnod/RpdXBUqlfjdwtUy0Kc9f912RGnt4t
	0HDKy4wH401iAp9Drq2nUZR/u7FZn6NlQenpoVgVB3uG1xBVNd6MN1rIG7qFJPKwOxciK9G
	QZ4Dofa8SqTn9jv/qFOK0lt8ZFoXFKWKQRvaFFJyyYNLneADJ8hiU1JKjEeClHW3XRZouwN
	msJyMthmjUh
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_170613_851122_FB4D77ED 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Type: multipart/mixed; boundary="===============8373542969414192711=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8373542969414192711==
Content-Type: multipart/signed;
 boundary=44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 4 Nov 2026 19:28:00 +0100, Iker Pedrosa wrote:
> > +       irq =3D platform_get_irq(pdev, 0);
> > +       if (irq < 0)
> > +               return irq;
>
> Consider using dev_err_probe() here for consistency with the rest of
> the function.
platform_get_irq() already prints an error through dev_err_probe(),
so I'd rather not print it twice.

> 32768 looks like a magic number. I'd recommend you to add a comment
> above explaining the clock rate bounds.

> 3 also looks line a magic number that could have an explanation. I'd
> suggest you to add a macro with a proper name to have it properly
> documented.
Agreed on both, will use named constants with comments in v2.

> The device tree bindings support both spacemit,k1-timer and
> spacemit,k3-timer, but the driver's of_match_table only lists K1. You
> should add K3 to the list.
K3 is described as "spacemit,k3-timer", "spacemit,k1-timer", so it
binds through the K1 fallback. I'll add K3 to the match table only if
it ever needs different handling.

Thanks,

--=20
Troy Mitchell



--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvWYxAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvMTcBAJiD4kR1iAZMK1VbPW2J2bTMBOjkpvGkklin
34cjePNAAQCEM2Pd5FKJRojTn0AA5gzgAvnCFeqcVgmsKyYYY9m0AQ==
=FeT9
-----END PGP SIGNATURE-----

--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0--


--===============8373542969414192711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8373542969414192711==--

