Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4AEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sd2GTgSnagMTrljuQeIAUpwdoJCBwyl//42m/bneTMc=; b=OcUw75xF0dB5VyJ7TNJM5Dn7uN
	AqLcYZ3v2uWLzK1D/1R2GnBZYrAdfWOMc7eNZWu9a8IhEuGNZyBfcxt7X3FBd4lGlxyZC5QnJOM/d
	J4hLewzw7voTZOig/A7gvsSAh1h6nnBLgFHwg1vZjScEt4UO+iaUakpcQ8jinwjPYw+m74/NPLcdV
	fqxStnB0leARIlJsaNYzvpCZBQM88Bvkf+jKkhnIr/i2LEMt9uZceOapZwzZuQ5K/RvFJ7wdxlboT
	2U2+WN8beCIZYFzn7VL0wFdUmzwVHQiZ3qvFLhggJL/qT0En2/q5iMMif9Ej+PnDa7qnmQ5xXwP4i
	S4k7WfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLA6-000xA7-1k;
	Thu, 22 Jun 2023 14:19:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLA2-000x93-2S
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 14:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687443586; x=1718979586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NeSR1vNwipiW/2D8gk01qgwm4EJAmEnPTQtu9D6YhEY=;
  b=dJrvqCMk7q6oSTCjvLYJALB2Wia1TqLPEJSL/tupYPlIHx05H11QL4GF
   DWbLx6QfcXSDWDIJikS787tkGJH78StFfUwRJ8gCF366GpN9u4KSaJzdG
   pzT+Llv4dWkvjpGWaf34IPaOhE2S6QERzaikYXC+17Oq5V2pRobJvFrvr
   MtbHXCOr/8JBU1pF0+uby2KepBup5qhs8weqQ4V3L12y85HyZeTmloG30
   KIepgVweZHd2RTsKHf5ZvTaoEitFcpaCi7yjy4pD8/x5nHaRbhl97uhFX
   sBNf8gXGAL3izMKosp40ZWp+O+eVMbXsr8L3Jpooh+p82t8pKnPTIqj0r
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="asc'?scan'208";a="231605811"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2023 07:19:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 22 Jun 2023 07:19:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 22 Jun 2023 07:19:42 -0700
Date: Thu, 22 Jun 2023 15:19:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230622-ensnare-catnap-1d1183111387@wendy>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-attempt-unstirred-567b0352176a@wendy>
 <CAHVXubhJXUODDnfRJAzAKcutMvz_amP3wAf+4QBKxXzcd_r7Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubhJXUODDnfRJAzAKcutMvz_amP3wAf+4QBKxXzcd_r7Yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_071946_958113_868CC244 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Song Shuai <songshuaishuai@tinylab.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1687133191765898132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1687133191765898132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ZbHIYccJ4yhuuFy"
Content-Disposition: inline

--9ZbHIYccJ4yhuuFy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 02:26:02PM +0200, Alexandre Ghiti wrote:
> On Wed, Jun 21, 2023 at 2:15=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Hey Alex,
> >
> > On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> > > This document describes the constraints and requirements of the early
> > > boot process in a RISC-V kernel.
> >
> > Thanks a lot for writing this & implementing the feedback :)
> > I had one or two minor comments about rather long sentences, but there's
>=20
> Arf, sorry, which one? So that I can fix that in case of a v3.

> > little point I think in respinning for that, so I have ignored them.

Nah, not worth the effort ;)

> > Other than that, didn't spot anything new on this second reading.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Cheers,
> > Conor.

--9ZbHIYccJ4yhuuFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJRYYgAKCRB4tDGHoIJi
0sOtAP4pFW6UOJGC/EkvVCkSSQbfq8gdLRnDTGVDOZ4wEJhvjAD/bXQ665m1ulNR
kjSwM6etTh4yJbDKoTALymORyEIu+w4=
=c0MV
-----END PGP SIGNATURE-----

--9ZbHIYccJ4yhuuFy--


--===============1687133191765898132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1687133191765898132==--

