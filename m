Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD31C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqdmiUkG2lpOXHzryxKq69AJewg/fpE7/4VxrwxAxzk=; b=mf1Er/xwxZWoqX
	AQAT6wEENWVSjt0VwfIBsuytn3ELmX8R7JoHeOMLOFBA8Dyjovtb2N0GqXeGi6UHSUrJGvhbDc7/e
	zOlLZyHl5Rb3wZBBtzA/dqr0VGpKaR8isxerC9ACNb0UIlTqf51tgZAJ4AjEcFnSYnVAPHXC/vGcR
	XmYi4Uz4B0ShI3ClLHIPUOcJMokdSY75y0OWwvf6IsQ4AmDUCLumaX8KbPET/uyf488ZFCsY8gqm3
	TgAHOsM9QKhkGo2zZhCKorDFzwbbRZQaYsNAEeLSW559xwnZfIykHWF9Wh25kX3wJ/ZAX0cs2pkL8
	DGvsJgh3i+GWaL/lrrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNt8D-003tA1-2I;
	Mon, 24 Jul 2023 10:49:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNt8A-003t1B-0q
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:49:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4D52F7FD6;
	Mon, 24 Jul 2023 18:48:49 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:48:49 +0800
Received: from [192.168.125.136] (183.27.99.135) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:48:48 +0800
Message-ID: <a687c273-48b1-651e-313f-d8140732c5d8@starfivetech.com>
Date: Mon, 24 Jul 2023 18:48:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Minda Chen <minda.chen@starfivetech.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20230720161555.GA526946@bhelgaas>
From: Kevin Xie <kevin.xie@starfivetech.com>
In-Reply-To: <20230720161555.GA526946@bhelgaas>
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_034934_663953_EB0CB4FC 
X-CRM114-Status: GOOD (  35.53  )
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



On 2023/7/21 0:15, Bjorn Helgaas wrote:
> On Thu, Jul 20, 2023 at 06:11:59PM +0800, Kevin Xie wrote:
>> On 2023/7/20 0:48, Bjorn Helgaas wrote:
>> > On Wed, Jul 19, 2023 at 06:20:56PM +0800, Minda Chen wrote:
>> >> Add StarFive JH7110 SoC PCIe controller platform
>> >> driver codes.
> 
>> >> + * The BAR0/1 of bridge should be hidden during enumeration to
>> >> + * avoid the sizing and resource allocation by PCIe core.
>> >> + */
>> >> +static bool starfive_pcie_hide_rc_bar(struct pci_bus *bus, unsigned int  devfn,
>> >> +				      int offset)
>> >> +{
>> >> +	if (pci_is_root_bus(bus) && !devfn &&
>> >> +	    (offset == PCI_BASE_ADDRESS_0 || offset == PCI_BASE_ADDRESS_1))
>> >> +		return true;
>> >> +
>> >> +	return false;
>> >> +}
>> >> +
>> >> +int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
>> >> +			       int where, int size, u32 value)
>> >> +{
>> >> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
>> >> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> > 
>> > I think you are trying present BARs 0 & 1 as unimplemented.  Such BARs
>> > are hardwired to zero, so you should make them behave that way (both
>> > read and write).  Many callers of config accessors don't check the
>> > return value, so I don't think it's reliable to just return
>> > PCIBIOS_BAD_REGISTER_NUMBER.
>> 
>> This is a hardware defect that we did not hardwired those BARs to
>> zero, and it is configurable for software now.  We have to add this
>> filter function for workaround.
> 
> Yes.  My point is that this only affects the write path, and the read
> probably does not read 0 as it should.  This means lspci will show the
> wrong thing, and the PCI core will try to size the BAR when it doesn't
> need to.  I haven't looked at the BAR sizing code; it might even come
> up with a bogus size and address, when it *should* just conclude the
> BAR doesn't exist at all.
> 

Got it, I will try to hide those BARs both in read and write operations.

>> >> +	/* Ensure that PERST has been asserted for at least 100 ms */
>> >> +	msleep(300);
>> >> +	gpiod_set_value_cansleep(pcie->reset_gpio, 0);
>> > 
>> > At least 100 ms, but you sleep *300* ms?  This is probably related to
>> > https://lore.kernel.org/r/20230718155515.GA483233@bhelgaas
>> > 
>> > Please include a comment with the source of the delay value.  I assume
>> > it's T_PVPERL and T_PERST-CLK from the PCIe CEM spec.  This way we can
>> > someday share those #defines across drivers.
>> 
>> Yes, the delay value here is T_PVPERL from PCIe CEM spec r2.0 (Table
>> 2-4).  At the first time we set 100ms delay according to sector 2.2
>> of the spec: "After there has been time (TPVPERL) for the power and
>> clock to become stable, PERST# is deasserted high and the PCI
>> Express functions can start up."
>> 
>> However, in the compatibility testing with several NVMe SSD, we
>> found that Lenovo Thinklife ST8000 NVMe can not get ready in 100ms,
>> and it actually needs almost 200ms.  Thus, we increased the T_PVPERL
>> value to 300ms for the better device compatibility.
>>
>> We will use a macro to define T_PVPERL, and add comments for the
>> source of it.  If the compatibility delay of 300ms is not
>> reasonable, we can revert it to 100ms.
> 
> Thanks for this valuable information!  This NVMe issue potentially
> affects many similar drivers, and we may need a more generic fix so
> this device works well with all of them.
> 
> T_PVPERL is defined to start when power is stable.  Do you have a way
> to accurately determine that point?  I'm guessing this:
> 
>   gpiod_set_value_cansleep(pcie->power_gpio, 1)
> 
> turns the power on?  But of course that doesn't mean it is instantly
> stable.  Maybe your testing is telling you that your driver should
> have a hardware-specific 200ms delay to wait for power to become
> stable, followed by the standard 100ms for T_PVPERL?
> 

You are right, we did not take the power stable cost into account.
T_PVPERL is enough for Lenovo Thinklife ST8000 NVMe SSD to get ready,
and the extra cost is from the power circuit of a PCIe to M.2 connector,
which is used to verify M.2 SSD with our EVB at early stage.

As the Thinklife NVMe SSD may be a halted product,
and the onboard power circuit of VisionFive V2 is no problem,
we decided revert the sleep time to be 100ms.

We will add a comment for the source of T_PVPERL until your define in pci.h is accepted.

> Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
