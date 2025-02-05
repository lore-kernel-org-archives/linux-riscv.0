Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07788C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3qBoCLMwWoSWCM8Xsx1BTgVTbZNhpNa1OlKriN2Qs8=; b=FrfF9NzBfJdWQNud5iWDebDfz3
	f3QV9ENTVI8k6GY/fTT9nIxzotNbUDB+FMjXk4IHZ7/out8znqNsh/sCnoUW6j7n02RwO53m7buQZ
	FU8UWjl++oWRog6+fcCGQKuuDDpWr2Zqt7Iumi7ZkfOwjcrbvG9RnB1AzGEx38E0doHrMgZc7a2hJ
	KoRbUSTFeekegl5nc6LrG6YCK5UK7HKV7BXJGs8Tw6osbrPOj5Fr8B2YLgiUXghQ9UN4TnUcbgBie
	vLLIqUQquVOI3ALNg0MPYzvwQUp8jGkrRZk67sBwBjOtaw75X9OBWrD66QkM0J57G2P8OLJEhMif3
	Ns9iGTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd9f-00000002zKi-3aIM;
	Wed, 05 Feb 2025 11:01:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd2L-00000002xPX-2H2K
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E800A4342B;
	Wed,  5 Feb 2025 10:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04EC4CED1;
	Wed,  5 Feb 2025 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738752820;
	bh=T+3gl+VSZ+Qi/d9r3WJTd8uqTFyuJiVzfw6RNe53BYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDd3SGBLbf6wfwR52kJbJY2t3d5Q//YmuOtijtnJaovsfUADjETr5rcQEVkg/fgT6
	 yIYkpvYhOp1XZ61+yyDUhog3aPmXid9GDgs4I0JTSmEEss2ktIs6XFnhpejfbARPVg
	 vy6M7pWW+NPFSU1n4+UMFCUmUXXe/Ipt8VRt6HJ74GroO6qfoPeeX6Qzt7ii4gL+/A
	 l6UIEtQmS7zhPC67+PuKex27eB65jAXN4qpnz6PX7z1J5pyY3zGFuBwxH/cyHw/DOT
	 V0eZhv1ixc50zFyAQd6YobH4WH3/PSXTHC/vLYH+WZle0pieZEONIwfPfLOh/U/Oxy
	 2A8tmPpkxkStg==
Date: Wed, 5 Feb 2025 10:53:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Message-ID: <20250205-tricky-passport-b786aba90241@spud>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_025341_641558_8BEA533E 
X-CRM114-Status: GOOD (  11.42  )
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
Content-Type: multipart/mixed; boundary="===============8903644153663972843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8903644153663972843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TQwBxH4NgmwT3RhR"
Content-Disposition: inline


--TQwBxH4NgmwT3RhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 02:35:42AM -0800, Emil Renner Berthing wrote:
> E Shattow wrote:
> > Add bootph-pre-ram hinting to jh7110-common.dtsi:
> >   - i2c5_pins and i2c-pins subnode for connection to eeprom
> >   - eeprom node
> >   - qspi flash configuration subnode
> >   - memory node
> >   - uart0 for serial console
> >
> >   With this the U-Boot SPL secondary program loader may drop such
> >   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board target=
s.
> >
> > Signed-off-by: E Shattow <e@freeshell.de>
>=20
> I can't find the booph-pre-ram property in any of the schemas in
> Documentation/devicetree/bindings. Does make ARCH=3Driscv <..> dtbs_check=
 not
> complain about this?

They come directly from dt-schema:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/boot=
ph.yaml

--TQwBxH4NgmwT3RhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6NDLwAKCRB4tDGHoIJi
0hNrAP43qtVDHtQj36YwYboLuBOirdtkgVN1fUhOnVEV0Y1ATwD/YYP2G1xIul75
f6agMqEHmTC28/AhY8PcgE/JUQIWzgQ=
=y2pN
-----END PGP SIGNATURE-----

--TQwBxH4NgmwT3RhR--


--===============8903644153663972843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8903644153663972843==--

