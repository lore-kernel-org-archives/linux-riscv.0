Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F9DEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuZygC5YR2JkhqqKmV2CtjFXTudJly3+H3TJDnLlCtc=; b=ZMtxuYudKRs1DS5j+8F2pijJp5
	fyxb19AF8H7/U9waOZtjaMyb/Fy4cBiayV2sdwqVCSjcuoy0BbvXeOUKNQkgC1LhrhmWYZLuNhfSA
	XgGN1N52awVuo3/7Dl/tAivJs5VgMMhJpGTkfavcnEKs+BB1KSsImSHjEPPawc5Z2uEjyQqAlsBhf
	9qGV6Nr/QbQ9yJ08IWOTpwNEW5DUaFABI6W7BDzLs2pFuGI+G5VqfBXMUIKImDyJG9BNIJMYRDpY7
	Kx7+c6bZ3ZM+7v+vFqSsClRrPmB3DRO4kx7hvd20JKiKZ2j08cPjAvpTs7Ow1acKCflHGgY3UJ4Lz
	yUcEfhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qET4W-00FYlM-2m;
	Wed, 28 Jun 2023 11:10:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qET4T-00FYk2-2L
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 11:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687950649; x=1719486649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WPS8EgVmsuYKLwB/yZyqAD3qQxEAVrUEUVm4/Bk6ZlA=;
  b=rYdtCkEPZtCRliPvodcEJixN+mPHM+pxsD/WBBoF6nbt7saRXiFtawap
   n+eUpkS5hveJJUn93iShfhspju4uBhh2qcnK93LmeT0woR7r6eXKL9+Qz
   Yvyqp+vEQB1tPc1xhxfap5IhZHCcT+hKrxnUo8ErZZ66q6bdG64aCmT6y
   rp1lU6ilCSE5gyg7myhkeTPQn2LhQEQUJl1eE7lAQXtdk2ciPemmEgauK
   qx/6VW5XD3Cyp+1/DdE1n4OLzQCi5ZCN9JM/EefmS/Rpr8q1tDbyxJf1k
   JdttbVsu+9g0hvwILSUM6+wvf8B6xZbMB1gFmXvlQ42rgAX00SWM24Jy+
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="asc'?scan'208";a="220273292"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2023 04:10:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 28 Jun 2023 04:10:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 28 Jun 2023 04:10:39 -0700
Date: Wed, 28 Jun 2023 12:10:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Ortiz <sameo@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, <linux@rivosinc.com>, Andrew
 Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Jiatai He
	<jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230628-unfeeling-tavern-edd4f58396fa@wendy>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJwE5wRVkoND3Z6P@vermeer>
MIME-Version: 1.0
In-Reply-To: <ZJwE5wRVkoND3Z6P@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_041049_767872_DC328B80 
X-CRM114-Status: GOOD (  23.24  )
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
Content-Type: multipart/mixed; boundary="===============0249065247407240103=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0249065247407240103==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YhMMrLi4maVY432h"
Content-Disposition: inline

--YhMMrLi4maVY432h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 12:01:11PM +0200, Samuel Ortiz wrote:
> On Tue, Jun 27, 2023 at 07:48:15PM +0100, Conor Dooley wrote:
> > On Tue, Jun 27, 2023 at 11:14:30AM -0700, Evan Green wrote:
> > > On Tue, Jun 27, 2023 at 7:38=E2=80=AFAM Samuel Ortiz <sameo@rivosinc.=
com> wrote:

> > > It would be nice to consolidate the ones together that search for a
> > > single string and set multiple bits, though I don't have any super
> > > elegant ideas for how off the top of my head.
> >=20
> > I've got a refactor of this code in progress, dropping all of these
> > copy-paste in place of a loop. It certainly looks more elegant than
> > this, but it will fall over a bit for these "one string matches many
> > extensions" cases. See here:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20230626-thievin=
g-jockstrap-d35d20b535c5@wendy/
> > My immediate thought is to add another element to riscv_isa_ext_data,
> > that contains "parent" extensions to check for. Should be fairly doable,
> > I'll whip something up on top of that...
>=20
> Nice, and thanks for the review.

> Should I wait for your refactor to be merged before pushing this one?

I don't know. I think that you should continue on with your series here,
and whichever goes in second gets rebased on top of the other.
I don't think it makes material difference to review of this patchset as
to whether you rebase on top of what I'm working on, so I wouldn't
bother until it gets merged.

Rather hacky, had less time than expected this morning:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Driscv-extensions-strings-supersets
Clearly there's issues with looping to RISCV_ISA_MAX_SUPERSETS & I just
repurposed Zicsr for the sake of testing something in the time I had.

Evan, at a high level, does that look more elegant to you, or have I made
things worse?


--YhMMrLi4maVY432h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJwVEwAKCRB4tDGHoIJi
0odBAQCGhQC04g5NX1UwATx7PJIFcjSsuRX6bdBayXqjTHuUqwEA1YlIzLiAh68e
R4OeRtEOFZOGNesu9GAsfbgm0Zx4DgE=
=iWeD
-----END PGP SIGNATURE-----

--YhMMrLi4maVY432h--


--===============0249065247407240103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0249065247407240103==--

