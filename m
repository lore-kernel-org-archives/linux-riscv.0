Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCF2EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYVjGnLbdKdM/XoWGYG2uhpVfifvxTVZfhG/A7qFpQM=; b=hURSpwPxGTdJ1tnlEEF0v6JMfD
	w5/BgpoUm/LHILgL+L18IoqlOMXIoTN5MumoZRODJlfjCvxlTEoRBjpqlGTZQCqr0N62dLZoJoynu
	Nuv+5JRpX5vFMm7baXgyE3O0Vb5sGofP7oLEDAUtm8ZnlucXlRbC686nPlggjaBVOM+MVrvEBxqzJ
	ybny8n0iqshvybaOoY8STyStpctLdkFTyYZrqU+ZGeb+AOanPfrkzQrudAwLDc50I6FEf7EmUQrTJ
	NEQi2H3OKYyN+mBmc3Zrt32MyR6pwl8XacO+XAINLkibrxO+kcnA0Gv68y+LgGbjWTYOuHTHCqKkf
	mKlj0QGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLQp-003kUl-2U;
	Mon, 17 Jul 2023 10:26:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLQk-003kTs-0U
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 10:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689589573; x=1721125573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iQ/N0neoo3P+j/z0OFytHjUq51WtcpqGqKCzyRI+I4Q=;
  b=u0TUAWbctLUpnRh7tgAlDhb0a8LLAE13sT8qxWiSa92hQd5NBvOwST/U
   wPRgs+n4UtTBEuzJTEZTNSQlk2X7Of2p8Kg2InJegS9gjfWoKyQRBUWYX
   LmcZWuGCHjHCA97HgZMttQKJXZVqr4el/KDuUNEYxrbbghI9Fur3z2d5l
   CLrDNZAf50tkxJRPm0RAJ3Z4Y6RRyYBNQ/cXhErpVg9eazP/oLI2++aJn
   iVBDCdWa+SZpJabTkv5/rEnxhLwDqGsQy7IFdZygOh3OvfTYHQLkGP0xQ
   IxaVVtog3LReSJC4Z3KP3knLFAHcMAGA88p2zC6Qr3WQ7WaPguupngkak
   w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="225003783"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 03:26:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 03:26:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 03:26:06 -0700
Date: Mon, 17 Jul 2023 11:25:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Han-Kuan Chen <hankuan.chen@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [v1, 3/6] riscv: Add vector extension XOR implementation
Message-ID: <20230717-sedan-tiara-b7013d409ab8@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_032614_271962_7EDDEB41 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Type: multipart/mixed; boundary="===============3072276052720340320=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3072276052720340320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I8okW/+Zv6mSc1/p"
Content-Disposition: inline

--I8okW/+Zv6mSc1/p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 03:00:29PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch adds support for vector optimized XOR and it is tested in
> qemu.

Since this patch was originally written, has it been tested in hardware?

> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/xor.h | 82 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/lib/Makefile      |  1 +
>  arch/riscv/lib/xor.S         | 81 +++++++++++++++++++++++++++++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/lib/xor.S
>=20
> diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
> new file mode 100644
> index 000000000000..81b8837fa161
> --- /dev/null
> +++ b/arch/riscv/include/asm/xor.h

> +static void xor_rvv_2(unsigned long bytes, unsigned long *__restrict p1,
> +		      const unsigned long *__restrict p2)

> +static void xor_rvv_3(unsigned long bytes, unsigned long *__restrict p1,
> +		      const unsigned long *__restrict p2,
> +		      const unsigned long *__restrict p3)

> +static void xor_rvv_4(unsigned long bytes, unsigned long *__restrict p1,
> +		      const unsigned long *__restrict p2,
> +		      const unsigned long *__restrict p3,
> +		      const unsigned long *__restrict p4)

> +
> +static void xor_rvv_5(unsigned long bytes, unsigned long *__restrict p1,
> +		      const unsigned long *__restrict p2,
> +		      const unsigned long *__restrict p3,
> +		      const unsigned long *__restrict p4,
> +		      const unsigned long *__restrict p5)

> +
> +static struct xor_block_template xor_block_rvv =3D {
> +	.name =3D "rvv",
> +	.do_2 =3D xor_rvv_2,
> +	.do_3 =3D xor_rvv_3,
> +	.do_4 =3D xor_rvv_4,
> +	.do_5 =3D xor_rvv_5
> +};

Same naming scheme comments as the main vector patchset and 2/6 apply
here too.

--I8okW/+Zv6mSc1/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUXHQAKCRB4tDGHoIJi
0mEjAQDgPG6h0Uww/sPGqtRqRuINX3mNtql0WM/nFK4mCE1/awEAlER/qMotklWN
5aA7/iX7wXtwsdpu/ow3ZZITZq83MQo=
=Zz+H
-----END PGP SIGNATURE-----

--I8okW/+Zv6mSc1/p--


--===============3072276052720340320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3072276052720340320==--

