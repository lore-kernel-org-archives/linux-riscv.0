Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737D8C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cOtGPx9+i4wUaJuEHXcvOZHFAknMfbR18O8r+LfsjY=; b=Ept/JrnOfZLX0GmfQOAws//njR
	PV2j6y6+3+isItiYyd8mm01nqbQBftQTrRlIwDweUrTJiYBt2rZbj0TY9P4aM+Kn84fveVSSv/sWQ
	+0lUw8aYlOnT/ERNbitvZfKTuZ2aojCU58S2/dCUzX3ENB96mYyOaRv/Q38n6Y79p1GQ2BkS6K3N0
	WUxLxi9NMXF0Dx6RaewdZoi+tLToZvSMxlrMRM9AcGeUr7bh0WypeBx4YC4hjoyt0qtMhtet1SElZ
	nskqn439gUQzRaMw9kmBtdtAg8YgYJ4fP3UmrDhl4v1nVXBLcg3s3cCYI0g9dKDoAqmY/piL/zVVw
	R9Az78Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIHt-0023pU-00;
	Tue, 08 Aug 2023 08:41:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIHq-0023oh-0t;
	Tue, 08 Aug 2023 08:41:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A1986245F;
	Tue,  8 Aug 2023 08:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8003EC433C8;
	Tue,  8 Aug 2023 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691484113;
	bh=RmuHI6SnVuFMKUQ2d0Pd88TnzEPcPc2NGqkjG7ikYO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwr+yMbUV+NM94lVf0ySZk4FQ2nozF+U9wyhfVylYCpXbt1OL0ssrTMJwXSxsdsHi
	 18rTqTqxxueHW+nMM+ermi6IQknqO8+usQdaIiyi1h1tiB82F262sqvPDUGDacSDkO
	 a+eTTnFx91yf6zmVoeagFEWEQ3lln0JhVGRC83P65FbUnGAKxwHLFQyg6fLOXTTdZn
	 A1EoGEKnrrv1NvaNJ3siqRI5n1/LCn3oUKEUABC06gGoEHMihEoitC1g2km+U7SlBq
	 HDlEJ7VYY0XrzBN2J0H3HcQA4IRPSXjHrlCgv6J3k9J5QInU+H7jleqW4Lu80DSrip
	 ExqC2/GRUi8eA==
Date: Tue, 8 Aug 2023 09:41:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Moore <robert.moore@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v1 20/21] RISC-V: ACPI: Create PLIC platform device
Message-ID: <20230808-chalice-easing-1369c7386082@spud>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-21-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230803175916.3174453-21-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_014154_403734_C70988DC 
X-CRM114-Status: GOOD (  17.38  )
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
Content-Type: multipart/mixed; boundary="===============1241700375803396512=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1241700375803396512==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yKOyY2Nm+bU0Ajrr"
Content-Disposition: inline


--yKOyY2Nm+bU0Ajrr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 11:29:15PM +0530, Sunil V L wrote:
> Since PLIC needs to be a platform device

For the unwashed, why does the PLCI need to be a platform device?
(And while you're at that, please try to make use of the extra ~20
characters per line that you can use here.)

> probe the
> MADT and create platform devices for each PLIC in the
> system. Use software node framework for the fwnode
> which allows to create properties and hence the
> actual irqchip driver doesn't need to do anything
> different for ACPI vs DT.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>

> +static struct fwnode_handle *acpi_plic_create_fwnode(struct acpi_madt_pl=
ic *plic)
> +{
> +	struct fwnode_handle *fwnode, *parent_fwnode;
> +	struct riscv_irqchip_list *plic_element;
> +	struct software_node_ref_args *refs;
> +	struct property_entry props[8] =3D {};
> +	int nr_contexts;
> +
> +	props[0] =3D PROPERTY_ENTRY_U32("riscv,gsi-base", plic->gsi_base);
> +	props[1] =3D PROPERTY_ENTRY_U32("riscv,ndev", plic->num_irqs);
> +	props[2] =3D PROPERTY_ENTRY_U32("riscv,max_prio", plic->max_prio);

My OCD wants to know why this gets an _ but the others have a -.

> +	props[3] =3D PROPERTY_ENTRY_U8("riscv,plic-id", plic->id);
> +	props[4] =3D PROPERTY_ENTRY_U64("riscv,plic-base", plic->base_addr);
> +	props[5] =3D PROPERTY_ENTRY_U32("riscv,plic-size", plic->size);

--yKOyY2Nm+bU0Ajrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNH/yQAKCRB4tDGHoIJi
0o+oAQCMWQ+6bAgMjck+BSFaQF/FjtKfLfwDUTH+w218stePOwD8DiC9qCq9yuol
xjAhVIcaeVplSIBN2+Ti/3cDd5sR5AE=
=0Z4N
-----END PGP SIGNATURE-----

--yKOyY2Nm+bU0Ajrr--


--===============1241700375803396512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1241700375803396512==--

