Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F6DC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOeu0+FKVcldBiJJdjjJU8pVIWJyZ/mcdKwt2zwyBms=; b=LN6NadBNyu63/kFRGW8+yAEDc8
	/jAe9SDNKbx9RKnajnytgHRxW5g6Oxx5mL2EAJiYIseiVMEEHRfgq0c/O2ZDKcxzIeJNYo8mg1wK4
	TZel2BK83VxrQyUD/pORjL3KE61cPq7vtKgttEHm8K6NgVOU3VViKPvXBueEfaJIs3wAIZefFvnjZ
	6dOvwxjBah2IXIcdd6mGnVk5nwx5yToed8rf6lwXRtDDmTKnwd74FLqiUFss21y3Hoqy9MZNQkdb8
	0x57HL7GbW7nct5MBzhHJoE+RbVDaKqugK1JFkNoAAi+BDNAO6eT8IIi8HLoepbNYe/uZxkygdbMh
	0HpINmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVHP-00000007ABR-3jUS;
	Tue, 17 Jun 2025 12:19:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV1g-000000077Sd-0H1X
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 12:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CDC3614BC;
	Tue, 17 Jun 2025 12:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABE5C4CEF0;
	Tue, 17 Jun 2025 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750161771;
	bh=lgdy5E+oqIYHdNt3F+D0lEuWC74tIxjQzu2g7Rp7xgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7HpeC0hn3voqySR3/DsHDStZnG3K169YWkik+JIbOoqASUbKfGs8lYiG3sEpDas8
	 TGETqFWUhwcQJSWunkk44byEwJgCPMHjpzHCGtTtJT9cAcxu1SwEdiVJOdHKLnN0md
	 nVzDvLV+vatm3B5CwXO7U2TAisRNI/YsJeH16Qv3VkCTT9M6KF6dpcQrFM1fdl7P7k
	 PYdP6E88zDw3nz62jHW4M7UYlLFs2N4cF/roTPYOz9xtEkSW6omRYgbNl2bi5QVnap
	 PPXKJdq3gq10fJrtFD30fBi8vgA3cp1xKaKauht5OCCyfwVEvMz6xCB5EnhsC32hYU
	 wn1L+cLqo8pfQ==
Date: Tue, 17 Jun 2025 13:02:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
Message-ID: <20250617-confess-reimburse-876101e099cb@spud>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
 <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>
MIME-Version: 1.0
In-Reply-To: <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>
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
Content-Type: multipart/mixed; boundary="===============2008804064977808058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2008804064977808058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JxZyEEACyPxmQ/io"
Content-Disposition: inline


--JxZyEEACyPxmQ/io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 08:44:01PM +0200, Klara Modin wrote:
> On 2024-12-17 11:31:30 +0000, Valentina Fernandez wrote:
> >=20
> > Valentina Fernandez (4):
> >   riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
> >   riscv: export __cpuid_to_hartid_map
> >   dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
> >   mailbox: add Microchip IPC support
> >=20
> >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 123 +++++
> >  arch/riscv/include/asm/vendorid_list.h        |   1 +
> >  arch/riscv/kernel/smp.c                       |   1 +
> >  drivers/mailbox/Kconfig                       |  13 +
> >  drivers/mailbox/Makefile                      |   2 +
> >  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 504 ++++++++++++++++++
> >  include/linux/mailbox/mchp-ipc.h              |  33 ++
> >  7 files changed, 677 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip=
,sbi-ipc.yaml
> >  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
> >  create mode 100644 include/linux/mailbox/mchp-ipc.h
> >=20
> > --=20
> > 2.34.1
> >=20
>=20
> Building this driver as a module with SMP=3Dn fails becuase the non-SMP
> cpuid_to_hartid_map() depends on the non-exported boot_cpu_hartid
> (discovered via randconfig).
>=20
> >From the description of the driver it doesn't seem to be very useful
> with SMP=3Dn, would it make sense to have it depend on SMP rather than
> exporting boot_cpu_hartid?

No, I think boot_cpu_hartid needs to get exported, the driver is
intended for use in AMP situations so the kernel config may have SMP
disabled.

--JxZyEEACyPxmQ/io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFFZYQAKCRB4tDGHoIJi
0vmKAP9tlz5kkwRKNkY0SNcbvhAt36eMbcF3/NxGX/qAO/prpwD/bdiwwZmMTZ2K
6MTrYk2DgPZmqbn0hnrRUxYmdUXNQwQ=
=Lxrl
-----END PGP SIGNATURE-----

--JxZyEEACyPxmQ/io--


--===============2008804064977808058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2008804064977808058==--

