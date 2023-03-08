Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05BC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnH/woA1bsKc0sCkKQhfguO6+dcH9mbTTtZKe/6Kx50=; b=WJt1ZLKj7jgtpUwIrOFUgyaKD1
	l+6V2WorieEG8Q6+SRkMbRFi2NrwHkGllXBciH1itr3grQITQ2xt6Y6TdoEXcf0r394WnPkKQIk4q
	fG5drkFhIrDStwTigtt2h4UayJBkm+lg6yudu6VBBt1pdiT/riE/xdRotdoefupyVWGfph1HEHFaZ
	mal8+Bu1RlfXBi6nGTp2HxKAH8FLAR6iW89yXyLYmYZlT6NSqAkgiQ6gHRhJjhtH73QRB6h7wkvYB
	a8lOQn3NN3sMW6J4MfSlKO2T5vewnYszHQX+9+J3hmaoJJ8HZsHfU0iVMlN2lWEgEKe9GTK2Ohr09
	koT4mqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtyP-005EbB-96; Wed, 08 Mar 2023 13:36:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtyM-005EaW-Fm
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 13:36:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D82B5B81CBB;
	Wed,  8 Mar 2023 13:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0E1C433D2;
	Wed,  8 Mar 2023 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678282607;
	bh=OWt+d3tO5ov32xGG5qMASavRsXPbCxmg5AnjKjZWCQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1+WSDpglc0KQHoGoeALrFnjtOEecp+1lZU/z1//Lcn5pU0D11ODzFYixZPHhO4s3
	 9wkMK/yg4dvTxbqvX2lyP8pLm/7d9PbjlWS13FReTUtQLlHwQYDUUuXs5Z4Gn17/uB
	 0O6fSaBNA8q2o5lFGKU8vsB0a/VzPd4EIW4Zv5HHzVRZEneGCCnR+k5ViVqS4ncGTx
	 V7dQtFyJcQw7DGz+7AdTpqJRdYEnwZ34J0WliqDc18fD8FOcBJMc9YyYXqvdnos0P2
	 ckAZaJMejCTT9jcTozelYzYnUmu8FKNsI5/jeP8+Ep/toXkl7Bhl00bhYQVKY5fjQD
	 HyBkHk7ruAvDA==
Date: Wed, 8 Mar 2023 13:36:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <4c071642-e3c8-4716-a580-5b42e25efb1c@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
 <ZAb7JVghuiwZF1Q5@wendy>
 <2f03dfb2-5cf8-e954-913c-f0c27db6bcf5@starfivetech.com>
 <ZAh/UeSlUeGoKxki@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
In-Reply-To: <ZAh/UeSlUeGoKxki@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_053650_693866_C5983AC2 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Type: multipart/mixed; boundary="===============8516617457527361779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8516617457527361779==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Q9Amaw99NjcnKrY"
Content-Disposition: inline


--1Q9Amaw99NjcnKrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 01:28:01PM +0100, Tommaso Merciai wrote:
> On Tue, Mar 07, 2023 at 06:08:53PM +0800, Hal Feng wrote:

> > The above two methods can fix the problem. Here are my test results.
> > The VisionFive board can boot up successfully if and only if all above
> > two applied.
> > The VisionFive 2 board can boot up successfully if I merge Linus's new
> > changes.
>=20
> Tested also on my side. Hope this can be helpfull.
>=20
> > Hope your fix will be merged in rc2. Thank you for your reply.
>=20
> Fully agree.

If you only have a VisionFive 2, it shouldn't matter to you, as you
don't need to fix up any SiFive errata (at the moment at least).
Linus' fix is already in his tree, so should be in -rc2!
The fix for the VisionFive was applied to Palmer's RISC-V fixes tree
last night:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=
=3Dfixes&id=3Dbf89b7ee52af5a5944fa3539e86089f72475055b

Thanks,
Conor.

--1Q9Amaw99NjcnKrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAiPVwAKCRB4tDGHoIJi
0jkLAQDPFRsrm3jV2o7oZA41VzOVHxBFtUn0CPkVOzvVlHguFwD/eEMsCXuhUN65
gD5cpKcLgiGCltbgB7imErj+jrsFrQg=
=11W4
-----END PGP SIGNATURE-----

--1Q9Amaw99NjcnKrY--


--===============8516617457527361779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8516617457527361779==--

