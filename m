Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF49109C050
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urklhuc9Ytz0mlnPSiTNSEr+w+JRcT6Qf6NPG8l9JVg=; b=dNKawJK+KorLWCL7xG1vwjXH9s
	RBAE6zu2FNG+24calSo+PhbStQkKbj77+AJfqWaDMAlM1AJZMxwQO9Rc/17DfqbA4PNCVODKU++Kq
	fbULXQfZ5tVFfX+oB1wA7I72OBPQu6W4MzgOMkyLujFeZVASTWSE2/it1S1qYHzrRexezMY+ZQIrL
	T6k4cK9A3pwbgRn0rRF4fMgpfiMKRlbeJZrc8XRrZiYlCo9S+2fNjbgL/iHIOzzhbJxRYCFNJGoQD
	FjWspolQG3/H6BD+YwVBtuOJs8u5g7Ah/wdNP+PTkrXdgWu15lPY401gtQBoNhN+KO+2MKJJenbAF
	Oq0yaTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sml-000000043ro-0wYj;
	Wed, 25 Mar 2026 18:16:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Smg-000000043qc-0H2N
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 18:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F5F443A3;
	Wed, 25 Mar 2026 18:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA426C4CEF7;
	Wed, 25 Mar 2026 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462608;
	bh=Rnj85twtesCZWmRKlew1BUMysMtURXXKALXyvov6u7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuF3YWGvw9rVb3ip9/c+ttWK8jvlcYjD58J0u3wjHwEpPltSf/Z0JkY8yWhjz+qWy
	 jnMQFZDSIJBUFv8xAOzHXhAjoVtTNl1L3o6VHHBFZfe6yTuUK5GV32jbHQp9irWkEj
	 uC9voQAZ8/X4cBkx6JSVQHDN1oD19BNIcNRYMNfnA5/KSM256P+WzmPAHU+tiSH7mi
	 brD9gtRfEGVKxoayq8J1j0bBjMEB/xh8pK9q2h6veOtdh7qG0axatgkK403KD9Dy+1
	 4LTarJwt7+6zLvHUcodyUwxzmvYQM19r71R3nnWtPIXsLqKlzTbomfdSmSgSroRoBf
	 G83DjrqHzuHNg==
Date: Wed, 25 Mar 2026 18:16:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
Message-ID: <20260325-thinning-apricot-c156914803d6@spud>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
 <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
In-Reply-To: <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_111650_119002_2305124C 
X-CRM114-Status: GOOD (  14.26  )
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
Content-Type: multipart/mixed; boundary="===============3063522585267587748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3063522585267587748==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PJMmZAkwfk4triIZ"
Content-Disposition: inline


--PJMmZAkwfk4triIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 02:20:13PM +0100, Javier Martinez Canillas wrote:
> Yixun Lan <dlan@kernel.org> writes:
>=20
> > Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> > which use same I2C IP as K1, so make it fallback to K1 compatible.
> >
>=20
> If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
> used in the k3.dtsi instead? My understanding is that this is the meaning
> of compatible, and there's no need to add another compatible string for k=
3.

Your understanding is incorrect! What Yixun has done here is what we
want people to do, because even if the IP is the same there can be
differences due to integration that are problematic. Having a device
specific compatible allows us to handle these kinds of problems if they
crop up in the future.

--PJMmZAkwfk4triIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQmiwAKCRB4tDGHoIJi
0qthAP9kd3bs5AG5Rmqrqov+rI1UksYOg3k8ZWPEl0SafVYBvwD8Cxm5AxliDjKs
5EwdvAOJXa8tCAw3rTT0sMwtNvkREwk=
=lc5S
-----END PGP SIGNATURE-----

--PJMmZAkwfk4triIZ--


--===============3063522585267587748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3063522585267587748==--

