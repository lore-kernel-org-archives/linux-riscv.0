Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA66DEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zti7Je0fe3G7fFnmeazKoUS6dU3QC1KIflIEFFuBKQ=; b=Jt8OG8ON79H4/YFnbLBFMZYUrI
	sSY5LDHpnnuo4Awu8dqvaGOlDXRcNhPBj9Tg6L5aGS+tKNPvSoUsr+nCZdX0pvOugpawvPWI5y6gP
	zByYouhOdqF1S9hu+KvdixmgXKGlMrKQOgyIXMxUD/OU/cl6u9xyovEgk5xQRrCTckJAlFFmO7Fi1
	NzAVGcwHyDlkN0t2j7itKc+Cdh3PlynzXQBTt8tBV+grQZEnCH29tr2BJDhMElJPIzIOnMVM/9+KF
	FBHE8quGNZE7cKarZhJ4Yt8BGizdA+G/mtJuk4XcflGtjpF3lTQFCcIB1uszH7e4GLHAXXTZPI79M
	SuVOjUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGH6b-00AINd-1S;
	Mon, 03 Jul 2023 10:48:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGH6X-00AIMp-2z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688381305; x=1719917305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GElUSEjJgkbqcofvqhL882P3ZXsEhg9Ndi1e2fZzULo=;
  b=s+q6FkrL90IvIvsTXSQZZ0LUr8PAQ8F6F2+cG1jmdrcd0JZGm+uXTOaz
   BGrO3u8Rk0g33j4M4p7spSD3gsFTUwANx8mDTgZ4CS7ff7rZK2iwcqdRT
   ubt0941yOhi1WkzJ+F3ADdTc6j/BsR0uty6g/8Pdsx9iC0SCnQHvT+9OS
   GrbL92VlBoBQj1kr01IKus6rrQ7W/LUxRmphtzUpDurjUVxuaeQCYuiPA
   SVbctdckNnfyzYnrCxXGwSd+lV7kwRntxr3+mMV1VRL862hPq/Gtsdxle
   N1UyAq6lGtOW/dPTjDKgDPZkZsm0NQBAeaAFyRGSIole/R54B0LKJFIqa
   w==;
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="asc'?scan'208";a="221038374"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:48:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:48:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:48:23 -0700
Date: Mon, 3 Jul 2023 11:47:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Amma Lee <lixiaoyun@binary-semi.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <xiezx@binary-semi.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: optimize ELF relocation function in riscv
Message-ID: <20230703-pretender-sculptor-c76e6d7428f5@wendy>
References: <1688355132-62933-1-git-send-email-lixiaoyun@binary-semi.com>
 <20230703-8fe42edab5ff83cea01db4f9@orel>
MIME-Version: 1.0
In-Reply-To: <20230703-8fe42edab5ff83cea01db4f9@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_034825_991941_C50EA1D4 
X-CRM114-Status: GOOD (  21.12  )
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
Content-Type: multipart/mixed; boundary="===============4776002911263655374=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4776002911263655374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BlJnNwQEuty8t1OC"
Content-Disposition: inline

--BlJnNwQEuty8t1OC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 12:35:15PM +0200, Andrew Jones wrote:
> On Mon, Jul 03, 2023 at 11:32:12AM +0800, Amma Lee wrote:
> > The patch can optimize the running times of insmod command by modify ELF
> > relocation function.
> > In the 5.10 and latest kernel, when install the riscv ELF drivers which
> > contains multiple symbol table items to be relocated, kernel takes a lot
> > of time to execute the relocation. For example, we install a 3+MB driver
> > need 180+s.
> > We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
> > type items relocation function in the arch\riscv\kernel\module.c and
> > find that there are two-loops in the function. If we modify the begin
> > number in the second for-loops iteration, we could save significant time
> > for installation. We install the same 3+MB driver could just need 2s.
> >=20
> > Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> > ---
> >  arch/riscv/kernel/module.c | 67 ++++++++++++++++++++++++++++++++++++++=
+++++---
> >  1 file changed, 64 insertions(+), 3 deletions(-)
> >
>=20
> I guess this is a v3 of [1]? But there's no change log here to know
> what's different.
>=20
> [1] 1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com

It's also still got the checkpatch issues (and possibly others) that
were pointed out previously.

Cheers,
Conor.

Also, when applying the patch:
warning: arch/riscv/kernel/module.c has type 100644, expected 100755

--BlJnNwQEuty8t1OC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKKnWQAKCRB4tDGHoIJi
0rzGAP4yGsFWAkWYAe/FI+YHgNsq3eWaO1BQaNBLdLesfizvMAD+Pq0/kv1xh2cr
KSbR74+nIN1TFVixuSIxcxQnJu9FGAU=
=pumt
-----END PGP SIGNATURE-----

--BlJnNwQEuty8t1OC--


--===============4776002911263655374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4776002911263655374==--

