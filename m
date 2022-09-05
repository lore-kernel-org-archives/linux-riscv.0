Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782C7C6FA83
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvPi895DPQqEniTWSZCgX78pyag4I4+JgnDZXtntDwc=; b=QVZ/n8ZTpnaoLw
	i1f+rl78qfkSMk/Z3abvd7AeJX1Q9lvVb75mSAmB9OW7manXRRZZwck9tyJGClru5cXUyGOJJmtRv
	r1891FvlOjmL/mUVVpmO6em4eISBGTFFm6/ucn2Z2HRDCU7TZXJ26FFLQRVgz6QCbcYDTMNpXIXE7
	3TjhOBk0deN2FJb5u1L5ux9+wGnw70HGdzwVy2i+XEWg3iPLCO68wCK+z+bN3EwQfh/9qOhdGZH6D
	q0XHZzgu51sgLWbt0xG08Xmscdnh7/xSfZTEe2x3Nh4EmRP4n+vNJLyYtrFVRgHepetTfIyLSq1nl
	FEcdkHMPLILwjCNJ4XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFcV-007JA2-0r; Mon, 05 Sep 2022 17:10:47 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDKZ-004dTn-ES
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 14:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CnJ+rEJNWWN+Lf3e9s/vp+tvJHaIflmoUiG2DuDyoWE=; b=jqZvvpHbbKoFwuT/GQnCpY/SnY
	ok7nEEH+YLTxgwoZl0Bgl86yZ3ZtZtKClFMCVsFYK864RKm+7CMURnChhZMZYSMOiMXUfL6UCJ5eo
	cpJy2ILHPeaV1ZRy48IdYcbUhTI1XLGNmesEuLcvOLICFaJXhCsVHSsKWfAd9gm3RjDSO69HsMrN8
	7NUzD5Lw4NoakvodN1v/CdBRlIFmFPP/ycknPq0auNGsZwgfJ0aanBoB1pEbPoeZg3D5L1017KYmR
	+wiVtH0y1LMi1pOMincCn79ZjRumkb8k7QR8PqDrlO82dGQlOFmqa5Bm6SXvlzXeZF7EwUt3F4SD7
	p6MpBrsQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCqV-009hPZ-B6
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 14:13:07 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVCpw-0006go-Bt; Mon, 05 Sep 2022 16:12:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
Cc: guoren@kernel.org, apatel@ventanamicro.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
Date: Mon, 05 Sep 2022 16:12:26 +0200
Message-ID: <13885578.y0N7aAr316@diego>
In-Reply-To: <7693745.aoefvbuG5b@diego>
References: <20220905111027.2463297-1-heiko@sntech.de> <1e61d31a-9bf5-af79-dbc4-87d63d24b497@microchip.com> <7693745.aoefvbuG5b@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_151303_664210_D33C2208 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 5. September 2022, 13:23:01 CEST schrieb Heiko St=FCbner:
> Am Montag, 5. September 2022, 13:19:41 CEST schrieb Conor.Dooley@microchi=
p.com:
> > On 05/09/2022 12:10, Heiko Stuebner wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> > > =

> > > Using the appropriate BIT macro makes the code better readable.
> > > =

> > > Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > =

> > Missing the cover-letter with the changelog?
> > At least, I didn't get it in my inbox.
> =

> darn git send-email and its automatic selection ;-)
> =

> I.e. I _should_ have added you to the hard recipient list for my series
> in the first place, but instead git send-email selected you based on
> the Suggested-by ... but it looks like these selectoions don't get
> applied to the cover-letter ... sorry about that

For the record, the series is here:
https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/

Though right now, I don't see it in the linux-riscv list-archive or my
own inbox of that list. Maybe infradead has some issue today.



> =

> =

> Heiko
> =

> =

> > Either way,
> > =

> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > =

> > > ---
> > >   arch/riscv/kernel/cpufeature.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index 729f7a218093..08f7445985dc 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -289,10 +289,10 @@ static u32 __init_or_module cpufeature_probe(un=
signed int stage)
> > >          u32 cpu_req_feature =3D 0;
> > > =

> > >          if (cpufeature_probe_svpbmt(stage))
> > > -               cpu_req_feature |=3D (1U << CPUFEATURE_SVPBMT);
> > > +               cpu_req_feature |=3D BIT(CPUFEATURE_SVPBMT);
> > > =

> > >          if (cpufeature_probe_zicbom(stage))
> > > -               cpu_req_feature |=3D (1U << CPUFEATURE_ZICBOM);
> > > +               cpu_req_feature |=3D BIT(CPUFEATURE_ZICBOM);
> > > =

> > >          return cpu_req_feature;
> > >   }
> > > --
> > > 2.35.1
> > > =

> > =

> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
