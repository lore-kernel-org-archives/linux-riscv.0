Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE00EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xaISdjUGdMg+y7ax6/TQRYHebVkEsj5EGexttdYIGs=; b=NTcOxj8JLMVbd5FM2CiHJr2EXh
	XOL5NeTJ9Bb9MPXG1tlKATwnl3liPN//DtEbvmvtLGzLdRJN798R5YVN0EwA/C6DrUR92EWYxQSzG
	AkVJCLPbb6mXZrKICqdHKMlgv0Dcwuw0eoEAM1QNfz+ul39eEnYzjinoHceMZx3bSWpGALVtsYW83
	hzlrUl7gI4XPJ9tMkioPYhlDjD6XD18nO30RD9nyjzU72/g8I5pYjAbkVC0EeCdNn7UEeYG9G5SmC
	gUeY+eejb6huKkI6qOTR4bFAa+erdxpKbZMG1fBmsvIS2S4SWTjRO0p6QWOXGh13jKYZqE9dKoh8O
	p0l+HKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9A9n-0092BC-0x;
	Tue, 13 Jun 2023 19:58:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9A9i-0092AG-0j
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 19:58:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C9ED63A57;
	Tue, 13 Jun 2023 19:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B68BC433D9;
	Tue, 13 Jun 2023 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686686295;
	bh=QPM/JQWhbc9ZZFnSxIH9LpBG+rM6NnSIOmkQYnFam2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2tv+6r7KPOuZdnOaI6L85b4er2mP+vze4RjmckW5gNfhf8TP6eZGC2AODQOSpvRn
	 j3ZwarKkPLqZ6zh00fXBpCayD8u5JuFSGi0KzR/rEuk61CtiJbn9FDKnDgE5hC0qy+
	 JuXv0rWg7iDo9ez0jrjDFNVcSNgIyLKdRcDa8vKZYAwZEmHKnOXC7UU56e4LIBjGds
	 9br6TtzsjCFFTpqhhFYEcaFVFvikQcZAbR/+0ZKigcCh/LxeX/korJBqvo95J4z1/R
	 QUG60rBCMBPNDMUzHtfl+ZMtCFM5S7PmpUYSh2Nj5YJlRrMYOa3SxfWXQbbexsMaz2
	 fbmbWNsl2chhQ==
Date: Tue, 13 Jun 2023 20:58:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 6/7] riscv: dts: starfive: jh7110: Add syscon nodes
Message-ID: <20230613-keep-sliding-e34c39f2774e@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-7-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230613125852.211636-7-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_125818_411305_B1E608CB 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: multipart/mixed; boundary="===============6670978271469986719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6670978271469986719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GKfT6rNBPc8xWVRn"
Content-Disposition: inline


--GKfT6rNBPc8xWVRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:58:51PM +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> Add stg_syscon/sys_syscon/aon_syscon/PLL nodes for JH7110 Soc.
>=20
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GKfT6rNBPc8xWVRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjKUQAKCRB4tDGHoIJi
0s8PAP4pzKCLwQ1EUqVXVMsQZlfBsL2tUqNrjaETDC2XMH3B+QEAhFyfospNgT3X
OJ2WHFf6HkK15ZnACS9Ik7nKZK2xLAo=
=i2sK
-----END PGP SIGNATURE-----

--GKfT6rNBPc8xWVRn--


--===============6670978271469986719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6670978271469986719==--

