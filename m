Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35CC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiTynBgUiKEoMiMa6Ro3NxBJuLx3p+6oRcUGXnMo9ig=; b=WqSJx/6U57w2/RVbcJoTq/YYLt
	dk8o1QUNs/0eEWHlQmRq1Wk/x3rMBc1g1s4T3EsXrEqZfhrJX0wIBd5ynOOiBJ2JSsRjfS3gTbAmG
	W8xPQR8cfxgHvFM9/i3PryLH4eu3Sgq2J231Xjkh7FGL9F2wl2tbOLhoyhTiwYkkoeAWiqbnEqPRX
	HcKxTVwU2SeDQAV2yQrfk3nRMTaF9bPCPwucZJijI7QQWkiZE23u31ZC4VpgOX1r0075l/aRnsJlC
	tv8dlOg+/psDBJjnqBQKvSjB1/8qAczMdzCIVaoa4FpqnMdh6YSuDyvVF2WgrMpZEV4xD7P/lkX/Q
	EnDWqjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYNy-004l0m-NH; Mon, 30 Jan 2023 17:56:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYKT-004jOj-Dp
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 17:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675101150; x=1706637150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwEKN/1p4eWTFuG/cB1MKqkiGvRps+1/UwCIq8nALKY=;
  b=v3szeAJWGCmOImHLqlLuGhyV8BObLhLliRow/nqaR6IOc05BAsPF8oGH
   MbwF74wspoj0ar/pRqoUUNNJNgrLA+YkSBGwI3ooSq7qrIKQ4JCoqNMGh
   uSpvP+SmSImUu+Gw3mrJrg8DxphqvnyxcyLYB/dvQo/YTJj1f9FZEy9h5
   9djJxdVC+OqeCSjpuz27yhFAKNW4srFSIldu4zGScFSD01F4BkuphhQg6
   qpqLUnEWi9ncsfYynsUeyRfjY2kspkh3y3jl0/8O4yap8GM9rQakB1zvX
   8eGQwtADhZAIXYJ1U3TOgcxOOBsWnM2HpqOW1hZ5h4fAHwcS7KiTzFhkw
   g==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; 
   d="asc'?scan'208";a="194421175"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jan 2023 03:14:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 03:14:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 30 Jan 2023 03:14:49 -0700
Date: Mon, 30 Jan 2023 10:14:25 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jinyu Tang <tjytimi@163.com>
CC: <palmer@rivosinc.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<yuzhao@google.com>, <ajones@ventanamicro.com>, <guoren@kernel.org>,
	<tongtiangen@huawei.com>, <anup@brainfault.org>, <akpm@linux-foundation.org>,
	<falcon@tinylab.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
Message-ID: <Y9eYgSnTmI168933@wendy>
References: <20230129064956.143664-1-tjytimi@163.com>
MIME-Version: 1.0
In-Reply-To: <20230129064956.143664-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_095229_570054_33B66357 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============3550244610406084863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3550244610406084863==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="anvknZz1ArHLm8XG"
Content-Disposition: inline

--anvknZz1ArHLm8XG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2023 at 02:49:56PM +0800, Jinyu Tang wrote:
> The arch_has_hw_pte_young() is false for riscv by default. If it's
> false, page table walk is almost skipped for MGLRU reclaim. And it
> will also cause useless step in __wp_page_copy_user().
>=20
> RISC-V Privileged Book says that riscv have two schemes to manage A
> and D bit.
>=20
> So add a config for selecting, the default is true. For simple
> implementation riscv CPU which just generate page fault, unselect it.
>=20
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  arch/riscv/Kconfig               | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  7 +++++++
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..17c82885549c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -180,6 +180,16 @@ config PAGE_OFFSET
>  	default 0x80000000 if 64BIT && !MMU
>  	default 0xff60000000000000 if 64BIT
> =20
> +config ARCH_HAS_HARDWARE_PTE_YOUNG
> +	bool "Hardware Set PTE Access Bit"
> +	default y
> +	help
> +	  Select if hardware set A bit when PTE is accessed. The default is
> +	  'Y', because most RISC-V CPU hardware can manage A and D bit.
> +	  But RISC-V may have simple implementation that do not support
> +	  hardware set A bit but only generate page fault, for that case just
> +	  unselect it.

Hmm, I am not really sure if this is the right way to go. Should we
really be defaulting this option to enabled if there are going to be
implementations that do not support it?

Thanks,
Conor.


--anvknZz1ArHLm8XG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9eYcgAKCRB4tDGHoIJi
0v50AP9BruHvX+Vp+nv8nNnUUgTJCFqXa+miF0OX6/LB2A5BlAEAtWmDrHHF+wUL
CZA1/N+0ovdarfkIEMX76O7HnBKe1QE=
=RCMS
-----END PGP SIGNATURE-----

--anvknZz1ArHLm8XG--


--===============3550244610406084863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3550244610406084863==--

