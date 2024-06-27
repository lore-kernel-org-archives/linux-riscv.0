Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59194C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JQNbL1bhphBoKPRWEbKyWbMFsUTLELzhijrRIsk/Lo=; b=nGIluUvKgq0Xr8YapMOvFUoeEv
	LdbkdwCijYaJWx77HVee86vZ2IQJe3GId/h6L5VpDyt2lqGVNunTXjaBssLTRUoyiERGHRd4gRky6
	KdEEwlSJ2xcsgyy+Tqb4ZKqPVk31XZnsR4sWk5nh0VWDZEw4FYXUKZPlKkSZVRoyy7BifP6Ikk9S8
	Gw0i6O/azpXR5+UmuPQRYs/DqitQ62RlmgwHXqtVaFyG/xpRGy9BmLmgxnBdq/sP2OssrpqIXkdni
	IDXUBU0yDAs1y+r6B5Ly0dqUh/t/jtQE8y/3lNKg264QAtyBDLmC1x7v5ar2RK1yQatqekzVgXV37
	jgCNcdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmUm-00000009z4V-0BIv;
	Thu, 27 Jun 2024 10:36:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmTm-00000009ydV-3oVP
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719484551; x=1751020551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PT0DemCx5L/ZcJvMGNX3zxbnwOgua37LhSOsc+eGUas=;
  b=rzkICiPL81hyRX2uxT/Kq9h4H3ruOlkyQO9hmd5WAN9yvZbUSWo38ll8
   ms1je4SvJ3o0xEoatIiIfpwPL3Zw7YxcPjZlmTgDKTh/f4MU9AyAPUUOg
   +3J5CqwN0sUGO66L1sm7twUgXxML+c1d9F1x4pPzKgmj+ZZmf0lLu93VW
   oh9QZ/m8AjN9U4D5UwXiYOOvqZVG2IRUIH4z5z86QFLu1sFT7GvfSLhbt
   9AzfXm8IVXj5HtnEyqbzHwbAmNWuQjpNaz4FuVkCLL8rdzpYclem/AcM3
   fOzwWBa5yXQN96oSXoaa/Kqc1oSrj8gPIPlDIaeMarClA+cXa8mZNh6H1
   Q==;
X-CSE-ConnectionGUID: +0US9/oBS+uQ72sgXKrlTQ==
X-CSE-MsgGUID: 3UJBguS/R3mlbAbhaHQ3dw==
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="asc'?scan'208";a="259448239"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2024 03:35:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Jun 2024 03:35:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 27 Jun 2024 03:35:09 -0700
Date: Thu, 27 Jun 2024 11:34:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <jesse@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Masahiro Yamada <masahiroy@kernel.org>, Wende Tan
	<twd2.me@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sami
 Tolvanen <samitolvanen@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, "Vishal
 Moola (Oracle)" <vishal.moola@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v2 1/3] RISC-V: pi: Force hidden visibility for all
 symbol references
Message-ID: <20240627-boring-handgun-40ae5bf2651e@wendy>
References: <20240626171652.366415-1-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240626171652.366415-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033559_282581_5F616F44 
X-CRM114-Status: UNSURE (   9.89  )
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
Content-Type: multipart/mixed; boundary="===============0000359711562705053=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0000359711562705053==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vKFCYLL3R2eTISok"
Content-Disposition: inline

--vKFCYLL3R2eTISok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 01:16:50PM -0400, Jesse Taube wrote:
> Eliminate all GOT entries in the .pi section, by forcing hidden
> visibility for all symbol references, which informs the compiler that
> such references will be resolved at link time without the need for
> allocating GOT entries.
>=20
> Include linux/hidden.h in Makefile, like arm64, for the
> hidden visibility attribute.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Did you forget to add --cover-letter to your format-patch incantation?

--vKFCYLL3R2eTISok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn1ATQAKCRB4tDGHoIJi
0ro5AQDUTIQAFPaxq8FMvwx+tMjLHvhpLVDKFrBTkl0J4RVnQAD+JyHcenavbWL3
JE+a1l9TQCnI/BGKBArtQn7zTJ0dMQ0=
=n7mi
-----END PGP SIGNATURE-----

--vKFCYLL3R2eTISok--


--===============0000359711562705053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0000359711562705053==--

