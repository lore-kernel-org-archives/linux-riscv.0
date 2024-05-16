Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C3DC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIOzzeI+20MzWnmv6PBN9JWA6Si3N9WOw/5llLITnCk=; b=Xl9ETx6DHFT+LOZ+1h/BTzMs2l
	S6ezpD2PB5UBQ3HGE1FCDiFOoQXEQgLam6NQqt3z1PqiaXLd5kwPiYTynIEyr6cFatwRnIR/qBtbC
	nyVyt1j6KbsX/l75/U+egUgS35x/9uWUvCHG/FWHa9fk7WNh4XiW4WFoCGZvEjpIuPKGYwhucvuJ3
	35LrlwppIIeg+5CQsc73kOMh+LW5H4HepbbLn72dYB4T5cMoVtopTI/TEFMRYo2LGUDeEOUYPbccs
	5hl1h2T9piFkp02dEoErgt3XnaOHclJ+vQNVGkwjCxP6/wZv+yDHT5AQME1RsF+yNjPCi41sgbIR3
	pezeLC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dhN-00000005Ss3-2Zy9;
	Thu, 16 May 2024 16:11:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dhK-00000005Sqn-1KK8
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 16:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B356CE16B7;
	Thu, 16 May 2024 16:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F4FC113CC;
	Thu, 16 May 2024 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715875870;
	bh=KPHdabfWiaxtIGIkpvORD6tIq15eItbt5MKhO4Blybo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHn5ukKt7aOHuWlDuzODIb3SvaGBw0d0vyjSaODCUH+inFxUaVMi8pO1ZRlypj5lb
	 XI+NL+lFc8iICdYyk3f3xhsicBboTTgR4zHTsB9uqqJZnsNWELEcgtyU56VrJ2rU7l
	 +m45L3EzsJ9rUp6QUVMzTT9swR7BsyXAGp2a7EXwq2N80Gfwq1fFZQtxUnF8wjJped
	 QwsirWfyOPyoCy87LQNaem2wTTdytYtoqdIhsh3krszGbVg3DKWnT/lKaIbN7Z5A8u
	 fK3NWBmqvlm4wsdUIuXEbQO5j7KI+5ffKPmgE7gUIUBtIKewN4M9OBnhtPjnK4PNBY
	 bQyOzGoGlTl9A==
Date: Thu, 16 May 2024 17:11:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: Introduce vendor variants of extension helpers
Message-ID: <20240516-woozy-flatten-7fb7cc2eac52@spud>
References: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
 <20240515-support_vendor_extensions-v1-3-b05dd5ea7d8d@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240515-support_vendor_extensions-v1-3-b05dd5ea7d8d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_091114_575451_2E0020D8 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Type: multipart/mixed; boundary="===============3393822572200894177=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3393822572200894177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+/XzYarysVlGuOn"
Content-Disposition: inline


--0+/XzYarysVlGuOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 02:26:15PM -0700, Charlie Jenkins wrote:
> Vendor extensions are maintained in per-vendor structs (separate from
> standard extensions which live in riscv_isa). Create vendor variants for
> the existing extension helpers to interface with the riscv_isa_vendor
> bitmaps.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--0+/XzYarysVlGuOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkYwGgAKCRB4tDGHoIJi
0o3uAQDZqSeE2PfossmmMsc96NPgqt6dTMaCDMs8JN+xw5MlIgEAnakVM7VWT4OM
TSMBsrHoorfFbYQp731WFofPusWCZgk=
=qzzp
-----END PGP SIGNATURE-----

--0+/XzYarysVlGuOn--


--===============3393822572200894177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3393822572200894177==--

