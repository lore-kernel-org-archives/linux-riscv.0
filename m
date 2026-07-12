Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D663C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDbinGqstqnpXnGKaTeHRpbecxoQGYfGBs/yVjnF8lg=; b=z/eCOM6nrSl4wGpojY9UrNnb60
	IR6pNkmE60xDEKtUTPKAJIpFJwZiSQh6VX7kdN/n+paWVwUq92HCGMgty4W0yvZX6BQ0cGVXk7xy6
	VdBICBE6oxdnkS9MW5gLFnhhF/EF9PBSlx+YQh8slPkLoRIb9F70CDYn+K+lymCeDm3wXybmUH88c
	u4xVdvngFNOGB65DBK0u1MTT0ZBUJhIBAbMm+SycDrcqpaT5jySs7GuYW1pHKyncYbFIdgM03lIt/
	kAazsFUTeOTk1EKknWgPYjh6ZT4t5JyVa8rL2gTYtW25hZRoCvbZP74hweCJIDPdDPPVCRjH7bZCc
	ides92pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu27-00000007Sos-3pG2;
	Sun, 12 Jul 2026 13:15:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu26-00000007Soj-2LWV
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 13:15:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70E006004E;
	Sun, 12 Jul 2026 13:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923901F000E9;
	Sun, 12 Jul 2026 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783862142;
	bh=Nh88LM8tcn4ASu2ZHG0sNKD7t6K3lGnx5oaEMxt0uO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VNEtcsuLTmU2ucIIDm9TU0aOrgLG0PmCJHk9PDUon1AljI1F9FSR9LpQDVRUf+7qk
	 mgoU55c86qZCVDWkmdFQ8EMVU9zzS+lyg39dHwDfuEt0lyiZnIZN1ln2xyKpgaenGB
	 1Y2727IZNQLM6VZGXxCQ61q4lq4S7Lhw8TJAPrzGVverjXFvff/WoZBPjKCiqSd8AB
	 PzO2NVD8dVg2RkiBjK3Ps9x/u8HE9LkND7+WE21L/Zzx5p2saUMs7W5bdC2yyL5AyN
	 QfRmoMiFqPmlhSDsF1SJs8Fa3LmWQlgD+YMkIHm2TPCdqKy1fM9X/zs/nekbo1cyxa
	 9RoBKqvGPRffw==
Date: Sun, 12 Jul 2026 14:15:36 +0100
From: Conor Dooley <conor@kernel.org>
To: "Ousherovitch, Alex" <aousherovitch@rambus.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	"Krishnamoorthy, Saravanakrishnan" <skrishnamoorthy@rambus.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Wittenauer, Joel" <Joel.Wittenauer@cryptography.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Message-ID: <20260712-washable-clapping-5dfb79d1bdef@spud>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-2-skrishnamoorthy@rambus.com>
 <20260710-siding-unmatched-5e066fbe4c01@wendy>
 <SA3PR04MB9001E7DC9B2D4788EDCE2390D7FD2@SA3PR04MB9001.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA3PR04MB9001E7DC9B2D4788EDCE2390D7FD2@SA3PR04MB9001.namprd04.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============7117900758594038940=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7117900758594038940==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwarKFrPpjCIAVeL"
Content-Disposition: inline

--pwarKFrPpjCIAVeL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 11:14:11PM +0000, Ousherovitch, Alex wrote:
> On Fri, Jul 10, 2026 at 1:59 AM, Conor Dooley <conor.dooley@microchip.com=
> wrote:
>=20
> > This company no longer exists, you should probably introduce a rambus
> > vendor prefix instead.

Please fix your quoting, you need to retain context beyond what I said
so that people who get 100s of mails per day (me) remember what it was
in response to.

>=20
> Cryptography Research, Inc. does still exist -- it's now a wholly-owned
> subsidiary of Rambus (our co-maintainer is @cryptography.com). The
> prefix names the IP originator, which is consistent with existing
> subsidiary/acquired-vendor prefixes in the tree (e.g. al =3D Annapurna
> Labs under Amazon, mstar noted as acquired by MediaTek, fsl, cavium,
> xlnx). We'd prefer to keep "cri" on that basis, and can annotate the

I'm not sure that these examples actually aid your cause.
al has been replaced by amazon, fsl is not used for new devices, new xlnx
devices use amd (only example for now is the riscv stuff I think),
cavium has had nothing added in donkey's years etc. mstar I don't see
anything new in years either.

> description as "Cryptography Research, Inc. (a Rambus company)" to make
> the ownership explicit. Happy to switch if you feel strongly.
>=20
> > This property seems like it could be replaced by having a reg entry
> > for each mailbox.
>=20
> Agreed -- v3 will make each mailbox a subnode with its own reg window
> and drop cri,mbx-instances.
>=20
> > This looks like it should be deducible from a device-specific
> > compatible. [slots/strides]
>=20
> These aren't fixed per silicon -- they're the per-mailbox layout of the
> VCQ rings in host DMA memory, chosen at platform integration and
> programmed by the driver into the mailbox QUEUE/SLOTS/STRIDE registers.
> They can differ per mailbox on the same silicon, so a compatible can't

I'm not sure. Unless there's more than one instance, this definitely
sounds like something that you can determine from the compatible.
Generally these kinds of accelerators tend not to have multiple
instances though, so each platform will have a different compatible,
and the driver can store an array of mailbox configurations.


> encode them. v3 will keep them as optional, defaulted properties on the
> per-mailbox subnodes.
>=20
> > This whole subnode thing seems like it is only required because you
> > don't have device-specific compatibles [cores].
>=20
> Core presence is actually discoverable at runtime from the CORE_ENABLE
> register, so v3 will drop the per-core child nodes entirely and probe
> for enabled cores -- no per-variant compatible needed.

No, per-variant compatibles (for the devices/socs that this IP is
integrated into) are a requirement. While it would have been handy for
detecting capabilities, it's a requirement for other reasons:
differences between integrations be that functional or enforcing the
correct constraints on properties, issues only present on select
devices, etc.

On that note, I see there's no clocks or resets properties added by your
patch. While the IP may not have a reset (although I suspect it
probably does) there's no way it functions without a clock.

Cheers,
Conor.

>=20
> > this could probably be handled via reg-names? [affinity]
>=20
> Yes -- v3 will express affinity per mailbox (a "role" of a specific core
> type for a dedicated mailbox, or "generic" for the round-robin pool),
> which is the subnode analog of your reg-names idea. One caveat: this
> cleanly covers 1:1 core-to-mailbox dedication plus a shared pool; a
> mailbox dedicated to several specific cores would need multiple role
> tokens.
>=20
> Thanks -- this restructures nicely.

--pwarKFrPpjCIAVeL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalOTdAAKCRB4tDGHoIJi
0lBLAQCfKTJZqqNJen0s99xi2ILKiuhHavFoxTEtPcq0kWgfegEAhX1S0vi0KgKV
HVl4wR7EAY3dKcF5wQElXIiRRSMQVgM=
=gP2T
-----END PGP SIGNATURE-----

--pwarKFrPpjCIAVeL--


--===============7117900758594038940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7117900758594038940==--

