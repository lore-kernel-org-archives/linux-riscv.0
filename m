Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95919C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gxJKenlF3Oxi39hTF1wISNhMQkp+0IEjw+yEbZw4xs=; b=ludgN0ul2tBqfA9EeH2r+KNQMG
	x8Bj9KDKIcF+sH8V8ULWOlrAjWJxe9QAXpl93obmDfmqo6qvKGxNrXnjqvRDljcNOZu76LNHkqWFY
	eDlg+z2+GBjSoswlO4WXrpj4m/qbDDkuQu6r1SxxEZr7XijeVvRnabitj9Id5dCxXv4Xzyxrk93Z2
	LLRgFQ8Y4r28DC9+xcs7rfGJyBF2e4AndirxTKoiqa5bHPVn0yCxcf1oS6GKp19epDeQHYXNKAUk/
	uogAKisvvWHQ84De4WRzW05kB0Iz7iiKAbl62Y2IHZbk9E8odvqPwIHL+6cfFHUy9oWg3xsTwf4rW
	6oxOihKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL3M-00000004eaB-3RUH;
	Wed, 29 May 2024 15:17:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL3J-00000004eZT-0Efa;
	Wed, 29 May 2024 15:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 345A560C11;
	Wed, 29 May 2024 15:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3737CC113CC;
	Wed, 29 May 2024 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716995839;
	bh=tRSPxp67b5/5Zs1BaKIcU7e76dVz6jxvEF0XMXgjsqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0MlBfJ+wGg3UwyFMwWfZEgt0MLOAeK2hTSg8URUYtWhVL5zAyca4eQcljcTBE/Wm
	 rALc2J3z9jeSoCaSKpP8TWCKnEaGhF9HjkOZm9GRFPSw6JV6Wcd4NPE7FxQLA7F+ZJ
	 GY2XMYc7LpkiNQCmTfNnoduF8UJER1QV6/tEWWBAGeebh0oGBtrfgVq882C+PSTA/a
	 idCgMvssZHIEAkunqTbN4PkGsxsQxsWC67dB0R3BP84nm0NVcKtxjtTXxo8KrhYa7r
	 9CEJC6D53/7AgtSIseJSnS44gyZZPAcwA9WMV7S41q8EDav25p6ct68ZcvU5P9S2Wk
	 NyEbh9aLUFgKg==
Date: Wed, 29 May 2024 16:17:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Saravana Kannan <saravanak@google.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
Message-ID: <20240529-rust-tile-a05517a6260f@spud>
References: <20240528164132.2451685-1-maz@kernel.org>
 <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
 <86bk4pm8j1.wl-maz@kernel.org>
 <CAK9=C2XRx==OTPoGW_AHmjq4Th0bv4okwcq6-3L5JYwHwQp97A@mail.gmail.com>
 <86a5k8nbh1.wl-maz@kernel.org>
 <CAK9=C2Ugq=0y8M86CD75mQccBo=TBLBomb4rqC4i1naKy2LyWQ@mail.gmail.com>
 <868qzsn7zs.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <868qzsn7zs.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_081721_205797_D6FCE1CE 
X-CRM114-Status: GOOD (  21.55  )
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
Content-Type: multipart/mixed; boundary="===============6869291738766807935=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6869291738766807935==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QuT3/USFLVPqyc21"
Content-Disposition: inline


--QuT3/USFLVPqyc21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 01:00:07PM +0100, Marc Zyngier wrote:
> > > > In the RISC-V world, there have been quite a few QEMU releases
> > > > where the generated DT node of the interrupt controller does not
> > > > have the "#address-cells" property. This patch breaks the kernel
> > > > for all such QEMU releases.
> > >
> > > Congratulations, you've forked DT. News at 11.
> >=20
> > Can you elaborate how ?
>=20
> You've stated it yourself. You are relying on a behaviour that
> deviates from the standard by having DTs with missing properties
>=20
> And since we can't travel back it time to fix this, the only solution
> I can see is to support both behaviours by quirking it.

I'm not convinced that there is any actual production hardware that
would get broken by your patch, just QEMU, so I think it should get
fixed to output devicetrees that are spec compliant rather than add some
riscv-specific hacks that we can't even gate on the "qemu,aplic"
compatible because QEMU doesn't use the compatible created for it...

Spec violations aside, the QEMU aplic nodes in the DT contain a bunch
of other issues, including using properties that changed in the
upstreaming process. Here's the issues with Alistair's current riscv
tree for QEMU w/ -smp 4 -M virt,aia=3Daplic,dumpdtb=3D$(qemu_dtb) -cpu max =
-m 1G -nographic

qemu.dtb: aplic@d000000: $nodename:0: 'aplic@d000000' does not match '^inte=
rrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@d000000: compatible:0: 'riscv,aplic' is not one of ['qemu,a=
plic']
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@d000000: compatible: ['riscv,aplic'] is too short
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@d000000: Unevaluated properties are not allowed ('compatibl=
e' was unexpected)
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@c000000: $nodename:0: 'aplic@c000000' does not match '^inte=
rrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@c000000: compatible:0: 'riscv,aplic' is not one of ['qemu,a=
plic']
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@c000000: compatible: ['riscv,aplic'] is too short
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#
qemu.dtb: aplic@c000000: Unevaluated properties are not allowed ('compatibl=
e', 'riscv,delegate' were unexpected)
        from schema $id: http://devicetree.org/schemas/interrupt-controller=
/riscv,aplic.yaml#

I guess noone updated QEMU to comply with the bindings that actually got
upstreamed for the aplic?

--QuT3/USFLVPqyc21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZldG/AAKCRB4tDGHoIJi
0oYWAPoDsUoaVQGx27axveY1n1lIrXkUGHlGo31YRIruXNo+ngD/R9/DjC94q7t/
JpAE9JiPE1EcGTOVFoRzpEHCL0sh8wg=
=qPe7
-----END PGP SIGNATURE-----

--QuT3/USFLVPqyc21--


--===============6869291738766807935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6869291738766807935==--

