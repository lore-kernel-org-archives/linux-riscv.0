Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D19606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EV2JQSxi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIA++qQz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qnTibcnww/DM2nnGps1HA9R6a6f2UzkU6D55taOAw6E=; b=EV2JQSxiDQfBcit6e0SdGVdWxk
	v5uPrPGIqgpaiTRSA7hJStpZq+cw8XXeHIygCr2rioEreP4AwrtrzNyMD7+/uSo8fZF4zjvW1AFkH
	6XJLmlKTqTDZ9s7wknOALqEGrnbY2qW02idBbtsplkqbk9H5VjjqWehgaMTo7X2t4PzjylU7d7AeM
	5q+DV1DssFXi69CTVOhcUPGph9xdtFN0XcwCK3Ea8VwB6V5XYwVc8ZVRw05iXWHWr3JjJrpf9PbmG
	Imh4Ih+TiqjrHwRlDWh1T5YlvEy4Yyg5akB5Mfg6l7w9Xmnf+OpJeWyRyWRNK+oUYaMEBBWVokoSz
	EnAPxB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoKS-00000004TUa-2kC7;
	Tue, 10 Nov 2026 16:04:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoKR-00000004TUT-1WKz
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 16:04:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79AC163A53;
	Tue, 10 Nov 2026 16:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA32D1F0089F;
	Tue, 10 Nov 2026 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794326650;
	bh=xKekDk65ciGsHWTkKV1pMmbrXvFgDyBbXHhz+tAUJ3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIA++qQzu27iDtqtghDQXe3eEMEtfW0pUmP1pw87hOPcbha/du/cYArpw3l9qOsQr
	 u6fuI8ol3G/cmTB7H0eq3cIZXkNRoak+psa1ttDOEBXrQ2XqbhBAzb6+Xi+xLPBqJ+
	 vdq62d3xZ808Gpm3yT0qE39ickLYELwfVwHjod2sH/2WuJQj1Wmcb1zuVo5IpVsHpN
	 fzsAA5EiJ77pKhwrDbnizdsWb2eW+bXCHwWYertEV0c1pCWX1KA4ZPVNfgsXCDcNmM
	 YfPXVjPGubGdfRRQWNMfUcJmFhhL2khzvsZ/cpado/dtESG+T+jyf0Hf9KhV/VnCkK
	 AHgdAarCDLtPw==
Date: Tue, 10 Nov 2026 16:04:06 +0000
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, pjw@kernel.org,
	samuel.holland@sifive.com
Subject: Re: [PATCH v2] spi: sifive: clamp the clock divider to the register
 range
Message-ID: <b3828c22-e7ea-4858-96b3-51ecdfee3a89@sirena.org.uk>
References: <20261110225741763HzyrdGiR7ZOAU1NiFmCCZ@zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110225741763HzyrdGiR7ZOAU1NiFmCCZ@zte.com.cn>
X-Cookie: You can't take damsel here now.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4063457531128285148=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============4063457531128285148==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ris94nVe1DPqFLM3"
Content-Disposition: inline


--ris94nVe1DPqFLM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:57:41PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> sifive_spi_prep_transfer() divides by t->speed_hz, which can remain
> zero when neither the device nor the controller provides a maximum
> speed. For a nonzero but very low speed, masking the divider to 12 bits
> can also wrap it to a small value and program a much faster clock.

This was previously part of a series of five patches, I see you've
resent two of them as independent patches when I was expecting the
standard workflow which would be to revise the series.  This makes
things difficult to track, I'd discarded the old version waiting for the
new one.

--ris94nVe1DPqFLM3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzQHUACgkQJNaLcl1U
h9B8tAf/WW4JG4AfkqK+sYp6AE8ZYaj60LYNZSkeWChcZGOTaQE/osIvlFkxcZ6W
M+czT7towwaX009L5ftrxgXGY7174plvvZn00TiNaiCLFxN3DxehTVLZDR19P2Pm
3imwmP5nt4B7k5HD4P/0DUnitMuFyKz8HxwNN25qieX94aYnfIdphFn0PGsZbtVY
1FWhLrVfWUAZFzIy/AU97OWp+2I3PGQ1za5MJmEY83lsgf/yiFtYqqtReK5TkdU8
JkPDTCDGpWsW8kw4mh6uwFTnimbyPNYXohW/4chQliouicGCnCo90RwS2rAnr5sS
QBYzgJfkucGlInyzQS6qtHeeaWYL6Q==
=aqqg
-----END PGP SIGNATURE-----

--ris94nVe1DPqFLM3--


--===============4063457531128285148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4063457531128285148==--

