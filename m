Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E9C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKKA/wHhFcxFLQWjdqkv5CAluNg2ctp7/Ul5TXgqV+k=; b=V8uYp6FxgMYVZcMVsByDbU0d3n
	muwLRDUoaUG8cuIrnoqejKs0MpetwMyWQGgjonUzdb1uLXAU6uHSA/hWuhAnPIgrFRV1UUwtk/234
	cu9VuEblCkO0m5BldsoPmfIFGOfjeFb5N7pOOEaTAagDa+cBq/mLF/v6MCWUZQJS3gBPUbjF1yIID
	3qQZlUv+XqyrzkrvJX/sCyMU20+803HdX8MEGdSwuJaXywIdM6q+6lVIPAOv8FTRNqaYvIPrGx7Og
	CIlPIvMiHwhFsVq7MTlalZQHGRYce3JUytbqJnhRTwkVLIhViq8I23TfIzaHXo0dy1guPLO7AtRKM
	FBacq9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxXR-00HX2d-Oz; Mon, 23 Jan 2023 14:11:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxXN-00HX1X-Sh
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 14:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674483066; x=1706019066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0d9Nb/yC6VAaBIa1D02pKGjTNBVJ6RLf6lkHDss3E8=;
  b=DdqzycnLUjlpHHGJ/ZsEII428O7Wo3cDvf0B80fWQGIJU6Y7hYQKZgIE
   0EqC8uecE0b2ML2teWHJB6trKk2cKrYO3GxmM54x6e8kBqbpUQeISmEjS
   4sios8oEwn6gI2VDTVbQaXTt6pt/bMceAfuEOOpWy4KD9nIt4PcBT5LmH
   H/+buTFFmQ/XA24Y1gQIQwkWmjiOdj96XQEeHti0DPIURC7Dp/IMESwoC
   ZOqI1Yk/MbPjJxDxJPDD6XD452tzk6n1tg9rsBDgqtX+dawguA52Om1v/
   k0V5FJVY/J28Z1N7XkHTsjE/yI0f+V1o6pvxuFSghU26dcyGGmTsF+quP
   A==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="197739625"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 07:11:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 07:11:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 07:11:03 -0700
Date: Mon, 23 Jan 2023 14:10:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>
Subject: Re: [PATCH resend v3] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y86VX3zhoSRHsewb@wendy>
References: <20230123105135.814154-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230123105135.814154-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_061105_970046_3F1EFF24 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: multipart/mixed; boundary="===============8109727688564287917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8109727688564287917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yXobd+UY1nEQhU1d"
Content-Disposition: inline

--yXobd+UY1nEQhU1d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 11:51:35AM +0100, Alexandre Ghiti wrote:
> Add 2 early command line parameters that allow to downgrade satp mode
> (using the same naming as x86):
> - "no5lvl": use a 4-level page table (down from sv57 to sv48)
> - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
>=20
> Note that going through the device tree to get the kernel command line
> works with ACPI too since the efi stub creates a device tree anyway with
> the command line.
>=20
> Also, as those params are treated very early in the boot process and we
> use standard device tree functions that may be kasan instrumented, we
> only enable them for !KASAN configurations.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>=20
> v3:
> - Massage commit log to make no4lvl clearer, as asked by Conor
> - Add a note to kernel-parameters.txt regarding the impossibility to use
>   those parameters when KASAN is enabled, as suggested by Conor

For the improved descriptions & commit message:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Apologies for complaining about the missing changelog earlier!

Conor.


--yXobd+UY1nEQhU1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY86VXwAKCRB4tDGHoIJi
0jY5AP4u/lkQ5s1usVmQJyS6cnYs6jE7Ft+3KsAeLXCPetcYhQD+MS7SEq+uA2kL
FsNU/AncvpfJtWmuEP1UDkLCS8DFwAM=
=gOqR
-----END PGP SIGNATURE-----

--yXobd+UY1nEQhU1d--


--===============8109727688564287917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8109727688564287917==--

