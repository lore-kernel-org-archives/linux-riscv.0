Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCDAE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5WWjx33LGFSqrX/XEUlopwZqpEvViiv3HdoBPQBW1U=; b=z+bHLzDlvOVI4ZK6q9MaRRYX2U
	RSWILsf/5EvM+JczSmc8hSESith9EaygY2XWPSrqOF0aLEWCF713J/gL8qVcHup5eF20MOEz46hJr
	0+KoRSGVTwiw/VBbGDxJUedOSLcJaWTlFBJKL8dUndLD6kuyWxcicpI9YQPkzGFYyUbDjDno+NIrn
	+DKKFLcDRgTMnjzYZeGBXHHYhTJtV/3WCCW+T+kEt7Ou9L68Uni9h0QMd6Nl/380LuukQrjbzPDr3
	loEFEFdDzxbFeq696EYviWlTEL3mUkWNAFzxLNV4Zs4HCcEbY562Sdd55GK0Yje9L/Jne9dYJT8y+
	wZuj84PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN88X-00000009fmz-3Yht;
	Mon, 16 Dec 2024 10:15:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN87J-00000009fTl-0lhI
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 10:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734344060; x=1765880060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oevHNvEMytCO/w2BsyOZ5rIUF1D5BkzLPG8TAKcZOmA=;
  b=OKTG/IeU2mGupOcZnVosTCYNcf77SamsjfCAfgKzDJcf67Tn8q2E5yRi
   Pc/kxOv9JxyvCAAOBgfEkn3rNsoUGUAoD49d4OFQxRzrqL87mRmos/a0w
   CuthE7RJBZnUC14BHDADu2WXeU22yr0wJ/KYJqVjzQSeNmqMLTqO6mJl8
   gSkx0ZMLY8RNkCMZrAHM6W+33RL+w+jRboMCnrkTBt6PRapUH5et3LwjJ
   k5sB6xR+/hYOFD9ZtV5VvuPkS3qLXCikyI0ES410CDARxFSu8eiUosNUA
   MMlX3sZBjvNeOoEi1HhFrYkayIbai+nL7prLdSFFoHn9eSHBAuYLIPSYg
   A==;
X-CSE-ConnectionGUID: 9L0TMu2tSHCHWfhN2S/CJA==
X-CSE-MsgGUID: S8x2wtMjTUSVspMwc6qKYA==
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="asc'?scan'208";a="203042226"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Dec 2024 03:14:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Dec 2024 03:13:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 16 Dec 2024 03:13:36 -0700
Date: Mon, 16 Dec 2024 10:13:04 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Drew Fustini <drew@pdp7.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto
	<inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Yangyu Chen
	<cyy@cyyself.name>, Anup Patel <apatel@ventanamicro.com>, Hal Feng
	<hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: Re: [RESEND][PATCH] riscv: defconfig: enable pinctrl and dwmac
 support for TH1520
Message-ID: <20241216-video-bush-7239b0cf29a3@wendy>
References: <20241216003114.326129-1-drew@pdp7.com>
MIME-Version: 1.0
In-Reply-To: <20241216003114.326129-1-drew@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_021421_490511_243366D3 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: multipart/mixed; boundary="===============3082410267708456913=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3082410267708456913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LtjecBICw5GPZ6x2"
Content-Disposition: inline

--LtjecBICw5GPZ6x2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 04:31:15PM -0800, Drew Fustini wrote:
> Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
> the BeagleV Ahead and the Sipeed LicheePi 4A.
>=20
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
> I am resending this patch since it has been about a month. It is still
> listed in patchwork in the "new" state:
> https://patchwork.kernel.org/project/linux-riscv/patch/20241113184333.829=
716-1-drew@pdp7.com/

I'll grab it.

--LtjecBICw5GPZ6x2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1/9MAAKCRB4tDGHoIJi
0l6dAPoD8yjJYupWC+472YD6A0TQiaMgAe4s2XxkxxkbysfjDwEAw/hOnW9hjfxm
Rs263BzlAUFvp4rwZbRVqNf9SsJtAQQ=
=h0DQ
-----END PGP SIGNATURE-----

--LtjecBICw5GPZ6x2--


--===============3082410267708456913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3082410267708456913==--

