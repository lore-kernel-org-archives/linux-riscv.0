Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50E8C83F14
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvxf2ahlrVgDQqa1PY6OOu0EKVRdbXbkwKRb7Qy+kf4=; b=2YlUodCV8jWzizVbI2C0Uw0U7d
	4I61lFMxR5lV21CQO1zDBfTQuoMl/XX56Z7+cy9jE3mOS6i2/8Abzd3Jp0RXDPdgsdMWRA2O5giDo
	rWhU/ldHihRpD6WaBtzHMTYxrKeOaCWR6llKhQdmJQ1/cc6h9QpAP3L8VkzPpv/sar9ivIX/74LFh
	rHeJWgfZV3wcYHIbNtpkteuko8yKoDpXsIxLOIfTInOPsaBSaVfUOUPcJE7GEZKyqz5KvA2QTKKUI
	hoZWY0eGU4vwncG91Aoy2hleS8IKvCnGQ6jfEZRDx91q3z7xEMb4iX/GS5n0n+QE0zPVj7Hj1VrV5
	eI5uZpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qasCe-00Arp1-2j;
	Tue, 29 Aug 2023 06:27:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qasCa-00Aro2-1S
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 06:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693290469; x=1724826469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GGbqLGqMN9df8eATN/J3U86vb4CO2JuXfpoZHqXvJqY=;
  b=nwmTjaV1PHqTiDhOZqix2eJZajVJVUWpc4RWnKzslHntbc0txrVWUwPr
   EoXclup+/O82Fz5HC7vSQzdfree3pyLYaCZCHtlDAmw1r+Ncp4lTYUT6V
   m+b43nQPV7cp8CWj080+7J7cFp9r0UljKJubY7WZQbTiZvBdZMQ57Dmyv
   w4yWpqx9El3a7ItfV6ZsGxSHuiH/D0U5+notpvUASh7xfaspYWy04EpBZ
   mzY1WD9F0tVTl/clKmb+iEaLCa531EPkHnQfDu2WqAO92zDkpRe6SANJm
   PiE2r1mKPBYZmVVzOZSA7sZGIMsxEvk1hG4Dn4SWCWLG2kFjDD41jn7Fr
   A==;
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="asc'?scan'208";a="232227171"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2023 23:27:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 28 Aug 2023 23:27:37 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 28 Aug 2023 23:27:35 -0700
Date: Tue, 29 Aug 2023 07:26:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bjorn@kernel.org>
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <20230829-unbridle-condense-2fc45a442bb6@wendy>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_232748_494231_BE9F713F 
X-CRM114-Status: GOOD (  25.51  )
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
Content-Type: multipart/mixed; boundary="===============4112261749146307343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4112261749146307343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gejlf3F12x47mKDN"
Content-Disposition: inline

--Gejlf3F12x47mKDN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 01:56:34PM +0800, Guo Ren wrote:
> On Mon, Aug 28, 2023 at 4:56=E2=80=AFAM Nam Cao <namcaov@gmail.com> wrote:
> >
> > uprobes expects is_trap_insn() to return true for any trap instructions,
> > not just the one used for installing uprobe. The current default
> > implementation only returns true for 16-bit c.ebreak if C extension is
> > enabled. This can confuse uprobes if a 32-bit ebreak generates a trap
> > exception from userspace: uprobes asks is_trap_insn() who says there is=
 no
> > trap, so uprobes assume a probe was there before but has been removed, =
and
> > return to the trap instruction. This cause an infinite loop of entering
> > and exiting trap handler.
> >
> > Instead of using the default implementation, implement this function
> > speficially for riscv which checks for both ebreak and c.ebreak.
> >
> > Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  arch/riscv/kernel/probes/uprobes.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/pro=
bes/uprobes.c
> > index 194f166b2cc4..91f4ce101cd1 100644
> > --- a/arch/riscv/kernel/probes/uprobes.c
> > +++ b/arch/riscv/kernel/probes/uprobes.c
> > @@ -3,6 +3,7 @@
> >  #include <linux/highmem.h>
> >  #include <linux/ptrace.h>
> >  #include <linux/uprobes.h>
> > +#include <asm/insn.h>
> >
> >  #include "decode-insn.h"
> >
> > @@ -17,6 +18,15 @@ bool is_swbp_insn(uprobe_opcode_t *insn)
> >  #endif
> >  }
>  >
> > +bool is_trap_insn(uprobe_opcode_t *insn)
> > +{
> > +#ifdef CONFIG_RISCV_ISA_C

> Can we remove the CONFIG_RISCV_ISA_C? As you said, "uprobes expects
> is_trap_insn() to return true for any trap instructions". So userspace
> wouldn't be limited by CONFIG_RISCV_ISA_C.

Isn't the RISCV_ISA_C required because there's a different encoding for
EBREAK vs C_EBREAK? That said, this should be using IS_ENABLED() not
#ifdef, since the definition for riscv_insn_is_c_ebreak() is provided
unconditionally afaict.

>=20
> > +       if (riscv_insn_is_c_ebreak(*insn))
> > +               return true;
> > +#endif
> > +       return riscv_insn_is_ebreak(*insn);
> > +}
> > +
> >  unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
> >  {
> >         return instruction_pointer(regs);
> > --
> > 2.34.1
> >

--Gejlf3F12x47mKDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO2PrQAKCRB4tDGHoIJi
0sQOAQDv1oVj7wyYwRi92joynjdOE3DDV2OuEjEbpfrv+eqJjAD+LnNdnWqsf6EW
vXpfa5K8Smd+td9s9Q04/KE8pPsWaAk=
=+9ci
-----END PGP SIGNATURE-----

--Gejlf3F12x47mKDN--


--===============4112261749146307343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4112261749146307343==--

