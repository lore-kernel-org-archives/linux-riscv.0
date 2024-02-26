Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC10C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrtqjVRhuVfq0rJ4S7DJl32SSN2CmifAbnJnpJr9UdM=; b=G3931M2ES9F/NUFCVgeokHC6Eb
	D4uv2cPyo0ibMCpibMjE2w1qfbhr1IfKChGi78ZwQx/jasJzF42x3KvlLdShqkuTIHYOlP0NqZZwf
	rfjbgCXdvcp/7/N5OPD8k1WBADU+GlUuzD4wwVcGHSBeJqXLZ3WZucjcTiqX9EOIGex3IbC7CF0CC
	n61dMXIlsO7uUGzyyzOH089jXsLL+Kc/q1ASv64cUnScg6xgQxB+1Do8XjKnQCNDtm/xnm01jLkb4
	k0UhNoNyVvJ/lvfY9mSj0G1gRPwsdS5TTM2Qb9Ci0aXd+P8hEBNjWrv/VgTlj+g/E9TrJaCoLEfeM
	b7lNz2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redRN-00000001Ye8-1MKA;
	Mon, 26 Feb 2024 16:02:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redRK-00000001Yd8-3cl4
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 16:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A72560DC0;
	Mon, 26 Feb 2024 16:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EC6C433C7;
	Mon, 26 Feb 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708963369;
	bh=CJxmj18L+u9NtRIEmmMRA0bmpUKvIcZuLUTtSw+eVhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOE+VB5n2vFS70HFpzM8RFYpzuENj0G42xI2p0I0i083vDmCWs1nN4o+tdgESD+BD
	 Zke7NWQXlGtu5KalcwhCS5KSbk7+6QYhbi8uHVnTtBFsJL/BL5P2CzZmY/unE+QXJK
	 ssVdIyRHCR7+E2RLbBlagOdNYzFDpQWuU8uOuZcmDtchqUXJ38vigv3hESk4HigKMr
	 +rFnfgbT+thKe3IEHIRjGuv+6foURL3PMQu8VKAAJWSI8ttH5KsfuVRQ8PIVGpJO5z
	 CBXa19wdCYRlIDXD/1FdRNQuaxm2J9w9RBazb1cTjUTiiHJQg4PbRIDPRMy1M8MUWl
	 EmGeVwjfXTVYA==
Date: Mon, 26 Feb 2024 16:02:44 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Message-ID: <20240226-pajamas-okay-51e16426b0f5@spud>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <40dee2c1-ff24-40b2-a13c-6934139ba869@sifive.com>
 <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ea356036-5a0b-47ea-aafb-f9813cc6ec9b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_080250_968747_E4FF24A8 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: multipart/mixed; boundary="===============0442541598458351361=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0442541598458351361==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubQpPdZaAd0QnS6C"
Content-Disposition: inline


--ubQpPdZaAd0QnS6C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:25:24PM +0100, Cl=E9ment L=E9ger wrote:
> I guess I could also mark XIP as deprecated.=20

I'm not so sure, people recently added XIP support to QEMU (and sent
kernel fixes in December). XIP is also not nearly as much of a problem
to support, there's far less that it does differently, the main barrier
was the inability to test it which is no longer the case.
That said, XIP is gonna kill itself off I feel as it does not support
runtime patching and therefore is extremely limited on extensions, given
we use alternatives for all of that (although I suppose if someone has a
usecase they could make nasty macros worse and implement a compiletime
switch in the alternatives too).

Cheers,
Conor.


--ubQpPdZaAd0QnS6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdy2JAAKCRB4tDGHoIJi
0nVMAQDYR93JQOut9mfMM8BH9MJ1F4/P4n478Z+nECkRjgzk8wD+K0fPpyls98as
yyR2HfqkmqE6DQSWZpf9BlfbolsuVQ0=
=IP3Z
-----END PGP SIGNATURE-----

--ubQpPdZaAd0QnS6C--


--===============0442541598458351361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0442541598458351361==--

