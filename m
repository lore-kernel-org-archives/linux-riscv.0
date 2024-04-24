Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHIZfX0H7zT3amuF56DCuz3N7iB3J6fPw9mt9E+J+Fo=; b=TQB5VKOt9ZcJYQKvYNYdU955eK
	eCe4ntAwoYn8zVBwMdxQcvaZK2xZrVQfjlADtaXOy9e8mDHWjdDjTvmrVU9QbXMRq5k4uitvBa5nu
	99X06P7yG68HZsZ9BKJsMqlpKZL5aCve8q3UZ0v3NmqAQBhMa+XcrLrAH/StiNW0bo7K30ksWSzh2
	qNAolwYnc5fmTOKq5P+R88uf9X/oGEHNmZrfKWWlYCVI8UxjNw0xV8tyQDs2T7Vu86ZFNEf56rTFl
	7j+y0z+dgRqXf9aIiHRW7QXGmIdreNWhmADzfQr4XFeZXWKCBa07ekLRkezz+IHCAjwxdZgFp3s8W
	Xj7qzUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXEq-0000000381o-3NZg;
	Wed, 24 Apr 2024 07:40:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXEm-00000003804-2PkJ;
	Wed, 24 Apr 2024 07:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73079CE1371;
	Wed, 24 Apr 2024 07:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC58FC113CE;
	Wed, 24 Apr 2024 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713944413;
	bh=3HsOuSJtJ1IhE61NoIAbOBMWZ2YnkKaqYDMmNhQXJwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C01cGJHaEbj4jAXPEmGr9XRdc9//r7NyYG9h0HHh0P2Gls9cq5hhbzvB6h9B8DvjO
	 ZibdC8Jcg/THVBIjizJaXZc4UZiUqi9Lk3zil83977KEmEnW74mvGHqYdnssAacJC3
	 4ByD9P+tI8VdtLHvmil0oTineLS9/01Tgj3lfCP6bgffEzLpLoRDk9GtqYJ44UXIzP
	 /Yi/stzmzEJNPQIcoAT1yzE1U+POy1eSfYfxpMABGRKGg/lY8gMqk5RV5f+O22Y0/o
	 hUq60Vg8VgsekAm5vJN+cnOm/ODkThHbfCm4zggIxZoUjzY7ahGGo6+NKoaBJPN3Qk
	 ucpDjJ0lH0O/Q==
Date: Wed, 24 Apr 2024 08:40:08 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
Message-ID: <20240424-rehydrate-sloppy-62132c72fe18@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
 <20240423-poser-splashed-56ab5340af48@spud>
 <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_004017_003605_61AABD2D 
X-CRM114-Status: GOOD (  25.43  )
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
Content-Type: multipart/mixed; boundary="===============1941604072513911863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1941604072513911863==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SiSSfUusYQSVZJqq"
Content-Disposition: inline


--SiSSfUusYQSVZJqq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 09:20:35AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 23/04/2024 18:30, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 04:26:41PM +0200, Cl=E9ment L=E9ger wrote:
> >> Add description for the Ssdbltrp ISA extension which is not yet
> >> ratified.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b=
/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> index 63d81dc895e5..ce7021dbb556 100644
> >> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> @@ -147,6 +147,12 @@ properties:
> >>              and mode-based filtering as ratified at commit 01d1df0 ("=
Add ability
> >>              to manually trigger workflow. (#2)") of riscv-count-overf=
low.
> >> =20
> >> +        - const: ssdbltrp
> >> +          description: |
> >> +            The standard Ssdbltrp supervisor-level extension for doub=
le trap
> >> +            handling as currently defined by commit e85847b ("Merge p=
ull request
> >> +            #32 from ved-rivos/0415_1 ") of riscv-double-trap.
> >=20
> > I see the proposed ratification for this is Sept 2024, and is marked as
> > "Freeze Approved". Do you know when it is going to be frozen? Until
> > this, I can't ack this patch. I had a look in the RVI JIRA
> > https://jira.riscv.org/browse/RVS-2291?src=3Dconfmacro
> > and it looks imminent, but it's unclear to me whether it actually has
> > been or not.
>=20
> Hi Conor,
>=20
> Yeah, this series is a RFC since the spec is not yet ratified nor frozen
> and its purpose is actually to get to a frozen state. As to when this
> will be ratified, I guess Ved can probably answer that.

Usually I'd just not ack the RFC patches, but I do at least check how
far they might be from frozen before I move on, The jira for this one
says "Actual ARC Freeze Approval:	18/Apr/24", which made me think
a freeze was gonna happen soon.

--SiSSfUusYQSVZJqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZii3WAAKCRB4tDGHoIJi
0sIAAQDIxpw/HuOo9/JqvyU+02o1E9Ih6d0pVx2mM9tf0Irq2gD/W+zFzb+/rTjf
GqZYpJl93UvUWXVzUj0PqNxDnSWcEQo=
=7cO9
-----END PGP SIGNATURE-----

--SiSSfUusYQSVZJqq--


--===============1941604072513911863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1941604072513911863==--

