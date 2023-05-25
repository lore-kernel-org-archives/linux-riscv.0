Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7068C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQcZIjt8/a3CInO5LTyhTHuWj6guFuz3UABLXgDG0Gc=; b=oWcIkK/bc/5RtoJ1R94fP4yWi0
	UOdqvEBv8w5SjQ8Hy+ze+CNxbiNjEBADplMwmUDhiea0G6d1aUcF2gnGAJRfNZiMjvspGlpC49Enm
	Ucc5jwAYIk4dPds4sZh2xs8DPFdwPEmrCO/L2Ha9J1vn7fZ4OW0ETdhEq1XaNV4qq1L41LxYSmhAX
	YPl83GRjzTBVTJxtzrEvl6LJ8EvoSfpPG+AVDJwFrFTg+Av9SKhqI4vpmNTjtCRuOcg34Cv801Zkq
	LFURKsEK5LzzGXDtD+1GnaVLrPJobvjcdfRTjaKjgTEm2FZlTFSQpxrhE7lXOfhyBNADPw3ctKaT5
	shJ0XiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ISF-000BPx-0J;
	Thu, 25 May 2023 21:25:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ISC-000BPG-1H
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 21:25:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4319764AF3;
	Thu, 25 May 2023 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BA6C433D2;
	Thu, 25 May 2023 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685049898;
	bh=sHbl6fw39/hwrmlJz0f1XUrMK4RPjY+BEtvJ1D7Z6J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBIGQ+FOoJUn2/25rDk8lCExgXRTLq0H40OZCNiiUWM5LIolvO5nEr54A4jWfHzVv
	 O4FogGGrf+pKb8qBGh8PNNRgdny0Eo1IELONCVpi9a4EyROmFCbfC6P7iQC3huj7Tq
	 HS/YjjAeaK5Gs4/+aUSHSrqkJPdsCo0V9QVpZPwHt1cixM7JlT1Vg/OAaa8HHpmH9N
	 HV4jFxTIH93nHYduCB4Mlf7J9qg97FCWlwq3gISVM6T7wzYz05qH6Lil5swQfbOlk2
	 o7SLUs/yLVXQZXBfqj7rWESOmKJPd+Ror6wBWyttlrBAdQ2FqQO9D5EA/CtfsuEwXA
	 DPdQ63e1FiZNg==
Date: Thu, 25 May 2023 22:24:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org,
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-batting-botch-7e03393a2d97@spud>
References: <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
 <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy>
 <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy>
 <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud>
 <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud>
 <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_142500_497345_4E91A6E1 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Type: multipart/mixed; boundary="===============8442557369927998153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8442557369927998153==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="giZwDsK7yc/if3gT"
Content-Disposition: inline


--giZwDsK7yc/if3gT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 01:06:04PM -0700, Atish Patra wrote:
> On Thu, May 25, 2023 at 11:39=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, May 25, 2023 at 11:37:40AM -0700, Atish Patra wrote:
> >
> > > Any testing of hibernation still needs to revert the patch until we
> > > have the proper fix.
> >
> > "the patch" is what exactly? I assume you don't mean depending on
> > NONPORTABLE, since that is a Kconfig option.
>=20
> Nope. Sorry I meant the commit
>=20
> 3335068 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")

Ah, if your SBI implementation is one of the affected ones, yeah.
If not, you can just set NONPORTABLE :)

--giZwDsK7yc/if3gT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/SJAAKCRB4tDGHoIJi
0jZOAP9C6VnJh9zSjVcNPKFI5K8sgE4+9cEmsr1nr1WidwGIZAD/bZtFnlwSpd8+
yf6OGQsxALfntjSloQkpjYvxsxhBegE=
=paGv
-----END PGP SIGNATURE-----

--giZwDsK7yc/if3gT--


--===============8442557369927998153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8442557369927998153==--

