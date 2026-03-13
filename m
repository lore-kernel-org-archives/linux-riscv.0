Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2180105F79A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu6p/t8nebqBoz/MByYjkPPcpDwn5eJcBY1ViI3cc7s=; b=obwfDRZS8lMBTz
	btOfet0O+xCiC2V5KY9z00c74A8gzVUiqc8ECzAOZIlV2FGEUNkajEJZsxaQBsOZlMLVpz5mBiQKa
	vm3oFDli0Omu4rI0xNEviESjjrbWUs9nnBE+AfqpK1gJMAQ/pA0jGgfpCi6cuIyLsmkAcC8xfb2KK
	7zaL9whRCnajPywj8W/P4gviUZAsqkVXDkdcT/or0RKvzrxulS33WTzcShjtIr4DOINW7uKSbkNkD
	x/QciJ7eMr2njavUPCTiTpwtJfcx0qTyqMZwUHus3m5stlc1EUCksFXIrcMFD1CNlw6kg9bF+rYqG
	Voa6lKs+S1GkoFrar4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10QE-0000000HaUJ-1mk5;
	Fri, 13 Mar 2026 11:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10QC-0000000HaU6-0lXy
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 11:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D69E60132;
	Fri, 13 Mar 2026 11:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55A5C19421;
	Fri, 13 Mar 2026 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773400271;
	bh=r5oAxsSgqMEW7Ns8Az8YVhuyu0CrjtI8S+hb3nn7Tww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgVyAec3WBE6a+ul+CXwo0AaKRP5WzH8ZLS9BMVWWGFh7Aqnqm65cC7Aj6cZiDf9N
	 8uYUbKxlSm+MuEsEeVuIuFv9z9y1NQBlflrhJy3ZqMshL1Hv019lPjy5YEdvQiCPdn
	 mfwgmVqCGSWFSEW0Qrlz9VgIZBUWqxG9htt306LntceicurnjHdAwoLJDNWBKGp2n0
	 ObwkT6QgDYc6WfaSDIbhNyZWP5A7QEABvKF5VADPiWGUxjfV5rOKGR/Jt2ADIdP2Wk
	 Y5wwFk0YVAEiSBkYxX5++OwYocWVRS8W19PoWV4U59FsPp4RrEBBshzLF2ySHCFsic
	 eikAZFINoXWYA==
Date: Fri, 13 Mar 2026 19:11:08 +0800
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
Message-ID: <20260313111108-GKM302167@kernel.org>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com>
 <20260313001940-GKA407679@kernel.org>
 <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com>
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

Hi Iker,

On 10:42 Fri 13 Mar     , Iker Pedrosa wrote:
> El vie, 13 mar 2026 a las 1:19, Yixun Lan (<dlan@kernel.org>) escribi=F3:
> >
> > Hi Trevor, Iker,
> >
> > On 14:27 Wed 11 Mar     , Trevor Gamblin wrote:
> > > Hi,
> > >
> > > On 2026-03-09 07:40, Iker Pedrosa wrote:
> > > > Add Spacemit P1 PMIC configuration and board power infrastructure f=
or
> > > > voltage regulation support.
> > > >
> > > > - Add board power regulators (12V input, 4V rail)
> > > > - Enable I2C8 for PMIC communication
> > > > - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> > > > - Set up regulator constraints for SD card operation
> > > >
> > > > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > > > ---
> > > >   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 +++++++++++=
+++++++++++++
> > > >   1 file changed, 48 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arc=
h/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d=
7eeaaa0afb4e86425ae36 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > @@ -19,6 +19,25 @@ aliases {
> > > >             ethernet1 =3D &eth1;
> > > >     };
> > > >
> > > > +   reg_dc_in: dc-in-12v {
> > > > +           compatible =3D "regulator-fixed";
> > > > +           regulator-name =3D "dc_in_12v";
> > > > +           regulator-min-microvolt =3D <12000000>;
> > > > +           regulator-max-microvolt =3D <12000000>;
> > > > +           regulator-boot-on;
> > > > +           regulator-always-on;
> > > > +   };
> > > > +
> > > Is this the correct voltage? I don't see a 12V rail in the RV2's
> > > datasheet, and the board's specifications only indicate a 5V USB-C in=
put.
> >
> > Right, this should be fixed. Please note Han submitted one version of b=
asic DT for rv2
> > which I think that series will go in first
> >
> > https://lore.kernel.org/r/20260310161853.3900605-1-gaohan@iscas.ac.cn
> >
> =

> I'm fine with that. Do we have an estimate of when these changes will
> land? I'm fine with rebasing once those are merged, but I'd like to
> continue with the review for the remaining changes in this patch
> series and I'm unsure on how to proceed.
> =

For that changes, likely will target v7.1 merge window

You can continue with current version, once that happen, you can rebase ..

-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
