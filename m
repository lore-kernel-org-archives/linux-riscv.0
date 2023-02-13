Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8DC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cekSFC4Y8MEir92UWeRbmdiWIQwWrwUCssk8rY8/LO8=; b=nCUZlzpN+g3QOq9uzCIIK/QgTj
	wf+VbUshxxEDGm2KHFUoowt40Iocs4nafhyWtGU/qDsq3akRsT1ZjynfOTqgES97Sl3bgj2r3f2lt
	TefJ0V2/kvbfJ09S1HMtjyuB3PRG//Vpl4iVW6sHNuSJTR7s5bpcTDvmyEB0aRUYaV+VhToE/kZvJ
	LHzD0wFPtHxYOM4nkWf/qCJhn8Gk54zPy8rillDf0l46cVWPQmeqwUyfi8wLb7T+fWOEv7xMjjYhy
	9l1m67Oz+aM5Tn2qvMem7rxzXtiRVq9hYM8+MGp6+SSCzhHc1UxETzYbt1bmjq4vm+6t6pTMDSmgL
	XDyUta6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcPI-00Fdt4-Vb; Mon, 13 Feb 2023 17:14:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcPG-00Fds9-6T
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:14:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62795611F2;
	Mon, 13 Feb 2023 17:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9709FC433EF;
	Mon, 13 Feb 2023 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676308460;
	bh=RkBn+EgRto+hmgpE2gQsAE6PgkVzQwCEhp8Ja4WbBSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNVbNcAPNfcwog/A5CdIWs2f3/q0e89mJw3M/fRVwaDjYc1ZOvGrXOJuHP543sbV3
	 QDNHcRGe3tjDCCehkpIqHsA5eQCQJuyc4S/nUcFSpr+LVr4POcVa96LXRzoMlD2sV1
	 IzoUOCdb8ZBOQ0LmgJgO5KY9sIja8UyH88ezxrbWFa6gk3TmCaJLw5NwOaggKZGaep
	 53W9GDBlNqjOlo6LPT0gDvoGyGSnqS6yKhyIH6t+TjJxTvbzhHVUyVXb282TI/NMMd
	 ZDl9vWsVIo/LwzWWMxX1bCrC+W1TY17rOVBAtfH42FY30NHz/RrofpOvVqdufzC1dX
	 fqpBQj4D0tFKw==
Date: Mon, 13 Feb 2023 17:14:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 06/24] RISC-V: ACPI: Add PCI functions to build ACPI core
Message-ID: <Y+pv5yefi3xYfLt1@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-7-sunilvl@ventanamicro.com>
 <Y+QToXO2kYQ2ipdz@spud>
 <Y+pV1aafHUNP6QfU@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <Y+pV1aafHUNP6QfU@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_091422_336569_F62056AE 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: multipart/mixed; boundary="===============3697456866956168816=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3697456866956168816==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UmPzDpczqd5I7ZHh"
Content-Disposition: inline


--UmPzDpczqd5I7ZHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 08:53:01PM +0530, Sunil V L wrote:
> On Wed, Feb 08, 2023 at 09:26:57PM +0000, Conor Dooley wrote:
> > On Mon, Jan 30, 2023 at 11:52:07PM +0530, Sunil V L wrote:

> > > +/*
> > > + * Lookup the bus range for the domain in MCFG, and set up config sp=
ace
> > > + * mapping.
> > > + */
> > > +static struct pci_config_window *
> > > +pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
> >=20
> > This all fits on 1 line.
> >=20
> It actually goes beyond 80 characters, right?

100 chars is the limit :)

--UmPzDpczqd5I7ZHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+pv5wAKCRB4tDGHoIJi
0mKhAQDrj8O8lI6jdzx/eHAiCr2CbVDULMK6x53p1/fhcJI7wAD+OWuhz8aeys1U
u1nGrlAy/YPBtu3+qPTbE+jWT1BDJgs=
=JgRA
-----END PGP SIGNATURE-----

--UmPzDpczqd5I7ZHh--


--===============3697456866956168816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3697456866956168816==--

