Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66734CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRa4UgsL1JkP+PCsGOjbVq87jHdamRG83O72+jnBLoU=; b=LY28paYxUu670Be2LZ3/rwd6pR
	2JYTl99ATc04Fxaq4FqMPWHM9a6Zmrj7sFDxn/CxC3NEF2HQ2qx794VF9Ce2NcheKTUsK8B7JDl0k
	Dd1CKLiHThw9XBQEDrNlxdD4Nb9VoIgJ+wSygHV/tGda/fWxYCTUiDWvaeZ50kT3wDxKLKufuEuFT
	SK62c4d8IDCsJPIpeqP2z7qa8Fn5DcRzHwe99UTLOdAMzNyAf1tVB+LsV7lsfGa+PIiCK4VHP8Fm3
	dZVoJH4yU54rC+bCoyAvGFZYE+Vhg2vM4vU6uyJ4/6um8MkUBZfQbT2+ksoKDlHEuqxZ1fCUPenle
	o/+a8RBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx1p-001DjQ-1g;
	Thu, 12 Oct 2023 14:51:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx1m-001Dio-1f
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9A1761E63;
	Thu, 12 Oct 2023 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762A7C433CA;
	Thu, 12 Oct 2023 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697122265;
	bh=5AiZVeDGvVMMzOjXejlLspSrRouelQDKxA7XAhxJnas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB8tl3Z6BJ+PO1/HesfFNW+WQJk5CCvdZmDK6a2BOTBbPcKkooxLRLOqzZj0h07pV
	 LmpoAwv9uaWH6OwmYrvCz39FTMZSlYnXsWJwynCLLVy2S8UXKGgNvDmbDA905OnI/w
	 s7rtEUeeNAt06tIoAVgUu7ZdFwCvcWJ8TItK6AW+l83pQ2vtJJFG+7JGhr9P0218o3
	 2iH3AXTpIzuFbbNnhtp8kSIvyKFutihIX+ar5/5ErBUC5ZKk9EMAEgAQRLWUYYTd4F
	 k3gOp5cm4ne+ZbFIs3XbMPUeoZkZdEKm/2eXtrapRmbfqS0mHigk1FCgSJRiOpkoe+
	 X92Hlk1B2PrTg==
Date: Thu, 12 Oct 2023 15:51:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v7 3/4] riscv: Add checksum library
Message-ID: <20231012-extradite-charbroil-32c0808c6669@spud>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-3-06c7d0ddd5d6@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230919-optimize_checksum-v7-3-06c7d0ddd5d6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_075106_626552_8E26E2B9 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7186457692420226887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7186457692420226887==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VacEKFf8B2xXnVnJ"
Content-Disposition: inline


--VacEKFf8B2xXnVnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Sep 19, 2023 at 11:44:32AM -0700, Charlie Jenkins wrote:
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h |  12 +++
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/csum.c             | 217 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 230 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> index dc0dd89f2a13..7fcd07edb8b3 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -12,6 +12,18 @@
> =20
>  #define ip_fast_csum ip_fast_csum
> =20
> +extern unsigned int do_csum(const unsigned char *buff, int len);
> +#define do_csum do_csum
> +
> +/* Default version is sufficient for 32 bit */
> +#ifdef CONFIG_64BIT
> +#define _HAVE_ARCH_IPV6_CSUM
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum sum);
> +#endif
> +
> +// Define riscv versions of functions before importing asm-generic/check=
sum.h

As a nit item, you're using two different one-line comment styles in
this hunk. Otherwise, looks like you've addressed the things I didn't
like, as much as was possible. You get an a-b, not an r-b since I've not
reviewed the actual algorithm here.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--VacEKFf8B2xXnVnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgH1QAKCRB4tDGHoIJi
0h4WAQDwylCfzxPDoqr8tU1izNvd8jH06hOEnbBlIXVTGp5uoAEAkT0Xj8ctwWNV
Ach6DncKx4c7MkjcvHe8OfU1sEoIdQA=
=QVL8
-----END PGP SIGNATURE-----

--VacEKFf8B2xXnVnJ--


--===============7186457692420226887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7186457692420226887==--

