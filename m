Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2B4C7618D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2CeYcSqygV3MyHUM9Kmi7jnbdFEKH5Z2ET3JK4Lp2c=; b=jCq9ALOUZ1oIgVuKw3ZicabmhN
	wU4EcLI9o1uZzFojWwWD3A1uixz7ivAJ653YH/ls/j9QMVhO7wNlOCQcabobwdAwELRZu1jiAlHyL
	KYs2nPw6B+bjxEYrkrXIe44PoVnabZTmwE6JEfn1UalcrMJS/S68kR2Abfiftmg31MZNvT5MuF4bb
	oYReLdMPSA8UWpjDeFLEo6eFiJs9rtX+i8v8W5V88d5/pWTWfp7fC1sKqSfiEo9+GiwgfGiJBXAa7
	GbEnKvLhImwrvyYSQT4tbWLMSXtIGnzEWt8Nszb1b/i5SGTxVb9q10Xu7R9pJ7nroBJ7xWdNNjGgt
	3PYCgyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaeM-000FfI-1f;
	Tue, 04 Apr 2023 07:00:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaeI-000FeO-15
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 07:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680591610; x=1712127610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ld2eaAkEDBJ1cLPyuEHukq8mrhlyAnJBQuxn65rZM0s=;
  b=q/T7gKOEI4XAvQmZW7Wgl1m8cUqy6gmug1vdoHw3Do7/RTuD9wT5R2vZ
   F9rK7smSFa7oQ3CbxuiQB50ftjdHcLBqDxSyKwamzxrb++ueqd8C6WwOa
   GQmH0iSY3WpNMoMuEIwAVTeROGmqipbvDJFczPnA9oTvzxcjuMKUuKeU9
   AcftMybLxBnfFWhbGMQ67DhvsY4qcdSxEuyJzmgIBXAyQ3Avu22QkdFjH
   C5ClZKKP4SZlto9xh9fg8vDpnraQFiHpOTagdnHaUk5uW9b3qtPyzkrPw
   ger7AkxoBvpkI4mjbGQwm2dUzEzjCrWNuj/vgRFDEZdW87pKUr8rcNsMC
   g==;
X-IronPort-AV: E=Sophos;i="5.98,317,1673938800"; 
   d="asc'?scan'208";a="207617530"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Apr 2023 00:00:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 00:00:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 4 Apr 2023 00:00:03 -0700
Date: Tue, 4 Apr 2023 07:59:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Christoph Hellwig <hch@infradead.org>, Prabhakar
	<prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, guoren
	<guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <20230404-5cd527745ab99524c5dde42c@wendy>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZCu1tFrQCVe2sgNz@infradead.org>
 <377d2841-18b5-4f61-b675-3a7c2e0db3b2@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <377d2841-18b5-4f61-b675-3a7c2e0db3b2@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_000010_431932_92BE8AA5 
X-CRM114-Status: GOOD (  26.41  )
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
Content-Type: multipart/mixed; boundary="===============6767362489029300356=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6767362489029300356==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZREIQbKvtp6hD4WG"
Content-Disposition: inline

--ZREIQbKvtp6hD4WG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 08:50:16AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 4, 2023, at 07:29, Christoph Hellwig wrote:
> > On Thu, Mar 30, 2023 at 09:42:12PM +0100, Prabhakar wrote:
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>=20
> >> Currently, selecting which CMOs to use on a given platform is done usi=
ng
> >> and ALTERNATIVE_X() macro. This was manageable when there were just two
> >> CMO implementations, but now that there are more and more platforms co=
ming
> >> needing custom CMOs, the use of the ALTERNATIVE_X() macro is unmanagea=
ble.
> >>=20
> >> To avoid such issues this patch switches to use of function pointers
> >> instead of ALTERNATIVE_X() macro for cache management (the only drawba=
ck
> >> being performance over the previous approach).
> >>=20
> >> void (*clean_range)(unsigned long addr, unsigned long size);
> >> void (*inv_range)(unsigned long addr, unsigned long size);
> >> void (*flush_range)(unsigned long addr, unsigned long size);
> >>=20
> >
> > NAK.  Function pointers for somthing high performance as cache
> > maintainance is a complete no-go.
>=20
> As we already discussed, this is now planned to use a direct
> branch to the zicbom version when the function pointer is NULL,
> which should be a fast predicted branch on all standard implementations
> and only be slow on the nonstandard ones, which I think is a reasonable
> compromise.
>=20
> I'm also not sure I'd actually consider this a fast path, since
> there is already a significant cost in accessing the invalidated
> cache lines afterwards, which is likely going to be much higher than
> the cost of an indirect branch.
>=20
> I suppose an alternative would be to use the linux/static_call.h
> infrastructure to avoid the overhead of indirect branches altogether.
> Right now, this has no riscv specific implementation though, so
> using it just turns into a regular indirect branch until someone
> implements static_call.

Someone actually posted an implementation for that the other day:
https://patchwork.kernel.org/project/linux-riscv/patch/tencent_A8A256967B65=
4625AEE1DB222514B0613B07@qq.com/

I haven't looked at it at all, other than noticing the build issues
outside of for !rv64 || !mmu, so I have no idea what state it is
actually in.


--ZREIQbKvtp6hD4WG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCvK5QAKCRB4tDGHoIJi
0u41AQC5LlNjFCo7KuWt5ZFwh4+c+I5y0gSMhl//kBtKQMsMKgD+NN9jEGHmflZR
INGsvjP7dlUKwSSpdNO7N3SeKqmFVwo=
=rvG3
-----END PGP SIGNATURE-----

--ZREIQbKvtp6hD4WG--


--===============6767362489029300356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6767362489029300356==--

