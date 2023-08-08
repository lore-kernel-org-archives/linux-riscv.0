Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83553C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHAGzdHr1li3FICS5g8OTrwxMmzO5JAlwvcMdnZH7IY=; b=W46arbwQxWil6P7ielCu/MsZ+d
	9wljRafzTw2WPDwqa0ZvVoq33Veew8tC6CbqD+rctfWiPB0sk+nAoDckMiENgoVD3xQA0kU7y8s1D
	vI0tiMlzSBcMCG69JwEYunnd7izGfzhPUjoW/BIKnCPo2AXlMLEn1fZqAvLWjzxKbqnEjQaJ+1dDD
	eRj4/MAEI28XxZgk0E3e2TpemTyDdyW89rGiNJrWYO30y+PHD4BKyfsGFggmNuDvsi7b6Ka+9axWF
	O6iW1KHnGi3B1Nu68ofDzIHBaie/24GWey5Rwr5pvuiUfYFCkpnqWTN/0QCCm03jZV/HpqOVn9RwF
	fRD0Z4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKum-002T2O-0Y;
	Tue, 08 Aug 2023 11:30:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKui-002T1k-2D;
	Tue, 08 Aug 2023 11:30:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F19CB624CC;
	Tue,  8 Aug 2023 11:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01BDC433C7;
	Tue,  8 Aug 2023 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691494211;
	bh=vBWSlCDrZROxYuy5ae4tTgkUDzDtAMFgQOHc2MqMN00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxQAHNSR+7FUjdWOuwilrrz5CHO2ObEjZl4fLBcr+LuMNcCNKtQAKcmtgTOIFV+Yh
	 7cu/EogbhTMQiiZ3g+syK5H83K28a+yereJhUBKnA4a/yOMRSjt3nLsKAHhlUvXYXr
	 htGC6od3JcJbQFmH5LiGxzAIRcVqG+ss/EdoPCxLbX1KOl4Sqdx8QNGbbZeNCDXOMi
	 IDR3emYO4U9d0hpj/LVopgLJRCXwtM1TvG6zIv47LavRbQnw6i8QGtabKCjXXlhWqN
	 1FbmPRagUR0jvtHILpvHSXizSC7kIt/kwtCj1gMpev209vnY2NFhuJbNneA3n1sJyO
	 ZFi+GGQOWIk9g==
Date: Tue, 8 Aug 2023 12:30:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v1 20/21] RISC-V: ACPI: Create PLIC platform device
Message-ID: <20230808-ferry-swarm-e2a0abb17165@spud>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-21-sunilvl@ventanamicro.com>
 <20230808-chalice-easing-1369c7386082@spud>
 <CAK9=C2XZ7_tfSK6HNN1Em5fAHrknWBqGaD9gPL8yGs8AzE3vQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2XZ7_tfSK6HNN1Em5fAHrknWBqGaD9gPL8yGs8AzE3vQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_043012_820164_DF99F230 
X-CRM114-Status: GOOD (  25.44  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============2000133806789134289=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2000133806789134289==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B+bG6e2jHgiFE7ir"
Content-Disposition: inline


--B+bG6e2jHgiFE7ir
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 04:27:16PM +0530, Anup Patel wrote:
> On Tue, Aug 8, 2023 at 2:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Thu, Aug 03, 2023 at 11:29:15PM +0530, Sunil V L wrote:
> > > Since PLIC needs to be a platform device
> >
> > For the unwashed, why does the PLCI need to be a platform device?
> > (And while you're at that, please try to make use of the extra ~20
> > characters per line that you can use here.)
>=20
> As suggested by Marc Z, only timers and IPIs need to be probed early.
> Everything else needs to be a platform device. The devlink feature of
> Linux DD framework ensures that platform devices are probed in the
> right order based on the interdependency.
>=20
> The PATCH5 of the v7 AIA series converts the PLIC driver into a
> platform driver. This works perfectly fine.

To be clear, I want the explanation of why the "PLIC needs to be a
platform device" to be in the commit message.

Thanks,
Conor.

>=20
> >
> > > probe the
> > > MADT and create platform devices for each PLIC in the
> > > system. Use software node framework for the fwnode
> > > which allows to create properties and hence the
> > > actual irqchip driver doesn't need to do anything
> > > different for ACPI vs DT.
> > >
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
> > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> >
> > > +static struct fwnode_handle *acpi_plic_create_fwnode(struct acpi_mad=
t_plic *plic)
> > > +{
> > > +     struct fwnode_handle *fwnode, *parent_fwnode;
> > > +     struct riscv_irqchip_list *plic_element;
> > > +     struct software_node_ref_args *refs;
> > > +     struct property_entry props[8] =3D {};
> > > +     int nr_contexts;
> > > +
> > > +     props[0] =3D PROPERTY_ENTRY_U32("riscv,gsi-base", plic->gsi_bas=
e);
> > > +     props[1] =3D PROPERTY_ENTRY_U32("riscv,ndev", plic->num_irqs);
> > > +     props[2] =3D PROPERTY_ENTRY_U32("riscv,max_prio", plic->max_pri=
o);
> >
> > My OCD wants to know why this gets an _ but the others have a -.
> >
> > > +     props[3] =3D PROPERTY_ENTRY_U8("riscv,plic-id", plic->id);
> > > +     props[4] =3D PROPERTY_ENTRY_U64("riscv,plic-base", plic->base_a=
ddr);
> > > +     props[5] =3D PROPERTY_ENTRY_U32("riscv,plic-size", plic->size);

--B+bG6e2jHgiFE7ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNInOwAKCRB4tDGHoIJi
0sLcAQCDXLAw71GxaGzz6Qp83L1Tb3sQIefjSzU544KRvPaIZwEA0NG4WpAU7bh9
dP9hFr5cEYLKlf5xgRt76/vz3TmyhAM=
=TeDA
-----END PGP SIGNATURE-----

--B+bG6e2jHgiFE7ir--


--===============2000133806789134289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2000133806789134289==--

