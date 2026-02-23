Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE64FEC110C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BitBzRXPSquXbBAd3WhtTgCtA/EGSYeN1YwWZDMWXP8=; b=QnmMKqZVvLivo7ZXg/mAT5My0t
	w8QgWdmFjrm1V3BMdVDTgJsXOD5OdUIrcJKgqw34zqsVi8zYqLBZb2nPDcvMutr3BTAHbeydeN70x
	acwl4tQxa91S3V1mGE1qQn5o8tyf++HfcS9S3oKO+IHWYl5v2iHRhs3ALTiAVwy+B4998uKyPUg+p
	gbIlJRbCJlZsuV/CHch4Dc+6ntUv7723h1qjBkGuqX6H01TFlKnAh/pt/JD3enX5rPFRMeUuLwIWg
	FvS1RNp4PQ/yoHtzwvu7L0O3A0wN9IsUnljrMKfh0fVbxEKTw+3SCqSqzgJ9zKQLYny7p3MI0aP9E
	ClILg3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZwd-00000000o2U-0aQN;
	Mon, 23 Feb 2026 17:42:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZwb-00000000o2A-3n3v
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 17:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6E0260180;
	Mon, 23 Feb 2026 17:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27C9C116C6;
	Mon, 23 Feb 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868524;
	bh=e59depEMM95HBTJ5jekap2dk5SJzCAO4MePwFF8/XK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRUlMZ3oLcN9NeB4lLM3Lk6rsJit8P3ciXiSEScPPJiuvmdhmMo2jpfEbVQqn/zvc
	 Yn5ZaSFOP617Ihn5xbJNuj5l7aHksqcWsAgrI2Bm5rKMCOk8X33d+y5FJ+0jmD2XwU
	 8ZGkxa83fnMMltVZoaR0tn0OdNCkYyPu45DY6tt8qWnnZcgwYHWzAnLohyqV35iOvI
	 JZXsiVdwRAvp2fgkFXaYzfL6iIFPBWy8A/hH/9Kg/jRRuaYJfCTneR2YJwduEO3bdO
	 yHuRZ1PoUPmw7rJJIGB1WwsdeiA6i1TdMTHozTCxaKnGg7vR0IqSwi1qh8k55s8m7X
	 pi7Sw1fbFc7/w==
Date: Mon, 23 Feb 2026 17:41:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com, palmer@dabbelt.com,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com,
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com, arnd@arndb.de,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, pjw@kernel.org
Subject: Re: [PATCH v4 10/12] riscv: Implement
 HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20260223-dropout-knickers-766174170935@spud>
References: <20250407180838.42877-1-andybnac@gmail.com>
 <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud>
 <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
 <20260223-respect-chaste-60c3403b5bc9@wendy>
 <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
 <20260223-garlic-sulphuric-0c1574608d09@spud>
 <CANk7y0iokvWz==XQ67v3aztQ268WVmud22Y4gp-dPd4SrFhzMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANk7y0iokvWz==XQ67v3aztQ268WVmud22Y4gp-dPd4SrFhzMQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3245735057631875367=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3245735057631875367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bp3ZjyzaI6V6BAFV"
Content-Disposition: inline


--bp3ZjyzaI6V6BAFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 05:36:24PM +0000, Puranjay Mohan wrote:
> > Ye, this is what Nathan and I both did locally, give or take. I just
> > wasn't sure if this was actually correct to do or if it was just
> > papering over an issue with our CFI support. Do you want to send this as
> > a patch?
>=20
> Yes, I will send a patch with fixes tag.


Great, thanks! Add a cc: stable too, while you're at it ;)

--bp3ZjyzaI6V6BAFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZyRZQAKCRB4tDGHoIJi
0hOMAQCYpiOeeKK/vZJG30655INe2kwTlJzDJsYxaTNFOLcmZAD9EImTaZbUYiXU
fE06svL0UqDXSj8d6ry6fEcp69G+1As=
=5z9m
-----END PGP SIGNATURE-----

--bp3ZjyzaI6V6BAFV--


--===============3245735057631875367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3245735057631875367==--

