Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D3C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wow/7ThOmLJj83l19PliJ4v1zPVecgwB9X6S5zmFwyc=; b=H4h8dD3FbdEoLXQgnh/GDsEc67
	ZnRo//zpFXP9er6tVjvS+50GWAvSN7GCzwChnaOVvpL57SU6YX8hD4kgJ+sVU6677cyS2v1qOuwEx
	eo7B40ZjDENNuTr6oGvxzFix/4f4KdQrxlWmw93sMbFiNyfvxEtzKzqokBEZq3UJU12rk3O5UgI2Y
	idno2njJAwt9icxPfaL/xxmZ5TFYmurWMCa+T56p0O3iLFxgILi41kJQ8uF0fy+RENmi6rx4WqvRj
	27H6AcX5xfdkMoqOa1YGolOn8SGcU/TNj4ZIXUApVR0Qrq6XjHiF/chiZNLxnmPA3x29LaVvFLS9t
	GsVElqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWc8N-009UPL-IC; Mon, 27 Feb 2023 11:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWc8K-009UNY-EP
	for linux-riscv@bombadil.infradead.org; Mon, 27 Feb 2023 11:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+LvN16KGYk7iDe5AzcBbBdbtn3iYc07lrCr0/NVqCik=; b=Nf6bS51UHopqySLlIIsH4gZlaI
	7yGihwVeRnGxgnhxqRg7XshDikQUCG01jqMPeJBWfSPu2AyFggQSHXROF4rSdkF4HVl0Is1eP75LW
	TUFtjoi6RUslXTNHymcR22uPWp99O0WAWsox0YMB9bIpJnxXyr7vQn4guTEanAiIFHiHEpkEsO7z4
	2HzTcM/yE8TXhto2d/cQ4sldj5GL6wmgUkiHO6Ktm+E3VibG3EDPMTDSQ+bX5cvhlTH+b3axWrsk2
	udUrOPvlWr445FWVnUsJ4BDJB5ZmsFrD/wRqsJ5gd8sBtJ7fvkUBFLV+/YG/2utWqGS6O4H7y4WO7
	bfkSP60w==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pWc8F-00EDhu-00
	for linux-riscv@lists.infradead.org;
	Mon, 27 Feb 2023 11:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677499048; x=1709035048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYWmC+11VkZ07K9SxaUsII3U3gMEbonSgeOzevEiM9w=;
  b=NbshbcRQFKI8eeg8s2u+HOxDthJYPc7mfulxdCBp9xrorO9y4jItH9fX
   87rlnDp7rT+BfgwUgVkZo9x+1oO7TeoV41pPB+p/DZIqewqAjquIMeqII
   W3ryfZV9WE8nn+yv0wfBv17w4RI2prnV0PmxkzOJvnYpYNoQyCvNu642Z
   DTnW2R+7HmpA/FM6gdkLvBS5VIly8TKTLEe7VRueg07S9FL4K4XI1eVFr
   PBBzg+S3bP0sqkv3dDS7oWSUQl88MLLbE7EQsw22dTqQ9+jvmijm0sjXY
   QRwpGFVbJqj+EZ7TN2jI2p6bdanMsdApWtnmojttgcRMSyxRWyzVXvCld
   A==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669100400"; 
   d="asc'?scan'208";a="198902334"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 04:57:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 04:57:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 04:57:15 -0700
Date: Mon, 27 Feb 2023 11:56:48 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <corbet@lwn.net>, <alexs@kernel.org>, <siyanteng@loongson.cn>,
	<robh@kernel.org>, <palmer@rivosinc.com>, <leyfoon.tan@starfivetech.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
Message-ID: <Y/yagE7jfRGo1FgY@wendy>
References: <20230227105941.2749193-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230227105941.2749193-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_115727_854696_1E1A8CA4 
X-CRM114-Status: GOOD (  15.43  )
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
Content-Type: multipart/mixed; boundary="===============1929429015146575580=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1929429015146575580==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qu+vqTjLVyvhigH7"
Content-Disposition: inline

--Qu+vqTjLVyvhigH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 06:59:41PM +0800, Song Shuai wrote:
> This commit 7d2078310cbf ("dt-bindings: arm: move cpu-capacity to a
> shared loation") updates some references about capacity-dmips-mhz

Not requesting a respin for this, but mentioning commit 991994509ee9
("dt-bindings: riscv: add a capacity-dmips-mhz cpu property") is
probably more relevant as a justification for this change.

> property in this document.
>=20
> The list of architectures using capacity-dmips-mhz omits RISC-V, so
> supplements it here.
>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  Documentation/scheduler/sched-capacity.rst                    | 2 +-
>  Documentation/translations/zh_CN/scheduler/sched-capacity.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/scheduler/sched-capacity.rst b/Documentation/s=
cheduler/sched-capacity.rst
> index 8e2b8538bc2b..e2c1cf743158 100644
> --- a/Documentation/scheduler/sched-capacity.rst
> +++ b/Documentation/scheduler/sched-capacity.rst
> @@ -258,7 +258,7 @@ Linux cannot currently figure out CPU capacity on its=
 own, this information thus
>  needs to be handed to it. Architectures must define arch_scale_cpu_capac=
ity()
>  for that purpose.
> =20
> -The arm and arm64 architectures directly map this to the arch_topology d=
river
> +The arm, arm64, and RISC-V architectures directly map this to the arch_t=
opology driver

My grep clearly missed this change, thanks.
For the only part of the patch I understand:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Qu+vqTjLVyvhigH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yacQAKCRB4tDGHoIJi
0jMuAPUS3U8wKt0dDvUC5JFcU2VrD5RRUuYkkJESmDvd+oMvAPsE9NZjwV40Eqvv
MRChuLnLfK6qyIngBouG73xf0TMeBQ==
=v5xR
-----END PGP SIGNATURE-----

--Qu+vqTjLVyvhigH7--


--===============1929429015146575580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1929429015146575580==--

