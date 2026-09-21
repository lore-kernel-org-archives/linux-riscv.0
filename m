Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A150C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTkSvYnpnLouzpWOTZO95CDiuKZJpRdbE+ErOs7ZV8o=; b=gse+D20IP5xhaP/45WKqCMYU7y
	gKziuFgJieNlhDQUcD8pkhEG1e99debg2k0xIsHel86I3TrlLVRwYBlpNOx4HIITAIrcMP+TUkRc9
	rnF3IMEKzBSd7WplSyWH4hxRVzImrWZBgDzQXGWqRHxWSRYX7orMZo1PoE5PvPKJOEghNGVG8Byib
	SWpjXFuQYu2CM8e5yfoZKOqAShLw4DSdD9d5SIJsYL4xFj3R4UDcduvZ0ifRAJcTnSH9giscQYU+G
	NzSbvmyefSnRf98hXujyr5Hu9WVSbOwI22IDsme9DVzMToVH17tBaVTSq62U/7kSlxk/63YY+89AK
	HWdumvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XmF-000000016Uc-0bez;
	Mon, 21 Sep 2026 06:45:23 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xm4-000000016Q4-3CAt
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 06:45:21 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so25687885e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 23:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789973111; x=1790577911; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vo43nW1+HDRpeCs9SBZj5gQKg1OMqxEnbDgZqJ2fh30=;
        b=GxLapejfVHssKFHCPGnevz3IBSKkdXsQvS7nyByRvQgxfuKsifZNp/hryVklDY+t7g
         PC0G1Lwo7oKvVAHgnLX9ZwD9hI/9hAHE6fOAB+UW/8vW3BxIsAUnznzU/TKKpw0sHfQq
         PPZ59T+E2osiU5YLK5PHtc1S/5P7eawW5Q5oK7/emDKUJ2JTNhBe+33KcCS10hfHQPtt
         S//IcrAgn81AD+NqNMxLaNvYOouyropxuNJgNYmJf9juAZlrLCsz3K4cbrDlSomeAKkv
         9oFECeWkAcFVGj+OqZ56I4pxHEz7g5u3/V6sLY/XWxuRBfwyO+l36UmTvmW7YGhPZN+6
         lfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973111; x=1790577911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vo43nW1+HDRpeCs9SBZj5gQKg1OMqxEnbDgZqJ2fh30=;
        b=pfJZvCaL+NUanTsqavcFMlIhSQYOA2gz4CAN5LiawddW/20+lfGIN7tY+8PyjahpvG
         wfYM7Gtd9ascYOKYIOGRJtEF3ZU3WQEaQRSgPAU5o+YMmqAE7orBaAGrfT0NQEPULBj+
         F3zuRQWIHrIInxARv2VNca8LXFyt04wMRFC6xrl8Mz57eJe56PdLs/bo5r5xy5HS3bGE
         m59MZhdpGwNLRcXW2mf5vqGhpxNb25L2fB5hQ7wow0B21omRjT9xcXv3xfgYoTdhBnie
         8YPYO/dTZiLq+Rveflk78kaZf0dq05h3gAuCTjJNBRJzufmCjwopMynkSvsXcvIyn8F8
         J87A==
X-Forwarded-Encrypted: i=1; AKwUvByc4gn896FDuWd8fE6TBALxQ22mpLeQmSmHu4jv2Fq8e16q4pP6ALzuo8Gc1FBinjJlQRUwkk16B60sHA==@lists.infradead.org
X-Gm-Message-State: AFuF++kv0p5s2Zp/eRtfHNQQmOGwMhAkE32IWZLt+4CY0BHnGqsnqbsG
	nbUjMHCelbAUgY1yHMkO2miQDFIncE3x83PEsfvJAeLlVzPWy0K0tGJaomodpFXBPsU=
X-Gm-Gg: AYBFou0xjWJjAv3bwdypHa8W4OuZoxw2wk+7BM9RU09Vd+o0m0JZO9h9Z7JzRqdW4Gq
	jR0B7b1mT+SMpcw0KqpZk/xDJLjqphDbpzAfeizCI7zs8llN63Y7wmLzTS8nNEisrMeWeO9qRdO
	UvEstrXroK9rRoxRG25VMuCAE0cCgm5J+SA1s6Y6O+AwFZTPduRtMz9P7OxdTYNNoBssjdYRnnW
	4XZqK75OxpkOLuAcmMFk4bihZvP7HgiKNs6niT4vpwIVe07MuY1tsB/FbFwHFr83wwDQSUOxESs
	Ap60U8EaXaIeKINPni+toiggYUuBd+oMbqScXRwbOzI0lCvZHJWz6LL66PsnEdugM8AJZoEYCeJ
	IrKBq6kCk5KmaHPzBDTMYBa9IKdYUjNyYjvMPso+W1Nt5iFxCupd6+U0oM+PGVNcPGDVrV/ZE5/
	wSzmJG0VnOKClJpLwssm1x21KI6Jk1WvDCZR5E1EqAYERCf+jHuDK26lIUzlic3P4KVdd/TN/1z
	TQxWlHb59mP5ZBee6dViOYxIzoQN84nu+rk8qiaVU434iolJkWCqHMLuzQACoahLL6q0+TX
X-Received: by 2002:a05:600c:468c:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fc5671095mr142921905e9.7.1789973110468;
        Sun, 20 Sep 2026 23:45:10 -0700 (PDT)
Received: from localhost (p200300f65f19a904d3adedb459c24bc5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d3ad:edb4:59c2:4bc5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd07cca6sm205073975e9.11.2026.09.20.23.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:45:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:45:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guo Ren <guoren@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, anup@brainfault.org, 
	hui.wang@canonical.com, samuel.holland@sifive.com
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
Message-ID: <arDSR9S3tZPB91Zm@monoceros>
References: <20260816070049.2097442-1-guoren@kernel.org>
 <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162>
 <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_234512_827711_5BE5C7D7 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Type: multipart/mixed; boundary="===============4705318028163221665=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4705318028163221665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz72xaap5da5s4zq"
Content-Disposition: inline


--uz72xaap5da5s4zq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
MIME-Version: 1.0

On Fri, Sep 11, 2026 at 09:17:11AM +0800, Guo Ren wrote:
> On Wed, Sep 9, 2026 at 6:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> > > From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> > >
> > > The IPI message type enumeration (and therefore IPI_MAX) is currently
> > > private to arch/riscv/kernel/smp.c.  Several IPI providers need to kn=
ow
> > > the exact number of IPIs that the architecture requires, so move the
> > > enum into the public header.
> > >
> > > This is a pure code movement with no functional change.
> >
> > Other than a build breakage with allmodconfig :) -next has this change
> > as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
> > asm/smp.h"), where it breaks allmodconfig with several errors along the
> > lines of:
> >
> >   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m=
=2Ec:20:
> >   drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclarat=
ion of enumerator 'IPI_MAX'
> >      63 |         IPI_MAX,
> >         |         ^~~~~~~
> >   In file included from include/linux/smp.h:119,
> >                    from include/linux/interrupt_rc.h:17,
> >                    from include/linux/spinlock.h:60,
> >                    from include/linux/sched.h:38,
> >                    from include/linux/ratelimit.h:6,
> >                    from include/linux/dev_printk.h:16,
> >                    from include/linux/device.h:15,
> >                    from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m=
=2Ec:8:
> >   arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IPI_=
MAX' with type 'enum ipi_message_type'
> >      27 |         IPI_MAX
> >         |         ^~~~~~~
> >
> > So one of these needs to change.
>=20
> I prefer to keep IPI_MAX for SMP and rename IPI_MAX in mtk_vpu.h to
> VPU_IPI_MAX, consistent with SCP_IPI_MAX in mtk_scp.h.

That's why using driver specific prefixes are great. Why not
MTK_VPU_IPI_MAX or something along these lines?

Best regards
Uwe

--uz72xaap5da5s4zq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqw0nIACgkQj4D7WH0S
/k7VDggAtMWaEROo9vpYmrGX8ewSro8MIJ04DBeq4qKdJ6ui/DxZ3i54EdW5HjOL
FlXUoSIuzrBY+AMFup3z+q7SgSOaqvB9VhrtY3eXO844a6rt58XBxgSCMGcnvK3l
16EVRxauXer25fmozFfpJwrKTtlFoLiXYftiXgZDFkCsT6anBxhLKu9wEe2PHls0
/zA0cxdCo4kBPPmkeq0C5HH93QX20hBg29dgUYDhE1Beqten0oV0UTJ1f1tBc6XA
ulko1Z/oYE4KDRvHWQZpYRAXTcqfBEbn0Rqaem8X1IBQC3DtFiB7hkHAIJuCB/vH
EBoqrf8X7voMkW97VOkmxr+IY3/KnQ==
=TG+g
-----END PGP SIGNATURE-----

--uz72xaap5da5s4zq--


--===============4705318028163221665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4705318028163221665==--

