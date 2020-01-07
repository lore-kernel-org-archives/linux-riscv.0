Return-Path: <SRS0=vGTX=24=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE8DC33C8C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 11:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17E8207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2020 11:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gy72yyWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17E8207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Gn0sKgSVl88I9a03JnH76quh+NEJOSZxLuBtN1E4nM=; b=Gy72yyWKCj1XdayoBegHU+BSc
	M/aX+KOoGL+qCUY4x4w1r/I819EBifq2qC7gtEt38KKseZTAFCjCOGxqMdjUAdJfL5HogkwNdhXed
	dlFtrt68u5zjbj1ELfXIXyad98vVfdGP6R4IeT+VvjEmSwt2zV76SXUV7vnW7ZJgJ37fbnqqKTYez
	k7+WAWayksYpO74YUxnCkgEs4cBAvLktSEwNAZxmavaMJFc/bczftAD3f5k0207/mDJx2P2eUdoic
	tMtASBjh8IlSp+FoeRgdgVU5/JLGuKeVMgT+U9c+YDNzPHPyKaKJX2IViy5GXH4BK9tGMpk24dizR
	GtW2QVlng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ionRX-0007Cq-NR; Tue, 07 Jan 2020 11:54:39 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ionRS-00079j-AM; Tue, 07 Jan 2020 11:54:36 +0000
Received: by mail-ed1-f67.google.com with SMTP id dc19so50085905edb.10;
 Tue, 07 Jan 2020 03:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/Gn0sKgSVl88I9a03JnH76quh+NEJOSZxLuBtN1E4nM=;
 b=XOtvi0rQH+8Hdy3gr7K0bqX+yNcm+Z45k+3g55aVJqH1N10rAAcv4wDZlp12GzKgv+
 yuxzyH5R44S8R/M36RgjsW8U2Iys1vOr7iEbqVelTbQbGPaaOcucuzR6AxuFR0spkTzt
 o9ZFx44gCIwKgzVBLkNlP++yep2pIJxZhl7BKrGAMDTpPvm4fZPl1pKZQD0lDrAx2j7P
 WXO6pzxNwQj1BRjqOC7/uHV6wSDJkFnqqVnebfxPgt76Y0qtyN2vldTNrlD2C0toXso4
 FxgajkH8JX2GFR/wcLOL5qvysk3iG3/CCiOJGQ5p7j1kCzmmj2uOtZ2XsNPY/zESlN2Q
 HANw==
X-Gm-Message-State: APjAAAXzjfy6FlluRXdYlqD6NBzi2r1/HXChvXzHqZ/CpwihJndoYHtD
 oZY76kTylpG3oJc7f23DqN4=
X-Google-Smtp-Source: APXvYqx1yeqLv4KsAcheDnbCECVEgnRO87Tbb4/fx7f3mlExaDwzc4evn6w18FnCcsfNgAflvXHFmw==
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr114422714edx.157.1578398072576; 
 Tue, 07 Jan 2020 03:54:32 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id cw15sm7677487edb.44.2020.01.07.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 03:54:31 -0800 (PST)
Date: Tue, 7 Jan 2020 12:54:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107115429.GA32632@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
 <20200107113354.ggq6zarewq5ip354@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200107113354.ggq6zarewq5ip354@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_035434_360518_C7B24D2A 
X-CRM114-Status: GOOD (  21.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 07, 2020 at 12:33:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jan 07, 2020 at 12:03:59PM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Jan 07, 2020 at 11:42:34AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > > I guess other solution would be to add stubs for few clk functions.=
=2E.
> > > >=20
> > > > > Also HAS_IOMEM is a typical requirement, but I tested with an ARC=
H=3Dum
> > > > > config (which does't have HAS_IOMEM) and they all compile fine.
> > > >=20
> > > > Because of !HAS_IOMEM, since some time ARCH=3Dum does not support
> > > > COMPILE_TEST. Therefore HAS_IOMEM dependency is not needed for comp=
ile
> > > > testing (and for regular build it is selected by ARCH).
> > >=20
> > > Hehe, I didn't notice because for testing I just dropped the "depends=
 on
> > > ..." lines in Kconfig instead of adding "|| COMPILE_TEST" :-) Still t=
hey
> > > compile fine on UML.
> > >=20
> > > Ah, since bc083a64b6c0 ("init/Kconfig: make COMPILE_TEST depend on
> > > !UML") =3D=3D v4.8-rc1~52^2~83 COMPILE_TEST cannot be enabled on UML,=
 but
> > > later 1bcbfbfdeb00 ("um: add dummy ioremap and iounmap functions")
> > > =3D=3D v4.13-rc1~8^2~6 UM got a dummy implementation. So maybe we cou=
ld
> > > revert bc083a64b6c0 today? (And if not, a comment about why near the
> > > "depends on !UML" in init/Kconfig would be great.)
> > >=20
> > > Orthogonal to that, I wonder if depending on HAS_IOMEM is right even
> > > though the compile testers won't notice it missing. Or should HAS_IOM=
EM
> > > be dropped?
> >=20
> > I think yes, it can be dropped, but this would require:
> > 1. Fixing any dependencies on HAS_IOMEM, e.g.:
> >     WARNING: unmet direct dependencies detected for MFD_SYSCON
> >       Depends on [n]: HAS_IOMEM [=3Dn]
> >       Selected by [y]:
> >       - PHY_DA8XX_USB [=3Dy] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=
=3Dy])
>=20
> I don't understand that warning. What did you modify to trigger that?
> Probably related to the big "if HAS_IOMEM" in drivers/mfd/Kconfig?!

OK, that's actually from my other patch to illustrate the problem:
https://lore.kernel.org/linux-arm-kernel/20200103164710.4829-2-krzk@kernel.=
org/

After reverting of bc083a64b6c0, every driver that selects MFD_SYSCON
(or some other parts) has to depend on HAS_IOMEM.

>=20
> > 2. Checking if all of stubs are implemented (not only IOMEM but maybe
> >    DMA as well). Also 1bcbfbfdeb00 brought only few stubs. Still we
> >    need devm_ioremap_resource() and others.
>=20
> A problem is that it's unclear (to me at least) what the presence of
> HAS_IOMEM actually implies. I thought it's about ioremap + readl +
> writel (including their respective variants). Does it really include dma
> stuff, too?
>=20
> > Quick test shows mentioned "unmet direct dependencies" and:
> >     phy-pxa-usb.c:(.text+0x2f5): undefined reference to `devm_ioremap_r=
esource'
> >     dma-iommu.c:(.text+0x179): undefined reference to `dma_pgprot'
>=20
> dma_pgprot seems to depend on HAS_DMA though, not HAS_IOMEM.
>=20
> (Oh, HAS_DMA is defined using "depends on !NO_DMA" + "default y".
> NO_DMA has three different definitions. Two of them (in
> drivers/crypto/ccree/cc_hw_queue_defs.h and arch/arm/include/asm/dma.h)
> unrelated.)

Yes, HAS_DMA is the second missing piece for UM.

Best regards,
Krzysztof


