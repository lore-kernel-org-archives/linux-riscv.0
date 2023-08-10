Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D5C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMAD88n+mNi+qjuLRtTLVw/GGCtczMdgC9mavJfPyEM=; b=cRls0T/fM7d5f2MA32c/s0LCeU
	oqiNkGC8dQ905rYTBCVf/+ZdtiCnrvJ/BXNhRPLA/qVfqzB6w5mrGxZdRjJ9FGXgLMTebTlxjrrYt
	c/qnLvcxhupwDFK3veA53MXH++v03Wt22X/EEExNiE5mLuGgY4ZgH2hZR54EpRvz2Mj28EB5MaLW8
	qqVSG6DX336SA7Rs8AiS97ozVouybw3R+rz2Xu6NhcUiDAyhw+a+LlolN4D4t8lujrJhtR6wO0+Bg
	QtbyzQ9WSqmCWjzJYG7QRQqORGnkjmDDXHSi0Xgb2XRoTABuXjCffDO+KIchKEz19LV1h724PEOgr
	6QVGJoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3w5-007Sez-2Q;
	Thu, 10 Aug 2023 11:34:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3w3-007SeJ-1u
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691667275; x=1723203275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTVuxqkQWxfDCmijxMsKYHfdus/mUdojfwUI6Dy9bAI=;
  b=B5XnQz6aLjEygLAReKzZ/rHXa/aUKbzP1o64l1iZuJv7nijKeQGinyXe
   PUjK6qTfWySn5sNawDf8pE8h1dNm9ZFbPNQfRCDkViZVrB3rOg/aLSUGs
   Hjhq4GHHSwKiec+cOChtvjyOnzOwMA/ayYWiYPdWy2oAoFyaHC965gm23
   ZlHNYzb0H/oxfrBgKI/zN0HdjOsnJqK40tgSs/nOd58+KPxLFz3/ELIKN
   ga4RGtjxZ32RrGbJZnIM+9tWfCOJq430XUDcFNWPbK0a2wQvHsFwrQG1R
   GV13cII5y1zCLmZrK6VeSXScw1P0eU4LBxF1Vih0JCD2SJQ6W4u7x/Mcj
   g==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="asc'?scan'208";a="228222954"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 04:34:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 04:34:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 04:34:32 -0700
Date: Thu, 10 Aug 2023 12:33:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <evan@rivosinc.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH 3/6] RISC-V: hwprobe: Expose Zicboz extension and its
 block size
Message-ID: <20230810-rifling-spelling-84cb162991ab@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-11-ajones@ventanamicro.com>
 <20230810-revolver-krypton-ab1883b361a1@wendy>
 <20230810-0c9993116a87372bf4fcfe9e@orel>
MIME-Version: 1.0
In-Reply-To: <20230810-0c9993116a87372bf4fcfe9e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_043435_808640_A0D0F7B9 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============2020352227812310475=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2020352227812310475==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TZUtYy/6nH3AaQ8n"
Content-Disposition: inline

--TZUtYy/6nH3AaQ8n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 12:57:30PM +0200, Andrew Jones wrote:
> On Thu, Aug 10, 2023 at 10:49:59AM +0100, Conor Dooley wrote:
> > On Wed, Aug 09, 2023 at 01:55:20PM +0200, Andrew Jones wrote:

> > > +#define EXT_KEY(ext)									\
> > > +	do {										\
> > > +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##=
ext))	\
> > > +			pair->value |=3D RISCV_HWPROBE_EXT_##ext;				\
> > > +		else									\
> > > +			missing |=3D RISCV_HWPROBE_EXT_##ext;				\
> > > +	} while (false)
> >=20
> > Would you mind adding a comment here that using this macro is only
> > permitted for extensions that can be used by userspace regardless of ke=
rnel
> > config options?
>=20
> I can do that. Then, as part of the "extension available" API rework, we
> can maybe drop the comment when we use the new call, which will be
> documented to say that as well.

Yeah, exactly.

--TZUtYy/6nH3AaQ8n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNTLIgAKCRB4tDGHoIJi
0sTJAQD0MGw3C7ll3lm9JDynPxQ20PJLH6JKGSzZmGi3JdatqAD+L07LdaRXSMHN
Y8M25hSkD+eWGje7P95Rf9PpPfrxrw0=
=VtjR
-----END PGP SIGNATURE-----

--TZUtYy/6nH3AaQ8n--


--===============2020352227812310475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2020352227812310475==--

