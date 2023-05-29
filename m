Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F347C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZDbDkgYWnIq6lrXX0mmYuxHDnB5vbEy1at8r56XmTU=; b=dtVfjacmI6rpGX6dAvtghkR5pA
	Q3DgbdFSOWXQCbWjysE5JxU95tcek3r8p59S1TPWBu1ULHCEoOq57kIQxsWl2LFm7fvM4/0tGYu8I
	sBni4y/A3oRc+g1cXBu+pnwBAArpe4tUqskG/wKaNG6Wa0ZxcKp5WfKKad/8OhjkkMoyYlNVeckKO
	OV5Fum807h1unOn+yACHwPdSj7Oo1Xa7+6cSpf0s+tJX3O8N/auY60XiLvFbIkJUAFJlksrqzGNNL
	WzYmAv5SUdX35cWgv2zo7rI1ajlEbJjpdxIV2ZLmsNCb1/Il/2DodywFnKR1q8NDWtbXIgrmGs4yp
	QsMcHWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aVt-00AC8o-1o;
	Mon, 29 May 2023 10:54:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aVq-00AC74-0s
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 10:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685357645; x=1716893645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0GG7xQh59rv35kj2DWfbqqMT5MkAeoUx7+wufm854Kc=;
  b=uFxmSD5stA+nKz6yDmlBCJ2lx4zhyGkWzGgONf58PNwC6MGo7J+jj6eI
   jInwHsspqP1eqjdEqCotXnbJOB1jKRNGuIFcZb2jtDqXTF3Qf5+hL92up
   77msHVwf/HChuZZ3E33Wrmp2nakUW2y9xFPut+9etkDrHLN2B6vqFpHC4
   JPJGDgbvmblva1QxoFz49RDtWUhXtEzc5h9Kyrwb29V1KlsUjFBm+84fU
   CAt/IbNce0Hz+nPlLNdyejTgaKOJrxF32c8t94RX56S/6uiyWZDjcuNvm
   hSTRbuyWZjWGXThInmB6U2oWPJTuWpbCV0aAxmIv7QXnPq9+FHZks7pF7
   w==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="154416048"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 03:53:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 03:53:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 03:53:56 -0700
Date: Mon, 29 May 2023 11:53:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 3/6] riscv: mm: mark noncoherent_supported as
 __ro_after_init
Message-ID: <20230529-gainfully-promotion-2ad5fc7e0249@wendy>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230526165958.908-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_035406_375395_C3944FC3 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Type: multipart/mixed; boundary="===============3231983104587207589=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3231983104587207589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hNYOrDLkJGVN45Wj"
Content-Disposition: inline

--hNYOrDLkJGVN45Wj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 12:59:55AM +0800, Jisheng Zhang wrote:
> The noncoherent_supported indicates whether the HW is coherent or not,
> it won't change after booting, mark it as __ro_after_init.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--hNYOrDLkJGVN45Wj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSELQAKCRB4tDGHoIJi
0ruJAQCJd3CbSBp8SNN1vC0dxORKjn8mwSILbRaoZmTDQInPLQEA65OQk3pFn8Xp
dWD1T5GU6696MQpp46flDfg4bD3e8go=
=IcbH
-----END PGP SIGNATURE-----

--hNYOrDLkJGVN45Wj--


--===============3231983104587207589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3231983104587207589==--

