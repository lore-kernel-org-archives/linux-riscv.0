Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B89CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfCzwKrPHUeDedib68SjaeoqNuD4cHFrMCVsEWDO3H0=; b=dXxjNq07KYSzzlmeAN6YNYbTe2
	kHWcGkWSKmgfAgoNyMV5koxc992yxawGqUTJ5CYtbb+2n+3/qLZ0ZPPukrUKNswJtQW8UsDb6jCT9
	8f5vjw91Fh4NSlx22ks662hNz5CtdaDOhAoAW1yq4+zzRGUjKgQF0D+AbCfXF9npoOfks08QfvqvN
	yWAAawQFWX+4+wO1mNVjt2Nrt0chvSrZyMYKdJsrMfhMgUpzSDRr0mKVuiQZiBfXMpsgRVyZoOaiH
	tnpBegFjOJ2GKak5kMDpoi374IcIarQuy3kZRx90AYJpoBkD+AArj6JSSWRIid1nqI7xl11OPHVwP
	iLpUe1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVYF-0000000BdyM-02UE;
	Mon, 24 Nov 2025 12:20:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVYC-0000000Bdxu-2VIP
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 12:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFDC440E87;
	Mon, 24 Nov 2025 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABBEC4CEF1;
	Mon, 24 Nov 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763986811;
	bh=/Yj6YE4nwthYIL0rOIKkvsqhHOAJVwTXZM7e6cPjilI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOW8LXM6jn+tyShA7JzzS7B75rWdGAjSbVmsNC7op1FkTrHLxbqL056CpUrHTOaAt
	 Fmo0V/XYMdFbgaqArrJxeJmlocKsGcE+x3XN/YvFQWtP6cvwA/VWdG5JqWo0T7qf0i
	 jspUtiynQyQGf1MTZkUTC8MhxQx1NDQsAnZvXC+4q/REblJHzdxed1VBecfN8Zgzml
	 38YrA3tOYAVqq9rt6avIhg6TmPxGEUQ9QfWezFxniOkuTAJEmfVrHKINKtRgwOd7W1
	 q70gB+M8/fT5A13BDmWFTWaOQpDjpiPnQ4AWNah9S5GEXbYeRs9whu27vLViO9fmZi
	 F5oC6MKpai3Bg==
Date: Mon, 24 Nov 2025 12:20:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251124-pulp-pound-a2b6d749dcfc@spud>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
 <20251124-said-overvalue-8a8f49d6c99d@spud>
 <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
MIME-Version: 1.0
In-Reply-To: <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_042012_679504_BD203651 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============0207647842124007805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0207647842124007805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdnfVisB77n/BULr"
Content-Disposition: inline


--kdnfVisB77n/BULr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 01:08:00PM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2025 13:05, Conor Dooley wrote:
> >=20
> > I don't really get what the fuss is with the dual signoff, what's the
> > point having both when they represent the same person? Pretty sure it
> > was you (Krzysztof) and Arnd that told me not to both doing the double
> > signoff.
>=20
> I do not object having or not having dual signed off HERE.
>=20
> I never said that. Just like I never said "From" has to be changed.

I didn't say you objected to both being there. *I* am saying that it is
probably not worth doing. That's especially the case when it is adding
complication about correct ordering of signoffs and maybe interacting with
how git-send-email decides to insert From: fields.

> So repeating THIRD time: sender's SoB cannot be somewhere else than the
> last one.
>=20
> ... and before you attribute me another thing I did not say - if you
> change the "From" field, rules will be different a bit...



--kdnfVisB77n/BULr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSRNdAAKCRB4tDGHoIJi
0ptBAP956X1zit1/KmamkExrxDO5JHMTMOIMyhqNrJtUut8iogEA/6YMiCwput82
DBhi2ECBNDPoqb3RvOun1DrwHY3DUA4=
=uorq
-----END PGP SIGNATURE-----

--kdnfVisB77n/BULr--


--===============0207647842124007805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0207647842124007805==--

