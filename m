Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BB5EFB7F9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WPPJVfJ/WajUwgH50LTMWFlhHNBIxu6GIvQPsmu+MI=; b=rIzJXAMuKAAmYR/TQ8AJuhOCrW
	I3TjDH/T4n/h3Y528hbJ85z4hHiRp0wunEDHjecODWcW9+qC7TQ4KVzJiDbdKKO7DUg/wiu1C6XbI
	8EqTc98JVEtbPddo7fH823D6x2u/rZQhMwmGWYZE1mUbTJzlCzZRRTlb5pGoylb+X2/m7tNqfyo6E
	urjR0ycWz30fleGh6TlRR8Dde7K3jKDGR9jJDCZiBtMTy4FpINZij0c0MTh4xS6FcnNmFWNA4GZy1
	1JrsVzy5ALECW6L1MmnPsUx8Eg9c/x+qfx4rdapojIEK5tIOKo7KwxBU9+huhMWzkOjzwDfQhm3JN
	gsrIG2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunOf-00000001cBy-3MZD;
	Tue, 24 Feb 2026 08:03:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunOd-00000001cAr-1yuV
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 08:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771920234; x=1803456234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S12rUZ1OBoMA05J/q6ecWZX+yIVp4hnup0a2gHYSYhA=;
  b=LcNY+b2uPP8eIoiabuqdIh7wMXnS85+1kD9zCdQr7OMy7pdBOdBz01b2
   xk32V1M7ViNb5zwdDhAqJ591vi1aKDK4qASedu5LlMjEYkojBvdo9kTwc
   YCMG5kGzN1+qUYSq+3reluwl2XIxKgXxE25rOH3T+3/m9ioszVB0khhiW
   2td8isaE+xStL4m4Cr1o4UMlhqeLmMiEtEX3AzWmUnOXj5jY/6nq9k1BE
   lqEn8b/c5vlryn1CpaZ81LngYENTMiATu2oxPGBzpLAhXBJcc/ey0l0Xw
   kEn3wcIo/Dp2vI3A9aUbaSdhiAcKnBHYwCpWCvA7P8JDrk1j5y1QFIn0Q
   Q==;
X-CSE-ConnectionGUID: osBqseBoTuOAuxCjcpvPYg==
X-CSE-MsgGUID: f0dLiblbSyi+eNuDA+dhpQ==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="asc'?scan'208";a="221046075"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:03:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 01:03:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 01:03:31 -0700
Date: Tue, 24 Feb 2026 08:03:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <shuah@kernel.org>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260224-likewise-rimless-151f6a12b092@wendy>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy>
 <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_000355_724339_21D929CD 
X-CRM114-Status: GOOD (  23.82  )
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
Content-Type: multipart/mixed; boundary="===============0667656400168317960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0667656400168317960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Buf9mfA6ccW6Des"
Content-Disposition: inline

--9Buf9mfA6ccW6Des
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 09:30:24AM +0530, Himanshu Chauhan wrote:
> Hi,
>=20
> On Mon, Feb 23, 2026 at 3:55=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:
> > > +static void init_sbi_dbtr(void)
> > > +{
> > > +     unsigned long tdata1;
> > > +     struct sbiret ret;
> > > +
> > > +     if (sbi_probe_extension(SBI_EXT_DBTR) <=3D 0) {
> > > +             pr_warn("%s: SBI_EXT_DBTR is not supported\n", __func__=
);
> >
> > This is going to run an all systems, right? A pr_warn() seems
> > inappropriate, given that not supporting this extension isn't a problem.
> > If you want to produce warnings, only do it for < 0 return values and
> > maybe print the actual error code too?
>=20
> It's correct that the absence of the extension is not a problem but an
> informational message can be helpful.
> So, I can use pr_info or pr_info_once for this with proper error code. Ok?

IMO, you shouldn't be printing unless there's an actual error. If every
extension we had support for in the kernel printed a message when it was
absent, our logs would be saturated.

>=20
> Regards
> Himanshu

Did you miss the comment at the end about the remaining TODOs?

Cheers,
Conor.

>=20
> >
> > > +             dbtr_total_num =3D 0;
> > > +             goto done;
> > > +     }
> > > +
> > > +     ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > +                     0, 0, 0, 0, 0, 0);
> > > +     if (ret.error) {
> > > +             pr_warn("%s: Failed to detect triggers\n", __func__);
> > > +             dbtr_total_num =3D 0;
> > > +             goto done;
> > > +     }
> > > +
> > > +     tdata1 =3D 0;
> > > +     tdata1 =3D RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTRO=
L6);
> > > +
> > > +     ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > +                     tdata1, 0, 0, 0, 0, 0);
> > > +     if (ret.error) {
> > > +             pr_warn("%s: failed to detect mcontrol6 triggers\n", __=
func__);
> > > +     } else if (!ret.value) {
> > > +             pr_warn("%s: type 6 triggers not available\n", __func__=
);
> > > +     } else {
> > > +             dbtr_total_num =3D ret.value;
> > > +             dbtr_type =3D RV_DBTR_TRIG_MCONTROL6;
> > > +             pr_warn("%s: mcontrol6 trigger available.\n", __func__);
> > > +             goto done;
> > > +     }
> > > +
> > > +     /* fallback to type 2 triggers if type 6 is not available */
> > > +
> > > +     tdata1 =3D 0;
> > > +     tdata1 =3D RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTRO=
L);
> > > +
> > > +     ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > +                     tdata1, 0, 0, 0, 0, 0);
> > > +     if (ret.error) {
> > > +             pr_warn("%s: failed to detect mcontrol triggers\n", __f=
unc__);
> > > +     } else if (!ret.value) {
> > > +             pr_warn("%s: type 2 triggers not available\n", __func__=
);
> > > +     } else {
> > > +             dbtr_total_num =3D ret.value;
> > > +             dbtr_type =3D RV_DBTR_TRIG_MCONTROL;
> > > +             goto done;
> > > +     }
> > > +
> > > +done:
> > > +     dbtr_init =3D 1;
> > > +}
> >
> > > +
> > > +void hw_breakpoint_pmu_read(struct perf_event *bp)
> > > +{
> > > +     /* TODO */
> > > +}
> > > +
> > > +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > +{
> > > +     /* TODO */
> > > +}
> > > +
> > > +void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > +{
> > > +     /* TODO */
> > > +}
> >
> > This isn't an RFC, why does it have TODOs?

--9Buf9mfA6ccW6Des
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ1bPQAKCRB4tDGHoIJi
0n5nAQDpiu6Vi9GMCaV7UxE0x6rMqnDSBkCTO6wGsAL/WP7HyQD+ICmNuzAKjy55
EC3gXLPhW63Ko/VgYZXsdw+06KTJJwY=
=IEkN
-----END PGP SIGNATURE-----

--9Buf9mfA6ccW6Des--


--===============0667656400168317960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0667656400168317960==--

