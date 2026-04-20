Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8DBF588E5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Twe1XgbDliD/1Uw+r8hfBqUEmIe9irhChzvyPc9BeAg=; b=APxxkJFtux+E5kewXGuL4kcAvo
	xftrPcUgpBpuNZsxd7dYq3ElxxkYAsSL0vHe0IsOUorn+djs/VqAc68gHKsgLlhI1NhFwT619cE1n
	mFUZJEnA/JEi0O8ObBikMRNY5ab8l6jl1lqHveYTJnnB4Of7eScEUcx2eE2RIIzfZG2JGwN5zm9/o
	EKR9xm7kmC4ep9EEnDnZORviP61Tbht6wCv5FNcCSB0nHFq9DLqfyPQoUBoiVha1tpr2eEbXMQxG7
	tX/t/bUUGbX3a25q14Txbkb5AT3nYsUbMOz4ZhCOyi/5/2SOgRaNeyRko4pl+5Vo2csjahhtWG/zO
	tuktfoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqaC-00000007HoI-3WQN;
	Mon, 20 Apr 2026 15:30:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqaA-00000007Hnn-2gNr
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 15:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E61BD4194A;
	Mon, 20 Apr 2026 15:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA3C19425;
	Mon, 20 Apr 2026 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699041;
	bh=MW3RsSyElgNabblIUb1Mg6MJ+SH2M6LiGmW1DzajLao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMaiKEv7ZS7BLhkT2rfutsuWwbsIUP+7CqHrowUsuIeMLjpw8FNuWiTEcaXO9GHRj
	 y8prUI/MGvu1AkYouPPi24RYaYnvFDTbwjxAh0UduKAGI6FoJqD7I/jNt0muoFw4zs
	 2l9sPULFkdIqcPnlW1/spt3hWwyewO7U4pbW3vzw2gIrnhLJVFknG9OmN98jSFRwcX
	 5Bs3Z46LJGG4aKXQtEHH5JnLSchqYlVKBKSg3Qxq4KzfirPQyMri0BnU6Ku0OScviY
	 usBUfsO38ng56yaQgw5vbmjXrWwCXyK5pbfo6lcAkLc9ybQJo4gvtGhcYduW+Wst0t
	 zl4pjlNAjkTpQ==
Date: Mon, 20 Apr 2026 16:30:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Message-ID: <20260420-cheating-boned-565f4c8d1333@spud>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083042_751955_9D330105 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============5146260527482870505=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5146260527482870505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uanZ6hPS9qrdKIWI"
Content-Disposition: inline


--uanZ6hPS9qrdKIWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 06:48:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
>=20
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
>=20
> Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss fro=
m staging")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spu=
d/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Ideally this patch should have gone in the original series, before the
> one that dropped the bindings which is now merged in mainline.
>=20
> I've added a Fixes tag so it gets picked in the RC cycles for 7.1.

I don't believe this fixes tag is appropriate, so I will drop it on
application. Doesn't really make sense to cite a binding patch as being
the problem with a dts.

--uanZ6hPS9qrdKIWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZGmAAKCRB4tDGHoIJi
0sdxAP43lJ5khIEciJ/TwVWkyDjMFYgzFRZHg0ND+AmOYgV4ngEAvXpTvg9NuAqG
HtDd38hqYSEG+6nZy4+nt5wCmLTmQwU=
=+xQP
-----END PGP SIGNATURE-----

--uanZ6hPS9qrdKIWI--


--===============5146260527482870505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5146260527482870505==--

