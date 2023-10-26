Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF05EC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9DIekAoRb3IWsQQrSbYNPevpT2/eeszFMwQIdoHSzI=; b=QpVeCdxysMotk8oklrXZ+yaLPa
	KXHe79yi13IqCAsPQDrj2OfUt7YxEjgGjuN+VxCpmv5vMJQySdBxPZPFXBlimQy/h9Hk3+iduv7rU
	mRv7VCUyse2xlj23wPwLuHotpDS5mEHMkFGkYPgeruHI7Jl1x1WGvjrucBG9aQzRQ7J815fE7eXxs
	etEhiRwkGMLMYYtuzqS6eE3Om64XYK/mx4N6rjlwI4z0BdfgxtRExuEoPdeivgIMsotyULmJGaqx5
	6ddzDMozZRA0n3XLXSVu/XJtDE0RIrIHTxE9IjxmsQlq0SHhOtw65CeMkYUmfDJrxlNSKfrOIAywG
	wcXmlYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw05Y-00EWG4-0i;
	Thu, 26 Oct 2023 13:07:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw05V-00EWFR-0j
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 13:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 161CF62265;
	Thu, 26 Oct 2023 13:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A69C433C8;
	Thu, 26 Oct 2023 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698325667;
	bh=qSGCd65c4a2ywTGNmKBPxAzOervWvlfXphWYRv+Cktw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vbc04HxzzJcfmVC9k2MU0Qu5+JTqWNg56/wK/2+OjxSXjcmm9yAQSPCwEEm/wm4ww
	 gJaG+lpz9KVk1sYFmFd/BVhKiFUe5Xw9BV+jO+e3Fc60OzwEpIlwDgMoxyka8S5MCD
	 ogo687OTyPfvdxevccyAUozcOz3D5i+H9hhsQggfpmimSiInZRl63KtooYiqE6M32r
	 N65aw2Y5QmkBJ4pnCIgEixHNaQeL+V3dEXQ/aNpD1FrAdJeoJU3JjW/zsgwwjnPgJJ
	 e2U0uXxdSuxnWORFUDXUokmMAHisyeRDZ4nmB2zbcn8it7oacVmwqfABeEzIMFIdZa
	 jyBes+CMIzMjQ==
Date: Thu, 26 Oct 2023 14:07:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Chao Wei <chao.wei@sophgo.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: sophgo: remove address-cells from intc
 node
Message-ID: <20231026-legwarmer-triage-1d7922802d3c@spud>
References: <20231024-maternity-slang-fd3dcfb211c0@spud>
 <MA0P287MB0332C00AB091FD7139560E25FEDEA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <ZTkwo/u6S9Atp2u3@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZTkwo/u6S9Atp2u3@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_060749_329598_1F916F39 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Type: multipart/mixed; boundary="===============2276869613445611408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2276869613445611408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JOJ8mdMNXG4ic7El"
Content-Disposition: inline


--JOJ8mdMNXG4ic7El
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 11:13:39PM +0800, Jisheng Zhang wrote:

> > Thanks=EF=BC=8Cbtw, will it be merged in 6.7?
>=20
> Don't worry, this is a fix, I think Conor will submit fix PR once rc1 is =
out.

Yup. There's no harmful affects at runtime, it's just a fix for some
dtbs_check warnings that I noticed in linux-next. I'll send it as part
of a fixes PR at some point after -rc1.

Cheers,
Conor.

--JOJ8mdMNXG4ic7El
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTpkngAKCRB4tDGHoIJi
0kqzAQCPFN41153Z1rGXO4AV7wGoq0T9lxUJ+9MShBAU+o4twQD9HNOLnVtbXTpc
EV2FeKUNpZ5UeTA2QQZJ4tMLyqS9rQM=
=hscr
-----END PGP SIGNATURE-----

--JOJ8mdMNXG4ic7El--


--===============2276869613445611408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2276869613445611408==--

