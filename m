Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB5FC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6VpnHvtI8tyZHioMCFIjQwjj0130cxMgJjY56cIvrM=; b=UBP4Uj0QNqmjJxENSSwZgWZqLN
	/P3G3ZjuVLe4sK8BMcMKJPOTESUwaslVEEZ+VD/jWDAOe7PcoL4dnPP+QxN0yL7C4HxQlwc74pkt4
	lE82o8fcmlsx0E6ssCTQ4NpXr1sDOmA6M2m4dCXEDVKtuSAseTSkBtCbMnL7Iycb6UeI/0+PAadeJ
	HXnkYV3PasZGExEyD7AZj40zJhoI4lPaxvoSsUFbkxMC5BLyvc6h0oWZEiywdLTTzJJ4aghWEPjx3
	PL5GKCEVinw6I9RR8Ss0KRRowhDnOkxMwr47KyU2sNF+4bblPCZgeEgZQZd3DJEef6c7bpZ0Oaloc
	WiI0WpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQL-004aSw-0h;
	Mon, 24 Jul 2023 14:20:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQI-004aRs-0z;
	Mon, 24 Jul 2023 14:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690208431; x=1721744431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpqAetm4pZsB5/kXbjlZnlIftjDXYhKEa2j6e0p9oaw=;
  b=CdTLoZ2JvYuFrAW0cxHmbZCHp6G2qYWFMxqtO7rn9+htLE4ed4NPvhSy
   WLZHRxMZj9M4LVhWOb0WD+lOrIoSOtdB1zOg+FC+iekceSOw3R6IUFajc
   RqLZyjvGWYanUIojY1trSSTjYYw0XoKhH7TEMFmnk43Se7sg13Ohm40jg
   q2y8orpuPSaa7cmEFW1gIvFyVkvukzEWcvYmhLZus9GDsxka+I8IlZodX
   QPoClrrDg4hLf9QJSlmEV8rDY2LFQAVxILOvEafOirl5kBDrZN65p8S3l
   V/jIawRSuTCZvgUozXaPAszGxSGtFX+m0GREpB9SwJ4DTCAX4yy7SZsZe
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="221901442"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 07:20:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 07:20:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 07:20:22 -0700
Date: Mon, 24 Jul 2023 15:19:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel
	<ardb@kernel.org>, Kees Cook <keescook@chromium.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-efi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Zong Li
	<zong.li@sifive.com>
Subject: Re: [PATCH v6 2/5] riscv: Dump out kernel offset information on panic
Message-ID: <20230724-fineness-sectional-8cdd1e4bbff2@wendy>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
 <20230722123850.634544-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230722123850.634544-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072030_408613_27FFBC5D 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: multipart/mixed; boundary="===============5289330274905685170=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5289330274905685170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aMNb8/bsNIfqV7pO"
Content-Disposition: inline

--aMNb8/bsNIfqV7pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Sat, Jul 22, 2023 at 02:38:47PM +0200, Alexandre Ghiti wrote:
> Dump out the KASLR virtual kernel offset when panic to help debug kernel.
>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>

Either you're missing a Co-developed-by: or the author of this patch is
incorrect.

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

--aMNb8/bsNIfqV7pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6IhAAKCRB4tDGHoIJi
0uMUAP9RhMxzS+06VHvIGGfhOAXni5ygCNraqDKLEstEuQWfDQEAlV63sF94gRq7
ibFLhTzDBOjVznhq0Br9EjnHLbwKzAE=
=G/wQ
-----END PGP SIGNATURE-----

--aMNb8/bsNIfqV7pO--


--===============5289330274905685170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5289330274905685170==--

