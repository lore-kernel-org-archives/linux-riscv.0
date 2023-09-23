Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFA6CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48rDOypRgWNqRXa0/KZnlPCvkidUSUjvvL0SBaXkiCQ=; b=lFbu1zcWxQOZ5pR37TW0ItQQc0
	ljL7hc/CcgdQXdxqnNq2uRkJC/wYNbJz4glTA2SFLLb0zCa4WQb9bP+0woRNpt/9BsA8xwMYmyBn6
	csTMOlxcjjfzCDAzfXD/2kHixpfZPoSyA6qKIIJJ3xcAecEcoHUvF5NtxRR06Y6u2CKiDWPL3bcx+
	Ph7Hc8M5k/vhUO7EPmikP4dsHj0lLO54m08RPhZjrLmIFGUiqvSnHTQpgA8f/LVkAzPY8OKyX+Twt
	eQ0ctazE5Sqv+tCsA1MMPZD1lY/qoLKL3oWgBm15lFP0khpVSuciwFun78OtLu+b04+Z+nL8LfCu5
	68gugZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjzpg-00Aqyj-1q;
	Sat, 23 Sep 2023 10:25:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjzpe-00Aqws-05
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 10:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C848A60921;
	Sat, 23 Sep 2023 10:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57453C433C7;
	Sat, 23 Sep 2023 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695464748;
	bh=Q3Y7t0Lpv4O8LxXpOYTrQfyQd9RMu7ml1ykCJ09i0So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3XJIweX871CqMOIaHHipt11EREXzfg2FoIRdC2GlabW2UWDr77bvfpiQnW6VqpX2
	 IrInx2zSMQrWTcK7PCWKcTu2boVcKo3rkcerPNfLFYz5WsFb7SBQW8rqHhWDm+7pTx
	 +aLLjjXNDZWqEWv/1goXqkfRefyvbp8fqjgWggWcYpY4BwCJg8LcJTId4C9UsA6tAz
	 GU0NNqVIDt3OZduOV4HoPZlJEEDNeQqlzaupvqSU9AsQtghk6gncjir72tcevg7vJq
	 DIIyY29iZNaTX/yjd8fVC/u+KcoZfEBB/eXoK87Ip2Qr2ft1JmbdOcatZIsgniKzNS
	 qhQwxOrN/+DKA==
Date: Sat, 23 Sep 2023 11:25:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <20230923-snowsuit-angled-f49237d27c83@spud>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-8-conor@kernel.org>
 <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_032550_171648_FA40E9C6 
X-CRM114-Status: GOOD (  16.10  )
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
Content-Type: multipart/mixed; boundary="===============8717208435546520021=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8717208435546520021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="47AsyQWf2LP0qoEw"
Content-Disposition: inline


--47AsyQWf2LP0qoEw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 03:50:36PM +0800, Guo Ren wrote:
> On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Convert the th1520 devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dt=
s/thead/th1520.dtsi
> > index ce708183b6f6..723f65487246 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> >                         compatible =3D "thead,c910", "riscv";
> >                         device_type =3D "cpu";
> >                         riscv,isa =3D "rv64imafdc";
> > +                       riscv,isa-base =3D "rv64i";

> Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extensions.

I did it that way as a hedge against things changing in the future. I
have little trust in that part of the ISA specifications.

--47AsyQWf2LP0qoEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ69JQAKCRB4tDGHoIJi
0vX6AQDE7jhpSu4VP4wtSRPrVTHRRS7VcBWe2XyVZJTOd9TWXAD7BBHlwAPzKSGb
vt2Z0iGrgkRVFsQ1U/vLuYvhM1ucsgE=
=fcfM
-----END PGP SIGNATURE-----

--47AsyQWf2LP0qoEw--


--===============8717208435546520021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8717208435546520021==--

