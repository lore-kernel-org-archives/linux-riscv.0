Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAECC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz6bIfpS40hBlEqe8H8n+90+6wjLYF+kF/015Nu1HMA=; b=pSByaX6cfwsgyIKvx2o8UaD9lm
	YaV1ZwaBsWnixHzPx88BVmt1D8nxqaMKfrC4fTxHrteq9+9YINd5J6qhu7Dkkj6NYNaI+7qtEiChK
	Oq/muxLlGhyipc+9+mkmhDUoVWJqfGyZ5cFmocpW3fC+IC+87l7ExNeCG2xb9tJMPSXR39hJjTvFk
	VUOs0EAN8qh3dwW3wI0C/ZOO4VPW8IkUAofFKL+w8g1ahS+tb4vRcuqcZaAsv8KRamK9hI7No+8mP
	HiXyCAV+1nDcCI7uWjKz2HDOepwlk8jz0hMYgV//JRc3yd9rK03qfHPr9DbD098DoGgNkeVItqRUF
	n5BG675Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmcT-0000000HWhD-48z4;
	Mon, 24 Jun 2024 16:32:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmcR-0000000HWgI-0Cg9
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 16:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12619CE12A5;
	Mon, 24 Jun 2024 16:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304C7C2BBFC;
	Mon, 24 Jun 2024 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246756;
	bh=Zs+yCXN5WcSvobPFe4rm+ty55pAOM4OvdQ9RT2GCmqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QeHWz0jJDNjYdXWC93Nn9kNwj+fGOseVk6zL4/tcHaESQhf+Ro0tVDTUv4afRAouv
	 ZXdz4lh1NkdIu7lUF5fd7kQ7Lj8SoNWCJUbkpDDZktCUXebFzix4kgasaBn4xpIP6c
	 Gn7VJG65KEiufKuhovn1nvPO5j96E9FYIXZu62/0lAN9MAADO3jv3IEqi4V7lp1jao
	 dfTaWdXAZMuVI7ZXS2zlpCugx4qW/k8MAtRDCGXMEKfzIpD/zZn26JIlEjh4KjlQDE
	 50J2JO/bBMhxJwlixCq0BcBEjdqDdeanWVovihEUhgH/Kge6QLU+tO7uiir2AAVUq+
	 xyYI10VqgI/LQ==
Date: Mon, 24 Jun 2024 17:32:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 1/1] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
Message-ID: <20240624-abdominal-friction-7de13b1e2c72@spud>
References: <20240621082231.92896-1-minda.chen@starfivetech.com>
 <20240621082231.92896-2-minda.chen@starfivetech.com>
 <20240622-festivity-salon-bbad348a12c8@spud>
 <SHXPR01MB0863A47890F95A45559FD82DE6D42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB0863A47890F95A45559FD82DE6D42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_093239_288031_B5F0DEDC 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: multipart/mixed; boundary="===============3515824401822514721=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3515824401822514721==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wBQen4bwb2gJxhYV"
Content-Disposition: inline


--wBQen4bwb2gJxhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 01:18:07AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Fri, Jun 21, 2024 at 04:22:31PM +0800, Minda Chen wrote:
> > > Add PCIe dts configuraion for JH7110 SoC platform.
> >=20
> > I think the commit message should mention that the star64 doesn't have =
a pci
> > port exposed. If nothing else crops up, I'll edit it myself if that's o=
kay?
> >=20
> > Thanks,
> > Conor.
> >=20
> Okay. Thanks.=20

I've queued this Emil, scream if you're not okay with it please...

--wBQen4bwb2gJxhYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmfoAAKCRB4tDGHoIJi
0kDrAP9TQtHYnHFLdB9xD3m+he22q7sWAYb+Wz/hbJFoFZy/cAEAuTcNQMsmvwv8
sNM6GY5H+5O1O5tVU3RsPu9VCxUTIAY=
=H/lq
-----END PGP SIGNATURE-----

--wBQen4bwb2gJxhYV--


--===============3515824401822514721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3515824401822514721==--

