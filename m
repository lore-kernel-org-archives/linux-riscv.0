Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73332C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHTRPo7GggXBINAhlxFuMWwWVx23elpVnhNfnXPsDZM=; b=tFLv6DyN3hNKbbOUT92XcTeDln
	LvmJni7SmEI5UhO8gvFpSZcxaww+WBe2jU1lmen70Xv4Tn3gs2W2DOVYlFD8v10CB2Dqt2DPUfdUI
	1/aGa699PyN9a6VgQ413wIRvRsSOBLU+o+h2dUwyN1f2F5WqNyk5hn79JmdxC9wcx6QHE6H2SDXSN
	SqUOHUWWzir0BXbVG76mbM6Bg6EEZ7GJXuVB50M7v6fDEH9sawxfTJNJEMTyfID863KfJXD1cvccO
	kMYwiboOufwl60Lt/nRYNWfwZ52d2TpcU5wsHKz3AKwMrrPQJ/Ll1vupZ1O4V1Oln+kTCBIX34+H/
	QTR5gfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGS4z-004gQm-0z; Fri, 13 Jan 2023 21:59:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGS4w-004gPc-1J
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:59:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73C93B81DA7;
	Fri, 13 Jan 2023 21:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482B1C433D2;
	Fri, 13 Jan 2023 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673647151;
	bh=PyqbId2M9YW4SIFMaCfDiHReYsBe8pl5PV1GHzr0VfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=td5ZRS6WLzomrpRam+rK9n9DFRecpI7yYJ5NTWv5ERQSgHOjwXab/yGvOB+O/ICAs
	 rY71MB09Ejyl+sYJYAo2n9Hr2MRn1y/msOLoPBn7rLMpNKckV73eYOYfPTO7LTG0WN
	 jC+O+N9bfd88dsJRfd4BTuBuLW6B+hZ3Yptv0dOCOnsmMOrWpjq/SoGfL0pnzjHlGW
	 m8vXst0hwp8fu5hpcsCaMjyJhSSaFOaQr1hGILpBFmrDBCI+FKrsoBC/iECxrW2fdi
	 WoIMcfAWeOXw4/FQlwCf0HxugwGW5kkvylCNZvr+EPerwTPv1MbUwyOjn2p1mnqU7M
	 TZXHJmMA6oC2Q==
Date: Fri, 13 Jan 2023 21:59:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 1/2] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <Y8HUKgqYjcMkQjJQ@spud>
References: <20230113212301.3534711-1-heiko@sntech.de>
 <20230113212301.3534711-2-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230113212301.3534711-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_135914_399790_C835B909 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Type: multipart/mixed; boundary="===============3048123390334318735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3048123390334318735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uEHC/N31OAI5ZQu2"
Content-Disposition: inline


--uEHC/N31OAI5ZQu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,

On Fri, Jan 13, 2023 at 10:23:00PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Depending on supported extensions on specific RISC-V cores,
> optimized str* functions might make sense.
>=20
> This adds basic infrastructure to allow patching the function calls
> via alternatives later on.
>=20
> The Linux kernel provides standard implementations for string functions
> but when architectures want to extend them, they need to provide their
> own.
>=20
> The added generic string functions are done in assembler (taken from
> disassembling the main-kernel functions for now) to allow us to control
> the used registers and extend them with optimized variants.
>=20


> This doesn't override the compiler's use of builtin replacements. So still
> first of all the compiler will select if a builtin will be better suitable
> i.e. for known strings. For all regular cases we will want to later
  ^
i.e. suggests that this will only happen for known strings.

> select possible optimized variants and in the worst case fall back to the
> generic implemention added with this change.
          ^ typo btw

I'm not expecting a resend for this, that'd be stupid, but does the
following say the same thing? (What you wrote was a bit -ENOPARSE)

"This doesn't override the compiler's use of builtin replacements. The
compiler will still select a builtin if it will be better suited, e.g.
for known strings. For all regular cases, we may want to select possibly
optimized variants, and in the worst case fall back to the generic
implementation added with this change."

I'm a philistine who was okay with previous version of the asm, so you
could've kept the:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I had a look and it seemed to match what Drew suggested.
Looking at the b4 diff output and seeing both side by side, the new one
does look nicer..

Thanks,
Conor.


--uEHC/N31OAI5ZQu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8HUKgAKCRB4tDGHoIJi
0s+dAQCWOeoNzYidjvb0m47VqYEl4/Tjr/lt6rRIyudG/gInvAEA7PqV7PoaeWx5
KxQpLGmIExqtc/skrz+/+YmExY0b9As=
=oLUB
-----END PGP SIGNATURE-----

--uEHC/N31OAI5ZQu2--


--===============3048123390334318735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3048123390334318735==--

