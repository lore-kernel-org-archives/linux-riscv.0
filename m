Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1456C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRATGyLJkD6zBJ7SVzrjkL/gwvcU/0MioMadMrw+v6o=; b=dIJ5xW9akcRQ0ys4DlH3QmiuMG
	YduYkrmdwV91qINOmXeD6zdiDEyfB7fM/tGN3egiwu3gvVBuFkqvAbXCVNPlff91qQ7Mw3Cy9pTt9
	/6qCx5aOPCQpnqsovOASwAfu3GbOS08XrYLHgga5DPlCx8DDTHFblucu6d/h95PmpoyyVkXsC/l9h
	bi71JkxWHqjqqxCf3j9CdWG6dmqltoTxA4qwo4baBu798sR4qIG16fMEOi08NuODGTQJmFMOVwRmG
	KlnQDJgSlf9lzCyJutGr/L0/afoTVCubmzJDyFAp4ZCNKt6m9JQVhOQxS8Ry7WeXRARpftQj9IvFF
	jufhJcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxF2Q-00AEkZ-2a;
	Thu, 11 May 2023 22:45:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxF2O-00AEjc-0A
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 331C1632B0;
	Thu, 11 May 2023 22:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAFEC433D2;
	Thu, 11 May 2023 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683845126;
	bh=xS+xbmQmBMpCyiY+zrlicDhfcljQ/eoXZ3fbNJ4K77Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIOH1b2c76ykJxTCgBILya89QHeVM3aYvTurYccCMNDxY8PEPYlN9wcovtklCVoJ1
	 QAXQe+1kZCM4ONEwfoi8YN6Hv6pVKyDgFWyV7YOXbKxw3r2t1hAH8Iv/Fvs6pzAmI0
	 sZm1KC8Xw9NU/1a23e7ViRFdqOyFYQNHQjNIHqFzLbAvuLOr7+S/oPnj3Tb2jxVGpr
	 w7GAyV7L7+pArzcUbwEjyLY5w4rVX/3Iqjboej9Kbd9FURKfOV2BVDxBi8tFYhrzE6
	 BTNTPOKvyZFvOVMrA9z9Df9wCRa7w3s6ppzzzKU1mEZsoTs/r0YOhqUF6ZttpXCPv0
	 JPmIdBf/MwJoA==
Date: Thu, 11 May 2023 23:45:22 +0100
From: Conor Dooley <conor@kernel.org>
To: "Amma.Lee" <lixiaoyun@binary-semi.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, xiezx@binary-semi.com
Subject: Re: [PATCH] riscv: optimize ELF relocation function in riscv
Message-ID: <20230511-precinct-task-c9d46a29eeff@spud>
References: <1683717018-12882-1-git-send-email-lixiaoyun@binary-semi.com>
MIME-Version: 1.0
In-Reply-To: <1683717018-12882-1-git-send-email-lixiaoyun@binary-semi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_154528_200935_056395FE 
X-CRM114-Status: GOOD (  20.28  )
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
Content-Type: multipart/mixed; boundary="===============3451673105726018638=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3451673105726018638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OIL18TX8W6/77P0D"
Content-Disposition: inline


--OIL18TX8W6/77P0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Amma,

The patchwork automation seems to have skipped this patch for some
reason, so here I am doing it manually instead!

On Wed, May 10, 2023 at 07:10:18PM +0800, Amma.Lee wrote:
> The patch can optimize the running times of "insmod" command by modify ELF
> relocation function.
> In the riscv kernel, when install the ELF driver which contains multiple
> symbol table items to be relocated, kernel takes a lot of time to
> execute the relocation. For example, we install a 3+MB driver need 180+s.
>=20
> We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
> items relocation function and find that there are two for-loops in this
> function. If we modify the begin number in the second for-loops iteration,
> we could save significant time for installation. We install the 3+MB
> driver could just need 2s.
>=20
> Signed-off-by: Amma.Lee<lixiaoyun@binary-semi.com>

Firstly, please remove the . between your names, and add a space before
the <.
`git commit -s` will automagically add a SoB FYI.

When I applied this patch I got:
Applying: riscv: optimize ELF relocation function in riscv
warning: arch/riscv/kernel/module.c has type 100644, expected 100755

There are also quite a lot of checkpatch coding-style issues:
| 65: CHECK: Lines should not end with a '('
| 71: CHECK: Please don't use multiple blank lines
| 78: CHECK: Please don't use multiple blank lines
| 81: CHECK: Logical continuations should be on the previous line
| 82: CHECK: Logical continuations should be on the previous line
| 91: CHECK: Please don't use multiple blank lines
| 95: WARNING: Too many leading tabs - consider code refactoring
| 96: CHECK: Logical continuations should be on the previous line
| 97: CHECK: Lines should not end with a '('
| 101: CHECK: Blank lines aren't necessary before a close brace '}'
| 111: CHECK: Lines should not end with a '('
| 117: CHECK: Please don't use multiple blank lines
| total: 0 errors, 1 warnings, 11 checks, 93 lines checked

Hopefully you get some comments on the code itself, and when you resend,
the automation does actually pick it up.

Thanks,
Conor.

--OIL18TX8W6/77P0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1wAgAKCRB4tDGHoIJi
0reAAP9K3xdqL+ESmSjQWUQq7wPdF2pzl97F/pDl7rs9uppWIwEA2/+kwCyVADt6
Unw3M+jWd84TIkws/v9fi6lMyM9BCwE=
=VUUs
-----END PGP SIGNATURE-----

--OIL18TX8W6/77P0D--


--===============3451673105726018638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3451673105726018638==--

