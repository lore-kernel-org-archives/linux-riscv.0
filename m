Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6FC77B7A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4of7w0Km1NBlhcH3hZSOkAQdEN96tTB8opTEmvdjT78=; b=k18fz0+wqdJNZzcoQmAVVgSIFH
	1Pn33Azj2UIfnDXzjw6hxW7gpSjy8aMs64krQoaIKHrb7P2bcr6+WUTY2dtDvM4MYb4uB1vaXguOX
	gjstBlR1+3yd1UrexBererRqg1jYiOGjQEf7qz3us8PSkwRavKCl4KT9tEF3XBv+INlRPAMVUqiYW
	u9dWPvpBZoDgOhMDR+mNk32rITF/FD2OP193l32d0xl+ZYhwCusBD2GONd7oBYydobzbgDbmWs8Tc
	5PlGWrOEXqoGo/H79icxkB/psJ7wHLMznCK4bM4ljK+7oCXwuKcto1suOx6VlRcNsaO2PGE5E43Rg
	NuQuGtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8I6N-000X6S-1W;
	Sun, 11 Jun 2023 10:15:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8I6K-000X60-1e
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jun 2023 10:15:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C777460D2D;
	Sun, 11 Jun 2023 10:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67459C433D2;
	Sun, 11 Jun 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686478511;
	bh=wAjOnzPfZnGlA7O9lsl0eoKYfnAkZ5NGFNa2T2qGSKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzJPSZYj0GDOcWFsAzNWo0anRacJxynblCHDgzQ3locAUn+OGD9dgSPMF/7/eNjTv
	 7veUUA4Me8CcccdrFknRkGRc/OMH/mP1QLOEyxcW+dG/RPsfoECu0eXYV2xPOh+CoQ
	 TGxfVnJDIt1yb0e6cqPcLq5QFMC5Y0GK5DVUN2YuRuizZc+/OqqAmMcDzW3B42/oeI
	 vK7whovWacTtQxjNzR3+Qms2X9fq0KpJ94EYCA6m4AW5cWK3Fz5HsSrr+MBRoi/Vjx
	 liR9OwGhzY0Df9BKYDMiISyIwaUNY/17b28ZIOCuDMTDkiYPIn9Z55/Q622qGL/tF2
	 JxvY203wwQSJA==
Date: Sun, 11 Jun 2023 11:15:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
Message-ID: <20230611-canning-antiquity-b60b360ea683@spud>
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
 <20230610-ultimate-moisture-630c7672358b@spud>
 <tencent_72C3F44CD3565F83575F5632D9574C331208@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_72C3F44CD3565F83575F5632D9574C331208@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_031512_616922_8560E401 
X-CRM114-Status: GOOD (  16.69  )
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
Content-Type: multipart/mixed; boundary="===============2228115482708666915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2228115482708666915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tcjkC733yzWvP198"
Content-Disposition: inline


--tcjkC733yzWvP198
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 07:31:03AM +0800, Woody Zhang wrote:
> On Sat, Jun 10, 2023 at 04:44:19PM +0100, Conor Dooley wrote:
> >On Sat, Jun 10, 2023 at 07:43:20AM +0800, Woody Zhang wrote:
> >$subject: "riscv: move memblock_allow_resize() after lm is ready"
> >
> >s/lm/linear map/ if you resubmit, please.
>=20
> Thanks, will send a v2.
>=20
> >
> >> The initial memblock metadata is accessed from kernel image mapping. T=
he
> >> regions arrays need to "reallocated" from memblock and accessed through
> >> linear mapping to cover more memblock regions. So the resizing should
> >> not be allowed until linear mapping is ready. Note that there are
> >> memblock allocations when building linear mapping.
> >>=20
> >> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
> >
> >What commit does this fix?
>=20
> Fixes: 671f9a3e2e24 ("RISC-V: Setup initial page tables in two stages")
>=20
> Will add this tag in v2.

b4 should pick up fixes tags from replies, you shouldn't need to
resubmit for that alone.

Cheers,
Conor.

--tcjkC733yzWvP198
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIWepwAKCRB4tDGHoIJi
0jFLAP4/9k6xvXQItKC98hykUy2EbSm56xcc/rZyYd0282CxiQD+IbGElxKlcEeF
wREvj1JS6GIfm4zWBbYCWkvL6C0TkgM=
=sFlO
-----END PGP SIGNATURE-----

--tcjkC733yzWvP198--


--===============2228115482708666915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2228115482708666915==--

