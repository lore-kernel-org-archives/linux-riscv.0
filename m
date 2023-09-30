Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D33E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP2MQugpPlw7yuATwCyH4IErMccypa+TFavuGEs+FTs=; b=TLNTzk05nBi8aycimbosKyiaQd
	BCSk7meDvlOMq/ZEAi7aFDB6NUHpOcHKPx9yJySVmkucBvgQav7C94c9euuFCs/erO4DOAeHxU72x
	o5IU55VwVVMUrWIBHgIV5lKKSrtVepfyPsoRYjhUbT/gEy6ZBghXMA3dmqKZcVaus/yohsy+NBlfB
	ux5KU9DcrQvqKQA8lhI60fACo7ylwNLr6b7hslQSRafXbqW2YGCzYC6urhUbVfVouNx2YjeNh8Yw4
	PJu1NS1tDQoyu48MWm1CSxIRX1NQNkptp4xnOMnSRAUNwCs/KqnAUfVSBt08YH292IDOZS4P0QhXN
	A/TJusXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVHX-009AQx-1L;
	Sat, 30 Sep 2023 08:24:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVHT-009AQ0-0v
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 08:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96B80CE18A7;
	Sat, 30 Sep 2023 08:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFDBC433C8;
	Sat, 30 Sep 2023 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696062288;
	bh=tVyUW2/Llb+W/qFET2JU3P/a6fBrTrB+I3rZznDnELI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGXjldCK4f9fuf1rWsYQkkR0H8cpVMnXfH1lbGPgproW4DD+VfSJ6Lwd30DpF720P
	 9Vp852znHxR4v95u1oSFSqD/VitZFL4KOKQJtdQZUxUyZsy6ZIW3pVgcbKWRIt/u3y
	 K6nKK9HlXgdLU5HhhN4RqeddUqJrNr6mNY/qsCj7HsoxiBE3PK1eNbuRwFFtN3RBGw
	 a41UeB01LT7VnNoYz2FbXiCRTy6nZ0iMB79aWpEhL4RNsjaxmjLxTeFaCV74T6hzYw
	 ypEY/YlvmZK81YatUZ7oEYYOPYlNxuFAWhaJkBUCVycj8fWsJZ5Cwk39SWs77smuuo
	 NJVLG6D9Yx96Q==
Date: Sat, 30 Sep 2023 09:24:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Edward AD <twuufnxlz@gmail.com>, alex@ghiti.fr, alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu, guoren@kernel.org, jirislaby@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, liushixin2@huawei.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] Test for riscv fixes
Message-ID: <20230930-quotable-feeble-2bd6513ca643@spud>
References: <2023092939-lagoon-punctual-e312@gregkh>
 <20230929230534.45142-2-twuufnxlz@gmail.com>
 <2023093049-next-confusion-b812@gregkh>
MIME-Version: 1.0
In-Reply-To: <2023093049-next-confusion-b812@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_012455_564305_EB1C35DA 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4460279946941318751=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4460279946941318751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cfF1eFtx8bOxDQy6"
Content-Disposition: inline


--cfF1eFtx8bOxDQy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 08:13:56AM +0200, Greg KH wrote:
> On Sat, Sep 30, 2023 at 07:05:35AM +0800, Edward AD wrote:
> > On Fri, 29 Sep 2023 08:04:57 +0200 Greg KH wrote:
> > > Where are you getting your odd cc: list from?  This has nothing to do
> > > with serial drivers...
> > https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/raw
>=20
> I do not understand this answer.

AIUI, the original report from syzbot "blamed" the serial maintainers.
Not too sure how it determined that though, given the contents.

--cfF1eFtx8bOxDQy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRfbIQAKCRB4tDGHoIJi
0ilzAQDi2+NPYGC/Is2pX+75UwVFobtEeyrz+G3SXBYYCT86vwEA6P59KUJ3EaIQ
Bm68KQVpPYmZ5JA9t15s6C2YUYa9Jwg=
=+zdT
-----END PGP SIGNATURE-----

--cfF1eFtx8bOxDQy6--


--===============4460279946941318751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4460279946941318751==--

