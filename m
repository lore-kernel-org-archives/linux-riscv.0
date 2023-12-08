Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF46C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCKyCbAmkUZlk6qvxFSpqxt0GGhmh/7Ob72ARuW9MGI=; b=A13/5NC4e/6Se15Hz65a04apa0
	ri+NlxZ+Rsv5RvFCGTlUEkKt3ZTb1mEIv7m9du36L11krx2QPOIQLHo/29XY/HlY59rSTgzxmGt6C
	FlqfV0za31ZOwinpubZh8PFo9QWepD8NmvuYdfAGH46sWrWUiByPzHc+jwKOPjE3YvjSo3S+7Oh28
	s86qaYoUg2q8V0ERgrg7GEh4jzzRYJ6mHutu1F/qVsMaPFbyw7lSqgotTjryYx6e0rlcnzBkHL/o6
	vNcI/sf0JhQvME0cTXgr7bhVpRdA/8UIQRs+CrcWrdYZW6nrk4krKsQmAen+YQ0LE3/OlmPvFCU/f
	PfRMzycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdga-00G17B-1X;
	Fri, 08 Dec 2023 16:26:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdgX-00G16A-2R
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 29A44B82BAC;
	Fri,  8 Dec 2023 16:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8482FC433C7;
	Fri,  8 Dec 2023 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702052799;
	bh=G8h5liRHQQqCxuXBWadFReEljM9UB62vGfdTtJ5lYjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0oVgX50j5K/ss45F9MCZpW/LcE/NZOB8Gpm0AkD4aHeUyTM2QFO4NfFjx1tDxb08
	 Xg0En8GH0at2otoby9PBikB1ZsV0jvZ/taKOOVT8Y5Mj1JNInVF0aJFkb/qFz92izx
	 LpmmnYBdHMmljM0rj5AO1DXoTmQfWkE00vE04jmNLbghq+IkI5Z2saFONcBkRUqnBm
	 vWU5FeWzFmAicaNFi5UCMy/pmh4U0Zhmrre6uTixHhM9ZnIhakUeEfZgYQ+UQQMOup
	 RQtURAwjVodTF0h6QHkDP4YHGAVWR41314ff/HkVPmjkyBhk8YZBbJxHhDMyGsd4z4
	 WBXbyShprkK5g==
Date: Fri, 8 Dec 2023 16:26:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: clock: sophgo: support SG2042
Message-ID: <20231208-italics-deceiver-e3673e693ae1@spud>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
 <6f456da5355f451309de0b1b420433ed65dab3c3.1701997033.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <6f456da5355f451309de0b1b420433ed65dab3c3.1701997033.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_082641_943929_8F3FAB9E 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4272245235855431399=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4272245235855431399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jlu8l0PhkNXRV65X"
Content-Disposition: inline


--Jlu8l0PhkNXRV65X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 09:14:02AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add bindings for the clock generator on the SG2042 RISC-V SoC.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Jlu8l0PhkNXRV65X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNDuQAKCRB4tDGHoIJi
0prvAP0S9gqVqTbYieWB4Kd4oyhZ0s0ohe8f5cP9iuF4DZcpkgD6AgNQjxtNAZhO
P111VONeHPdlK/o+LaSyQO/Ymf3ZaQU=
=5XXN
-----END PGP SIGNATURE-----

--Jlu8l0PhkNXRV65X--


--===============4272245235855431399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4272245235855431399==--

