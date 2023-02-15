Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857F5C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuotaWKdGheykPWJ6WGN+cGhvpt+fFmNGjQgqgZ8guo=; b=k9q+31HlhnS/XdIeobyJbrsOJq
	YIfa52H2B72Mu5ootBxxCstTvTDOpH0LxJGYGozoA+IzPxfo1JKzhF7kHrO+I6nFc0AgkcPtPXWS6
	w9CuW4KJ2k40QB2CtPHiQGPTkjHPZcLhIJs20TDYtFivvBA+WU5bV5pLLEHVqIJ0wlkCUbcaaoFY1
	uQDu9e97IdUm07Rhk6n0O1CHJTKIUI2reF/6x4RDVuHVM93Etar8UJ5Hiaojpdp9QM/ZGSQX+c1EW
	3KBkK5Q9wwVjjM8r+gTrtsIzJS/UQex4kqIggeEQsChMXCzlx/kpjnq2xH7dnYBBLe6m2mxSehBWk
	7qAWEsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPHQ-007YLx-Et; Wed, 15 Feb 2023 21:25:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPHM-007YJV-G5
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 21:25:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4AB3B823B0;
	Wed, 15 Feb 2023 21:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CF6C433D2;
	Wed, 15 Feb 2023 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676496324;
	bh=yT0K+3YL357KR0NiqP89fd2PeAmTGztkd0aqwwFztEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teKK61SayCRu7xGjVpn79ODnqJg4fIs1XILh/g9mqjDiDpUA403dfzQGZNwrfcbyK
	 Qj65jUlPxg74Lk0eKDmrEt2COv6PKhsXmHj6f1OqRwD6hDOWOIC+7szypivY0n+ait
	 Raxp4kI+GPCtsKBMt0NIqBmc0wn0xslX31ra6kpwAp00oln5fcI7eBr2b5qLJmWh2r
	 k++XsTknuT1S8ONc2wOIrvuJjYFkDeUyul/vkeS8Yi0EWgl0vRdofYCtQmYH1RPmGM
	 J+Rd0RxRZPTilWZHNziYSKwzDm8dEerPSy6BS8cDcuO/bISyEgS0PMXUG9PaFtxnTZ
	 ilODtzNQ+0nRQ==
Date: Wed, 15 Feb 2023 21:25:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
	heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	dram <dramforever@live.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Message-ID: <Y+1NvsLlbo8HvV5w@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-4-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230206201455.1790329-4-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_132528_852779_2F4B8429 
X-CRM114-Status: GOOD (  25.69  )
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
Content-Type: multipart/mixed; boundary="===============7785539011083598245=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7785539011083598245==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="updhdCcu1eESaG0k"
Content-Disposition: inline


--updhdCcu1eESaG0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 12:14:52PM -0800, Evan Green wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> We have an implicit set of base behaviors that userspace depends on,
> which are mostly defined in various ISA specifications.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>=20
> (no changes since v1)
>=20
>  Documentation/riscv/hwprobe.rst       | 16 ++++++++++++++++
>  arch/riscv/include/asm/hwprobe.h      |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h |  6 +++++-
>  arch/riscv/kernel/sys_riscv.c         | 23 +++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 97771090e972..ce186967861f 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -35,3 +35,19 @@ The following keys are defined:
>    specifications.
>  * :RISCV_HWPROBE_KEY_MIMPLID:: Contains the value of :mimplid:, as per t=
he ISA
>    specifications.
> +* :RISCV_HWPROBE_KEY_BASE_BEHAVIOR:: A bitmask containing the base user-=
visible
> +  behavior that this kernel supports.  The following base user ABIs are =
defined:
> +    * :RISCV_HWPROBE_BASE_BEHAVIOR_IMA:: Support for rv32ima or rv64ima,=
 as
> +      defined by version 2.2 of the user ISA and version 1.10 of the pri=
vileged
> +      ISA, with the following known exceptions (more exceptions may be a=
dded,
> +      but only if it can be demonstrated that the user ABI is not broken=
):
> +        * The :fence.i: instruction cannot be directly executed by users=
pace
> +          programs (it may still be executed in userspace via a
> +          kernel-controlled mechanism such as the vDSO).

I don't really do the whole rst thing at all, are we able to have
newlines between list items? If we can, I think one would go nicely here.

> +* :RISCV_HWPROBE_KEY_IMA_EXT_0:: A bitmask containing the extensions tha=
t are
> +  compatible with the :RISCV_HWPROBE_BASE_BEHAVIOR_IMA: base system beha=
vior.

Why do we specifically care if they're compatible with IMA?
What's the "fear" here?

> +    * :RISCV_HWPROBE_IMA_FD:: The F and D extensions are supported, as d=
efined

Also, is this IMA and FD thing a kinda commitment to only supporting
hardware that has IMA* or IMAFD*
I know that's what we do now, but only under the hood?
As per usual, I'm probably missing something. What is it?

> +      by commit cd20cee ("FMIN/FMAX now implement minimumNumber/maximumN=
umber,
> +      not minNum/maxNum") of the RISC-V ISA manual.
> +    * :RISCV_HWPROBE_IMA_C:: The C extension is supported, as defined by
> +      version 2.2 of the RISC-V ISA manual.

See, this seems to be how we have to treat specs, list the exact
versions! I don't even have to look to know that this was in the v1 ;)


--updhdCcu1eESaG0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+1NvgAKCRB4tDGHoIJi
0ha7AQC/S5jZedtKbMNumbyPyOqC4TjG5v6wEG28r1rPooijYAD/cJ+TtEVxdSCk
N3UbO2hRZZfO+Ot5Y2ew9jJdYzzn8gc=
=Sxkx
-----END PGP SIGNATURE-----

--updhdCcu1eESaG0k--


--===============7785539011083598245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7785539011083598245==--

