Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AEAD0BB7F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U9R39wxp0fk+xWwKNzbGL3Ta0GqCpPbTxF+8elnyzw=; b=iLIZTmyiUwmZeg99SLxnPz8qac
	5hyoQoXEuBO3ZP/J7+KSD679fsKtjuzv3k2i4s0nFY0bN5cTUtR3aFJ7L1fe0O4PkkQxwuXpBuac3
	rdp/td1uWDHSIZ0NfChMc+grsghSqUymQSVS6nQxZ77hYp+dxsdzQAYOBO3iSD6hBCuj5pTTGmgry
	5/B9MtP6N+j2Uio5pjHYDI0onJy8uC1dd7XQ0uPthyV5ImjBYQCGELCyKDehFySOLAZqTsH5Ut1Id
	AUtyUWIYnt+gkyfCAgqVMGW/IaU8gbbVO1YaUkDMuvF+OJ+i0qPZY826KLWSiB4ccRcKbf55y9KjJ
	fzNF0GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uPb-0000000HXT6-28kQ;
	Thu, 24 Oct 2024 09:45:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uIK-0000000HVBf-1w2I
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 09:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BD575C5E3E;
	Thu, 24 Oct 2024 09:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EEAC4CEC7;
	Thu, 24 Oct 2024 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729762695;
	bh=TM7UNffSSOmAOZkaONHkwvnJYn+RtQ7/d5lFvohpBnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWboTjyIQkjp08p9YShGmcoM7pqqYthPP6XGtm+Dl811CsjBV+JzMBevlJyusgVvG
	 ZgccgktLRRy7kuZSwAWnMKaIvfPi5q5hBURUdsnSpToD9FblTPvrdpYTurXr+WDZkT
	 tyFfGAeOymPWNi0pHE1CTqovskZ4zPQQ2LJNrBWdNHkqb5jgfE1+1nAhGAXp3QC+9X
	 jMi8qQ0igZIZghT5MSBxfjaP5aJOMap2mtjFLsMfh8cLgJ9d6K9xEc6nL3sjoeRmBY
	 K+5zsbpi5R0nct7+/NfNmuU2y9KkyzoGS5Lch0t0z7oNG8d8vZXZdeoSYuqhcvBbFU
	 TrTygL8pzHYTg==
Date: Thu, 24 Oct 2024 10:38:11 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <20241024-gout-kinfolk-0f24b28d41b7@spud>
References: <20240814-setback-rumbling-c6393c8f1a91@spud>
MIME-Version: 1.0
In-Reply-To: <20240814-setback-rumbling-c6393c8f1a91@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_023816_563299_A050622E 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: multipart/mixed; boundary="===============3835438464711075608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3835438464711075608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U6iyZokWShLT5gWe"
Content-Disposition: inline


--U6iyZokWShLT5gWe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 09:08:40AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The current driver and binding for PolarFire SoC's PCI controller assume
> that the root port instance in use is instance 1. The second reg
> property constitutes the region encompassing both "control" and "bridge"
> registers for both instances. In the driver, a fixed offset is applied to
> find the base addresses for instance 1's "control" and "bridge"
> registers. The BeagleV Fire uses root port instance 2, so something must
> be done so that software can differentiate. This series splits the
> second reg property in two, with dedicated "control" and "bridge"
> entries so that either instance can be used.

Just attempting to bump this patchset. It has gone over 2 months without
response, and I am afraid it has completely fallen between the cracks.

Thanks,
Conor.

--U6iyZokWShLT5gWe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxoVgwAKCRB4tDGHoIJi
0rSkAQDDxvSCVpyNBChctdnTAmn52RkLFOl+dBGBX8kpkw1apQD+LA70iId0caDT
vs957ff3Zq274+khzayKzwkmeaf0Zgk=
=nk2E
-----END PGP SIGNATURE-----

--U6iyZokWShLT5gWe--


--===============3835438464711075608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3835438464711075608==--

