Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44AAC624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdHnfxCtBAFmPmRZYtr9wPhMmhNgxzzaXeYXuAhjDGE=; b=DmaNCA84IfmKkQCXnXt7xtyJTC
	nTp/Isq0eG4IAxTmDCTNQtfbklpHcn36fetYkXk5cfeGs3Nw7QHR+FVmv1tQIouSRHesr1YYPEj+w
	2AEdlMDLWPkTHIoCElnFMb7fFnUwcFykr5vNF/OedDH8PgHaJpIlSKXFbE7MOLciRxF5vp0z/Qh7j
	Xx3GXVlsCWxcgR+9XSJDcfYRy4oYSwTXoyfzi8OaH/ViR4QQmWpymQyPHeQvSCUPsDUzsYAmbuv+B
	OUYiSj7eu1Cg0D7K5UxXkopjMurEeYtcP0jNgKQKUvF3o9QpVDxLXFsOyFYjYe4XD51oagOAK5vja
	1Ouy4WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B8g-00000000Gc6-2JRx;
	Thu, 03 Sep 2026 17:22:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B8f-00000000Gbz-3qsH
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 17:22:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAA476020A;
	Thu,  3 Sep 2026 17:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912221F000E9;
	Thu,  3 Sep 2026 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456132;
	bh=XvnTQxFgY61UGE2ft9tFLjsbyTsoA/BlZA8xRu7UTQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ErbWB4XTfH7lCfPrEIvBxWogp6UT8r8sszDuSVROiVrapPMIQcWAuDUkh6TPKIyj4
	 Ag9K+G9m+UdsTMKVqGCkMs/i5mJ3OEef0zxKEOil/hqZmcwGZwzsIMtxXNfqrWbKCT
	 dxHTxFzICPetVasAc06M5E5nNZIHVPAuG9Gm4mJLu/QIu+YiU5Pcuefx9k+VHD+zuv
	 Xy6ud/R1y3BZkgvCObAdksFDsaR8FfPnJWid/d8Qs5Y4ToNyZACRTsU2acPiKSV9hB
	 EzkbBq1uEes6CuEaDnv2Lps0oxZXTv8LV4Tqlj4ZMggbv6yk/L+dDDZ9dvt8dUJczW
	 A/pGv391wmCHQ==
Date: Thu, 3 Sep 2026 18:22:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ulfh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add RPMI device power service
Message-ID: <20260903-devotedly-expire-fdd219021952@spud>
References: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
 <20260903092347.620060-2-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260903092347.620060-2-joshua.yeong@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============4288562107602798440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4288562107602798440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9aX6c3GUC1XB7Kb"
Content-Disposition: inline

--c9aX6c3GUC1XB7Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 05:23:45PM +0800, Joshua Yeong wrote:
> Add device tree bindings for the RISC-V Platform Management Interface
> (RPMI) device power service group, both for the supervisor-facing power
> domain controller and for the SBI MPXY channel which the SBI
> implementation uses to expose the service group.
>=20
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--c9aX6c3GUC1XB7Kb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmsvwAKCRB4tDGHoIJi
0lQTAP9vjD/TR3Hm8070BSAXKYtk9ZWy43AOda42jG73y7bb/wD9FKdr/H+YxfY/
F6O5StnbAOkwixw2NJaxoL4sqBbzyQA=
=RWhM
-----END PGP SIGNATURE-----

--c9aX6c3GUC1XB7Kb--


--===============4288562107602798440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4288562107602798440==--

