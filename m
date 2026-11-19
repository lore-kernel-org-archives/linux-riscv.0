Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33F606A336
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yP5yvdhS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEyVbTMZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cS3AE8VZZOToTUVu4wgCLHhH9ELlUrCHhDndjJkh9Rk=; b=yP5yvdhS47G49oxFeUELWK5eEi
	8xMX/xAZ4FPdwX9xnJaBC8Em/mhiAVUBPahpROTwt2/odZ9PhAFvPjeEXeB7biQiHEZIsECIACsXL
	5E00MgDAhbHDnajv15YhYcEFy8rT3njkPBQCXwjH5RoYO1BFC/g09ASI1dq25IkgLDMHf0o0HHAzr
	R6Ff+r12DNme7p60SVIRljFEDqzwSX8Q85sWcgPRtLHiKcZCesX8lpSpObJ01NSm/+yiP+XhQe4zX
	EmdBivjpDqZwv0mXn/JXE+RpPCDEbNhbZIwkmQ24O6gGHkhlNOfeEwXcfXLCNpZY0gTkqP8rYS3Mo
	s4qEp0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4tX-0000000Cc1b-2Q5j;
	Thu, 19 Nov 2026 16:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4tU-0000000Cc0r-0wRb
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 16:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 423FC63346;
	Thu, 19 Nov 2026 16:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E01F00932;
	Thu, 19 Nov 2026 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105311;
	bh=ogwuGK0yggXwyq45YKr/fwg2TxpvW9p6nHWOQhtoq4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bEyVbTMZqA60ppB2VMFcMUfj4WYvq8nW+47qQuq/k05qCfuwcgMjNxyY2UCKUkeJL
	 BASHzdhXItBRt2uaAzjFFsSB4dMD20MM44LnWNDeabs5SILybthN8cdUds+wpB//B5
	 trX5H6OEYWX5CVkaLsyA+vtlabx3jBUiad0HQGUYr51gTWG68t5HRbkrqdGPNCGcS+
	 yQioZLt5xE8n8a7qN2pygXHM58GXHxcr3jwj+79CrcuuiWQ46QD3WbgwPqCKzczlo/
	 R0pNU0mQrDHHpVRfwvnI1STl8VCJwUx/0o7E4KR8alOzdz4mTEFIu2/wASkjik9aIu
	 BTmCS8hwjeT3A==
Date: Thu, 19 Nov 2026 16:21:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Zhouqi Jiang <luojia@rustsbi.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dongliang Mu <dzm91@hust.edu.cn>, Anup Patel <anup@brainfault.org>,
	Andrew Davis <afd@ti.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alejandro Colomar <alx@kernel.org>, contact@rustsbi.com
Subject: Re: [RFC PATCH RESEND] riscv: sbi: expose firmware identity in sysfs
Message-ID: <20261119-zoning-appeasing-71d648cfc78c@spud>
References: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com>
 <20261119-borough-flap-6481c20b3013@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261119-borough-flap-6481c20b3013@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0009372452846241637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0009372452846241637==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4ha9iLRTx8cil11"
Content-Disposition: inline

--y4ha9iLRTx8cil11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 03:57:19PM +0000, Conor Dooley wrote:
> On Thu, Nov 19, 2026 at 09:03:56PM +0800, Zhouqi Jiang wrote:
> > Linux queries the SBI specification and implementation identity during
> > boot. It caches the specification version, but discards the
> > implementation ID and version after logging them. Userspace therefore
> > has no structured interface for this immutable firmware metadata.
> >=20
> > Cache the implementation ID and version and expose the available values
> > as read-only attributes under /sys/firmware/sbi:
> >=20
> >   spec_version
> >   impl_id
> >   impl_version
> >=20
> > SBI v0.1 systems expose only spec_version because the implementation
> > fields were introduced by the SBI Base extension in v0.2.
> >=20
> > This gives tools such as lssbi a native source for basic SBI identity
> > information and starts moving those queries away from out-of-tree
> > kernel modules.
> >=20
> > Codex was prompted to research lssbi's out-of-tree SBI probe and design
> > a minimal in-kernel replacement. It assisted with the sysfs interface,
> > implementation, ABI documentation, changelog, and QEMU test setup. The
> > result was built with a RISC-V defconfig and boot-tested under QEMU
> > virt with:
> >=20
> >   OpenSBI v1.3
> >   RustSBI v0.4.1
>=20
> I like this idea.

FWIW I tested it with the polarfire hss.
Tested-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> > Assisted-by: Codex:GPT-5
>=20
> FYI, these tags are now deprecated.
>=20
> > +static ssize_t impl_id_show(struct kobject *kobj,
> > +			    struct kobj_attribute *attr, char *buf)
> > +{
> > +	return sysfs_emit(buf, "0x%lx\n", sbi_impl_id);
> > +}
>=20
> Should this actually be printed as a decimal? It's a minor thing, but
> the numbers in the spec are defined that way (see 4.9 SBI Implementation
> IDs in the 3.0 spec).
>=20
> > +
> > +static ssize_t impl_version_show(struct kobject *kobj,
> > +				 struct kobj_attribute *attr, char *buf)
> > +{
> > +	return sysfs_emit(buf, "0x%lx\n", sbi_impl_version);
> > +}



--y4ha9iLRTx8cil11
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav8iGQAKCRB4tDGHoIJi
0nchAPwMyGXXDEqHemrcQzyFtqOcbeumL62PWeRJvAlUUOXxNwD9FVOQuhadciGN
6UYfq66MOZYm68669t9iCZtqoa1xGQ0=
=IiQb
-----END PGP SIGNATURE-----

--y4ha9iLRTx8cil11--


--===============0009372452846241637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0009372452846241637==--

