Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD17C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTvgSu8zgepxPCs3yOmzBeYq81Sz/z1G+RoDyloFRoA=; b=3akE5P8m4y4wVCNvSjbZJkcXdx
	WKK9ZpmcOh/I7vk7DJWwuOCWrg3kMaV+WyBxTrFzcD8N6n0T6s04yG6pMUEfGySB9KB/HZcGBMttS
	fQ8yTatLj1oAy6isCeBJLI4oiDwNwJWtou7frutwYIcwZIDaBv4qWDBruyEDH6yTaBbz4jMPlQ3tW
	zgh5KAX/T1njBteWmP7+weOvzmaG6/pjuUh6+TnHUoM30bKerIgnQrkmECaRrnhHI+Z86MQeFjLjS
	Fr2XlQ217sklO31ZAFKf8IAAdyVw5QwfTk4YJY86MGmAF8OAqUVCi+wV9WBxb9IYjwlyDtafOz5LZ
	h2NVeU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjdK-004jJX-1I;
	Tue, 31 Oct 2023 07:57:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjdI-004jJ0-0L
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 07:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698739072; x=1730275072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eiDnUW4Kn/odss8/DbdMU36YzLZTMzt2HhmARUpQoCE=;
  b=M6+zZ2tWQrqa2FIRl/v7muKU9oOUNddOz6uIihZcnF5UpMpTT8aXrjvm
   sQJkcOJHlvHPnp8TB1EfIvCw3zvSzIjkZnNyMkrVAf+zXr4TF/Z99d2Nb
   x6+/bgo/Y5RHlUe1dHPeiFVIRI40D8BQhlQ1rx9Y7pWUxggzJHDfSjkiy
   bSFD5tKRSydtPrVILL4CNt9Nf62dkuCl8QaTsFI4lCN4Wy7+EO+WYTe1r
   zmOqUFr+PWqmdgeqhaAGYCmET8OgH84hcXmnCjJGkAVhns+5k8g+mFBPD
   452/Q26Xxk05fsOUgS4MhyVpEtJJTm7Vh57hwboFRNnxwJxgeN5fdNUCC
   g==;
X-CSE-ConnectionGUID: oOYSTJdaShisXPhp1E4W2A==
X-CSE-MsgGUID: 9QGEiL/2TtG25dQLEbKR6A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="asc'?scan'208";a="241617896"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 00:57:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 31 Oct 2023 00:57:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 31 Oct 2023 00:57:43 -0700
Date: Tue, 31 Oct 2023 07:57:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>, David Laight
	<David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, Evan Green
	<evan@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>
Subject: Re: [PATCH v8 0/5] riscv: Add fine-tuned checksum functions
Message-ID: <20231031-shrouded-simmering-e60d23d17fa3@wendy>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_005752_152685_85FDAF54 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: multipart/mixed; boundary="===============7323899446186966413=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7323899446186966413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qRR1lRF7FS8U2Elp"
Content-Disposition: inline

--qRR1lRF7FS8U2Elp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 03:43:50PM -0700, Charlie Jenkins wrote:
> Each architecture generally implements fine-tuned checksum functions to
> leverage the instruction set. This patch adds the main checksum
> functions that are used in networking.
>=20
> This patch takes heavy use of the Zbb extension using alternatives
> patching.
>=20
> To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
> and RISCV_CHECKSUM_KUNIT.
>=20
> I have attempted to make these functions as optimal as possible, but I
> have not ran anything on actual riscv hardware. My performance testing
> has been limited to inspecting the assembly, running the algorithms on
> x86 hardware, and running in QEMU.
>=20
> ip_fast_csum is a relatively small function so even though it is
> possible to read 64 bits at a time on compatible hardware, the
> bottleneck becomes the clean up and setup code so loading 32 bits at a
> time is actually faster.
>=20
> Relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@rivo=
sinc.com/

Not sure if the dep here is related, but the series is back to failing
to build properly. Patch 3's build is broken everywhere pretty much, and
patch 4's allmodconfigs don't build:

https://patchwork.kernel.org/project/linux-riscv/list/?series=3D797256

Cheers,
Conor.

--qRR1lRF7FS8U2Elp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUCzXwAKCRB4tDGHoIJi
0gTuAQCn9o4GuOxKhaiu5W8NOQuoO/gxx0KouCaKxas8K9dn4wEA1y5FNvh1iWAg
XUdMgxRn+G362ufQfEH3gDx1oLZImgE=
=YvhH
-----END PGP SIGNATURE-----

--qRR1lRF7FS8U2Elp--


--===============7323899446186966413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7323899446186966413==--

