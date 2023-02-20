Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562B4C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmYpsXDdCgomMwXmo/ROjB/K5zpaWqFglN9RYxpVq4w=; b=yWKJEgwLJu5mGyEoq0W9+qhGpD
	8nPRFYGYRQgxW8no0oYd2AI8CvR+EUzsX46650EqZUW+5j6nzLxS7zlKwAQWk9M+LZ/zV+0wfvVj+
	K1Jp0GMvkMt+xruPOu9ZaOY7V9ML5DCRzxij8sNdYSSTW4/N2jiwUVZIv8JJ/GwQZ4mWAVbR6pqIl
	f7IYErDD2uqU8GOkZFTVmSUD0xGPfcnLcVqasAXrrWORw6X4feHOF5zn45piRiIa7l7vzPoNC0crk
	Ho9R3gFrOeOmDKJ5A8Dk2tppJw0awaDSG/2ZPUgrcVmVoxptBReKtpTL6uCljM+GvyYJQigBQUxBO
	ZyENhAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3r6-003lBr-95; Mon, 20 Feb 2023 10:57:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3r1-003lB1-4W
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 10:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676890628; x=1708426628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jDdc34ua3hSMfXFV4jOX80dQxnqYjzwrw24WUIV9lJQ=;
  b=i3Qxm7rzDzSxZuue9MFKYI4HOBBdaGExdhs6x5cLZJkrC7JWLe5veFua
   QBjvXvU9POJSLfDlkAdizH/28Ob/QEJYsOtaJ8Pi6QnIXZ8ZoTZ1uvpPh
   MCaGZWR3xmAOc3HFBiOoGrWcPBZGoT750Kt4dBAkYpEZQTmxPC8PStPE8
   U/HXFRncnYsBpVkF/U3VypRjjK+oeAJtnX4YTUD1K0e0ECxXhZ7Xzgiwy
   kEqC4Qfk0eAwpa2Hja1o+cAR3twEJ+jji7uz61pDYL7ZQ9MR4/yNDGZbC
   LWK++MpKNHom/OR5rVzTL6R3kePNnrSzZoVgTK+GnpxRNANtfr/4HXQ4e
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669100400"; 
   d="asc'?scan'208";a="197790378"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Feb 2023 03:56:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 03:56:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 20 Feb 2023 03:56:49 -0700
Date: Mon, 20 Feb 2023 10:56:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra
	<atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup
 Patel <anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
Message-ID: <Y/NR18DhIGQrDb7w@wendy>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-7-apatel@ventanamicro.com>
 <Y7X62v5Zp6+thx5A@spud>
 <CAK9=C2UPa5SATTG1pJdckqaoJxh-8EBz8xsENirZQ-vbaHTgjg@mail.gmail.com>
 <Y/NMWZAW4KAqKXEs@wendy>
MIME-Version: 1.0
In-Reply-To: <Y/NMWZAW4KAqKXEs@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_025707_289331_09F5E9D1 
X-CRM114-Status: GOOD (  26.12  )
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
Content-Type: multipart/mixed; boundary="===============5766264477383054898=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5766264477383054898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jSnDV5Ee8m2676wk"
Content-Disposition: inline

--jSnDV5Ee8m2676wk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 10:32:57AM +0000, Conor Dooley wrote:
> On Mon, Feb 20, 2023 at 10:06:49AM +0530, Anup Patel wrote:
> > On Thu, Jan 5, 2023 at 3:47 AM Conor Dooley <conor@kernel.org> wrote:
> > > On Tue, Jan 03, 2023 at 07:44:06PM +0530, Anup Patel wrote:
> > > > We add DT bindings document for RISC-V advanced platform level
> > > > interrupt controller (APLIC) defined by the RISC-V advanced
> > > > interrupt architecture (AIA) specification.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++=
++++
> > > >  1 file changed, 159 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/interrupt-con=
troller/riscv,aplic.yaml
>=20
> > > I'm sorry Anup, but this child versus delegate thing is still not cle=
ar
> > > to me binding wise. See below.
> >=20
> > There are two different information in-context of APLIC domain:
> >=20
> > 1) HW child domain numbering: If an APLIC domain has N children
> >     then HW will have a fixed child index for each of the N children
> >     in the range 0 to N-1. This HW child index is required at the time
> >     of setting up interrupt delegation in sourcecfgX registers. The
> >     "riscv,children" DT property helps firmware (or bootloader) find
> >     the total number of child APLIC domains and corresponding
> >     HW child index number.
> >=20
> > 2) IRQ delegation to child domains: An APLIC domain can delegate
> >    any IRQ range(s) to a particular APLIC child domain. The
> >    "riscv,delegate" DT property is simply a table where we have
> >    one row for each IRQ range which is delegated to some child
> >    APLIC domain. This property is more of a system setting fixed
> >    by the RISC-V platform vendor.
>=20
> Thanks for the explanations. It's been a while since my brain swapped
> this stuff out, but I think delegate/child makes sense to me now.

> Just don't ask me to write the dt entry as proof...

Having looked at Dramforever's QEMU dtb dump a bit more and your
responses to her, I think that I have "come to terms" with it now
actually.
I suppose when the next version comes around I'll make sure that I
arrive in the same ballpark that QEMU does, based off the descriptions
etc in the binding.

Thanks!

--jSnDV5Ee8m2676wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/NR1wAKCRB4tDGHoIJi
0u+GAP0XLd9PvC0s3LcqSNtuFDzWCUDZhswGihu85xIq2c3jigEA11nESkIJ+S8H
pDH3YOtFsT1FnHWHSt515DWQhxTwbA0=
=6jax
-----END PGP SIGNATURE-----

--jSnDV5Ee8m2676wk--


--===============5766264477383054898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5766264477383054898==--

