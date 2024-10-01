Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B92CE7D12
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 12:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO4ckjxUaFXfZ82GXo7gDkg8wtg4lyS8lnVHuSKzEgo=; b=PIKXB/CQZXdZsLO1z+UtFUtXxp
	4e6lLe1otJi4YN2jZEXJsF/qGfR/VwqCoxwZGOAvIBwJrANH+AEEYzFmgkGckLUuMWSOo89/Krdw5
	gqrO5UPNldZ1i+aG85KpTUdl3RmgMXr0DTBw06echGrPO764CTH5nblN/Xb03GfVKZvJzsB2PcH2b
	01Hfw91rxIcB+JdOCO2HzzaLjNaj2CrpIItfYwLPdBb5V/Jj54ea3yAeqkPsQsjMf03KXyebmOvMG
	or2DUnkzNUHkEbD/lU74KA8pNYoc36d8ARVdekNqrQ70IfN8V7u4pLIO7i4bmEK9B83NPHdvuGBiE
	XbIWzQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svc44-00000002miV-22eP;
	Tue, 01 Oct 2024 12:33:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svc3u-00000002mfi-09Vm
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 12:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AE7E5C1002;
	Tue,  1 Oct 2024 12:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5267C4CEC6;
	Tue,  1 Oct 2024 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727785985;
	bh=2mC2Q0SM0qv8F+TbsE6KIL+n1IyhIuMI2WWZSIIkF3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHvQlB3f4XuJ3Lxeqche4e0Z4YLu/RjBxkGvXOZq+qw3bZnobbUu4REsTnH0GMfV1
	 ZFxCUvAL9Q2WlSSjSuv15DTgEShQJ+O85Nk7e4j9rbOsdJTyWkHj/ANKRYPAuBSlSl
	 Dgw7NaF71t8wmtFgBKUFosvG2xqJwOlJK+hsvI5ltPDLj1h38c1yIn9swXl1P48yJi
	 DR0N75MdvRBwwKNDVN2YMpce4PL4wx9xAL4XD4mAw/FDr/1gXyW2Mkesd+7SacyRcX
	 47qEMAPT1Aa/QfzM5WR6BGBwri6EvIxZnOnod14g4+VHVcVu2OD/uksSBRcnN7tJ4F
	 oHBV5Ib02tckw==
Date: Tue, 1 Oct 2024 13:32:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ze Huang <18771902331@163.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
Message-ID: <20241001-stratus-overplay-96266c33ca89@spud>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_053306_181133_B39360C7 
X-CRM114-Status: GOOD (  22.42  )
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
Content-Type: multipart/mixed; boundary="===============7075918371285058241=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7075918371285058241==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MVunmLxiGHzDTp2O"
Content-Disposition: inline


--MVunmLxiGHzDTp2O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:27:25PM +0200, Linus Walleij wrote:
> On Thu, Sep 26, 2024 at 5:58=E2=80=AFPM Ze Huang <18771902331@163.com> wr=
ote:
>=20
> > This patch series introduces support for the pinctrl driver of the Cana=
an
> > K230 SoC. The K230 SoC features 64 IO pins, each of which can be config=
ured
> > for up to five different functions.
> >
> > The controller manages the entire pin configuration and multiplexing
> > through a single register, which control features such as schmitt trigg=
er,
> > drive strength, bias pull-up/down, input/output enable, power source, a=
nd
> > mux mode.
> >
> > The changes have been tested on CanMV-K230-V1.1 board.
> >
> > The pin function definition can be found here [1], and most of the DTS =
data
> > was converted from the vendor's code [2].
>=20
> Bindings ACKed and patches look good to I applied patch
> 1 & 2 to the pin control tree.
>=20
> Please funnel patch 3 through the SoC tree.
>=20
> > prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@=
qq.com>
> > prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
> > prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
> > prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
> > prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
> > prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
> > prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
>=20
> I don't know about all this stuff but neither bindings or code seems
> to contain anything that won't compile so I just assume that any of these
> dependencies are purely for patch 3/3 and I nothing blocks me
> merging patches 1 & 2 so I just went ahead with that.

Yah, this should all be cos I haven't yet applied
https://lore.kernel.org/all/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq=
=2Ecom/
as I am waiting for a clock driver to be sorted out.

--MVunmLxiGHzDTp2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvr+wAKCRB4tDGHoIJi
0hnQAP93nua+l5hRyOfPimtHNG8Wn/JusylG6RrR+aZbNJtWnQEAhLgo5tqTgYtt
euXnFikL3ifpzn/KlGUSlx8O8lRN/AI=
=a1pK
-----END PGP SIGNATURE-----

--MVunmLxiGHzDTp2O--


--===============7075918371285058241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7075918371285058241==--

