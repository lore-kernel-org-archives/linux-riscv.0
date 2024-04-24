Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFCFC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2pkBJ3Ss++sT/TBUhTze3gUn0Sd6p6VQtVZYerEWBc=; b=YCyCEsrLzgQwIhTC3M0XOk1hZK
	w+P11MfW4dMm3iMFnY1taMJ/KvOL0h+DVjl8I7NXME+3yPPYeg9/nbvnBa2UC3E6iIv2wiZLkD+K2
	IEGmqN1xyJ0X1HbyBNF1oB/SurMKUjkbC6kZf6iVN+nyY/MsYMd1Je5Gca4RxzyOTtgLcYA1ai+AV
	ak5N+WdmZhK8Q+e+aYyoJ1NXl5frHTG4GC5gDU8uOGES9IJZ7kEruBsP+TKYSSNgeCCzD5f+Ej9Ot
	ruBPU7+Aw1CFKxtX6ZT5or9fhgAPsgVnJz3FTyhsdk6F04H3LUUb1yQkpg9j1v6XzSJmgOWIZhh8/
	AB9edgCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZl6-00000003fWd-002Q;
	Wed, 24 Apr 2024 10:21:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZl3-00000003fVq-3nVe
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33CBDCE13AA;
	Wed, 24 Apr 2024 10:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80471C113CE;
	Wed, 24 Apr 2024 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713954103;
	bh=mHWzUjYz6696rmqvzHHtLW+jfpbBAvrrZwJo47hyK5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGUUZMA9azO4ibiF6QemdmxTWinYwIrIJrEKjAog5K5qMVwXhM6aV4SHv7jbDK5AW
	 Xy5G1tSdXySiL0mngzzT7M0pGxxBGxwC21WutXxwkUpS1XsL6gfLFSJo0Gx7DmYfln
	 8SO6clR9pNJvmdE5RUP1OwznudQfeWwKR0EYDfu5xDq0wIY/E3gLoHbWsCjsl/9eSV
	 Z7WuLr7RzIz7Ec9x4zo/1kVr9pjejlIrUXgHyvB1rSLLD/9AicK6ZO5zJd0ULXLHa+
	 F+8Y46swU6Dye3kMquQmdLl0YeXvA997hyEhxRHcC53v26fA5HkWgsva/boTnngfkn
	 +ES8novzQFB+Q==
Date: Wed, 24 Apr 2024 11:21:39 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>,
	David Laight <David.Laight@aculab.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2] riscv: misaligned: remove CONFIG_RISCV_M_MODE
 specific code
Message-ID: <20240424-sampling-autopilot-313efe9aa9aa@spud>
References: <20240206154104.896809-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240206154104.896809-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_032146_165683_6CB2EC7E 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: multipart/mixed; boundary="===============6540700558594874590=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6540700558594874590==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oRqeOvL+VdCc0NJF"
Content-Disposition: inline


--oRqeOvL+VdCc0NJF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 04:40:59PM +0100, Cl=E9ment L=E9ger wrote:
> While reworking code to fix sparse errors, it appears that the
> RISCV_M_MODE specific could actually be removed and use the one for
> normal mode. Even though RISCV_M_MODE can do direct user memory access,
> using the user uaccess helpers is also going to work. Since there is no
> need anymore for specific accessors (load_u8()/store_u8()), we can
> directly use memcpy()/copy_{to/from}_user() and get rid of the copy
> loop entirely. __read_insn() is also fixed to use an unsigned long
> instead of a pointer which was cast in __user address space. The
> insn_addr parameter is now cast from unsigned lnog to the correct
> address space directly.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Removing some m-mode only code always feels like a win to me, given how
little testing and attention it usually gets.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--oRqeOvL+VdCc0NJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijdMwAKCRB4tDGHoIJi
0obhAP9G8BENAnUK/4kZ8hmIz9sbPYs+/H9oy+evduj/1FIkbwEAwglg5QsZanZN
2N+UjmpnEvexe+uJYsAmjiRBxr6f/wE=
=esEe
-----END PGP SIGNATURE-----

--oRqeOvL+VdCc0NJF--


--===============6540700558594874590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6540700558594874590==--

