Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900DEC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=80AhlWnelETbhtUfvqZlXTjDs6y27nB5CTqvuHNOFbA=; b=EeY5iMykGDCOWV
	GHrywvukT9xLFepUdbUh7i9ldOKKoiThMbWiFAttz0fa3RUdX0gyfDVtQ5dmNp/CPiBeCutCVMdrl
	yAGRAaQ/AGdw/0pDtleQXTZQA3PfwagaIQPHRIt9WqMfwxTDscJTutpeP5a6geSZ3wpbY3CFTXdFz
	laZfLNR0Uc4n1rh+cwSdElcak7EtuQW8o2OdYRorPWXmRtCPOlGwmOHjTxk6A1yfLSiRV3XTPJSgE
	cycMLHJJkzti5+zAhpN9hsqJ4F5/n/nNzH+eAQpxo71B/FOjRru8+EB8LQMK+zcPmjInlUF/92T61
	Orw+kmKGKL0TtpAi5CYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnIK-003j3t-C4; Thu, 02 Jun 2022 16:03:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnIH-003j3U-3s
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 16:03:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 618AD6148C;
	Thu,  2 Jun 2022 16:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C3BC385A5;
	Thu,  2 Jun 2022 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654185807;
	bh=Vc3eAUMjMU8tORu4+YbRV1KqF0w9KECltFREEa/MG7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SOUJ9Sa4h8L9vwt8poGEI/YG0hUBQYbHQH2BFCt3a9mlgtpGlou3/7BPBbi09EDqT
	 vIYjtoyqtH7ByGmYUCrMNvVooTmBpfHIM83teW0F91R8GDRf2CvJa89VO2WOPSSd+f
	 bHsvEzkx1/v4Dlwbm+rSVHnE+FNZw8bnGE4lw8E5mY2p/Ep9d4nULcyLlP2JAVuvBi
	 9u8gFJNfA2pToiDTkw4/Z/WMRTvkcgiarq5+k53xMnBj1s1WqUsoJAIQlfw8b/yD4E
	 y2ASSS90imr5/ca0qsIq0nS5Rm8GZMojxvpj9o9SnSptqpfHyz+k/++HZryuEii+tL
	 qr1PhPsy4tRPw==
Date: Thu, 2 Jun 2022 11:03:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor.Dooley@microchip.com, Greg KH <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-clk@vger.kernel.org,
	lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
	linux-pci@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Daire.McNamara@microchip.com,
	Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Message-ID: <20220602160325.GA20054@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_090329_273176_753E1AB8 
X-CRM114-Status: GOOD (  27.99  )
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

On Wed, Jun 01, 2022 at 06:55:40PM -0700, Palmer Dabbelt wrote:
> On Mon, 23 May 2022 13:00:01 PDT (-0700), Conor.Dooley@microchip.com wrot=
e:
> > On 23/05/2022 20:52, Palmer Dabbelt wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
> >> =

> >> On Mon, 23 May 2022 04:42:53 PDT (-0700), Conor.Dooley@microchip.com w=
rote:
> >>> On 05/05/2022 11:55, Conor Dooley wrote:
> >>>> Hardware random, PCI and clock drivers for the PolarFire SoC have be=
en
> >>>> upstreamed but are not covered by the MAINTAINERS entry, so add them.
> >>>> Daire is the author of the clock & PCI drivers, so add him as a
> >>>> maintainer in place of Lewis.
> >>>>
> >>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> Hey Palmer,
> >>> I know youre busy etc but just a reminder :)
> >> =

> >> Sorry, I didn't realize this was aimed at the RISC-V tree.=A0 I'm fine
> >> taking it, but it seems like these should have gone in along with the
> >> drivers.
> > =

> > Yeah, sorry. In hindsight it should've but that ship has sailed. I sent
> > the rng bundled this way b/c I didn't want to end up a conflict.
> > Obv. there's not a rush so I can always split it back out if needs be.
> =

> I'm adding a bunch of subsystem maintainers just to check again.  I =

> don't have any problem with it, just not really a RISC-V thing and don't =

> wan to make a mess.  I've stashed it over at palmer/pcsoc-maintainers =

> for now.

Fine with me, if you want it:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> >> Arnd: maybe this is really an SOC tree sort of thing?=A0 No big deal
> >> either way on my end, just let me know.
> >> =

> >>> Thanks,
> >>> Conor.
> >>>
> >>>> ---
> >>>> =A0 MAINTAINERS | 5 ++++-
> >>>> =A0 1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index fd768d43e048..d7602658b0a5 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -16939,12 +16939,15 @@ N: riscv
> >>>> =A0 K: riscv
> >>>>
> >>>> =A0 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
> >>>> -M:=A0 Lewis Hanly <lewis.hanly@microchip.com>
> >>>> =A0 M: Conor Dooley <conor.dooley@microchip.com>
> >>>> +M:=A0 Daire McNamara <daire.mcnamara@microchip.com>
> >>>> =A0 L: linux-riscv@lists.infradead.org
> >>>> =A0 S: Supported
> >>>> =A0 F: arch/riscv/boot/dts/microchip/
> >>>> +F:=A0 drivers/char/hw_random/mpfs-rng.c
> >>>> +F:=A0 drivers/clk/microchip/clk-mpfs.c
> >>>> =A0 F: drivers/mailbox/mailbox-mpfs.c
> >>>> +F:=A0 drivers/pci/controller/pcie-microchip-host.c
> >>>> =A0 F: drivers/soc/microchip/
> >>>> =A0 F: include/soc/microchip/mpfs.h
> >>>>
> >>>
> > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
