Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B3CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQPWwiE1+6+hqS6b6SX7Qkiq78MjRZ3hVJd/EoYBTY0=; b=LlTfM+K3tJ16JQaPQLJzENdYW4
	RJNUcTYwb+lXMorHZbyMAN8PeQi6v6fzSULHlZNZLeYXWHCOTWdg05YNhfiIi5Y+dOHxDaPj5DBBD
	R3VGnA1FH1kTqMXOPdwbM4ADKM1Fw/VIcFBhUEJiM4o6dT1xF/rqTkpM1we7MQQSy1xKiyRw9a14S
	jytmQDs0UgZU903q4Wu5xNzdUkCoDe1ib4+x4Jq7iTpmkTlMrpSpf/5ECdCdpINhviuZZdqIVo9Zf
	YFBIfTW8tjSVHYY5zWed3AJs3cUAay8LTbB68XYqEOTMjUqb8pvOG9Se3lCrpxrpvXB94wAxhQSzj
	p2p654vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jty-0000000DVXJ-1QIW;
	Mon, 13 Oct 2025 14:51:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jtw-0000000DVWE-32Dj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 14:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B9C743777;
	Mon, 13 Oct 2025 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5808C113D0;
	Mon, 13 Oct 2025 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760367111;
	bh=1f1R3hSRZT6UvLUu06F4HKhifFVAYk2MH31zzCMuaMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNBnyf5mQqInO6AKrseYPWAQUKjA7FwKTh0ngKwlfHCCDImzvVtQ7ZAKxefQkTBSq
	 URAZHR47cIBC5F6FdoA++rPOEkvhrcqNSBdGwoPELMt23JLCayZaOaH7rtZ1uDjyUE
	 IHbEIY+Z5g0jjr3s1g4LCK/kPDV+Vw5NCpoXMb8m4FoCjCANLcFaTXEp1xpBIu1bDi
	 RNZYnDkvwNS5ZDuFmfbkbnXJDjVVVyCHTKfZ7KLRWT+6ME1i6KBa6lcojyTv1ayF6+
	 VyRI57IJLFZjA5dZz1byAoXBK1YsA7WqEUP9Fhw+IEFoQoI3sjGxV69TqVpgfdn4+O
	 fZWWUoxKrtT8Q==
Date: Mon, 13 Oct 2025 15:51:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Ron Economos <re@w6rz.net>, bhelgaas@google.comk,
	rishna.chundru@oss.qualcomm.com, mani@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
Message-ID: <20251013-blatancy-husband-ed9872a46e25@spud>
References: <eac81c57-1164-4d74-a1b4-6f353c577731@w6rz.net>
 <bc7f397c-1739-465e-b195-e1a41c34504d@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <bc7f397c-1739-465e-b195-e1a41c34504d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_075152_802486_6767DC3B 
X-CRM114-Status: GOOD (  23.35  )
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
Content-Type: multipart/mixed; boundary="===============4229349586319337050=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4229349586319337050==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uueo13zjvdFAPZts"
Content-Disposition: inline


--Uueo13zjvdFAPZts
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 01:49:39PM +0530, Krishna Chaitanya Chundru wrote:
>=20
>=20
> On 10/13/2025 12:44 PM, Ron Economos wrote:
> > The SiFive FU740 PCI driver fails on the HiFive Unmatched board with
> > Linux 6.18-rc1. The error message is:
> >=20
> > [=A0=A0=A0 3.166624] fu740-pcie e00000000.pcie: host bridge
> > /soc/pcie@e00000000 ranges:
> > [=A0=A0=A0 3.166706] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0=A0 IO
> > 0x0060080000..0x006008ffff -> 0x0060080000
> > [=A0=A0=A0 3.166767] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0 MEM
> > 0x0060090000..0x007fffffff -> 0x0060090000
> > [=A0=A0=A0 3.166805] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0 MEM
> > 0x2000000000..0x3fffffffff -> 0x2000000000
> > [=A0=A0=A0 3.166950] fu740-pcie e00000000.pcie: ECAM at [mem
> > 0xdf0000000-0xdffffffff] for [bus 00-ff]
> > [=A0=A0=A0 3.579500] fu740-pcie e00000000.pcie: No iATU regions found
> > [=A0=A0=A0 3.579552] fu740-pcie e00000000.pcie: Failed to configure iAT=
U in
> > ECAM mode
> > [=A0=A0=A0 3.579655] fu740-pcie e00000000.pcie: probe with driver fu740=
-pcie
> > failed with error -22
> >=20
> > The normal message (on Linux 6.17.2) is:
> >=20
> > [=A0=A0=A0 3.381487] fu740-pcie e00000000.pcie: host bridge
> > /soc/pcie@e00000000 ranges:
> > [=A0=A0=A0 3.381584] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0=A0 IO
> > 0x0060080000..0x006008ffff -> 0x0060080000
> > [=A0=A0=A0 3.381682] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0 MEM
> > 0x0060090000..0x007fffffff -> 0x0060090000
> > [=A0=A0=A0 3.381724] fu740-pcie e00000000.pcie:=A0=A0=A0=A0=A0 MEM
> > 0x2000000000..0x3fffffffff -> 0x2000000000
> > [=A0=A0=A0 3.484809] fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8=
 ib,
> > align 4K, limit 4096G
> > [=A0=A0=A0 3.683678] fu740-pcie e00000000.pcie: PCIe Gen.1 x8 link up
> > [=A0=A0=A0 3.883674] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
> > [=A0=A0=A0 3.987678] fu740-pcie e00000000.pcie: PCIe Gen.3 x8 link up
> > [=A0=A0=A0 3.988164] fu740-pcie e00000000.pcie: PCI host bridge to bus =
0000:00
> >=20
> > Reverting the following commits solves the issue.
> >=20
> > 0da48c5b2fa731b21bc523c82d927399a1e508b0 PCI: dwc: Support ECAM
> > mechanism by enabling iATU 'CFG Shift Feature'
> >=20
> > 4660e50cf81800f82eeecf743ad1e3e97ab72190 PCI: qcom: Prepare for the DWC
> > ECAM enablement
> >=20
> > f6fd357f7afbeb34a633e5688a23b9d7eb49d558 PCI: dwc: Prepare the driver
> > for enabling ECAM mechanism using iATU 'CFG Shift Feature'
> >=20
> Hi Ron,
>=20
> can you try with this change.
> Looks like fu740-pcie driver has 256MB space of config space so dwc
> driver is trying to enable ecam and seeing failures while enabling.
>=20
> you can try two options 1 is to enable ecam if your hardware supports
> it and other is to use native method like below.

> If you want to enable
> ecam your config space should start with dbi address and should have
> 256Mb aligned 256Mb memory of config space. Uf you want to enable ecam
> and had this memory requirement fulfilled, try to change your devicetree
> by starting config space with dbi start address and give it a try.

If it worked before your changes, but now does not, I am not going to
accept a dts change to make it work again FYI.

>=20
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c
> b/drivers/pci/controller/dwc/pcie-fu740.c
> index 66367252032b..b5e0f016a580 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -328,6 +328,8 @@ static int fu740_pcie_probe(struct platform_device
> *pdev)
>=20
>         platform_set_drvdata(pdev, afp);
>=20
> +       pci->pp.native_ecam =3D true;
> +
>         return dw_pcie_host_init(&pci->pp);
>  }
>=20
> - Krishna Chaitanya.
> >=20

--Uueo13zjvdFAPZts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO0SAwAKCRB4tDGHoIJi
0tgOAP9RGYYbZuhXkwHit4qJoD31YDcFt5XTMP7JPekrluQ8+QD+PyxF3Fa/gUrf
kXHMSjfsVuDMxC4EupjKVUMjGexKmA0=
=nnJc
-----END PGP SIGNATURE-----

--Uueo13zjvdFAPZts--


--===============4229349586319337050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4229349586319337050==--

