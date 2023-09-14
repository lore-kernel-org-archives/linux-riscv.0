Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00515CA0EF3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJbcxMshkXynYbevzWpmOL3+ThlBmAWoUHloDmlNtXE=; b=mpSsrX1bQVDx5ciK2DT3YJ2md/
	0xSLGiUgrwoteXPTopkAxYZXnkNDWlf4UAPFWJqPYGB3wsN6LAF0tShiXrssVNSkWAL07WJEPP4lb
	2NN7RbYzbciem9DAmBtZCAZ7YXzdPaKdLjNYIyuWZsrXow3vR3rE4iG3O3EQncFldThR6mxyDI7sJ
	7+Ooblqs788l3GWHi2M2o5X6KiweQ+b3wB6TV2TxzAXgiqjE/Jg2dCG2XVxwqbkEqWsJbI0nYE7dk
	yaLS9Yu+U0zMQmG6fEOEKx/fvJf2SW1QkQYeUTs4/+Cn/CVFwT3DWR3R1g9g8f4fr4eROF2mMMjLm
	7sQ5ocdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglku-008N0T-0C;
	Thu, 14 Sep 2023 12:47:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglkl-008Mye-1l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694695647; x=1726231647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tMp3otj0E3N1naQgnjsWYmftiJNjCbwcCEIwK3540lA=;
  b=nO9It1vTUuXkVntpVYFyuTpS0uBwmHUf8S35VrPJvs7Ge8KfbxEB+7O3
   DlydRNrpBGk11vXb2Bbci0NZXtz6uyo+PuWpZ5K7NJnqdj9HMnqiOzlvE
   IesJQW/aJTdYIcqZB9J/bdqVTywTWuVS7LCsYUTshBIe/Le/IN7LGlgyY
   lbaO++tr5QVPR6GsNneCKLqmuUbc6SOP6t9J9o16nRkfbD3wjvzIxy61V
   7bQ38BeErHaED8LGqp9DBc/ky8ybFAj2XIlRQY/R4cm+Kiq/I5VZdpOOY
   R0cGRaK31M6SUNLL6aR6/pKSDfKIUk78r9xWkBNbXOMvSL2wy1TlVAshI
   g==;
X-CSE-ConnectionGUID: lkrc8tYBQW+sSqrl8F8mbg==
X-CSE-MsgGUID: vLu6P7iFQCiOKWUeCiVYmQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="4824435"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 05:47:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 05:46:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 05:46:45 -0700
Date: Thu, 14 Sep 2023 13:46:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <20230914-pennant-obligate-db3adf056281@wendy>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_054727_699793_056BABAA 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8073666272872245644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8073666272872245644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KDMf+6JZIfT6eNsC"
Content-Disposition: inline

--KDMf+6JZIfT6eNsC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> This patch is not ready for merge as vector support in the kernel is
> limited. However, the code has been tested in QEMU so the algorithms
> do work. This code requires the kernel to be compiled with C vector
> support, but that is not yet possible. It is written in assembly
> rather than using the GCC vector instrinsics because they did not
> provide optimal code.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 47d98c51bab2..eb4596fc7f5b 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -12,6 +12,10 @@
> =20
>  #include <net/checksum.h>
> =20
> +#ifdef CONFIG_RISCV_ISA_V
> +#include <riscv_vector.h>

What actually includes this header, I don't see it in either Andy's
in-kernel vector series or Bjorn's blake2 one.
Can you link to the pre-requisites in your cover letter please.

Thanks,
Conor.

--KDMf+6JZIfT6eNsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMApQAKCRB4tDGHoIJi
0mhkAQCXmf4t51iUccwMbirqaRqdZmk8Yzcti0AGOXOg+2IUZQD/UOoVsc8T1wQw
644D6sgHFMl2lPtyh7o/BcKqkMHoYgA=
=61Sl
-----END PGP SIGNATURE-----

--KDMf+6JZIfT6eNsC--


--===============8073666272872245644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8073666272872245644==--

