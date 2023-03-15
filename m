Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D25BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVuZ5E455JxaY/T0XkKrvGbSgY9cqXr/wwlD3JhrefQ=; b=Yo1PdfnQraREgTt5ltQkKf4WpI
	h/MGxoMaHZlsZG6pqNjo58D3Qm7DLlk/dYmYopEojfN54B2KLL8QvY3OjKuRz47olL2XlZM1iGdcw
	rcZ1nYYVriSiuDyC/mr8nTfOlAwiUrUqS5KD2KL6YAfIJjl2lA32rLJBEygEe8Q5nPf7uTBjkd6TE
	cLNy/7HcXXuPL7iNpZXkw5sBwMzfHO8L5SQCbRXndKe6d0EVEAJ4wO2C7Q6GPQtsAMGpTcGE90Yu7
	r2cF7aivXmgp2p1f9pjZ4nIANsPPh1k21SvYdn9sZ4uwNc2XuByMYmlElDlu2FuHt3D3e1VKIsZOj
	t8JWhg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMH3-00ClKt-0X;
	Wed, 15 Mar 2023 08:14:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMGz-00ClKM-2y
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 08:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 231B561BF5;
	Wed, 15 Mar 2023 08:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66742C433D2;
	Wed, 15 Mar 2023 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678868052;
	bh=RYBEOk+HK2aRj9LqS2VuCmRmezqPOUjCPLS3OrVq21o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=It7x0u2QWNI01AxqasCNsexzhbUEwlriKjOKPlU9dy1pPQR+mW0uMLAPF3YAeoUd3
	 sH44L4IVmHXaHJoxrr5ECxgJCLWTE1FZLViiH+SMfafccYu+Xk3icuKLb5JO93jqBI
	 FDOACRMCojYOw1j320frZcsO2VFKbDsKgnBnpnHthkSUxa9I8L+8L7My3vUSYvsC5e
	 15PG6UnTZrQlHsNnYSn5P8qAzrpnc3084BpyUmVQgVqQ+TUG9HZzJGx5u+YpaEHLgp
	 V1rIg+uy/JFhoKVnQhO9adsCJDSYvnlUZNB1IolAHtu4On3bJ023VbjED+TRCMfAcT
	 ypfdd6PSkWlMw==
Date: Wed, 15 Mar 2023 08:14:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for
 StarFive JH7110
Message-ID: <e895fea6-e13b-450f-97e8-34ecfe075691@spud>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
 <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org>
 <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_011414_050517_21A6905B 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Type: multipart/mixed; boundary="===============9149771627286343422=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9149771627286343422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KCsBIXoje4qDVRrt"
Content-Disposition: inline


--KCsBIXoje4qDVRrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Stephen,

On Wed, Mar 15, 2023 at 11:44:00AM +0800, Xingyu Wu wrote:
> On 2023/3/15 8:30, Stephen Boyd wrote:
> > Quoting Xingyu Wu (2023-03-14 05:43:53)
> >> This patch serises are to add new partial clock drivers and reset
> >> supports about System-Top-Group(STG), Image-Signal-Process(ISP)
> >> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.
> >=20
> > What is your merge plan for this series? Did you intend for clk tree to
> > take the majority of patches? We won't take the dts changes through the
> > clk tree.

FWIW, I've been waiting for the "main" clock/reset series [1] to be ready
to go, before suggesting that I take it (the main series) via the soc
tree. This one is kinda in the same boat, with defines in the dt-binding
headers that are used by both drivers and dts, so splitting the two
doesn't make all that much sense.

As Xingyu points out below, this series depends on the main one, so if I
was to take that via soc, this one would need to go on top, or be
delayed.
At what point does that become too much to go via soc and some sort of
shared tag become needed?

Thanks,
Conor.

> >=20
> > I think Philipp Zabel reviewed some earlier version of the patches and
> > provided reviewed-by tags. Can you check if they can be added here? If
> > so, please resend again, or get those merged through the reset tree.
>=20
> These patches add new clock & reset providers based on the basic clock & =
reset
> of the minimal system which Hal.feng had submitted[1], which are used in =
USB, DMA,
> VIN and Display modules that are merging.
[1]: https://lore.kernel.org/all/20230311090733.56918-1-hal.feng@starfivete=
ch.com/
>=20
> Oh I checked and had not received any comments from Philipp Zabel in earl=
ier version
> of these patches. Maybe it was confused with the patches of the minimal s=
ystem.
>=20
> Best regards,
> Xingyu Wu

--KCsBIXoje4qDVRrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBF+SgAKCRB4tDGHoIJi
0m5xAQDTPvvjhBE832qUHY52KqkLnWO+zVLbPmehlEo0xNwyOgEAyLmITy69AFwW
1sNnZiP3T9rxdKwPr1lXTsdPnIjPtA0=
=kWwU
-----END PGP SIGNATURE-----

--KCsBIXoje4qDVRrt--


--===============9149771627286343422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9149771627286343422==--

