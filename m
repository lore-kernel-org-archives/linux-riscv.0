Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6A3EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo74WGn56JJHxlFgjQNTA6OMvJ8mjmgBSt0Cf+8ZKFg=; b=zlWioutVTcBVGBxvnVUhAlrdQi
	0F6nvh6x1FNbAm3EthGJ7oUetRE5q++KYrcA3YIfkxiqF3MKuO1M+AiUS4DHTSJM07zp74T3gfkzp
	lJdZ6G0IqYc2Ukq0U0s/P4DjW0a8qOsIQWpkLLlyJmfOqUmgfNFgynLY152mGltQwTbKJk48pPNfA
	RwniD9kOHEggxCwnjqO3V9VOxPQoVzzyP9vcZ9JfLkx1KP7oFcGLz99Qmap4eGb22OOgrCtXNjJ7T
	N7/75+Dqo9pACx6nkxld1HPAYgfGP+IkVlor11VrgnSo1OAQneN00fWRmvkOmYM+qwqQ7av8uTUkX
	kl3MEzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaBX-00AC7h-0a;
	Thu, 03 Aug 2023 15:24:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaBU-00AC6y-0W
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:24:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75E8561DA8;
	Thu,  3 Aug 2023 15:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A052C433C9;
	Thu,  3 Aug 2023 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691076254;
	bh=ps0OX5jIdA6Pp9zgaz7sRP4v9HKZ6NOefzonsbVDzJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaMCInwsRoeDqbEHLfrPgnp+aUOy6ySKfMqG3jLvM1B1w/bssCUg8ro38lLKr2+dw
	 LLgGMhGu6CNIcO7wwpT6MhayyoL9wn4ZNZDMkdoGAdsgXB+4O78vls7UaN57cFnqkA
	 hMSehkIIbCOKlSpw4QPg+42u2mknU3l7e04nYPDOyJFexOQQqhJtwLbzibPEDyU69u
	 FWSv4khN1rCYkcnmKkX2oYqqW0oLb/pKSidqxZEqJ8H5gLCYsgU4c4cAkk32j6SEz8
	 8U+ogayiYSNH0++PSZq4aKbqy4RcAos+/hmtJdHfGg6dqZ64EHnQJj++Se8MsEdz2c
	 VCDHYE598Lp0w==
Date: Thu, 3 Aug 2023 16:24:11 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5pet6Lev?= <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: Fix local irq restore when flags indicates
 irq disabled
Message-ID: <20230803-sage-mongoose-2452dbe3109d@spud>
References: <20230803132818.2092166-1-luxu.kernel@bytedance.com>
 <20230803-curtly-sandbox-9ff8c7aafb85@spud>
 <CAPYmKFsbGMRY7S6WguDHkkY1futTS7+piKf83Pb+aktO2yLXpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPYmKFsbGMRY7S6WguDHkkY1futTS7+piKf83Pb+aktO2yLXpw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_082416_245475_8E68D0D5 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: multipart/mixed; boundary="===============2466643544745343648=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2466643544745343648==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qX9DtSamNXDyfInn"
Content-Disposition: inline


--qX9DtSamNXDyfInn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 11:20:53PM +0800, =E6=97=AD=E8=B7=AF wrote:
> On Thu, Aug 3, 2023 at 10:36=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > Hey,
> >
> > On Thu, Aug 03, 2023 at 09:28:18PM +0800, Xu Lu wrote:
> > > When arch_local_irq_restore() is called with flags indicating irqs
> > > disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> > > implementation based on csr_set() function only sets SR_IE bit of
> > > CSR_STATUS when SR_IE bit of flags is high and does nothing when
> > > SR_IE bit of flags is low.
> > >
> > > This commit supplies csr clear operation when calling irq restore
> > > function with flags indicating irq disabled.
> > >
> > > Fixes: 6d60b6ee0c97 ("RISC-V: Device, timer, IRQs, and the SBI")
> > > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> > > ---
> >
> > There's no changelog or explanation, so what is the reason for the
> > resend?
> >
> > Cheers,
> > Conor.
>=20
> Sorry for disturbing you.

Nah, tis fine.

> I haven't received any response since the patch was sent last week. I
> think maintainers are busy and thus I want to have a ping. This patch
> was resent because I found it is said that resending patch is one of
> the methods to ping maintainers in this kernel doc:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Right, resending is a valid way to do that - but leaving a comment about
why you are resending under the --- line is advised so that people know
why it is that you are resending.

Thanks,
Conor.

--qX9DtSamNXDyfInn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMvGmwAKCRB4tDGHoIJi
0rrnAQCkHXYxHxGxG4oSXUAxx2XZI+yqXgkHJpn/JOh0/zH7vgEAr7wOdeqv+u1Y
kNMZG9HQcX1C6QNjrRueg8jYB7R5IgA=
=u7Lk
-----END PGP SIGNATURE-----

--qX9DtSamNXDyfInn--


--===============2466643544745343648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2466643544745343648==--

