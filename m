Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB251C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgzMedIjUhi0DkShJwQ60sb435b5/JEzyWlFLl4sD64=; b=o2iQYePyfIkEfJ6N9mS+jOz3c6
	6ZRW8rxgnhIpPR9tYQnWTFMCSWcP3fOGzNnL2OsbdhZ2oFNXcrGTkGlq91XxP4boAuhmfu31JVOvM
	k2T+MZNyodrjR6wyxFcL3Ctha+1larxUUbFWJjdJZP2BGbykNe4PNRT1FYhFbR27A0bhWIR6mL5YX
	qKVh5gsydzl4mBAZyrY9i4CBAUTno9rrj0vgP2c2gug5nMcqENGL/6svprKZWdGq4DzhmLXO+0PrK
	Kvu1nS8R2JIhfmkhlxHHershIfQm6xqY/Bho8MRUClH/6GZ4JGoSzt68nZnvzvy33r9TtVfXpFW12
	fkuj9X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCS2-0000000E8rA-2BPb;
	Wed, 28 Aug 2024 06:46:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCRz-0000000E8p7-2NCJ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 06:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724827599; x=1756363599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k7OQG7UGq+5+V4/ckvBPFF0UXfEHVjzOblv15sDs95A=;
  b=p2Kq6M27gKIhFoTHzQNAfGeQuOtkJav8bCFbSoVPXXZZxAh+6B3/pKSL
   X1dR/yqdGPTEP2hutf07ydsX5IlJTGHEmZV9xW7zTeliJcgQGQfdNTa4y
   nkpHme2NffLRrIo/KcGbqbcgpBT0Q8TAhtWcIervkKab1IO76lPw3DVIY
   gwTfyUqdW3CJ0LryKFwBjEbBfS1QTMX4SIFfiEyIEAH3LXDSBgrnCXjTb
   ZaAfynFP2uFXqLCbAtebA+x5ovzShrsKriZ8GXybXF/4TAJyNeRVHMvZn
   R529UCxNbLlyFW9srr+GTlpFgbg3Ls94ECok5Dm/pThdJjQ9rdV+OPErQ
   w==;
X-CSE-ConnectionGUID: x3WSnwMeTXCQAFkJ2kaqjQ==
X-CSE-MsgGUID: uEo4ucA1TdiN1WsF5bHHrQ==
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="asc'?scan'208";a="30984765"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2024 23:46:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Aug 2024 23:46:04 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Aug 2024 23:46:02 -0700
Date: Wed, 28 Aug 2024 07:45:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	<guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
Message-ID: <20240828-wolf-expletive-f96cfc4e9c7a@wendy>
References: <20240826105737.106879-1-alexghiti@rivosinc.com>
 <20240827-striving-dispute-19b6cf97139b@spud>
 <14d633c5-804b-4be9-8329-751a2ac08c7a@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <14d633c5-804b-4be9-8329-751a2ac08c7a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_234639_750870_E911AFEA 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: multipart/mixed; boundary="===============7614108250717544943=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7614108250717544943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6jLkahvux+y0lESW"
Content-Disposition: inline

--6jLkahvux+y0lESW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 11:13:16AM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 27/08/2024 10:38, Conor Dooley wrote:
> > On Mon, Aug 26, 2024 at 12:57:37PM +0200, Alexandre Ghiti wrote:
> > > RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
> > > process, before the first memory mapping is setup so we can't have any
> > > instrumentation happening here.
> > >=20
> > > In addition, when the kernel is relocatable, we must also not issue a=
ny
> > > relocation this early since they would have been patched virtually on=
ly.
> > >=20
> > > So, instead of disabling instrumentation for the whole kernel/sbi.c f=
ile
> > > and compiling it with -fno-pie, simply move __sbi_ecall() and
> > > __sbi_base_ecall() into their own file where this is fixed.
> > IOW, this should fix the issue that we discussed here
> > https://lore.kernel.org/linux-riscv/abec162e-f3f2-488c-83d9-be17257a5df=
8@ghiti.fr/
> > also?
>=20
>=20
> Yes, as a side effect it also fixes TRACEPOINTS + [KASAN|RELOCATABLE] as I
> reported in this thread since I moved the tracepoints in a file where
> instrumentation is disabled and compiled with no-pie.

And it does, so
Closes: https://lore.kernel.org/linux-riscv/20240813-pony-truck-3e7a83e9759=
e@spud/
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--6jLkahvux+y0lESW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs7HhQAKCRB4tDGHoIJi
0mRNAQDN1X4zm0B2mqva54OgfujQV8jdFEp/nNY3Mt1f+Fmy+wEA/uHkjAC3VXyc
9lCVnuuUC/VbM/U/cV+Nqa/q5hRD2wU=
=qxcC
-----END PGP SIGNATURE-----

--6jLkahvux+y0lESW--


--===============7614108250717544943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7614108250717544943==--

