Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BCCA0FFC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgVrUQOxGzqNWZBAWO92nOM/LN/b6hpX8htsyAdkYSM=; b=jPioxaEVV1HYIw
	DVfsVEFijCCZqpHAfM7xLHF/jJUkg3LaYUWapmmzuhhgJw6yd6ZyceeKQ6/HAi9tKoteMhX4Y8ch3
	+uXPgV+sMxwoNx/B8Ik4FLJA33XfdrtggpmVjPq/xMNSUoyglN/N2NmsQmcJ6/A/8xsjEOGNF8WYp
	4oixWhBQCJyO/4C/RRmf1ibxba1tQ6ghjD6Mna+nMdlPb+YWFyy/ZK9Pn8DLJ6wi4p9VSiakpqR6n
	UlHlPnPm0h9y4BdSs1LK2/M8pcgryL1glX0Vkpn4MDquXJbmEmdf+NLvUJ0LMDbP3btesct66ohFB
	VmK/wluOrxju39rXSLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzv-0000000FABW-0EIi;
	Wed, 27 Aug 2025 11:07:23 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCXg-0000000ErIh-1TBj
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 09:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756287215;
	bh=3fghkl2yk9rz5bIVyEjDjhowSDJcsJYAqStEl1qbPDU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Mgecbmb3p/PsLbTn+l8oN+uzB7JDNHXI7nd6eH2ypvN+YcsPElYL20phBK57H5wn2
	 Cz45+X9B71J4Jh6YVMe6tkvaIB5n10rjV76pVgEMi/GZKSki6XhQrmBjfBHPXFwltm
	 yIfAaW9yD/M4lQrM0cPuJtbQuQ3lmaiGI2AOXX5E=
X-QQ-mid: zesmtpgz8t1756287213t979e8db4
X-QQ-Originating-IP: +p5Udl5pLkD5rldse5I0GLOWxX+xPdjNmzEYXYfq1hY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 17:33:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 295757120406263004
EX-QQ-RecipientCnt: 23
Date: Wed, 27 Aug 2025 17:33:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, lee@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <1D7078ABFE5E7BF8+aK7Q60w5Vhy1Wreg@LT-Guozexi>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-3-elder@riscstar.com>
 <089D29348F246F2C+aJ6bPgJsp5GjhDs5@LT-Guozexi>
 <b387ebdd-ae5d-4711-9e10-c61cb06f4b5b@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b387ebdd-ae5d-4711-9e10-c61cb06f4b5b@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nnd5cAEgLcFhoWAD0Vlb8+NYa6DFeqnWj/tGOR0GIV8AJHK4EuhRKvVH
	gMHgyGSvwmPDdGjeiI4cBLA9X1WjvSVHxXN9UKhJ+Pbcj7x+QkfssV089eA1OfObBJQweZF
	85fhpuGWlBUM2Mx/HX3obo0TNtXtr8h2PLxvNvjO5F8f4Z53XMclyxflU7GETUxr2+Siyoc
	nYYSr+ZNr255gOga6eqowez4VpF6oLSJpM9JsY/WqQhioj1S4TVDKYYjTdLnTNnbWwB1tdk
	g06LJ+G7P1wcVv4iWIClVuvMLW+0UC/yapanHs3EzZize0wWHbpvKZBv7qlsSkFYUTxfCgu
	fzLYpCdpcZpGRLEbJb6H/syDdsYEIsSWQlhsp+gV4Rjdy1+U+gyI6GGyLPDBfemWhLLOWvf
	rD9mzLkGUxx3J7HwOtb2jDdziqjz2KQIE98qiPZNpPSAtWBtBZbHM0h/QkdQKTnVoIKHdRG
	CxoOuYPRqVF/A1awvaR3BglMOMjmvh4woX4B/q/uMZ+V4f8m984XCPzsSIRH23OMdVTDtBf
	4puv+J3Nawjr8vcKVyDmjGxRiDA6ju+Ybk0lle6pt3KF/9joVNXssOspuhxhuwsOwbA/hvR
	E4X/hPDxkNMU+79ikGdBKhFDnRgHr7WGo+BexBEwi3VNPWlwRZeaMcjNIESRbmgG8XmgVdU
	dJrA7wvfppgDtv2JbNfLfYl75/Hu41cIwYeW72yE4TSgeozjpUI6Q3bFUUnqDKhHZ9bdcgf
	sYPY1ihQkYcQpV5747ExvDFArYlRAaWW1mHZGRItFG95cRw/gbRtIDLNVOLtusY4mduW7nf
	5ehwXblmebB0Vo1hNfbgWKnIrWoOyPCD9e6ZWV7ja40+FstVLsoJFQNDBLkj0cu8di6yIHv
	+ZvmSdjbK0CTASKmEr1KNVIH37Y3qJot6Jm4+y7oWplUfI9fX/HDiCdjVkQybHNBOWL19Fn
	tFlz2A4/zZVgd/OKc1yI61H7byr3Umihle75evUJnU3wM3f11u10sO77AGHORcf7bu0RPSx
	Zp/UkqpqPyScDTD9z5UC9dRKbGhd/KcPuPTuGMzRkEsT8FG/thC45RaeUVpHbfQUOag4z98
	vasK5rLzsgV
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_023409_062567_CF219534 
X-CRM114-Status: GOOD (  36.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 25, 2025 at 11:08:45AM -0500, Alex Elder wrote:
> On 8/14/25 9:28 PM, Troy Mitchell wrote:
> > Hi, Alex,
> > 
> > I did not find any accesses to the P1 shutdown or reboot registers here.
> > Does this mean that the current series does not support reboot or shutdown?
> 
> Yes, that is correct.
> 
> > If so, do you have any plans to support this functionality?
> 
> At this time I personally don't have any plans to add this, but
> it could be added later (by anyone).
> 
> I actually attempted to do this initially, but gave up.  The PMIC
> is accessed via I2C, and I needed to implement a non-blocking
> version of the I2C register write operation.  I tried that, but
I have implemented a non-blocking version of the I2C driver [1]

Link: 
https://lore.kernel.org/all/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com/
[1]

                - Troy
> then found that the shutdown or reboot still did not work reliably.
> As it was, this was more than I originally planned to do, so I just
> implemented the simple RTC operations instead.
> 
> 					-Alex
> 
> > If I have misunderstood, please correct me.
> > 
> > Best regards,
> > Troy
> > 
> > 
> > On Tue, Aug 12, 2025 at 09:45:03PM -0500, Alex Elder wrote:
> > > Enable support for the RTC and regulators found in the SpacemiT P1
> > > PMIC.  Support is implemented by the simple I2C MFD driver.
> > > 
> > > The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
> > > PMIC provides 6 buck converters and 12 LDO regulators.  It also
> > > implements a switch, watchdog timer, real-time clock, and more.
> > > Initially its RTC and regulators are supported.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/mfd/Kconfig          | 11 +++++++++++
> > >   drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
> > >   2 files changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 425c5fba6cb1e..4d6a5a3a27220 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
> > >   	  Say M here if you want to include support for the Qualcomm RPM as a
> > >   	  module. This will build a module called "qcom_rpm".
> > > +config MFD_SPACEMIT_P1
> > > +	tristate "SpacemiT P1 PMIC"
> > > +	depends on I2C
> > > +	select MFD_SIMPLE_MFD_I2C
> > > +	help
> > > +	  This option supports the I2C-based SpacemiT P1 PMIC, which
> > > +	  contains regulators, a power switch, GPIOs, an RTC, and more.
> > > +	  This option is selected when any of the supported sub-devices
> > > +	  is configured.  The basic functionality is implemented by the
> > > +	  simple MFD I2C driver.
> > > +
> > >   config MFD_SPMI_PMIC
> > >   	tristate "Qualcomm SPMI PMICs"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > index 22159913bea03..47ffaac035cae 100644
> > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
> > >   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
> > >   };
> > > +
> > > +static const struct regmap_config spacemit_p1_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +};
> > > +
> > > +static const struct mfd_cell spacemit_p1_cells[] = {
> > > +	{ .name = "spacemit-p1-regulator", },
> > > +	{ .name = "spacemit-p1-rtc", },
> > > +};
> > > +
> > > +static const struct simple_mfd_data spacemit_p1 = {
> > > +	.regmap_config = &spacemit_p1_regmap_config,
> > > +	.mfd_cell = spacemit_p1_cells,
> > > +	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
> > > +};
> > > +
> > >   static const struct of_device_id simple_mfd_i2c_of_match[] = {
> > >   	{ .compatible = "kontron,sl28cpld" },
> > >   	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
> > >   	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
> > >   	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
> > >   	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> > > +	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
> > >   	{}
> > >   };
> > >   MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
> > > -- 
> > > 2.48.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
