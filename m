Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D671C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1eQxrbM1axRruXyj5/kW6t8UsbekBV56CeTmKNfixE=; b=XElgpXsevWXhPK
	HJY6Zkje+CvD5F/vNCtNoTbO8PgB4VVv2f0wPPDnQtNOnBqiuuSglZH6KjNDDt2hZorosUIldwX3B
	qo4UA6yBVWHiBphEjq6KgFTWCgfe+0lmTYfAhPVRDKCY5GSY9peUTuZfff0bj2dCLlBkQRjY3LkzN
	E1ITIqFhTofxsL6eQiKQjTIgx0qDtBHieClE+H8qCg4aB137X3UCAoLEQAX42KAXmrhR1JIERAbly
	AA4LauPRrrwZWgf/cHmY8VMahnkq1JZ/NtMLo6RkzMrO/cZR2ZdHZ7aQ/CxDbEupKMUrZGxeF/z1q
	xULtgYEKyqK68OBm3ZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOk67-00Db8b-In; Mon, 28 Feb 2022 17:46:11 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOk63-00Db5v-CK
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 17:46:09 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nOjeo-0003hq-Jq; Mon, 28 Feb 2022 17:17:58 +0000
Message-ID: <467c5472-25fd-2611-4bb8-d70d6b60b299@codethink.co.uk>
Date: Mon, 28 Feb 2022 17:45:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCHv4 2/2] PCI: fu740: Force gen1 for initial device probe
Content-Language: en-GB
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220223205141.GA149346@bhelgaas>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220223205141.GA149346@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_094607_460391_EB58AF12 
X-CRM114-Status: GOOD (  35.70  )
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

On 23/02/2022 20:51, Bjorn Helgaas wrote:
> On Mon, Feb 21, 2022 at 09:03:47PM +0000, Ben Dooks wrote:
>> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
>> board without this fix from U-Boot (or having U-Boot explicitly start
>> the PCIe via either boot-script or user command).
>>
>> The fix claims to set the link-speed to gen1 to get the probe
>> to work. As this is a copy from U-Boot, the code is assumed to be
>> correct and does fix the issue on the Unmatched. The code is at:
> 
> Maybe something like:
> 
>    Limit the link to Gen1 speed.
> 
> since "the fix claims" and "the code is assumed" is sort of
> weasel-worded.
> 
> The subject says "for initial device probe," but if you change
> PCI_EXP_LNKCAP, I assume that limits the link speed forever, even
> after a retrain?

Yes, thought I had checked this but having just gone back and booted
things again, the following is observed:

- U-Boot "pci enum" and then unpatched kernel -> link 8GT/s
- U-Boot "pci enum" and patched kernel -> link 2.5GT/s
- U-Boot no pci and patched kernel > link 2.5 GT/s

Clearly there needs to be some fix for this, either have two rounds
of soft-reset on the first probe, or if the device does probe at a
degraded link, do something about it.

I am not clear what the correct fix for this is.

1) Detect no U-Boot initialisation and force a two stage probe
2) If no devices on initial probe, go around and do #1
3) Always do a two stage reset
4) Something else.

Do any other systems see this issue?

I assume we need to go back and re-do this. At least this is a 100%
reliable repeat on the Unmatched board in our test rack.

>> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c#L271
> 
> Maybe use this so the link doesn't become stale when more things are
> added to pcie_dw_sifive.c:
> 
>   https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c?id=v2022.01#L271

Thanks, useful to know.

>> The code has been this way since the driver was commited in:
>> https://source.denx.de/u-boot/u-boot/-/commit/416395c772018c6bf52aad36aca163115001793f
> 
> s/commited/committed/

Oops,

> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/pci/controller/dwc/pcie-fu740.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
>> index 842b7202b96e..19501ec8c487 100644
>> --- a/drivers/pci/controller/dwc/pcie-fu740.c
>> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
>> @@ -177,11 +177,30 @@ static void fu740_pcie_init_phy(struct fu740_pcie *afp)
>>   	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
>>   }
>>   
>> +/* This is copied from u-boot. Force system to gen1 otherwise nothing probes
>> + * as found on the SiFive Unmatched board.
>> + */
> 
> s/u-boot/U-Boot/
> 
> Use usual multi-line comment style.

Ok.

> 
>> +static void fu740_pcie_force_gen1(struct dw_pcie *dw, struct fu740_pcie *afp )
>> +{
>> +	unsigned val;
> 
> u32, since that's what dw_pcie_readl_dbi() returns and
> dw_pcie_writel_dbi() expects.
> 
>> +
>> +	dw_pcie_dbi_ro_wr_en(dw);
>> +
>> +	val = dw_pcie_readl_dbi(dw, 0x70 + PCI_EXP_LNKCAP);
> 
> I assume 0x70 is the offset of the PCIe Capability.  There should be a
> #define for that.

Will fix.

>> +	pr_info("%s: link-cap was %08x\n", __func__, val);
> 
>    dev_info(pci->dev, "...");
> 
>> +	dw_pcie_writel_dbi(dw, 0x70 + PCI_EXP_LNKCAP, val | 0xf);
> 
> I don't understand this.  Per PCIe r6.0, sec 7.5.3.6, 1111b is a
> reserved encoding for the low four bits of PCI_EXP_LNKCAP.
> 
> If you want PCI_EXP_LNKCAP to advertise only 2.5 GT/s, the low four
> bits should be 0001b to indicate Supported Link Speeds Vector field
> bit 0, which is defined as 2.5 GT/s.

Yeah, this does not make sense now. I sort of assumed it was W1C
type thing (write-1-clear). I'm just wondering if this is now some
sort of undefined behaviour or they originally meant to clear out
some bits only... It does work, just shows the following from lspci;

  LnkCap: Port #0, Speed unknown, Width x8, ASPM L0s L1, Exit Latency 
L0s <4us, L1 <4us
          ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
  LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
   LnkSta: Speed 2.5GT/s (downgraded), Width x8 (ok)
         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-


>> +	dw_pcie_dbi_ro_wr_dis(dw);
>> +}
>> +
>>   static int fu740_pcie_start_link(struct dw_pcie *pci)
>>   {
>>   	struct device *dev = pci->dev;
>>   	struct fu740_pcie *afp = dev_get_drvdata(dev);
>>   
>> +	/* Force PCIe gen1 otherwise Unmatched board does not probe */
>> +	fu740_pcie_force_gen1(pci, afp);
> 
> I guess the "Unmatched" board is the only thing we need to care about
> here?  Are there or will there be other boards that don't need this?
> 
>>   	/* Enable LTSSM */
>>   	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
>>   	return 0;
>> -- 
>> 2.34.1
>>
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
