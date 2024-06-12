Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1826AC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5jRWSEWfK3B56TqklfvPxY6EKcsHckhB1h5PkzzMBo=; b=pOuM3N9mMVffbdwlFDKNUe+KsO
	T0cTa8NveaCpiErTL35tUVKg/Ri+qJ9+p4fpI2AgNHtwSi5Sj75eIYrKBULSbhfdDcT2axERDtiVq
	uIRIJzu++o+4j1Zi01F+MJD0EaqJNtrMmjwA1lvYhqRkeOQLogPhinxPlciNDsNATH5quOZN1YHgv
	QWem/DnAll4vC0XSjd5u6STJpd5r8JSR3UxMUBh2azdN+FdNdVtdNvuWDbLF8KK3TVtCpoYMGdZ+K
	+PfgFgOhWxyrfKapCLmR3orjFDsKuXdtDfRby0b8J7S6EsyXC7Uwjv5ptApT+sUo/QuY3DNm55OyV
	6t9rvBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQIU-0000000DFjp-46Ew;
	Wed, 12 Jun 2024 15:54:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQIS-0000000DFij-1LTN
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F1F3CE21CC;
	Wed, 12 Jun 2024 15:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E8CC116B1;
	Wed, 12 Jun 2024 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718207637;
	bh=A/q6m45sA8KG3xWSmANGingFfUIcNjjpTnH7bMJgRmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTy8Jw/jTcDpAnDYssZPlt8vz3bcbolI+P475PfDuR+fHaR5a09wgg6QBVQmg+owo
	 PFKNFpynkSRKrTtBXBPy0ysbUUlHxeVjIjUdtXs96LdZ1ufRoZNg9rgwCa5eJvUXvB
	 rCgM8wwfi+tDUSoLG4g6iuFsIYolucywbFU0XQtmCtG7Y9FvraSaYABDJTo0mMeKWw
	 m9+vnDFnA0M5HoTXzHh49/T8BwrUh8ZGmJTUA4odCXPkzzhHrFgKwlHX+CGKglQIAV
	 BhAfgE5r6q2Je+Tb9DPxuDgUdayvTqG0MbCQoqOnv0PXv3JsExXn/4BjdcAMmn8aTl
	 yIYArnfRGivpg==
Date: Wed, 12 Jun 2024 16:53:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for
 JH7110
Message-ID: <20240612-circling-hungry-29a993ca5fc5@spud>
References: <20240611015200.40996-1-minda.chen@starfivetech.com>
 <98031697-93AE-43AC-B192-44B12CB43EC5@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <98031697-93AE-43AC-B192-44B12CB43EC5@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_085400_565540_350428B0 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: multipart/mixed; boundary="===============3229036108812238609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3229036108812238609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o24WclyZlx9mMuRS"
Content-Disposition: inline


--o24WclyZlx9mMuRS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 04:24:44PM +0100, Jessica Clarke wrote:
> On 11 Jun 2024, at 02:52, Minda Chen <minda.chen@starfivetech.com> wrote:
> >=20
> > Add PCIe dts configuraion for JH7110 SoC platform.
> >=20
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> > .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
> > arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
> > 2 files changed, 150 insertions(+)
>=20
> Is there a corresponding YAML schema?

Yeah, it's in linux-next via the PCI tree:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml

--o24WclyZlx9mMuRS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnEkAAKCRB4tDGHoIJi
0tEhAQDKDsuAnifw9l4RMxkk9gttAErd01F5deCxrozjvbw68gD/f4YR4jwR+HWo
guuAKaN4L1wy1l8OHja7SG8tgk4Wsgo=
=DpyI
-----END PGP SIGNATURE-----

--o24WclyZlx9mMuRS--


--===============3229036108812238609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3229036108812238609==--

