Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F4606A321
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 23:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZaYbX/dr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGcDhCMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=puiRKOQ9HX9DRrDHJGzWWc80G9oegXD/ASbb8Z8FkFU=; b=ZaYbX/drpQuC6m6QWNZRlZhg6C
	VccHajuPekugfpanviXR+kWb99Wg+9bCrtEh5KTRsjByP78XELqwkaWJXlpVO993xIwBF7k1GUD94
	yQM6VHTo/DzafEBJ56dnWaG2PCCSA6EC30yVznd3uynT/BUBM9XG5uCEQwl0/miUb5WFm6Gea5X9N
	IsE8sxTS4eU0zxj/LqyUqUIcrdD+by4ZsYCVJp7aKFckR6wB0vldGPgj2CCeKY8rLJOwp5pEjcvJj
	5/TRDUt6lcSLIUWKH5VJiQ0IpIhdEfsMXGLcHqpHRXch2JOBrZb+R93DTRKPpj+n4YuV4d//L90TJ
	Myu1uCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCFY-0000000GuCN-28wb;
	Sun, 08 Nov 2026 23:24:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCFX-0000000GuC1-0HiP
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 23:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC5CC4177E;
	Sun,  8 Nov 2026 23:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F44A1F0089F;
	Sun,  8 Nov 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180274;
	bh=ES2fe2OeeWN8lXmtNe7OrgYovNQ/GK0YNS0MK0hH5CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fGcDhCMH/a85cDlsr3pElVB/dGeefSIpWRLTFB+Ci99m6t59r+FCUnzgL6ONW3NvS
	 /Jsbg/8bt4bFtGcGL1untNKBH/r9rBdOCX7TdPJiwh/0e7IGjTUJfmzymTiPHwhEje
	 8HmYGLH3gsDwAJSWt8OjmdIliUzzU25x2KYlfY5MNToxUtWZnRPFzASI7XwV3yqd5U
	 o5xSGVLxbHjUrMZG/NQE1qGto0QdPq0c12DMvRL/DRiKUoDBvkJHRrTkli7EFV/HVJ
	 MthORDnmiY9Q9W7ow6umvXR0CS/gW8crxxH2te7LZSI6qff3FZk3wqCtkAxlWRTRtJ
	 rE2E0F1Wpc0NQ==
Date: Sun, 8 Nov 2026 23:24:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: e@freeshell.de, kernel@esmil.dk, conor.dooley@microchip.com,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
Message-ID: <20261108-florist-smartness-eeaaf38d5d1a@spud>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
 <20261106-tumble-hurt-d1a0be3fddae@spud>
 <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6417935726304733664=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6417935726304733664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVtvTnoaGFJXJKwI"
Content-Disposition: inline

--AVtvTnoaGFJXJKwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2026 at 09:55:07PM +0000, Owen O'Hehir wrote:
> Hi Conor,
>=20
> You may have missed my email on Friday at 21:12.
>=20
> I think E has a point. There is a separate red LED on the board that
> shows power. My confusion came from the net that drives this green LED,
> which is labelled STS_PWR. This green LED has no silkscreen label and the
> schematic is ambiguous on this particular LED.
>=20
> It is probably better to drop this patch. Apologies again.

Okay, no worries.

--AVtvTnoaGFJXJKwI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavEErQAKCRB4tDGHoIJi
0syNAQD9ambPIxy/jezDHx7UY3KpaN3HqLlA2khDM59kkcX4KQEA4IuuqDTsxm7n
gsTdgRWg2MrqzasI1NpptgGPIQu4Rwk=
=LdK7
-----END PGP SIGNATURE-----

--AVtvTnoaGFJXJKwI--


--===============6417935726304733664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6417935726304733664==--

