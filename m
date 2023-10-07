Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C8E95A60
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHbRY5S4Mg5ur1DgCsiDEOzdhyRedDevfljjhnROjVo=; b=lRsxTU44KMyLmm601DYdHRIYdP
	L2vSDVpEkgJKjqS7R0onDsWg7D/a5F95+H90X6TpspDuX6+JxZObEyA9lFrWIXhcARXOGPVdwtxEN
	2kTe/fq3E4AxYyRaSVSTyind/O/oGS+KaR7SsMg7ZzkeggWuHWiINu0gDlSaRp/V1C56Oa97HHWQ6
	jU7QGZQ36ExMbBrSFw7TJZ5LBAaeLgkg/1fXYWn/DuRipExwm5TaOvImrQGWwfpx2IyUftdb36mQv
	M8NH89VJqChezjF/OIIPFcivzpIZstceU0qkTEXy40dNxDhjNy2UVo23bXSOCR8eCjXBAWynzICbV
	9jGjr0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp56p-007TuK-1q;
	Sat, 07 Oct 2023 11:04:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp56l-007Ttm-2c
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 11:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1002E60E04;
	Sat,  7 Oct 2023 11:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AE2C433C7;
	Sat,  7 Oct 2023 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696676670;
	bh=Y20YNDErf8+O0Uirh1MexdXjCNi6je8JK4gr+jq+D/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgF7wMxa207/Mac9QAxEm5FvzBxZ9YIvLFFHdVCk5q4V6ORJOG8JO+WHY66KGcPr2
	 Kr51mja0zcVwKrOcaEOtLxVpuqUTYl5lGAaUlzQNt0mPM5YoRBpw4A4g3K3A4iO4Ek
	 iXZEuR8utzO3nj6471NoehywXnLJd8oJuWjOGuZI9PykJzqqmdTzKE+wpvIPNF1BK1
	 w2VgVJbepIl/ChoSizjE7WVn47KjhqFFYn/ky2q2Brh7wHg4NwDpJSAdC4vV5SgzBO
	 SKsudqBQU+oZ21BUqdQy4AnOC4XjH/bRu0mGOgCTgY+vZVIvEajR6TyNba7EOgctBi
	 HqhUeGq6C1A8g==
Date: Sat, 7 Oct 2023 12:04:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
Message-ID: <20231007-kennel-lustily-59b0a9867aaa@spud>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
 <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_040431_937200_C65C4EEE 
X-CRM114-Status: GOOD (  23.61  )
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
Content-Type: multipart/mixed; boundary="===============3178923174846123807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3178923174846123807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Usml4cP+MUcKhLiY"
Content-Disposition: inline


--Usml4cP+MUcKhLiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 06:58:51PM +0800, Chen Wang wrote:
>=20
> On 2023/10/7 18:17, Conor Dooley wrote:
> > On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
> > > From: Chen Wang <unicorn_wang@outlook.com>
> > >=20
> > > Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 =
[2]
> > > in a standard mATX form factor. Add minimal device
> > > tree files for the SG2042 SOC and the Milk-V Pioneer board.
> > >=20
> > > Now only support basic uart drivers to boot up into a basic console.
> > >=20
> > > Thanks,
> > > Chen
> > >=20
> > > ---
> > >=20
> > > Changes in v5:
> > >    The patch series is based on v6.6-rc1. You can simply review or te=
st
> > >    the patches at the link [7].
> > >    - dts: changed plic to support external interrupt
> > >    - pickup improvements from Conor, details refer to [8].
> > Did you? I only see them partially picked up. I'll just replace patch 8
> > with the patch 8 from this series I think.
>=20
> Yes, only the patch 8 of this series(v5) is updated for plic node. For ot=
her
> patches, I just cherry-picked them from previous "sophon" branch.

But added my signoff? I ended up seeing my signoff on the patch where I
disagreed with the commit message, which was confusing to me.

> BTW, what I did this time may be a bit redundant. I would like to ask, if=
 I
> encounter a similar situation in the future (that is, only one patch needs
> to be modified, and the others remain unchanged), is there a better way to
> submit the patchset?

You could have sent the plic change as a incremental change on top. So a
new patch with just that one change in it.

Thanks,
Conor.

--Usml4cP+MUcKhLiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSE7OQAKCRB4tDGHoIJi
0tYoAQCfpiz+XYlsXbrOM1jH/kmXLPj1YIVw6DT2XQAQ0p0ZMQD+JedP/XPzZ3rS
cn2UlsfA/CV2IIz+FkD2l5OoZdELTQ0=
=56si
-----END PGP SIGNATURE-----

--Usml4cP+MUcKhLiY--


--===============3178923174846123807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3178923174846123807==--

