Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F7C6379F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/tPQVf57dIMcTKh+4AnTO33zZtXx4AykUtGDGi6aRI=; b=wcCxSTFEQIllxEkhnJD6mAZoJk
	NqcDFn5EgA7dQKbZSEfwuVwbfD12VFrqTDM3OUNLQOhHL3XsFp1rneVcYBBqeTPhQpFyFpqTmYSX8
	pyD9o0BGFwlU9L1lr0FPRglHYSASjHKOtsBS9oG3x6OKCO4fhavDXHv3I62ewqjU923tP30u27R/d
	xE9U0bsRZjjjyrgjh69DS8ZWRPhdMH99omf740vhAHw+bqt+91O3z6Ozh+sLcSl/HsaxT7nUEXPkf
	KKR9/De3j9Q9q8mhJXA84tB4uGaEuYxJXvr8cEzv+mpphnxDXG/hSXbJ5TYaAZaMSJFvv8wZkutOy
	8WyjbrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZi4-006a4e-Eo; Thu, 19 Jan 2023 18:32:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZi0-006a3D-OQ
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 18:32:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7970DB826F9;
	Thu, 19 Jan 2023 18:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D760C433D2;
	Thu, 19 Jan 2023 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674153136;
	bh=G2dlcSrpAd5WYQ2pF9B2zYjqocrarlO2vwEZAG98/+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqUxNns1Mx/u/m/jBytaYR3d/Gv7QQ4/+CVwoOuOn8wVI0CO8/RmhAFm4NR87Vw1A
	 zQ0NgY0Qyi2xUrueRD/VnTUmjnUOawe2lGANV4sCd7abggh8esYjezQT8SPbhbLEEp
	 dxYqnLMKqVhfs0fiiOuMd0vN6OS62l+omxr8ROi9vJ/gaXvnA7AQnzNBQnZOnWpcGV
	 L2KiL0ZMjXPt2M0gBRbhGLWzcJ4jgIDYt8wttu/QLljznvc8vQTQXJXLMr09YCrLnM
	 OXZmuCJ8hH5eDWIRWDxjNpOFIAJnM5tB34RXOv6IutV/yburvhn1QBzcS7Dr+1XMGb
	 QWhFjaLTc4I0w==
Date: Thu, 19 Jan 2023 18:32:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] riscv: lds: define RUNTIME_DISCARD_EXIT
Message-ID: <Y8mMqxqegQ5XThKv@spud>
References: <20230119155417.2600-1-jszhang@kernel.org>
 <20230119155417.2600-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230119155417.2600-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_103220_982112_8F3D68B1 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: multipart/mixed; boundary="===============1485822860284859479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1485822860284859479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SsobklzoJrra3VXj"
Content-Disposition: inline


--SsobklzoJrra3VXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 11:54:13PM +0800, Jisheng Zhang wrote:
> riscv discards .exit.* sections at run-time but doesn't define
> RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
> and kept even if the generic DISCARDS would discard the sections due
> to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
> the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
> it still works if we move DISCARD up or even at the beginning of the
> linker script.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>

Thought I left one of these against v1, either way:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--SsobklzoJrra3VXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8mMqwAKCRB4tDGHoIJi
0rczAQCp6WYGe/TWmVUyy+TKfW2nJC1Gow59p8y+l0hJK9E5YwEA2upUxo9SWD5m
ieU1BPJlB1yIQBwHj73xUFLqxKvCSgM=
=YSh+
-----END PGP SIGNATURE-----

--SsobklzoJrra3VXj--


--===============1485822860284859479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1485822860284859479==--

