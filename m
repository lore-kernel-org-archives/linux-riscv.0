Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC2BC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK36PKojg9fdGinvFvItpMr8/p816zw/AyIerN+Vlf0=; b=wI7Q/VaD5V1uaQv0AuYB09L5ng
	z91os/clnoawXo6AVbUPjbwmZSgYonh283nAXg6BUZfVvphmFaX+8sjJVTuAw2an3aXfHmVnFNUv5
	9DJdAU8eRA3RBZWNa4ZXdpg8g6g5If2XLjuQhSGxUkzSQ/shzmj29n3QUxzQ6qQpP0EjDSSXR4nYp
	zbwtzshWHeZxHeIAv+uZqNrQRF2lepuotkZq5a1Qq3myh4XPR9CjzGhCwDo09sAJoydZ5kOegZlc5
	TOv4N8IOxuZHwzZ5yvD0dBesKJcErJ+CFbrub4G059bT7tomUbGp247lDQV8ZlKuB12Zc3icoNUuv
	hGa9cgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzksz-00ECzE-0q;
	Thu, 18 May 2023 21:10:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzksw-00ECy3-0L
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 21:10:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94F7C61551;
	Thu, 18 May 2023 21:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6D4C433D2;
	Thu, 18 May 2023 21:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684444205;
	bh=rP15fZhlGlpAVtM+tSyZm1fbiu8oJMW5yhdrl6OFl0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EycbRRdHL3BFEwJjyvQ8nbQl3XS3SafOoTIkex5ICB9mTapmGB9zuMqUUVQ0oGnOl
	 Ao3F9nAzU2XK6uJ4p0XFNK/l/xck4/86Dhfj4WBc1ac4ba8cIo68SI61itWyo9a3Uw
	 N7ShuI+S2hc9t6+zeG2NpOyUPGpYWZlRoUHClE+JyFAFp7bnbq3yzYZXqOhnwzYPIA
	 ygvrvwZ5xHKmaYROjzdluN6284y9w4tTvvtnmDGbDVs1yi1ubAMs9NDyDUlp7dRfZe
	 1XiWnXyVXYYtlT7Om2XaW+hgyToiJ1r/2vOusV3Osi9SiFIuuEQ3R0yT1foCQrQU5O
	 2Ne4zCmJnp7QQ==
Date: Thu, 18 May 2023 22:10:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible
 value section
Message-ID: <20230518-radiated-diligent-2eb1d1323037@spud>
References: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_141006_191620_4A527ACA 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: multipart/mixed; boundary="===============0661900582496973349=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0661900582496973349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jHvc5MrDuTemn8os"
Content-Disposition: inline


--jHvc5MrDuTemn8os
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 03:27:24PM +0200, Geert Uytterhoeven wrote:
> Replace the sentences in the description listing some supported variants
> by comments on the individual compatible values, to ease future
> maintenance.  While at it, restore alphabetical sort order.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Palmer has assigned this one to me on the RISC-V patchwork, any objections
to me taking it via the riscv-dt tree? There's some other patches for a
new platform thats almost read touching the file too, so (to me) would
probably make sense to take.

Cheers,
Conor.

--jHvc5MrDuTemn8os
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaUJwAKCRB4tDGHoIJi
0oSuAP9YKg1eEcnZLmdHGNOdQ1OmbMAE5Q2m5ol0cHXmrBQrMQEAzGQl1K7CBDOI
TY5zuOuID+jNVfrW8O6VgSCTElP6iQw=
=YAEs
-----END PGP SIGNATURE-----

--jHvc5MrDuTemn8os--


--===============0661900582496973349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0661900582496973349==--

