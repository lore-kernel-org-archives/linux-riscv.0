Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B839EEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlh4FP79HHtWMpj0XfZIUBYnWceJWhdD+qX5Fwq6bgc=; b=KYleg1Qfjk7Oa+10LllvDJ3vRK
	UTIAc8vCHyqL8Ib2e2hMgAsSHRn1qRqCAo1793DAEIcJY9+fPS936BG+aB9aBdiV+/d3n3T1gHaH1
	2sxZ4L20tm4hBFNcHSQma8TQsFuCVq4L6485U/thkM/L4cDrpn4TTqmhZHYZi8rHLVaXZzhV6fAkq
	TWQAlUk2Pn9NkKGLSJYFBs/eKguDEzg9o+FDPWi0YTQYmI3hp/5O4paJ5bFo86wYi0havRkdkso8h
	XvKcnkujXn1yQdgqx1yGEZ6yfX+snGtEMhWdYTS0gqJq+wpJOazQi7rp8bMmVefhg7xLP7pWNZt77
	G3RMqH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjmP-006mfP-1U;
	Sat, 01 Jul 2023 23:13:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjmN-006meo-0X
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 23:13:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DB3D60A72;
	Sat,  1 Jul 2023 23:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19154C433C7;
	Sat,  1 Jul 2023 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688253201;
	bh=yKgMddQapKf3JCyJBuC01M7yETVYS19zD9KU+DqtD4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvdPoGGWJ6pcmV0sx7sh71ClnpIipklO1ZZBtDaBCMXjdIpcSjBhxDVMguluosZxQ
	 8QH5Kt5DxMf+y+1cqOLjJdAIYVXIQB+p4quUUdfmpnwLWNuZ3K5gWzkLVtns8UDr9D
	 ORp+hl7Rjcd+Ijh3Zupax24T5tPh4uDwsp4KUQOPMz96HDiZUNlOHVxhT4nmFnM1+V
	 o2a9lBKzqqlTvjFC+bCO6IT8COWwGceL9UEbKGqOZk3Ly/wXqi3jjGG3262f6LRoC2
	 Yq6AZlapivbt/UnuBwbim2Yoklp/d43qzMGHUVDroayPo4lV+jt1/Lokioi7xjxgPz
	 OE27EhBkyUISg==
Date: Sun, 2 Jul 2023 00:13:17 +0100
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: microchip: Rename and refactor
 mc_pcie_enable_msi()
Message-ID: <20230702-audacity-gradient-a7871e31a97a@spud>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
 <20230630154859.2049521-8-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230630154859.2049521-8-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_161323_269357_DFF192E8 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: multipart/mixed; boundary="===============1929072658656059238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1929072658656059238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kd4aL8O75rLHZ9c+"
Content-Disposition: inline


--Kd4aL8O75rLHZ9c+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 04:48:58PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> After improving driver to get MSI-related information from
> configuration registers (set at power on from the Libero FPGA
> design), its now clear that mc_pcie_enable_msi() is not a good
> name for this function.  The function is better named as
> mc_pcie_fixup_ecam() as its purpose is to correct the queue
> size of the MSI CAP CTRL.
>=20
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Kd4aL8O75rLHZ9c+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKCzDQAKCRB4tDGHoIJi
0j67AQDk5OEcJCa5lf1hVQ/cU8VwhepULzIUArDgqfqy3RVOSAD/WCrLcO+TP3g5
WIKDODvJxGPI0CPXgT8CWAA04v/+zQc=
=BAuH
-----END PGP SIGNATURE-----

--Kd4aL8O75rLHZ9c+--


--===============1929072658656059238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1929072658656059238==--

