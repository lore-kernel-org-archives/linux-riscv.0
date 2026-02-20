Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D95C5ACC0
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKHZEwj+8mvyFp9PIDPdXa1wktRidsrEtIYxIQxqOEg=; b=MltjsFcNFbIsIJgqZk6ppcbrey
	NSsXw6PlXBlid9pja6j9Mteg9r4nsK4oJbKLgCVYU7G1KjXlR+DepQGOcice7RXF6tGFF9lcMONkY
	AORfeexjdbF5uW/1zoqtbr2fEU9hbOvm3n1yR34C2VM2Mtf/71N8gqCM2WbGVk2b2boLUatKNt3dW
	1asQcylIgeUL9H9VyGjQgFZ+9811A4txH56oXTXMsgDfyBMRYEJFpAxEnJKkO74wwm18F+gzdmxON
	hDpQ8XXwgi3zcJ8/Xz1CBZgyqT49n5x22znjaotQQ3jOOi+77aJNXq4pkYnXHgv+G5M6/EuLa6FLK
	G+oss9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ9Q-0000000FfP0-3ww3;
	Fri, 20 Feb 2026 22:39:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ9O-0000000FfOu-3ne6
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1885560123;
	Fri, 20 Feb 2026 22:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566C0C116C6;
	Fri, 20 Feb 2026 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771627145;
	bh=mI3DiEAWC0QgxvWgebPwZRRwG+6G2ivTegh9FS0XPY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtqyY89S8+Y3uZXsSTb8oCWlweAUkqOy4n1TuPeCmBAuuiA2v85rhrFetnYZkegKo
	 /cuSwMJ+GKjTxc/DEE1PYsoFUYwnWWbgS2+1fUmVJLjmQhe93W+hIEE3W/PkJw1LKV
	 kK/Hnts8aXOt22Ju3aqqXZHhXeLFwsnOSIvCqydESsB0gKFXCfPKQxbnj13Rffcxl5
	 Q5zjs8M4H2ygyJQMShEilcflT1pYH0zCDt16s6F2rW7Hx9hT+Sj3UrpYLZyT4sjJZ6
	 tvEHWS4gHrEf5KgpP+pOg7td5pLy3ujqkCLghzi2BWWYd+pVxbD6sE+fwPdy4mIVFo
	 2N1FTDkGtCW+w==
Date: Fri, 20 Feb 2026 22:39:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in
 XIP code
Message-ID: <20260220-cardigan-scanning-da6647279ea8@spud>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
 <aZh_25dtac8wDFNe@xhacker>
MIME-Version: 1.0
In-Reply-To: <aZh_25dtac8wDFNe@xhacker>
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
Content-Type: multipart/mixed; boundary="===============0076145769552584093=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0076145769552584093==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WCtFJNCIevePJJ7C"
Content-Disposition: inline


--WCtFJNCIevePJJ7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 11:38:03PM +0800, Jisheng Zhang wrote:
> On Sat, Feb 14, 2026 at 10:38:02AM +0800, Kunwu Chan wrote:
> > Fix a few minor issues found in riscv XIP-related code:
>=20
> 'RESEND' isn't expected to be used as you did in this series.
> You sent the v1 series on Feb 14, only 4 days ago, the series doesn't
> miss any dev window.
> https://lore.kernel.org/linux-riscv/8ee1b065-b021-411b-b5ee-22c4a108cbce@=
linux.dev/T/#t

v1 wasn't threaded correctly, so I think a resend is fine as the content
didn't change.

> > - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
> > - head.S: spelling typo and wrong #endif comment
>=20
> I'm sorry, but how important is fixing comment/spelling typo or #endif
> comment among maintainship?

It's not, but I think we've made this point already!

> The riscv XIP code doesn't stand on itself,
> but heavily affects and is affected by other riscv arch common code.

--WCtFJNCIevePJJ7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjihAAKCRB4tDGHoIJi
0iWWAP41tLmKr1IGVMl/E/wbeln1O2Hjk1pJKmW1r7JdMht2/wD+MEwUc0+gdCto
x/VOvGbhkbNUS2r4Q8BYG3Is38CDXQY=
=ZR/J
-----END PGP SIGNATURE-----

--WCtFJNCIevePJJ7C--


--===============0076145769552584093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0076145769552584093==--

