Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF087C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vMpVssB8o8vZhM4IdK2V5I/D5fSTdLlJZxB3m5ZGDM=; b=tYjVjxVw4pmwy4kTfeIYMlcLqI
	wGw5z72747IWKAcyMXCOtXyYs6l96l7433zZG3UWn4/HmxpWhqLIwsIs3fSX0PyZ6RlwyN1iH3ZV0
	TBgT18tinql3PzM346WiokVVuPr55RsIZ+3H2wl503IOV49Lkm5ahngKx5w5+2UQB/bD7uTjp5oyi
	U6tAtkz+hmX5UJTPa+ksXFuMp8Znjz81k5yLSc8xtBuvq5RELqZqxrsySvU1r1mp2xwAz1mslUq7h
	5GxQuCRg8JxZ+nbZ39gzIguKsG9s69CPGzBHc/L9gPtBYMCogZYEnH8Ih1x+r1Aj/7KEZLdHchkqA
	82RUzzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb7h-00C38j-1Q;
	Wed, 25 Oct 2023 10:28:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb7e-00C37Q-1g
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE705CE3739;
	Wed, 25 Oct 2023 10:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4434C433C8;
	Wed, 25 Oct 2023 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698229697;
	bh=eDN3u4TDJcYx+DdQgle7gIiWglsOEno7mki/bA7iChI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYi3dilYvxvpeucgQcFZt/105T7co3wqObnpSfk+MdkG6n1Ax+Nglw0FpL/EzTLXr
	 fwkO3jO8d8RXPVQed3WVMNI2+ACOa/JE7PFkG7W19F6wiQrPJ9D6V2LpkUsvPGlrep
	 lUii0yUazUY8F0nyRZ/c2WQwv2DMrfRoGxw7rMst956WIV8CvPko4YwOQLKcH3YqXu
	 hMdZcIi+sFMwQq/sScjpwVX29E0DEuiJzLo2hB5YOcfWKY6VM0ZuLkg5TpXut5ncbo
	 uqRHOomTnr8dg9wWfUSrrkX829PueOgyJk6g4jhanNNVG8x2VifYJebgi7URD7czWP
	 XReaJl1ihzO8Q==
Date: Wed, 25 Oct 2023 11:28:11 +0100
From: Conor Dooley <conor@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v9 01/20] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Message-ID: <20231025-dotted-almighty-ae489e9eb764@spud>
References: <20231020104341.63157-1-minda.chen@starfivetech.com>
 <20231020104341.63157-2-minda.chen@starfivetech.com>
 <8ced1915-7b94-4abc-bd8b-cb4bf027fa01@linaro.org>
 <bd441e1d-73ae-4abc-8eb2-877419acb2df@starfivetech.com>
 <97e2decd-f6a3-91cb-6ca7-539f53b686f3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <97e2decd-f6a3-91cb-6ca7-539f53b686f3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_032822_899294_F0565C8E 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: multipart/mixed; boundary="===============4671436962701453818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4671436962701453818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hpByJWRUAD7N1Kah"
Content-Disposition: inline


--hpByJWRUAD7N1Kah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Mon, Oct 23, 2023 at 11:09:50PM -0400, John Clark wrote:
> > On 2023/10/20 19:04, Krzysztof Kozlowski wrote:
> > > On 20/10/2023 12:43, Minda Chen wrote:
> > > > Add PLDA XpressRICH PCIe host common properties dt-binding doc.
> > > > Microchip PolarFire PCIe host using PLDA IP.
> > > > Move common properties from Microchip PolarFire PCIe host
> > > > to PLDA files.
> > > >=20
> > > > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > > > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >   .../bindings/pci/microchip,pcie-host.yaml     | 55 +-------------
> > > >   .../pci/plda,xpressrich3-axi-common.yaml      | 75 ++++++++++++++=
+++++
> > > Where was this patch reviewed?
> > >=20
> > > Best regards,
> > > Krzysztof
> > >=20
> > This Conor's review tag. v2 : https://patchwork.kernel.org/project/linu=
x-pci/patch/20230727103949.26149-2-minda.chen@starfivetech.com/
> > This is Rob's review tag v3: https://patchwork.kernel.org/project/linux=
-pci/patch/20230814082016.104181-2-minda.chen@starfivetech.com/
>=20
> Tested-by: John Clark <inindev@gmail.com>:
> https://github.com/inindev/visionfive2/tree/main/kernel/patches

I suspect you don't mean that you tested this individual dt-binding, but
rather that you tested the whole series. If so, you should probably
provide this tested-by against the cover-letter instead of this bindings
patch.

Cheers,
Conor.

--hpByJWRUAD7N1Kah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTjtuwAKCRB4tDGHoIJi
0iNaAQDXojC88wOu7QjVVmLnYZL8zENhy8Oi2Di4/qv5YX44awEA94984Ym3RynW
Zg7JNxtoafH9S4GD3WxSvjcUuQVxQwk=
=pa28
-----END PGP SIGNATURE-----

--hpByJWRUAD7N1Kah--


--===============4671436962701453818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4671436962701453818==--

