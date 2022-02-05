Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C24AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Feb 2022 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7T1yRp79kjdjE1FR9LJJ7Yzrgx9h6FhzX/xKJh9ImeU=; b=TTRlOkJCAXZ21WrPiRuFJXePTS
	63l4Wtur+3G2DsjqnvWLTXOCmCuzDYXSoZPfRjqvFZJIB5RPmAx8es2aCyat75ieio5dN4AboBQmH
	lcep+4sHBCQR9iTw8y8k1IX9vLeijTJh77o4CfYKBrI0cCXYVpVFoLT6HUwh7LQmDrYrRkpkz9IGI
	xFK0+gx1CEOaz42cKclvufSfaT3RFA1r5nGHp6RQVwpp4Idt55DbNOny+NbVVNObG7QTROj5JzXty
	Q5lAL/Bq7YLMFsGruIALOOR0yhV0Su04O81KdB+Lh1TQTO6Pq2aKXtDg2fivDc4ed/ddR+f8ZCoDj
	nFa47wwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGGo4-006HW5-Kb; Sat, 05 Feb 2022 08:52:32 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGGo0-006HUb-7j
 for linux-riscv@lists.infradead.org; Sat, 05 Feb 2022 08:52:29 +0000
Received: from [78.40.148.178] (helo=webmail.codethink.co.uk)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nGGnp-0005LZ-Ak; Sat, 05 Feb 2022 08:52:17 +0000
MIME-Version: 1.0
Date: Sat, 05 Feb 2022 08:52:17 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] PCI: fu740: fix finding gpios
In-Reply-To: <20220204225308.GA225749@bhelgaas>
References: <20220204225308.GA225749@bhelgaas>
Message-ID: <90fdcc8b0b4e1b6cd9913923fcfb6415@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220205_005228_311512_7F19930C 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2022-02-04 22:53, Bjorn Helgaas wrote:
> Follow subject line convention (s/fix/Fix/, s/gpios/GPIOs/).
> 
> On Fri, Feb 04, 2022 at 05:38:21PM +0000, Ben Dooks wrote:
>> The calls to devm_gpiod_get_optional() have the -gpios on
>> the name. This means the pcie driver is not finding the
>> necessary reset or power gpios to allow the pcie devices
>> on the SiFive Unmatched boards.
>> 
>> Note, this was workng around 5.16 and may not have been
>> broken? There is still an issue if uboot has not probed
>> the pcie bus then there are no pcie devices shown when
>> Linux is started.
> 
> Wrap to fill 75 columns
> s/gpios/GPIOs/
> s/pcie/PCIe/
> s/workng/working/
> s/to allow the pcie devices/to allow the PCIe devices <to something>?/

Thank you, will reword this and re-post.

The note will be removed anyway as explained below.

> I can't tell what this is saying.  It used to work and something broke
> it?  If so, we should have a "Fixes:" tag to identify the commit that
> broke it.
> 
> Or it used to work and "may *not* have been broken"?  I'm confused.
> 
> Unclear how uboot is involved.

I wasn't until we finally tracked down and posted the issue about the
gen1 speed setting for bridge probing. All we knew is that the board
would work if you initialised the PCIe in u-boot, and otherwise would
not probe any peripherals. We have posted a patch for that and are
going to try and sort out what needs doing there.

The issue for the probe is here:
https://marc.info/?l=linux-pci&m=164399947722914&w=3

I also think this may never have worked given the issue above, there
are no clear commits that would break this and the driver has had
very little modification since being added. It may have been luck
that most people are booting from a PCIe device and have uboot start
the PCIe for them.

It is possible there may have been changes in the GPIO or GPIO-OF
handling, but again it may have been masked by uboot initialisaton.
Our boot logs suggest somewhere around 5.16 something changed that
stopped probes working. I will try and bisect down next week to see
if the kernel is at fault or some part of the test framework,
uboot changes or other issues.

>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  drivers/pci/controller/dwc/pcie-fu740.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c 
>> b/drivers/pci/controller/dwc/pcie-fu740.c
>> index 00cde9a248b5..842b7202b96e 100644
>> --- a/drivers/pci/controller/dwc/pcie-fu740.c
>> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
>> @@ -259,11 +259,11 @@ static int fu740_pcie_probe(struct 
>> platform_device *pdev)
>>  		return PTR_ERR(afp->mgmt_base);
>> 
>>  	/* Fetch GPIOs */
>> -	afp->reset = devm_gpiod_get_optional(dev, "reset-gpios", 
>> GPIOD_OUT_LOW);
>> +	afp->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>>  	if (IS_ERR(afp->reset))
>>  		return dev_err_probe(dev, PTR_ERR(afp->reset), "unable to get 
>> reset-gpios\n");
>> 
>> -	afp->pwren = devm_gpiod_get_optional(dev, "pwren-gpios", 
>> GPIOD_OUT_LOW);
>> +	afp->pwren = devm_gpiod_get_optional(dev, "pwren", GPIOD_OUT_LOW);
>>  	if (IS_ERR(afp->pwren))
>>  		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get 
>> pwren-gpios\n");
>> 
>> --
>> 2.34.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
