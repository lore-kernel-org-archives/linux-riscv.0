Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360DBE7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAKN5W+s9IZCwt7jjXyLIpkqu2VNoo/OXF85nGnjusM=; b=K34C8yev9zDkMoITn+TCJ63oi5
	BP3S/b1umcGDHSxV4A7OseiW7qTE9O/ZKIGhZU8jpxcDz+wR67JAvv8ae4j3wRqVS8tD69nrGlhUS
	AyEHUtzb64mzATlSNLDFVbHnrxC5DQlOS43eUTI0Il7BC7qOvOdL5k7OadKZGHqxZKf4JTqR66zDi
	7j7oR+CpuMUYZuklPAGrcOT8gVGwr5wS+mYAFLYwaGCoF9LEhDh6qGHMFwUxYSsiMsFuc9zP/XZgH
	0LbTjSgFIYNhxi7dIeC/JfmQG0O0umtQXofibxleFv8aZzm01bm+55uio/X9sb2Myvn/y9i5MSOUA
	pyN52t1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHlt-00CgU2-0P;
	Mon, 02 Oct 2023 12:11:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHln-00CgTD-2d
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 82359B80FC3;
	Mon,  2 Oct 2023 12:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EC2C433C7;
	Mon,  2 Oct 2023 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696248685;
	bh=xzFeW3pPDzT2xIba8bCh5rsBV+Lctflw0Tb347eHVco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAAMF77CSZ8zwlWvhXP27KLdxzDnIVh8IlcwMgGerC3ryuvIDXa4QOqQPbQ7CxThc
	 IItzNuWyU1eSRRbY4AkgYcpWtu/hUfddBTyn6OHD8KfR8twts19NCI4ngpIzpPtf0s
	 MPGRcOPXczLSLjxdWU0Bfh+tEKiDOGQwx2qhDQ06Z2y0LtNAxSbc5FndvhpKnF8WGm
	 Ag03SZQUGYHmNktxJQrbTy2czINs8uWtwwZyQfpuh+gA+JCp+dv1jy5DmhPLKQumLr
	 +p6g3S2zokIJdJRzUVtU0X/OojOx2YFp/pWYkNGM1dFS8ZOdgzr7DOlk28IqtkujIq
	 Kg06xZhArdpkA==
Date: Mon, 2 Oct 2023 13:11:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <20231002-crux-drained-448f49cf6b7d@spud>
References: <IA1PR20MB4953D58BA3ECFD487918E3A4BBC6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953967F34C7C48C74313B74BBC6A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953967F34C7C48C74313B74BBC6A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051128_119782_8B9A3F3D 
X-CRM114-Status: GOOD (  27.29  )
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
Content-Type: multipart/mixed; boundary="===============5529359611439464801=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5529359611439464801==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FyNWdJyZjS0Y1L+C"
Content-Disposition: inline


--FyNWdJyZjS0Y1L+C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 08:22:04PM +0800, Inochi Amaoto wrote:
> >
> >>On Sun, Oct 01, 2023 at 06:34:21AM +0800, Inochi Amaoto wrote:
> >>> Hi, Jisheng
> >>
> >>>> Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.
> >>
> >>>
> >>> You add the clint dt-bindings of CV1800B clint, but I don't see the c=
lint
> >>> node in this dt. The SBI needs this clint node to provide timer for l=
inux.
> >>> AFAIK, the dt of SBI comes from the linux or the bootloader, and boot=
loader
> >>> may load the linux dt and pass it to the SBI. I think it is better to=
 add
> >>> the clint node.
> >>
> >>> In addition, please separate the peripheral node to a different file,=
 which
> >>> can be reused by both the CV1800 series and CV1810 series.
> >>
> >>How do these SoCs differ?
> >
> >AFAIK, the most peripheral of CV1800 and CV1810 are the same. there are
> >only a few difference between CV1800 and CV1810:
> >1. CV1810 have mmc interrupt, but CV1800 have none
> >2. CV1810 have more RAM and a more powerful TPU.
> >3. Some models of CV1810 support I2S.
> >
> >Also is some you have already mentioned, the video capabilities (includi=
ng
> >encoding, output steam number, input steam number) are different.
> >
> >The only board with a CV1800 soc is Huashan Pi (CV1812H).
> >
>=20
> A mistake, I mean CV1810 soc, not the CV1800 one.
>=20
> >>Documentation seems rather lacking, but I was able to find something on
> >>github that suggests there is also a cv180zb. The difference between the
> >>three seems to, from a quick look, be their video encoding capabilities.
> >>Is that correct?
> >>
> >
> >Yes. it is correct.
> >It seems like you have forgot a chip called CV1801B, which has 128MB
> >RAM. But I see no board with this soc, so at now it is not necessary to
> >care it.

FWIW, I do not mind if the properties are left inside a CV1800B specific
file, and moved out at a later date if/when someone actually upstreams
support for a board with that SoC.

--FyNWdJyZjS0Y1L+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqzaAAKCRB4tDGHoIJi
0sxWAQCql3VtfCEXULtNAc+z3zZNdJZhrkP04sdnpjovRzaDNAD/dsALTQv/EuU2
mQX4mkdJhdPw0TAr6R8LaQ8C66GfsAQ=
=NoLa
-----END PGP SIGNATURE-----

--FyNWdJyZjS0Y1L+C--


--===============5529359611439464801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5529359611439464801==--

