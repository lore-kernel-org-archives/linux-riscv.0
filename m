Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF184C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZvD+FgQ5Tzs92zaLvmDy9dDBIKnEYvo3obaPvXFJX8=; b=kpVtywUBQW0avTo/tI7LkiLSIj
	ls5GRKvY6ZXYNpLccIGRFP5pRYqtIPekRq+bBYn0suctY6jWTT3SP/4tA4dhBBBJxP5OcCZ03kcly
	DIPY8pyT69RBBLiZj/MbT++cKzXpIwvRADUzet6+5sXq7tE4P9s+xHPgjUDA+oUnIt1VOKEfUz5oj
	wcRyNKqjY0N+dSNTPC4aDeFhZ9qo1tqY+tkZWM+P61WNO7ktQY5Z0PFiILmFpRfG5ZsEqkkfQ8TTE
	30JOBPcm1Py00Zl2kO3u0p3ctjfnnE5lapg648R6E9YgI4eXZuGc3QQmoPdemXFSi0KIJTH38YApy
	yjroEmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUYP-00EqwS-TU; Thu, 02 Feb 2023 08:02:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUXr-00Eqd4-KC
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 08:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675324931; x=1706860931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQBvHEt3OYbt6ZuYlZ6G1QmajxGPYt+D83TUYCJf3zg=;
  b=G3ANEE5u2YNjzTCOimKANlldwUx0j5hmH0TAwNeVVIz5NScis+PbOmYa
   G5tgi5bjH+V7OFv1j8RezWuh9KyTYjAHX71bQFfCqB+KXxp+834+lJln0
   i9fSZbofCWQOVa6i+xXXmsnLcUc4gT1xwAU2fl7vcrRK1TZXVYtiNK2hi
   /ma7uiv/sZy9PSxw0h/YGUhaNt8x5972LN1K91lf4oaIgpUGxerAWQiib
   bBZsEf96z96KAskkJzB3DCC9n67C7IXgAFX5fASo2j6t/xLUwsPkUJP6x
   YEcHcr35E8JG71dUBqc/oGygDrQ8Nzy0ACOsxxKPRMZM7e5bd9/NnYCOL
   w==;
X-IronPort-AV: E=Sophos;i="5.97,266,1669100400"; 
   d="asc'?scan'208";a="198577152"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 01:02:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 01:02:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 01:02:08 -0700
Date: Thu, 2 Feb 2023 08:01:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changbin Du <changbin.du@huawei.com>
CC: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hui
 Wang <hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, Zong Li
	<zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <Y9tt6MCMXK4c8W6E@wendy>
References: <20230130232659.3374212-1-changbin.du@huawei.com>
 <Y9fdtcoh8POLZ6CD@wendy>
 <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
 <Y9jIPOLxRRrjMo2t@wendy>
 <20230201210031.x7c5xlgxxiaoahqz@M910t>
 <Y9pwo5iC7hrPm/wk@wendy>
 <20230202230043.737f6z3mi2thukgz@M910t>
MIME-Version: 1.0
In-Reply-To: <20230202230043.737f6z3mi2thukgz@M910t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_000211_771581_ABDEDBCF 
X-CRM114-Status: GOOD (  34.75  )
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
Content-Type: multipart/mixed; boundary="===============1607534045002396637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1607534045002396637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gBbIyJy2WEH2GpHk"
Content-Disposition: inline

--gBbIyJy2WEH2GpHk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 07:00:43AM +0800, Changbin Du wrote:

btw, something is wrong with your mail client or host machine.
Everything that you are sending is timestamped in the future,
as it is currently 15:57 on the 2nd in UTC+8.

> On Wed, Feb 01, 2023 at 02:01:07PM +0000, Conor Dooley wrote:
> > On Thu, Feb 02, 2023 at 05:00:31AM +0800, Changbin Du wrote:
> > > On Tue, Jan 31, 2023 at 07:50:20AM +0000, Conor Dooley wrote:
> > > > On Tue, Jan 31, 2023 at 03:26:33PM +0800, Guo Ren wrote:
> > > [snip]
> > > > > > >
> > > > > > > -     /*
> > > > > > > -      * Before reaching here, it was expected to lock the te=
xt_mutex
> > > > > > > -      * already, so we don't need to give another lock here =
and could
> > > > > > > -      * ensure that it was safe between each cores.
> > > > > > > -      */
> > > > > > > -     lockdep_assert_held(&text_mutex);
> > > > > >
> > > > > > I must admit, patches like this do concern me a little, as a so=
meone
> > > > > > unfamiliar with the world of probing and tracing.
> > > > > > Seeing an explicit check that the lock was held, leads me to be=
lieve
> > > > > > that the original author (Zong Li I think) thought that the tex=
t_mutex
> > > > > > lock was insufficient.
> > > > > > Do you think that their fear is unfounded? Explaining why it is=
 safe to
> > > > > > remove this assertion in the commit message would go a long way=
 towards
> > > > > > easing my anxiety!
> > > > > >
> > > > > > Also, why delete the comment altogether? The comment provides s=
ome
> > > > > > information that doesn't appear to become invalid, even with the
> > > > > > assertion removed?
> > > > > Stop_machine separated the mutex context and made a lockdep warni=
ng.
> > > > > So text_mutex can't be used here. We need to find another check
> > > > > solution. I agree with the patch.
> > > >=20
> > > > Whether or not you agree with the change is not the point (with you=
r SoB
> > > > I'd hope you agree with it).
> > > > I understand that you two are trying to fix a false positive lockdep
> > > > warning, but what I am asking for an explanation as to why the orig=
inal
> > > > author's fear is unfounded.
> > > > Surely, having added the assertion, they were not thinking of the s=
ame
> > > > code path that you guys are hitting the false positive on?
> > > >=20
> > > The assertion is reasonable since the fixmap entry is shared. The tex=
t_mutex
> > > does should be held before entering that function. But the false posi=
tive cases
> > > make some functions (ftrace for example) difficult to use due to warn=
ing log
> > > storm.
> > >=20
> > > Either the lockdep should be fixed for stop_machine, or remove the as=
sertion
> > > simply now (we can keep the comments). (or do the assertion condition=
ly?)
> >=20
> > How would you suggest checking it conditionally?
> >
> Please refer to a early patch from Palmer Dabbelt.
> https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/

Oh cool, thanks for that.
Why not resend that approach, with your suggested fixup for
ftrace_init_nop() then?
It looks more complex, but is less worrisome & has an R-b from Steven
already.

Thanks,
Conor.


--gBbIyJy2WEH2GpHk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9tt6AAKCRB4tDGHoIJi
0rOGAQCP7CvKIfUYMvpFXk6ShF5aUu96ZpumGzvPHmJj5WTHwQD/Zb6sGA3Qk2Dk
4AZ705P+pl7nngLvEmGPW7yT0jSLPQg=
=s4jh
-----END PGP SIGNATURE-----

--gBbIyJy2WEH2GpHk--


--===============1607534045002396637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1607534045002396637==--

