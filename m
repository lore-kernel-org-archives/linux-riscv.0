Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E746C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noHAzYfcO0xtawzvVxRUXgpAWeqMQHqqT2rNavFkyWY=; b=OjLaGqegflqjT92wS1rYsea5dl
	D6w07q7sMjfmQbsQqe3cBcz6CF9pkwLqvcu9wbAfa1UlpjEoNETqDaCvkBH1ERxtrgHqzc+/L8Oqi
	reHvkRSzdZx60nKjj/jxos97QGRpUJ6vMLj452zRKMvjLsWJ9j1uoQU8icDrQIXUfI87Dn5NO0ofg
	7nrblwB++B4aNk74RFv5iTmldFMzPA54IJ0UjMOHU2C7ETY9dPKmS54V6fKiFT3Db+S5RnWVOC/6d
	01hWtp4HMEWcANJ4OjdUkATMHVbkW+/F02X6jc7UDxZpTIAirt465CuHoLUnWphWbDcYvGTEWbiCa
	xo4O7XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImPM-008wIb-Fx; Fri, 20 Jan 2023 08:05:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImPJ-008wHQ-Bu
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674201954; x=1705737954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/vFMlrK2KnqeufhmqNtiNZik2hNdR9y2XiFORuw/PQ=;
  b=QlP4yYJ/HkpPbLibBNcmskWIQfelMpnb4LoO/uZbU4r2XRm0y/RRjKg3
   m3tGWqmJOKiSt7zz4iRNeELwzLJeen6gmN6u8SO5i1YAwGd0gse+OK1ta
   raxtJ+s8+fyINqSz2V/lQ9l2asiAJfma7cerS3bRU8MmyhCoVl1ILOnYq
   5OWtaEYyeC2nDFUu7tNMLgp2/Yk6vJD8GCeU78Wnz28sCW3u0TZWPbZN6
   S9zlG3ZT02+mCTygS8tKACrc9PtROYjUGSV06kCiwpDsCmTGOLIW41oZF
   ZHdW9ObIaA+e+pulolKSNh6wVZCoRh0pXQOjYvUVB5tLf+EGt/a47blpP
   A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; 
   d="asc'?scan'208";a="197592595"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 01:05:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 01:05:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 01:05:50 -0700
Date: Fri, 20 Jan 2023 08:05:27 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <mr.bossman075@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Yimin
 Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 2/2] riscv: configs: Add nommu decfconfig for RV32
Message-ID: <Y8pLR7CUad2eLe+A@wendy>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230119052642.1112171-3-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_000553_501665_821C8B26 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Type: multipart/mixed; boundary="===============1366541383249566740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1366541383249566740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GLd6KBy4q8LeeBDp"
Content-Disposition: inline

--GLd6KBy4q8LeeBDp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jesse,

Same here w/ a single nit.
I'll leave judging whether supporting rv32 nommu is worthwhile to others!

On Thu, Jan 19, 2023 at 12:26:42AM -0500, Jesse Taube wrote:
> riscv: configs: Add nommu decfconfig for RV32

typo: defconfig

Thanks,
Conor.

> 32bit risc-v can be configured to run without MMU. This patch adds
> an example configuration for RV32 nommu virtual machine.
>=20
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Yimin Gu <ustcymgu@gmail.com>
> ---
>  arch/riscv/configs/rv32_nommu_virt_defconfig | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 arch/riscv/configs/rv32_nommu_virt_defconfig
>=20
> diff --git a/arch/riscv/configs/rv32_nommu_virt_defconfig b/arch/riscv/co=
nfigs/rv32_nommu_virt_defconfig
> new file mode 100644
> index 000000000000..460907253a80
> --- /dev/null
> +++ b/arch/riscv/configs/rv32_nommu_virt_defconfig
> @@ -0,0 +1,16 @@
> +CONFIG_BLK_DEV_INITRD=3Dy
> +# CONFIG_MMU is not set
> +CONFIG_COMPAT_32BIT_TIME=3Dy
> +CONFIG_SOC_VIRT=3Dy
> +CONFIG_NONPORTABLE=3Dy
> +CONFIG_ARCH_RV32I=3Dy
> +CONFIG_BINFMT_FLAT=3Dy
> +CONFIG_SLOB=3Dy
> +CONFIG_VIRTIO_BLK=3Dy
> +CONFIG_SERIAL_8250=3Dy
> +CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_OF_PLATFORM=3Dy
> +CONFIG_VIRTIO_MMIO=3Dy
> +CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_PRINTK_TIME=3Dy
> --=20
> 2.39.0
>=20
>=20

--GLd6KBy4q8LeeBDp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8pLRwAKCRB4tDGHoIJi
0kg2APsF9EWMCh3V0/jjH/xYpiSbRuTSUV5wrKfqJH3ToQ7IWwD/RJR7Rut4vZTe
BQoyi9Tt2/66Fk2/IAg2KAkUwC9x+AE=
=yXNl
-----END PGP SIGNATURE-----

--GLd6KBy4q8LeeBDp--


--===============1366541383249566740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1366541383249566740==--

