Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BF1EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 22:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmfY2Gdhuesw37+mFb4dAi6Dnn7EjB/vmSgA3S3ROQ0=; b=W2eXops1BjD5SGGb5DcX4o74Yo
	5fyLHbRp5oGVjJSbqB9BP0nkVmK/Q7Kw+mRuSLKCljwMZC2nut8QwAVtUR0kTR8dYnQqq41qmWsNq
	2QkNWbOfVTXwdcN6uf0yNMN0EsukrEbRcw1qQH7Rtr41ifD4eFyLhJV/b44rnzYXVqZ9xBGrVcR8y
	OVrbVtvqT++h0j9OJUG+l71OqhEC56DKJxhZ26+4mv3WpdUgyrpiE7IHy70iOKoCkOa+IT0XokcvZ
	AwHBAizCCcg6OE6aDbXwQBbekXf9IT+Kq+NadjUnSBcPrVMI/Do/xbCwk4LC9lkFHkQR01YcBqfVL
	Dsdio6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMED-00G1SV-20;
	Tue, 11 Jul 2023 22:53:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMEA-00G1S4-2t
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 22:53:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0CC2615F4;
	Tue, 11 Jul 2023 22:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A61C433C8;
	Tue, 11 Jul 2023 22:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689115980;
	bh=VHdFIq+SW8gZEm6SJctrHJ5/TSSkyzbus8jPIeeXyzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5I6Kv8Jnvqgio8y+HMLYe2qz1nNcgUZvbwoXBCnfaWDHhboAGDlMnsEHZPCpeS05
	 pMw6gPywC4cc16ep01GzvxgbwhUQgucg6O39SXzRIXXbVUfcX/cAr2mce7MWayBaTM
	 kFFphtCqkJMYh0u99iO8iPwEqI/FtflOablrGtK6Xzju2Q/DDPfgUrDZdYM5qHhaUY
	 NTaqfFKGRsosWq0i3v545ft5Yf8KoWX2926iB8MGO36q2fKfl9CDxufb6hlRMi7vqc
	 vFcEH6soptrweqiXHpNRiTYxLcFSnGDdTxPvCrdwtbqbXXocvTg4zpKrRcXdA/s41L
	 4ckVJVmTh6KBA==
Date: Tue, 11 Jul 2023 23:52:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
Message-ID: <20230711-slideshow-plaza-4ceaa37f6c00@spud>
References: <20230711224600.10879-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711224600.10879-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_155303_047592_56E54900 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6460639820355581464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6460639820355581464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EpgXFXdc1xhpMk5M"
Content-Disposition: inline


--EpgXFXdc1xhpMk5M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 03:46:00PM -0700, Palmer Dabbelt wrote:
> ACPI ISA strings are based on a specification after Zicsr and Zifencei
> were split out of I, so we shouldn't be treating them as part of I.  We
> haven't release an ACPI-based kernel yet, so we don't need to worry
> about compatibility with the old ISA strings.
>=20
> Fixes: 396c018332a1 ("RISC-V: cpufeature: Add ACPI support in riscv_fill_=
hwcap()")

I think, if anything, this is actually:
Fixes: 07edc32779e3 ("RISC-V: always report presence of extensions formerly=
 part of the base ISA")

Although my rationale was that if we get as far as here, then Zicsr and
Zifencei are going to be enabled anyway so there is no harm in setting
it for both. I probably should have been less of a cute hoor though.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index bdcf460ea53d..a8f66c015229 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -317,19 +317,14 @@ void __init riscv_fill_hwcap(void)
>  #undef SET_ISA_EXT_MAP
>  		}
> =20
> -		/*
> -		 * Linux requires the following extensions, so we may as well
> -		 * always set them.
> -		 */
> -		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> -		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> -
>  		/*
>  		 * These ones were as they were part of the base ISA when the
>  		 * port & dt-bindings were upstreamed, and so can be set
>  		 * unconditionally where `i` is in riscv,isa on DT systems.
>  		 */
>  		if (acpi_disabled) {
> +			set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> +			set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
>  			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--EpgXFXdc1xhpMk5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK3dSAAKCRB4tDGHoIJi
0jeuAQCxEeVNdDOolHW0/YyR+5G6rR0cwe2qNyDyibjz8lzlrQD/SSPEDx+KiDVJ
VxbhhUUdS77awYlyg7yc3V68mTvxWgM=
=7eNX
-----END PGP SIGNATURE-----

--EpgXFXdc1xhpMk5M--


--===============6460639820355581464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6460639820355581464==--

