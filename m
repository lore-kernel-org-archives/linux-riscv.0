Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB9EDEC78
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBBqbLQCTnsWMb18vetGIghsJqMnkeoD9ugL1z//SmA=; b=MUdXSKnuFxY5t9sfz+AdvL6NTr
	0NgptXYiRtdLlKkKR3HUMkB2yjRcm7DzkJkT+OCIMSrYzUJJD68ZoiOp/8C8P3yV+A01mRmWps5Pe
	TXHxIsz3/JRiRhCXXa5aICtC25w0GLCw+tZTqrMTlaWEDijRn6ZsRnuMd14RaxiCk2V5uDRX0Fo8U
	Ckxwdcs6RWX/Bmrnkw/uNz7NxL3cSI6NJb58iTn3+AjUGQgBEUjutUiyxjLTp8LYxiq/1Ybwqd/Sf
	j+H4RfjsD742HemNVfR1RaifybWhwhKPy8NRgDHYBfeCGacsw/nB/bryJHukzblQtLkw1ZEPqPfA3
	7Sp6Ym8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgS2d-006Gtj-2s;
	Wed, 13 Sep 2023 15:44:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgS2a-006Gss-2a
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 15:44:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA57CB82456;
	Wed, 13 Sep 2023 15:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A5EC433C7;
	Wed, 13 Sep 2023 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694619863;
	bh=1/CkrulF6+KqbTuzKb1q/qLsYFk1Z2Rg5kemiCj/HOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iz4vXsVlWKFeoRTHSTR6jo+EiFbQhqudRDByNMPV3K4LzK7obYnpdIte0MwAk909i
	 hGhMyBHcJz49tdTsQtDZ5NJLDzr9CZf8C00vmehN5tV0rFnD270rmbDU8vCEfbLBDg
	 UQnDhfIb55+LtsMLOM5gQeTTxV9+IUjqPb425N0JB6YZkoMLKUw+Yc//poexsVDZG1
	 BSecK2bR4kY0TAefqTYoyDb5mGB4opp1R+AkSHWsP2ycu2Cig1P2Dm2faNkM8IALwL
	 lup/MCsokIWlva1znMfKu9Av4dSm2nG5DcLyYdydJXv1VlX1l9Ni2MWR1fYDjaoDNL
	 sWfBJGEAR5AAw==
Date: Wed, 13 Sep 2023 16:44:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <20230913-faster-spotted-9df41a0d7787@spud>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZQHSLdPufI6CXApg@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_084433_015644_B381DFBA 
X-CRM114-Status: GOOD (  16.88  )
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
Content-Type: multipart/mixed; boundary="===============7574439602702821817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7574439602702821817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jVo0hczGyclwPro"
Content-Disposition: inline


--9jVo0hczGyclwPro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > dma coherent, so set dma-noncoherent to reflect this fact.
> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > ---
> > >=20
> > > Since v1:
> > >  - rebase on v6.6-rc1
> > >  - collect Tested-by tag
> >=20
> > Does this mean you're expecting me to take this?
>=20
> Hi Conor,
>=20
> I think I will take this and send PR to soc people. The reason
> I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> mailist due to typo;

Great, thanks. Please ask SFR to add your tree to linux-next.

Cheers,
Conor.

--9jVo0hczGyclwPro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHY0gAKCRB4tDGHoIJi
0gecAP0auetLpNJ7XpG2j+SH1o/AGeaMeSgE2Z7Ig27iynDf5wEA6Jjs8EUIxn97
J9fX6wqhmw1fgEb2f8gLCYktVPx9qAM=
=Zlau
-----END PGP SIGNATURE-----

--9jVo0hczGyclwPro--


--===============7574439602702821817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7574439602702821817==--

