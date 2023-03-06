Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385F5C6FD1A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulCSFxHfdtx0t7P14MShpyc1DZ28jxiuiPS9UzTkGkg=; b=fNtroMabhKrtTWHkGwLyUXEZ6D
	V42XAuh7Z1Zs+A4dDxLbc6tVVUgDJppzFQfcDVZ2pvlh8LEtpbH8HMgK0a9jMROk2tmVax2h6L2HV
	oZHp4O1vPBUOl98U6N9rA4F17LAgfgL1jzzD0kzszJvhNIgDWxT5IbC7N8dz8zukALxZsRTYxjWgF
	TKvhgjHNxIKixjq82wP4KYZNtQspDUBAkRuXSKBwb4lK1Dy7Uo+BtLmJ1o10e82a1iWLtqBjfGlVR
	OeiffhFDcn29PIfD1j2j+8JPaPG4rrpzZzrBaIbWJ5wcp8jKKxgkBH4cDSSM9qYTRGfJCMBWlNOCi
	FhecjMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHQB-00Evc5-4i; Mon, 06 Mar 2023 20:26:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHQ8-00EvaW-Gp
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 20:26:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E20B9B81107;
	Mon,  6 Mar 2023 20:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD787C433D2;
	Mon,  6 Mar 2023 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678134413;
	bh=IgrsSBvQN4ROvRo5O3phazhRtEEiAn3qxcpkRoyKDvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWMLE5PfWhbV12VdnLkTA8CFqUi7eNYS3U7vVBLBRDJ7GOR8hm0h+Ys2xK4tjwVzG
	 fEKUEJv/qzaWx3dsYNNvGsGhW07KHuvdad81fYXpI4FB/asY/svnX/gUkpflDD6drM
	 sUhh13qetPkAvYTO+JLZVCNBIjsYCMQyjE6akilIDjCSnkksi86kLqnCKGK8nr2fER
	 B3onZiM2rDcUbKWxqtJ+NFrfvpJ8QLWOaiuFgZ67ONa+8dA4tmDZMImL4wxSc7NMiy
	 7HWpSdasoKYMZe+7m1vbIkPKo+aYVAdxj4/RoqED/k9GiGk82lxAxL15TNfoPQVLbB
	 rtR7bF2dVMLaA==
Date: Mon, 6 Mar 2023 20:26:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 12/20] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ea37af34-ccb9-4b6a-a67c-a17f03fc0311@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-13-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-13-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_122656_733608_11CCA3AA 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8825942917099006812=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8825942917099006812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8PADbTt3DS+5vFB"
Content-Disposition: inline


--a8PADbTt3DS+5vFB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 07:06:39PM +0530, Sunil V L wrote:
> On ACPI based systems, the information about the hart
> like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> Enable filling up hwcap structure based on the information in RHCT.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

With Drew's split out of the riscv_of_processor_hartid() removal and his
acpi_get_riscv_isa()-takes-a-cpu suggestion:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--a8PADbTt3DS+5vFB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZMhwAKCRB4tDGHoIJi
0nABAQCnF38Bn91wkehg27V7pP0e84DW4kc9w5CHtUNPsU8ruAEAkX7FZy7UJEOR
dWOFx+i4IeK+2UNEiKaPlMuO32y/xAY=
=bGRd
-----END PGP SIGNATURE-----

--a8PADbTt3DS+5vFB--


--===============8825942917099006812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8825942917099006812==--

