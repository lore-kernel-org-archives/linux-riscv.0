Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3199C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqE82arbtD692ypM9x8RB517NyUJRXBqyw8wxWTnIvo=; b=bH35mAFJKAPdISoVLlRH6lqmoq
	n7LCjbYZVMxBAkZHpZ1tzBOM0NSd17vnN1Nna1WBN5xgZAaoaCVzCCPJuo5DmpkrPvD3XZ9A1clOS
	if4pESHkahM3gPFPJ2kkdQrwe1v9cbUK/fkOD8wA3Q+R+biMlTEPsyuRUCHn9zz/p16ovNB5JArIW
	jbhSY3MvHcGEGnWXGZC8c6H+1MQXu9ifVLbNOdG/bJHHCVNt5kXL8BAxo4K3uPNqRQ27JqWdl0ur1
	xec1T7C2ecshW9XGJwVJMWi6ZDgLV1SSBvDWofAV0BBx8xZztoPQ1/Iv0Qgm74ffua+7HlMYbhrUg
	JGLMt9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPjC-0000000CUjI-32j4;
	Tue, 05 Mar 2024 08:00:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPj7-0000000CUf0-1L4c
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 08:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709625640; x=1741161640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gWFAJuQry3gzF9uH7O4D0aDTDmuwfZxjmqEXA+RPFLQ=;
  b=OloVcACqesIsW79fmpmLY1r1J0SHhB73mEf04hau2A9WvN7E/e6vi7JJ
   JcCe9MPMyEjiWzsSzFINNQZjOtBPPKy187+8PbMJ5YZBQ0PQNfiLXZz+g
   UkiBSsPNBGf+ESLq7TqRgJdukx2MQf4JgMjF6WywRrUcYLeAAbzAgI+PW
   1Josu6XifzvLR7v3sslNk7XDkeH7VacKiyNPf8jhj29FQovwq07hiZ9oj
   FhNwzVoDl2kEsZrtdpsQWPNOaX14LUEzalCdn8+9auWrVAKDTjH+AYhi5
   8sJzmBaXMeHmzK+GFLVdAg3X24xBivMHQkxBprri/Lk+junHmVJP5cWuJ
   g==;
X-CSE-ConnectionGUID: aFDr3hW/QMqfVKlnMUlmNA==
X-CSE-MsgGUID: 6fJ54n74SV+WjGmrURhuaQ==
X-IronPort-AV: E=Sophos;i="6.06,205,1705388400"; 
   d="asc'?scan'208";a="18837278"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Mar 2024 01:00:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 01:00:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 5 Mar 2024 01:00:21 -0700
Date: Tue, 5 Mar 2024 07:59:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Conor Dooley
	<conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri
	<andrea@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Andrea Parri
	<parri.andrea@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
Message-ID: <20240305-sarcasm-ending-0f7946490aea@wendy>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-3-alexghiti@rivosinc.com>
 <20240304-makeshift-bakeshop-26c9611de1a3@spud>
 <87msrdzqxi.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Xjgr9_H-sHkmAAc95dAm2jd+_dxLUxSM3RM3NrQJFKGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2Xjgr9_H-sHkmAAc95dAm2jd+_dxLUxSM3RM3NrQJFKGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_000041_564394_FFF9C65E 
X-CRM114-Status: GOOD (  22.70  )
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
Content-Type: multipart/mixed; boundary="===============1295144599445966034=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1295144599445966034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofyVMJD7bERZqUGb"
Content-Disposition: inline

--ofyVMJD7bERZqUGb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 08:33:30AM +0530, Anup Patel wrote:
> On Tue, Mar 5, 2024 at 1:54=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
> >
> > Conor Dooley <conor@kernel.org> writes:
> >
> > > On Thu, Feb 29, 2024 at 01:10:56PM +0100, Alexandre Ghiti wrote:
> > >> For now, we use stop_machine() to patch the text and when we use IPI=
s for
> > >> remote icache flushes (which is emitted in patch_text_nosync()), the=
 system
> > >> hangs.
> > >>
> > >> So instead, make sure every CPU executes the stop_machine() patching
> > >> function and emit a local icache flush there.
> > >>
> > >> Co-developed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > >> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > >> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > >> Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> > >
> > > What commit does this fix?
> >
> > Hmm. The bug is exposed when the AIA IPI are introduced, and used
> > (instead of the firmware-based).
> >
> > I'm not sure this is something we'd like backported, but rather a
> > prerequisite to AIA.
> >
> > @Anup @Alex WDYT?
> >
>=20
> The current text patching never considered IPIs being injected
> directly in S-mode from hart to another so we are seeing this
> issue now with AIA IPIs.
>=20
> We certainly don't need to backport this fix since it's more
> of a preparatory fix for AIA IPIs.

Whether or not this is backportable, if it fixes a bug, it should get
a Fixes: tag for the commit that it fixes. Fixes: isn't "the backport"
tag, cc: stable is.

--ofyVMJD7bERZqUGb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZebQ6QAKCRB4tDGHoIJi
0qg3AQD+yvdHglvWYh8y5lWj9K/+QDa9GdWm0cjqVDuvHYScUgD9FI61pKq1ci91
LXvSARs1oJvF0xK/zbm2iRwaXt4gCAw=
=F+Fw
-----END PGP SIGNATURE-----

--ofyVMJD7bERZqUGb--


--===============1295144599445966034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1295144599445966034==--

