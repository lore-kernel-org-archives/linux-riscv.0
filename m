Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605BAC282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZMqy4ZdlesA7iwWYmzd1kPJUu9UxZkzJz9vHabn4fI=; b=FfQxaljSZJ5Db2r9kAFD4gkO7Q
	aziEyl2kPmoYzpP7876H8LvmcGFMftr1vTRtRlGiZps6ASAPn3k/3oEhhBtrZYoQ4B70E69BrAST8
	hUH3B+rAA7urOhG4KYkraK0ZDE4a4RccouMjIs0VukzggJ8whyPODiZiGQS+lkDJF5HM6n/NFZLsL
	cuc0+3q9wM4ApvyKxkDhDUQkxAgod/nFZMGk6IryLFpws6nRmM/CqZZ0tgxhMCfI60TuzaVDb/ol7
	Dq7DJn8UWBq+gWzuxSSjupDsmdpxr2/dnCwz1GSjkT70MR+AJWdmQtUUUCbORGWmSfLMwCmhhbxE0
	0Z7eOAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8aU-00000001Vmb-1p02;
	Mon, 03 Mar 2025 16:24:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8aS-00000001Vka-0b6O
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 16:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DB935C5A3E;
	Mon,  3 Mar 2025 16:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7870EC4CED6;
	Mon,  3 Mar 2025 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741019050;
	bh=1yDqqVmCKFaOfepku4ibV9RAk9lyrZmb0xSVnZlX/L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcN+cLwmkh4DIQ6sWSD/sU2ZBMbfcJAiWSiMZS3bojcipN2vLCUA4RmRuD+lb1gch
	 CooqYUk7Ll+ZuffNOvZZyvKaMzmbcZch6zQj26ow+RLtNOMZV+a63v45lBPJFplSSK
	 50C5rgEiMZStbW3mCVjFD0RxJcChTlErOzVxZ1DStMcP29Ig/OmI30jJ4VYZGDu1V+
	 6FSCShMeKGyxtqmQELiP2Qg1WThyQaxhTGHBglEP7nsCe6eN6T1cnuZ9rQyDnUA12i
	 bE7Pzvf7Oi3nsgSB12FgxCvDEpzBO4wlixmwbmsedLVdCySol8pL7lOd8vQYW5TnOW
	 PP05De7W0SY5A==
Date: Mon, 3 Mar 2025 16:24:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Message-ID: <20250303-navy-radish-dcd4e6a24c0e@spud>
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
 <CGME20250303143635eucas1p1dbcd26d4906b962e07cbde7f5ef704bf@eucas1p1.samsung.com>
 <20250303143629.400583-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250303143629.400583-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_082412_223932_FFC37AEE 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: multipart/mixed; boundary="===============7822850321450166893=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7822850321450166893==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CALOE5J+d774HnuJ"
Content-Disposition: inline


--CALOE5J+d774HnuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 03, 2025 at 03:36:26PM +0100, Michal Wilczynski wrote:
> Add device tree bindings for the TH1520 Video Output (VO) subsystem
> clock controller. The VO sub-system manages clock gates for multimedia
> components including HDMI, MIPI, and GPU.
>=20
> Document the VIDEO_PLL requirements for the VO clock controller, which
> receives its input from the AP clock controller. The VIDEO_PLL is a
> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
> with maximum FOUTVCO of 2376 MHz.
>=20
> Add a mandatory reset property for the TH1520 VO clock controller that
> handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
> which is required for proper GPU clock operation.
>=20
> The reset property is only required for the "thead,th1520-clk-vo"
> compatible, as it specifically handles the GPU-related clocks.
>=20
> This binding complements the existing AP sub-system clock controller
> which manages CPU, DPU, GMAC and TEE PLLs.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CALOE5J+d774HnuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8XXpAAKCRB4tDGHoIJi
0gkWAP498RW2NwZO3txiozqaSy4rbLEB63zmzt4SqAiUaOeBVQEAt8JxtyMnMCfk
vhJzjAMHGQhKi4qdTMFnXrJiVS5v1QQ=
=iY3/
-----END PGP SIGNATURE-----

--CALOE5J+d774HnuJ--


--===============7822850321450166893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7822850321450166893==--

