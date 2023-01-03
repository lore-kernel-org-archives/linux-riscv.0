Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5848EC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCNqBwjjhd0+gcGIvJLG+NnR4ddeFpI4ldz8x2yMX0A=; b=0EioyyZEEhvVmcVVz973g9NzHO
	HJm6urMuPt4IVsRk78qVe8eJSNOF6PgVS2OmQ/sTwmJ4T4aW9DguNHXZtkEvVrZxdLJvma5TZRstG
	o31HxR9l89IKrvkvvDWkYtuSS1u4wQEFCnKE/F6kmAf7IiFbVb4uu2nw9MUqsiVMa66azr8005A+D
	K3LioYTUd39fVn+A4ikAQGEK8HE6RZRgJZ+gbr8JBJ8ChIDLK/bLuy6Mdf9qD3+6jJNZwq9GCNAcQ
	rH1Zg+3Rab6CcHxvUjoigmFOfwF7/hW122+j9YDngAEdYZHu7Cbz48O5GMGzNV+xls1Jc1bS0Ne1b
	7t68xpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmpx-004KpQ-70; Tue, 03 Jan 2023 19:20:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmgJ-004FcE-U2
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 19:10:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5EF51B80EC5;
	Tue,  3 Jan 2023 19:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEEFC433D2;
	Tue,  3 Jan 2023 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672773037;
	bh=etxDQ0Uv7EXayM8Xh0GJOsPu0SY3JxhWPjiRbQ4Bd04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQJlDysa31xrUr8R1W1e/UBgISCRKeQTCwDCfB1kXiELl8IxrdXdC8AknOtuvc6vR
	 nWJQPkAXoFm1vBH+UeCUYpic82t9lvlUtH97cIzhDg7Bt/zPz9XS9xqePgTRVLmTHL
	 YaYF8xWYosg4ln796nVC5be/SI5QbgI0mWu/B5cnsnPTlxiBffXTsZU5CVsmHcNBNC
	 Aizf8vC58dACwXInqpnXu9JU7UGVrSqKJpL5tuXRcuEMtMHeCGbYyTawiZGAeYFtOH
	 6v+xAw4Dc8Xrfrizxzd+6ULtxqMiSFkACkrTSGaHj7LWnvR464ECYBbvfAROdB1fop
	 O8mrq/cgBIgig==
Date: Tue, 3 Jan 2023 19:10:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, uwu@icenowy.me
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] riscv: errata: prefix T-Head mnemonics with
 th.
Message-ID: <Y7R9qB6fNTwCvqek@spud>
References: <20230103062610.69704-1-uwu@icenowy.me>
 <20230103062610.69704-2-uwu@icenowy.me>
 <5641668.DvuYhMxLoT@diego>
 <Y7QBCeqh96rKmZvf@spud>
MIME-Version: 1.0
In-Reply-To: <Y7QBCeqh96rKmZvf@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_111040_183328_D85C84C8 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============4231374237367652525=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4231374237367652525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LVa78PCruCP8gqTJ"
Content-Disposition: inline


--LVa78PCruCP8gqTJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2023 at 10:18:49AM +0000, Conor Dooley wrote:
> > T-Head now maintains some specification for their extended instructions
> > at [1], in which all instructions are prefixed "th.".
> >=20
> > Follow this practice in the kernel comments.
> >=20
> > [1] https://github.com/T-head-Semi/thead-extension-spec
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>=20
> Hey Icenowy,
> This (yet again) appears to not have made it to the list.
> It's not on patchwork, nor lore:
> https://lore.kernel.org/linux-riscv/2668919.mvXUDI8C0e@diego/T/#t
> https://lore.kernel.org/all/2668919.mvXUDI8C0e@diego/T/#t
>=20
> Since you CCed lkml & not just linux-riscv, but it is not showing idk
> what's wrong..
> Your reply to me the other day came through:
> https://lore.kernel.org/all/dda144a8397a175f3ce092485f08896c9a66d232.came=
l@icenowy.me/

This (and the previous iteration) finally came through to the list.
I guess the pusher-of-buttons for "suspicious" mail or w/e is back to
work after Christmas. It's in patchwork now:
https://patchwork.kernel.org/project/linux-riscv/list/?series=3D708586

Thanks,
Conor.


--LVa78PCruCP8gqTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7R9qAAKCRB4tDGHoIJi
0rogAP9LW4bvmXOCZvT0p+1r1xnkdcr6g+wA3yApv4c0EO2mBgD7BrHC7EPJUL4q
5msTX6EyE+Rs4XPyefrmRjn7cdkmeQk=
=zoqn
-----END PGP SIGNATURE-----

--LVa78PCruCP8gqTJ--


--===============4231374237367652525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4231374237367652525==--

