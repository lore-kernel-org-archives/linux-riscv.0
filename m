Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D24AC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/qPNX/JBWwyaOBXjz3RwQ3a9iVFkcxO5ldKD3b1Iwg=; b=awB/MC36Zx4+WvJnQZMuAQfVOA
	WB4Ywd1mQKGl3I5A9Po9VIVISmwZjpBvVmGK4gmjz1pCCjhFwZQexOqfK8MMCr7sS0i6pPbPs6DnB
	CipcTOFvyOkPM0Wr9IAFk6zFIyp9HQ/feaaEFy2WlLPek1g0rvSJdq6LFdTzoW6QAmqoSH3Eus2wi
	3Nser0f+161KGDOW/nQjq97l/+t6cK469DcqlZ5Q3mZsu6+ED6aCz9g0zmy6zviZhgS7suAw3svNa
	ku774ojYSAZM0/MUpzZNaTewuaeKFxBtPU12EusTtq1zEBe73enJ+TkCmmwWWRpcj2M237H7waDbl
	gvuWFdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnMz-0000000846O-2O80;
	Fri, 02 Aug 2024 08:10:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnMw-0000000845u-3px4
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 08:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E9E762952;
	Fri,  2 Aug 2024 08:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69B6C32782;
	Fri,  2 Aug 2024 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722586233;
	bh=b3da8a47roN/8v56A+q+bWCYVlxmLmnqVAMz16h0mho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNViO4vIMbLv2dEIASvpAvSodp+9Jn2znTiyROAbAoqhbOLuIwVa8SLD2qA2Vr0xt
	 RabLRwu9RWRHDK1PP0vQMlitEukABpKOqwPxlB+rQ81rljw54pcwLi6VZhI8bwua6P
	 aHO9CbChmxmf74n+yz+E/r9byZ2o39p/ufWn8pqS7uUe7lnFwBoZTZDfdYan7nBIsY
	 VrU/Pl5avi3ouPvqm1nljHU33c5d7z9YLoC8TKoYvdzVaOGdKmRLxowuvya187/NeA
	 m7LgAjbljbTpchzru+Drmhm5r5dgdRNFTBpu74UqQ/rPQ0QzxIASFSwJNsjR9hzXBz
	 k4r2vVonllGvQ==
Date: Fri, 2 Aug 2024 09:10:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Qingfang Deng <dqfext@gmail.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [PATCH] riscv: support KASAN instrumentation of bitops
Message-ID: <20240802-showpiece-uneaten-7920dbf75aa8@spud>
References: <20240802040506.712-1-dqfext@gmail.com>
 <16be871d-a52e-4b1d-b579-71ec03a0c81d@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <16be871d-a52e-4b1d-b579-71ec03a0c81d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_011035_045420_43001612 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============8028978230227195109=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8028978230227195109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N/dkjSIa5W7jBqLZ"
Content-Disposition: inline


--N/dkjSIa5W7jBqLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2024 at 07:45:38AM +0200, Alexandre Ghiti wrote:
> Hi Qingfang,
>=20
> On 02/08/2024 06:05, Qingfang Deng wrote:
> > From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> >=20
> > The arch-specific bitops are not being picked up by the KASAN test
> > suite.
> >=20
> > Instrumentation is done via the bitops/instrumented-{atomic,lock}.h
> > headers. They require that arch-specific versions of bitop functions
> > are renamed to arch_*. Do this renaming.
> >=20
> > As most comments are identical to the ones in the instrumented headers,
> > remove them.
> >=20
> > Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>

> Samuel has just posted a similar patch here https://lore.kernel.org/linux=
-riscv/20240801033725.28816-1-samuel.holland@sifive.com/T/#t

Additionally Samuel's patch has the advantage of compiling :)

This one errors with:
include/asm-generic/bitops/instrumented-lock.h:80:16: error: implicit decla=
ration of function 'arch_xor_unlock_is_negative_byte'; did you mean 'xor_un=
lock_is_negative_byte'? [-Werror=3Dimplicit-function-declaration]

--N/dkjSIa5W7jBqLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqyUdQAKCRB4tDGHoIJi
0lS/AP0dN95j4sYFCbhJuqhsXwejhUpB8X3RfrpkwX8DZ2W5VAEA34wRBfnGo0Hs
Td1o6RjF9h/BP7ghwMllDf714Spo4Ag=
=+vA2
-----END PGP SIGNATURE-----

--N/dkjSIa5W7jBqLZ--


--===============8028978230227195109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8028978230227195109==--

