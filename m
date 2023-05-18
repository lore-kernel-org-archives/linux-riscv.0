Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07854C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU41Av/7X/YtNf/Do+7fCc3uIKSWqL0Fq4RbBMV4vMM=; b=AV/sbmPBODNEGVb0fU+Qyv3ZwN
	60nKWzmX2Haqd3LfWIT79hP9WG0JEJPuI1Hr73D7u3MVhQDwUuaoB75/KtbQ+tPOTf4vXXAGDfX0v
	UN2Z6bPd2A6q3NqwGMni1jgMb6f0bcddE+3g7nk0r0tVpWVuewZ38WoRtITqL8B1/afqFQNkhCEHc
	J9dfGMj73q2Anu6slaTga+afsSXnoeaj6IfEXGf8KlKphfHNIKa1PcU+HhrcepXAaRbzh3c0Y1dZL
	aSO1hDvrw1gX2wvs3G30UmIwEVJ0jpuShy5p8CrxlfzQnVAHYiqEGN9rvBb93l24ehXPHTnZ8syUy
	IuTw6pjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkv5-00EDGx-1z;
	Thu, 18 May 2023 21:12:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkv3-00EDFx-0H
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 21:12:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5233B6143A;
	Thu, 18 May 2023 21:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE0BC433D2;
	Thu, 18 May 2023 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684444335;
	bh=9rao59iF0/hlenFI47AMwa2g21Ybabeem4OOm8CS2U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML3zP+bavZh8i0EG9Yp7C4Eq7IW+IXoy0jCSRQaKWC4qrvb9GCWkEsmXHqI70VRHF
	 ZSxOaNHEkDtLXh5ZXLsUj3oHYZ5IkdazLGJUFfLKdxlSYQ2UkxS0E6nEqC3sH13wpc
	 DWwndznU6e0JdmbqRSrMvFeNjGnB9NJzgUwHKNV5kF7oqPSlEtFFWab4uNyqzu3ik7
	 b3EiCswKAMS59KhA/OcrkNFd4DHZ3vigul/oFx9v4HryifmoGYUJu1xtwnfAZS8UrY
	 vTWsNwYuRAD99GZR+qBptjq1S6aaN0t9zNtQz53D0qzklQ29c8Zbgwv51qgMYkFNUj
	 Oh97pDdAguZxw==
Date: Thu, 18 May 2023 22:12:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive,plic: Sort
 compatible values
Message-ID: <20230518-landless-reoccupy-efd52921a51e@spud>
References: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_141217_166988_A7715114 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Type: multipart/mixed; boundary="===============4845823827434245038=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4845823827434245038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SbjnggWnJTqUrTqs"
Content-Disposition: inline


--SbjnggWnJTqUrTqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 03:26:00PM +0200, Geert Uytterhoeven wrote:
> Restore alphabetical sort order of the supported SiFive-compatible
> values.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Palmer has assigned this one to me on the RISC-V patchwork, any objections
to me taking it via the riscv-dt tree Marc? There's some other patches for
a new platform that's almost ready touching the file too, so if you don't
mind I'd like to grab this one.

Cheers,
Conor.

--SbjnggWnJTqUrTqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaUqgAKCRB4tDGHoIJi
0mQnAQC9UM3Eld08kXNym4VNUQFo9XIzMCJIShrHL56NnpCPxQEAsam87/5wbbL1
qXGirmvYqHj44ZA4RmNZgzPvtCszUwQ=
=8EvR
-----END PGP SIGNATURE-----

--SbjnggWnJTqUrTqs--


--===============4845823827434245038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4845823827434245038==--

