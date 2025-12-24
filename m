Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A74E776FA
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjsauD1OcEwb7xUd3cAXeZMfVuwiI/0vCJ8ue0eer4c=; b=m83H5J811GPS3QXwELvcmhqntc
	xcAzl8MKY+7sf6u5Jw40eCc4YKrozQYbvpVoN1bZfCck7h/u3983zOPbTJ48VxnzyHDMSwsa5uviw
	uuC+LWMxy28je6/Ts90pQPl9wyazlxrICft2hxeAl4AnAqp872l01FDC1ry6ZbEoV7TvkDEcP3DoL
	zMkamrL0JKsdy9m+xnRiFcGDqICmVUtddlf74UiAoI8V/9bK5M34GD6xPJWGTuxS2hjCtqusGtacm
	R5745YF7ZTV84BD3YaMnbvr/+f8/kyyp6eihEmMCxOKfoPjqkfm4kh366epqX4Blb/5TgULShdx+W
	+XkVsG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYeB-0000000HVST-0RxY;
	Wed, 24 Dec 2025 23:52:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYe9-0000000HVSJ-0Ah8
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 23:52:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2392160010;
	Wed, 24 Dec 2025 23:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E89C4CEF7;
	Wed, 24 Dec 2025 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766620319;
	bh=r04ONwOk12O0xtjUc1ghPQyx7Cx9gH3sO7kIyFuAFZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFngvylgv5jOLAGEG69if4X6NQx+r1wS92wnN5Xyi27y7uLZ0IpknS7At7gjvp3Vs
	 a+acEElug/+WXG5qSxe9MjrhopNO20gEMw/BXxdU9I6qV/2FN/Ctn/oLsGkK0I97Ln
	 fQOXtlHQMbCxFAwTOvx1ikC/2iDWdkyf26kHd0QtZbJ4BImKd26aS2L7ImB1FU5My6
	 VcX9En+yhc2sHT955BhXx6MjYrfboJObGpnz4lBEM/mv4pbdV3e9T9+J8/BkDxIeAr
	 uK2dKJPHJc47G/iyetdUQnzkBR+IEPoP3Bovq1pfc3FWBSiqWhbKq1mzQpjXy8gwyh
	 8ska2tfCpX9Uw==
Date: Wed, 24 Dec 2025 23:51:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: riscv: update ratified version of h,
 svinval, svnapot, svpbmt
Message-ID: <20251224-shuffling-sierra-c6fab4368530@spud>
References: <20251223-h-description-v1-1-98bea93b0919@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251223-h-description-v1-1-98bea93b0919@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============5015926463668869392=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5015926463668869392==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vz/vFtXledt/oQ7C"
Content-Disposition: inline


--vz/vFtXledt/oQ7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 08:52:24PM +0800, Guodong Xu wrote:
> The descriptions for h, svinval, svnapot, and svpbmt extensions currently
> reference the "20191213 version of the privileged ISA specification".
> While an Unprivileged ISA document exists with that date, there is no
> corresponding ratified Privileged ISA specification.
>=20
> These extensions were ratified in the RISC-V Instruction Set Manual,
> Volume II: Privileged Architecture, Version 20211203. Update the
> descriptions to reference the correct specification version.
>=20
> RISC-V International hosts a website [1] for ratified specifications.
> Following the "Ratified ISA Specifications", historical versions of
> Volume II Privileged ISA can be found.
>=20
> Link: https://riscv.org/specifications/ratified/ [1]
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> I'm not sure the 20191213 version has been removed or there are other
> reasons. But since RISC-V International is the official source for such
> documents, I think the version history in their website should be
> respected.

I think this needs a fixes tag (or tags) and is a copy-paste mistake.

With the tag(s),
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vz/vFtXledt/oQ7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUx8lwAKCRB4tDGHoIJi
0kD6AQDJ3HbBcok5VacFNgCU3hDLAKIMSuwdjkBbuUikPsMO8gEAg51p8fvaklLA
tjEz9TlqRV8fiPlWz45SPPHVToewpgk=
=ADAX
-----END PGP SIGNATURE-----

--vz/vFtXledt/oQ7C--


--===============5015926463668869392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5015926463668869392==--

