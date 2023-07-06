Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42876EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNGp6SrMb/1pLXrXwfvuAKAztyTDgGeFfHaZs3yOpL0=; b=FTaW0R6tvuMqXymY/WbYfwZnBn
	EGbcikfwItKqJAKV5KYBeHu2mzgeh0aVfsAq81mDDW/ZD6X6sXEawxbGNbJUtw/4huFUsEoOtLyOa
	R1tayjihb+rT4hZXfO+jYiktf3tyjgUHyck+AnBgGe6PCYN+CqIXhBw+MkTcFkGWFq4czcXSBbR/c
	8mqu5DrdekjYitm5K9oMEHRA1KTdCLVpeAHUFqs1DJucFJPVR8NqQtcGjho6N2m1DmJXM71vKctQk
	4Aor9zLQbrC0QpiiNxz5og/4VHXuvJFyiFu/f1JTrv6sMiPsM4Zfr4V5kLhspU8zQ0ZzCpf99S9Yo
	HKhccMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHP7G-001mLO-07;
	Thu, 06 Jul 2023 13:33:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHP7C-001mKf-2n
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 13:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688650427; x=1720186427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQYAGOy4mHGCVmcTL61GMJ4UBsZ5/jjfANV8gUIZHI4=;
  b=UvTCbHrp1fNbD33lQjN6NUrEID5VLnkuF6Z7ZOiR9ZPMKibAsNQW+T//
   61QjUavt8WmSojr2NUE29dYVRFLSiVDvLQs7AyADFhxVZlgM5IwigCn2b
   V+XkWU03WMB7umFRkOo4JLqCOhVuNPytNZkayGT/zQTc9y2lMS7n9WGlG
   SFgjj93INmjBw3NhcvPqR45RxvVOPCBqsjfrr0xofvoO7t27f3MEB4Rhj
   ug1yApqzIDn5d76n1PZqPfHg9dq19CK2kEuYcl+lvo7hVcfDdK78Gdwqf
   hmjz5UZX0CtRLDXRLkoekdyA7v2LXB6a4Yg4J95dGFx5n+54jG2dm9zRO
   w==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="asc'?scan'208";a="219183784"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2023 06:33:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Jul 2023 06:33:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Jul 2023 06:33:32 -0700
Date: Thu, 6 Jul 2023 14:33:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Ortiz <sameo@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux@rivosinc.com>, Andrew Jones
	<ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup
 Patel <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>, "Hongren
 (Zenithal) Zheng" <i@zenithal.me>, Guo Ren <guoren@kernel.org>, Atish Patra
	<atishp@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Implement archrandom when Zkr is available
Message-ID: <20230706-putdown-unedited-012eafe854f6@wendy>
References: <20230628131442.3022772-1-sameo@rivosinc.com>
 <20230628131442.3022772-4-sameo@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230628131442.3022772-4-sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_063346_967672_A8640245 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============0082982920902936432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0082982920902936432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jHRuTEvE7B4wrY25"
Content-Disposition: inline

--jHRuTEvE7B4wrY25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 03:14:35PM +0200, Samuel Ortiz wrote:
> The Zkr extension is ratified and provides 16 bits of entropy seed when
> reading the SEED CSR.
>=20
> We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> that CSR and filling an unsigned long with valid entropy bits.
>=20
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--jHRuTEvE7B4wrY25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKbCjgAKCRB4tDGHoIJi
0rUUAQD2SibyQT5ig13MedvYPovD5MwTLc3X3FPiCRKhEyiGNgEAxh2SNdG5Av37
RK24M0lgtLEsw/YArvcqo8AUYAdAIA8=
=Pwkn
-----END PGP SIGNATURE-----

--jHRuTEvE7B4wrY25--


--===============0082982920902936432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0082982920902936432==--

