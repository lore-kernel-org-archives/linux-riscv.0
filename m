Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F1C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVCVaEty04uAAgEbMZKmuvm+qbuhmhenA1nbJw2NNiA=; b=v6hkHcWpMIXClhpROjb1rmAe8k
	6sqCwIBB5DsZAjXH6JSAsF48Dix9KgiNXAlqac3rJNCSAclorE5W+Qlxbp+Uqr3h/yr42xsBxZf1l
	fNLJx8PQGN9ouqAk1R9EouZ9pkQbVaiJbUxw9gVlms7p6oGdGnGsQjfGrLu2gEoJZ1NueAXP24KVQ
	6vzBzoNacxKceIcXEmE2gnKaVKaLc9jiEoG+U7wyJQHmOVhXudS0p79at1HeoFZ/M43Rkkrq7iVxY
	rBhdJhiNU1MXRAVPFXO/RTQo+gqGifZkVKc59lSmlUYqtc6vWNBJmDTp9QVtmFryqPHwd1DKSpBbx
	PC+2lzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnB5-0000000H3He-2FxM;
	Wed, 06 Mar 2024 09:03:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnB2-0000000H3FN-1aO9
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 09:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709715784; x=1741251784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uV64QgV0J/+QZOGrjbCPihXYSBl0rMMCx3JYQNRjgpQ=;
  b=OCPru/fLr4vtFwkdD8z3eyyxLC68fcBtTxqbAArqopj87JRiU3eczmaT
   AC6ugC2xGLNaIvIn+oSYi8L4RN2iyeuEfRtz5LPk16TPSQ1S68G3P1Z7V
   ascEzgecPjWE2gElAQGgHIbkQNZ+nj39igM+oL2tPwtyxjMcJ1aloXn7u
   6FCg94EQ5pqJCN/k250EPkBcx+05x5vSeioNG5qcv06+rfn9/T3GwtvCo
   phJlX6KDd3rxGSsB9BtsZQYbf1QswDATZUCNL9yDV5wJHLaLcOZ6/t8Ar
   P1CqV3ZiYjjxdDf0ZWdxbfEebcFCsOwU6P+E29GvUuTC1x0pDB+OoJT/F
   Q==;
X-CSE-ConnectionGUID: 4dqBU33OR6GCmN6Rg1LReA==
X-CSE-MsgGUID: ker7b5MQRvW9rJIKupvRzQ==
X-IronPort-AV: E=Sophos;i="6.06,207,1705388400"; 
   d="asc'?scan'208";a="248037788"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2024 02:03:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:02:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 02:02:46 -0700
Date: Wed, 6 Mar 2024 09:02:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ardb@kernel.org>, <xuzhipeng.1973@bytedance.com>, <alexghiti@rivosinc.com>,
	<samitolvanen@google.com>, <bp@alien8.de>, <xiao.w.wang@intel.com>,
	<jan.kiszka@siemens.com>, <kirill.shutemov@linux.intel.com>,
	<nathan@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>
Subject: Re: [PATCH 1/3] Revert "riscv/efistub: Ensure GP-relative addressing
 is not used"
Message-ID: <20240306-zippy-magazine-9a4ecfe1758a@wendy>
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240306085622.87248-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_010304_468893_305F04D8 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Type: multipart/mixed; boundary="===============0158617178450825233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0158617178450825233==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UQFtTkia6S6WEuRu"
Content-Disposition: inline

--UQFtTkia6S6WEuRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 04:56:20PM +0800, Yunhui Cui wrote:
> This reverts commit afb2a4fb84555ef9e61061f6ea63ed7087b295d5.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Reverts are commits too. You still need to write commit messages
justifying the revert.

Thanks,
Conor.

> ---
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi=
/libstub/Makefile
> index 31eb1e287ce1..475f37796779 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -28,7 +28,7 @@ cflags-$(CONFIG_ARM)		+=3D -DEFI_HAVE_STRLEN -DEFI_HAVE=
_STRNLEN \
>  				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
>  				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
> -cflags-$(CONFIG_RISCV)		+=3D -fpic -DNO_ALTERNATIVE -mno-relax
> +cflags-$(CONFIG_RISCV)		+=3D -fpic -DNO_ALTERNATIVE
>  cflags-$(CONFIG_LOONGARCH)	+=3D -fpie
> =20
>  cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+=3D -I$(srctree)/scripts/dtc/libfdt
> --=20
> 2.20.1
>=20

--UQFtTkia6S6WEuRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZegw/QAKCRB4tDGHoIJi
0ufrAP0fOFW/zftAQMBV1enoDhJMzqNOQWXj+pDwdOj2qTybjwD/exFfXude+jUl
xvXn4DE7ZGib8U52zF+vq1DDE3/XmgM=
=eSX3
-----END PGP SIGNATURE-----

--UQFtTkia6S6WEuRu--


--===============0158617178450825233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0158617178450825233==--

