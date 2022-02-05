Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18987C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Feb 2022 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtwmBw5cO+OsdLn4tJHfWZg5dGhOg6KbhmLRsorRDDQ=; b=Bb0GOhNjkDVTjhBq9btuYkH11m
	lFtKe5tjceJUMcgHqZklLBzblSYSQ3a47S9dSKPF7U3G46GhmS00kiORTdkZtapjkEJTMRX0zRVBR
	lyJFs75QIC7812AwdwBXD4lOf4nPA7OruLE4oq80+CGCGZIUmdCvDjkH5bYmWzNV5j7v/XIjxhwuB
	I8dCU5CiiKBPYzLrhL64KACrMCXQFR2QD4cWMstMqB9tR5K5dQHAEoiNb+5s+9zeUf87izKK2vQE7
	wYV6W/5TOYR7bl8d92LnGuGA9VPnCO9jL4FYbGGz90/wyLcTlF7eTacs2cLJPddbTuPSD+eRrKG/w
	MFYUlfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGGuj-006Hwg-9t; Sat, 05 Feb 2022 08:59:25 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGGuf-006Hvv-EQ
 for linux-riscv@lists.infradead.org; Sat, 05 Feb 2022 08:59:23 +0000
Received: from [78.40.148.178] (helo=webmail.codethink.co.uk)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nGGuX-0005XR-Vr; Sat, 05 Feb 2022 08:59:13 +0000
MIME-Version: 1.0
Date: Sat, 05 Feb 2022 08:59:13 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu
 <greentime.hu@sifive.com>, lorenzo.pieralisi@arm.com, robh@kernel.org,
 kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, macro@orcam.me.uk
Subject: Re: [PATCH] PCI: fu740: RFC: force gen1 and get devices probing
In-Reply-To: <CAEn-LTo96qGWyq7Zp9=VUaJh_kAW2JA7hRKwVzrSyz=xwDT=rg@mail.gmail.com>
References: <20220204183316.328937-1-ben.dooks@codethink.co.uk>
 <CAEn-LTo96qGWyq7Zp9=VUaJh_kAW2JA7hRKwVzrSyz=xwDT=rg@mail.gmail.com>
Message-ID: <32a067b4a6b14fc4229c5f56e0280101@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220205_005922_378585_509C3067 
X-CRM114-Status: GOOD (  25.21  )
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



On 2022-02-04 19:12, David Abdurachmanov wrote:
> On Fri, Feb 4, 2022 at 8:35 PM Ben Dooks <ben.dooks@codethink.co.uk> 
> wrote:
>> 
>> The dw pcie core does not probe devices unless this fix
>> from u-boot is applied. The link must be changed to gen1
>> and then the system will see all the other pcie devices
>> behind the unmatched board's bridge.
>> 
>> This is a quick PoC to try and get our test farm working
>> when a system does not have the pcie initialised by a
>> u-boot script.
>> 
>> I will look at a proper patch when I am back in the office
> 
> Hi,
> 
> Have you looked into the patches posted for Linux and U-Boot from
> Maciej W. Rozycki?

I haven't seen any u-boot patches, but I do know u-boot has been
able to do this since 2021.08 release as a colleague has apparently
know about needing to initialise PCIe under u-boot to get Linux to
properly enumerate devices.

Do you have a reference to these, trivial google searches did not
show any patches.

> On the Linux side (not reviewed yet):
> [PATCH v3] pci: Work around ASMedia ASM2824 PCIe link training failures
> https://www.spinics.net/lists/linux-pci/msg120112.html

This is not the issue, we do not see even the ASMedia PCIe bridge
if u-boot does not have PCIe initialisation done.

> The U-Boot fix was merged a few days ago.

Ok, but I think the kernel should also have this fix done as it
seems bad to have to upgrade u-boot on all the machines for
something that is not a large fix.

> david
> 
>> ---
>>  drivers/pci/controller/dwc/pcie-fu740.c | 37 
>> +++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c 
>> b/drivers/pci/controller/dwc/pcie-fu740.c
>> index 960e58ead5f2..44f792764e45 100644
>> --- a/drivers/pci/controller/dwc/pcie-fu740.c
>> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
>> @@ -181,11 +181,48 @@ static void fu740_pcie_init_phy(struct 
>> fu740_pcie *afp)
>>         fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, 
>> PCIEX8MGMT_PHY_INIT_VAL, afp);
>>  }
>> 
>> +/* u-boot forces system to gen1 otherwise nothing probes... */
>> +static void pcie_sifive_force_gen1(struct dw_pcie *dw, struct 
>> fu740_pcie *afp )
>> +{
>> +       unsigned val;
>> +
>> +#if 0
>> +       /* u-boot code */
>> +        /* ctrl_ro_wr_enable */
>> +        val = readl(sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
>> +        val |= DBI_RO_WR_EN;
>> +        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
>> +
>> +        /* configure link cap */
>> +        linkcap = readl(sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
>> +        linkcap |= PCIE_LINK_CAP_MAX_SPEED_MASK;
>> +        writel(linkcap, sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
>> +
>> +        /* ctrl_ro_wr_disable */
>> +        val &= ~DBI_RO_WR_EN;
>> +        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
>> +#endif
>> +
>> +       val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
>> +       val |= PCIE_DBI_RO_WR_EN;
>> +       writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);

I've found pre-made functions for these.

>> +
>> +       val = readl(dw->dbi_base + 0x70 + 0x0c);
>> +       val |= 0xf;
>> +       writel(val, dw->dbi_base + 0x70 + 0x0c);

Will fix to config-register 0x0c and try and find the relevant macros
for this and the proper accessor macros for the dw driver.

>> +
>> +       val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
>> +       val &= ~PCIE_DBI_RO_WR_EN;
>> +       writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
>> +}
>> +
>>  static int fu740_pcie_start_link(struct dw_pcie *pci)
>>  {
>>         struct device *dev = pci->dev;
>>         struct fu740_pcie *afp = dev_get_drvdata(dev);
>> 
>> +       pcie_sifive_force_gen1(pci, afp);

I'll change this to fu740_pcie_force_gen1()

>> +
>>         /* Enable LTSSM */
>>         writel_relaxed(0x1, afp->mgmt_base + 
>> PCIEX8MGMT_APP_LTSSM_ENABLE);
>>         return 0;
>> --
>> 2.34.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
