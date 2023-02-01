Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FF0C636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haKB5DnnyZqveLTnQsdACStd3vPTp4xlB5DgqOKqTUg=; b=h6NhDwjYimm1R3svE5oJ38cC49
	V3cUtaOi7e6Fl0gmA2Wylqdo2fNP2hgArx6iuMTTJWtojzHHo8aOeC8Q5nA9iZk0MSu8rTUaaWjFx
	/1sv9uLnUfx5Etn+TgAGAio6Oq3CXr2jkFxLXBDyP1sf6f5j7dawGEcu574M9jmxVlWs1uSOVjMZl
	3BAIJ6YAs7EQZPuHSP35Rs6H/26cIDEZSYrG9ntyKn97temmiUqTEqmPJwZKobiPTvf07lm3t6vyf
	n6h9lzSCyAQ+QohLzUbq/oG2PmOTZw9UgAeKLnAgJCQdsCsPT2CcPbTP4OtQczCT4QMu40bBD/KMk
	emVYL1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDzO-00CJ3y-D3; Wed, 01 Feb 2023 14:21:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDgn-00CBGk-HF
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 14:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675260138; x=1706796138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0eRkRJBcwpM2VLlWCWyB2TcX6G2SLjmLQHtOXZY2CpU=;
  b=VzbW5Y13hPLUmf1/joVorGl1RcGixOAyoaYz6AdZR+zHf6N9T8Sk2+VZ
   yxbdMDXmjSCSvps9PJgmnqlOTXOQgefzKpyp3+VtHKki7ZjKSqYep5BLw
   lpcAuuR742cnyed8iNawbS0XmzUvyg4NEEXENtCeHkBRK5htQ8mel3M5e
   1XY+cZuELOz/sQjC5KcSfE9ozLHpvIujcIBwxJlsdCuEw9mEHW5pm+sjX
   x4iQCZuEF2+KXklTSSziH7u5GvGvvTX38vp5DjKGuPYafPoU2z7T/qGtc
   t/B7UgqnZFB9tfKbAYKp8pAwv9vOiuQ+EX8/b7vRlDinyu5VAyiN1bkKj
   g==;
X-IronPort-AV: E=Sophos;i="5.97,263,1669100400"; 
   d="asc'?scan'208";a="199149175"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Feb 2023 07:01:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 07:01:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 1 Feb 2023 07:01:31 -0700
Date: Wed, 1 Feb 2023 14:01:07 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changbin Du <changbin.du@huawei.com>
CC: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hui
 Wang <hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, Zong Li
	<zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <Y9pwo5iC7hrPm/wk@wendy>
References: <20230130232659.3374212-1-changbin.du@huawei.com>
 <Y9fdtcoh8POLZ6CD@wendy>
 <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
 <Y9jIPOLxRRrjMo2t@wendy>
 <20230201210031.x7c5xlgxxiaoahqz@M910t>
MIME-Version: 1.0
In-Reply-To: <20230201210031.x7c5xlgxxiaoahqz@M910t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_060217_686905_68FADDD0 
X-CRM114-Status: GOOD (  33.70  )
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
Content-Type: multipart/mixed; boundary="===============7440402911092612585=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7440402911092612585==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tMs+ZMJUpHAbBOSW"
Content-Disposition: inline

--tMs+ZMJUpHAbBOSW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 05:00:31AM +0800, Changbin Du wrote:
> On Tue, Jan 31, 2023 at 07:50:20AM +0000, Conor Dooley wrote:
> > On Tue, Jan 31, 2023 at 03:26:33PM +0800, Guo Ren wrote:
> [snip]
> > > > >
> > > > > -     /*
> > > > > -      * Before reaching here, it was expected to lock the text_m=
utex
> > > > > -      * already, so we don't need to give another lock here and =
could
> > > > > -      * ensure that it was safe between each cores.
> > > > > -      */
> > > > > -     lockdep_assert_held(&text_mutex);
> > > >
> > > > I must admit, patches like this do concern me a little, as a someone
> > > > unfamiliar with the world of probing and tracing.
> > > > Seeing an explicit check that the lock was held, leads me to believe
> > > > that the original author (Zong Li I think) thought that the text_mu=
tex
> > > > lock was insufficient.
> > > > Do you think that their fear is unfounded? Explaining why it is saf=
e to
> > > > remove this assertion in the commit message would go a long way tow=
ards
> > > > easing my anxiety!
> > > >
> > > > Also, why delete the comment altogether? The comment provides some
> > > > information that doesn't appear to become invalid, even with the
> > > > assertion removed?
> > > Stop_machine separated the mutex context and made a lockdep warning.
> > > So text_mutex can't be used here. We need to find another check
> > > solution. I agree with the patch.
> >=20
> > Whether or not you agree with the change is not the point (with your SoB
> > I'd hope you agree with it).
> > I understand that you two are trying to fix a false positive lockdep
> > warning, but what I am asking for an explanation as to why the original
> > author's fear is unfounded.
> > Surely, having added the assertion, they were not thinking of the same
> > code path that you guys are hitting the false positive on?
> >=20
> The assertion is reasonable since the fixmap entry is shared. The text_mu=
tex
> does should be held before entering that function. But the false positive=
 cases
> make some functions (ftrace for example) difficult to use due to warning =
log
> storm.
>=20
> Either the lockdep should be fixed for stop_machine, or remove the assert=
ion
> simply now (we can keep the comments). (or do the assertion conditionly?)

How would you suggest checking it conditionally?

Also, if you persist in removing the assertion, there is a comment in
arch/riscv/kernel/ftrace.c that would need to be updated. (L129-ish)

The comment you removed in this patch seems valid both before and after
though, so I don't see a compelling reason for its removal.

> And this is not a riscv only problem but common for architectures which u=
se
> stop_machine to patch text. (arm for example)
>=20
> > Perhaps Zong themselves can tell us what the original fear was?


--tMs+ZMJUpHAbBOSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9pwowAKCRB4tDGHoIJi
0rYoAP9Juds6y+/bRX1335OxIRznijbxVx7ssJVGtTg55WzL5AD9EUz28Vddkidq
CgBeN5L5QA/Zzuv5LKPen71NIMJTwQc=
=8flm
-----END PGP SIGNATURE-----

--tMs+ZMJUpHAbBOSW--


--===============7440402911092612585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7440402911092612585==--

