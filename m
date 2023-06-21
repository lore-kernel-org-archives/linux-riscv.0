Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB58EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 20:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnYXoYdpzxA6qVi72qWWffdISywjD0nVpdesuVjWc9Q=; b=WMgT+DCwCoIN9Zjq3C6m/5X080
	bglRKawvs3XRlC1OvGJ+LAS56HExx9UNly5hUU3UyjfaMVpN4+XDXTHnbB8LnFkXrkm+46bX/Tfb+
	KcbMsnm5+G+5JotpDF1Gv441njDJWTIWhx8tt5NiC6BOXzFvFZYiv5ByI0V43WnFIcPHJBvvg2MQ7
	fUet4cFCTkjw9Tac9oepYVJjXDGr9vhutS3fDaHLuDUCUFUy50iLixtg2ROw88oSKswa28nOd/Gge
	Iy8JlrwrTOV3nXU3yjFFz6T42DRmwfm0p80aa5pBIOoOkJK6PyCxZ2C/MbTSB24V4zUn7JzUfYISg
	w/3xX9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC40T-00FcGn-2Y;
	Wed, 21 Jun 2023 20:00:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC40R-00FcGA-2L
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 20:00:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42B8C616C0;
	Wed, 21 Jun 2023 20:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC82C433C8;
	Wed, 21 Jun 2023 20:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687377642;
	bh=SQ+imObWS14cP10Y18MziYIjmjUYYcXFjwdTr8wPsuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr6TOo8PAYzuw3GXwltDcFDKVqzjhvGdLJZuz9zdI8UsBS1iU4pTVQBkrwCA2JP5y
	 9N7e/63kEYmBs3uQ5eQoxktyv+Srdd1fVzuswsIXSS3NSlHSnTsIIaCZX60YO/NAJe
	 tHmpF1EreigRcCcTbM2n7sgB+DpVdqgVopfMZTqQgwmO5YVX2rgHzuBeCF1/F8xCBu
	 +6Qw5s3gPToZ3u/Ivb87p2VF22RBk06iG7BH0Qo12FQ1W2OdjsRhoDiV+DyfNSAfxN
	 276t6WAJgPNAyiSwO5kZcJoXPEsbB0UDTabwDwdARQmx4vk1S+C4VA8qWGRM+n1XYP
	 ZD0B9e2ZqYnQA==
Date: Wed, 21 Jun 2023 21:00:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, rdunlap@infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jszhang@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
Message-ID: <20230621-grass-pregame-8fa7cd7bdb96@spud>
References: <20230621-panorama-stuffing-f24b26546972@spud>
 <mhng-2c7ad1c9-cba1-4501-ae38-0ffb3d5bf487@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-2c7ad1c9-cba1-4501-ae38-0ffb3d5bf487@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_130043_806110_5FC65060 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2348116508983351620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2348116508983351620==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ajf8h57HmhRtTFF7"
Content-Disposition: inline


--Ajf8h57HmhRtTFF7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 12:57:02PM -0700, Palmer Dabbelt wrote:

> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> I don't have an ARCH_THEAD, though, so not sure where this is aimed at.

I need to take it, I applied the patches.
Sorry, probably should have said it below the --- line.


--Ajf8h57HmhRtTFF7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJNW5gAKCRB4tDGHoIJi
0nn8AP9dbp+MsPmGU4vtjULuvQ3gNxenRtrKDk993yQwQOrLuAEA433XyDsXuAvS
iC2ighoEnR8mC9vnFlomU51Xu5oPoA4=
=JUGI
-----END PGP SIGNATURE-----

--Ajf8h57HmhRtTFF7--


--===============2348116508983351620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2348116508983351620==--

