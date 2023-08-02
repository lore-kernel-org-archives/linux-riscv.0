Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B796C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8c3lEPRAeyY0bt8/MFs9wfLcDoVk//QbAVKC3yeTsY=; b=TGYYkTHJJyaVFHN55ZlNCEDVTn
	w0KNF+UbH0baI3cjwjQnMv7DVUCzC1pEOm6b1cwZfC/FBjq/nUllkrSUwdbMgfbz9WeW+/eelG5cu
	vMiY26trRasRR8GmHiWYA36H2B3YhdlJjZoPsd+sIdGy01UJsilnSgLvo1HRB284Pp1GCIW4Y6qdY
	yfLxTNg8nAcd2Lm0Cvvv87nxkLhNMe+kjonTHLP/lcv8ZkWVIjiWq7kQnZBDbdGKdvTpFdWHSn5KX
	F8Wxgzpm6zy3D+NsHaiXqR0+OP/HW3WGwYOTeng8uv8uoeOCmoljwRvbJXWuBMcJ7dfjuT35UfCwR
	AJ7r+9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIPN-005pMt-1l;
	Wed, 02 Aug 2023 20:25:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIPK-005pMS-1s
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C24EB61AF9;
	Wed,  2 Aug 2023 20:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437F4C433C7;
	Wed,  2 Aug 2023 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691007921;
	bh=+O8qluPv0JxAbf7ZatxXqZjsT+TjZ01Aqc8qllKD3Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fbe01a2wiD0NKAGOOQ+Z/Aldho4ww1deCdZHhsXr7nJ30qKpP8ue9MzYguW3mi0B3
	 ccDZtPKQA4X3XAuW/073Bia42VRCrERZCNh3sPbH42uqmNylg2NtaJLpkUHP/9ARO4
	 Klxc4MNqHl73nfnxDkySvLRoPAIueWO5qxYOQjOuAhHqyZkOjZRdsJ6j24aSmQ2+Cs
	 +EfevmIhMQUsnionoYY/PSvSXO5ySKTPUU1Qpgt7YOGdW/MCAp0vVrfIAWyEcE05x1
	 RG60J7zMgS5JxN9PKkL1yxG1ss6JNVZMPABtI+aXCw1RHha1TR/zqTXw4juf9gST4x
	 pQeQdORSZr7dw==
Date: Wed, 2 Aug 2023 21:25:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Zong Li <zong.li@sifive.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
Message-ID: <20230802-maimed-spotted-5fa1fe4be386@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0qRYvTffMnep-aQyTq2tMxbP-s_Lunc+cZ2Rio+BvAE=g@mail.gmail.com>
 <CAH2o1u5Sr0XigUbhna0E-Zk=U76CLZZ4LbM0u4ahPaN5+nOK6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u5Sr0XigUbhna0E-Zk=U76CLZZ4LbM0u4ahPaN5+nOK6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_132522_708527_E75C097C 
X-CRM114-Status: GOOD (  17.97  )
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
Content-Type: multipart/mixed; boundary="===============3701791038645011160=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3701791038645011160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ma68l5vGJ6Lc1SF4"
Content-Disposition: inline


--ma68l5vGJ6Lc1SF4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 01:15:22PM -0700, Tomasz Jeznach wrote:
> On Thu, Jul 27, 2023 at 7:42=E2=80=AFPM Zong Li <zong.li@sifive.com> wrot=
e:
> >
> > On Thu, Jul 20, 2023 at 3:34=E2=80=AFAM Tomasz Jeznach <tjeznach@rivosi=
nc.com> wrote:
> > >
> > > +static int riscv_iommu_platform_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct riscv_iommu_device *iommu =3D NULL;
> > > +       struct resource *res =3D NULL;
> > > +       int ret =3D 0;
> > > +
> > > +       iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> > > +       if (!iommu)
> > > +               return -ENOMEM;
> > > +
> > > +       iommu->dev =3D dev;
> > > +       dev_set_drvdata(dev, iommu);
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res) {
> > > +               dev_err(dev, "could not find resource for register re=
gion\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       iommu->reg =3D devm_platform_get_and_ioremap_resource(pdev, 0=
, &res);
> > > +       if (IS_ERR(iommu->reg)) {
> > > +               ret =3D dev_err_probe(dev, PTR_ERR(iommu->reg),
> > > +                                   "could not map register region\n"=
);
> > > +               goto fail;
> > > +       };
> > > +
> > > +       iommu->reg_phys =3D res->start;
> > > +
> > > +       ret =3D -ENODEV;
> > > +
> > > +       /* Sanity check: Did we get the whole register space ? */
> > > +       if ((res->end - res->start + 1) < RISCV_IOMMU_REG_SIZE) {
> > > +               dev_err(dev, "device region smaller than register fil=
e (0x%llx)\n",
> > > +                       res->end - res->start);
> > > +               goto fail;
> > > +       }
> >
> > Could we assume that DT should be responsible for specifying the right =
size?
> >
>=20
> This only to validate DT provided info and driver expected register
> file size. Expectation is that DT will provide right size.

FWIW this check seems needless to me, it's not the kernels job to
validate the devicetree.


--ma68l5vGJ6Lc1SF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMq7qwAKCRB4tDGHoIJi
0tRtAP9nGZaGgIQrAaYTLppahmjpJ+B4A4f+5TIiS3irhCOhSgD+IoyNLqVkVsKP
MLzN0x3g4i4TUarzD0mHByZ86FQ9eAQ=
=fGg5
-----END PGP SIGNATURE-----

--ma68l5vGJ6Lc1SF4--


--===============3701791038645011160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3701791038645011160==--

