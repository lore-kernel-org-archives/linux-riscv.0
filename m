Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D9C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiJ3pfNzFsoLLnReNljvPmlFEE5/FG+6GfeRDB2o+DA=; b=uPpyigPuUeJ8aLaTL1FAIlgPCy
	eSCXw38Na1+mmy/FzKwOp7/WO7oiTed1NkuILE5enX36w5MhRiQCLbi4S/lXnXc+yrUbDttWmGajN
	VKDg2q7oGzFlzNPS5FzHYYBXbfXx9lcws5HT+EtL3t1fVoDcdOvlfgJxZZxz79OrEOL21lLdOTJrM
	MYyO6OQ7X0jb1YoU7Quvw7C3ZAu5mbQBrAew+3+pVWbm75naZxRvD0XgMsPGyEh/+flwEW78e/lex
	ECxnTGrI5aaHaNICHpQzQ2tgfWO7Qu//Jv4fQugn1gtkwUGsxoNupb3Q3NDWyf3yyP28zhZWwwu1G
	TsUc/eUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYQ1-004m75-9n; Mon, 30 Jan 2023 17:58:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYOq-004lTN-6j; Mon, 30 Jan 2023 17:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675101420; x=1706637420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R2Arxju9SKmyJE8i3oT3ku44eFBP9QPyzS7LFGcZRr4=;
  b=YIvYOLjEiwBgF1oY7cATgzuGEc/iIdCTKFuJEbUb3hTqXfExceaZ2ZMZ
   17UJWpX3u/9aeZEBDD7DeQXTOu5RhU5ilIsX3HSdxi02rq3axJF8M/l80
   j8IJn5T6PAvhdfqI+PgsxX61znO+/MJ+oHTjoraMej2fimpjSqqC67VAb
   By6OtEkDCZ/Y5O30VRe8g3TPpYu9gyOBHZXe88CC0tNiqHC/1FRNych0B
   Ih4mQtbwkSFxFdNiWGalhVNXyh2TGJBYrKpbOIYtP0QOIqHkUPYaXPrXc
   MMpFYHDYHFe7IhA/J6GWKcoonJ6TesamqAdZ94lJymTh4Nh6ZCI8fcEHV
   g==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; 
   d="asc'?scan'208";a="209758505"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jan 2023 01:13:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 01:13:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 30 Jan 2023 01:13:44 -0700
Date: Mon, 30 Jan 2023 08:13:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
Message-ID: <Y9d8IBqXyep+PJTq@wendy>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
 <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_095700_304039_CB16333E 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: multipart/mixed; boundary="===============5096822894425481705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5096822894425481705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CJhZexl+M95YUvmH"
Content-Disposition: inline

--CJhZexl+M95YUvmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 03:46:32PM +0800, Andy Chiu wrote:
> On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> > Firstly, no-implicit-float is a CFLAG, so why add it to march?
> I placed it in march because I thought we need the flag in vdso. And,
> KBUILD_CFLAGS is not enough for vdso. However, I think we don't need
> this flag in vdso since it is run in user space anyway.
> > There is an existing patch on the list for enabling this flag, but I
> > recall Palmer saying that it was not actually needed?
> The flag is needed for clang builds to prevent auto-vectorization from
> using V in the kernel code [1].
>=20
> > Palmer, do you remember why that was?
> The discussion[2] suggested that we need this flag, IIUC. But somehow
> the patch did make it into the tree.

I know, in [1] I left an R-b as the patch seemed reasonable to me.
Palmer mentioned some reason for not thinking it was actually needed but
not on-list, so I was hoping he'd comment!

And I suppose, it never got any further attention as it isn't needed by
any in-tree code?

> [1]https://lore.kernel.org/all/CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jHVa=
mR_LcsKdA@mail.gmail.com/
> [2]https://lore.kernel.org/all/20221216185012.2342675-1-abdulras@google.c=
om/

--CJhZexl+M95YUvmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9d8IAAKCRB4tDGHoIJi
0g+MAQDJ7eBJdCaLsu0EJa72pjyXE98/RF+uv1lr+Os0xW9MZgD+IDGhAvVyfm+J
TzjupFmI4XgIGFBAGk2H10/strXdbwo=
=O31O
-----END PGP SIGNATURE-----

--CJhZexl+M95YUvmH--


--===============5096822894425481705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5096822894425481705==--

