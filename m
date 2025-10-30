Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D96CCF9EB
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 00:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4LyG0Lx7orTZG5G0jny3CZwVnZSbwPuYYdQPel1IS0=; b=Uk31iFc8IL+Ayl
	E9KJ7tDp5JKrVyNsjjTEJCElwOsjMS4LvmO8u/XB6PBqEshFqsveioZu9+PzgAWnMC5Aa2ihNXclJ
	VitbjSZNADPscMBBA428WBkbBNC18FPFl2KUZ9w3i4Yw3o9tjkNvENnx6Yof5YAhkzgGBswN4Y2/v
	S6Etkdlk8Rj8O0vnD4qvr1W84meZIYd+dKh+NGON9fZ/oH5kpQrdZqwnGlEUgtf8dXXwDMJLwVJSZ
	TmIuzZySod8blSwH3vYv8wZbioD/87na6wLKMlDzico5csobgVpL+dQvBYaKgxobd65JQg0KYRwWa
	IITkaYSeubarOCLNVL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGF8-00000003HGh-2wXi;
	Thu, 30 Oct 2025 00:10:18 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGF5-00000003HF9-1qmj
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 00:10:17 +0000
Received: by mail-io1-xd43.google.com with SMTP id ca18e2360f4ac-93e8834d80aso19294339f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761783014; x=1762387814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VMgrL4eh2mYx+l5oZfmNXv7av2SRwaUbOAevR++3T8=;
        b=koH9eeHA+/JK2h2SrfNC+eqLcqV9L8oM+09H6Y3PSmpndV9nekKYnOYgQKJLKXmSRx
         2SaNo3uJp2mLWPi5CkD4t9oeuFV1TGbGeun2+zDwmv46V3FegDT4bN5F5dzZdUjNCrAl
         iSGBL6jUa7mJrIu9Wuhw2dARmsfTE4iy06vg1kmqstB84kSE20jzPrC9V2E/okUYP0io
         3V+X25rAyr/VUEFxLNUyHVExKJv7lxHnS/nX+oybvtRASXYI0ULaERcOx3HURdtB9VjB
         ppy5VM7ayKMSvZphXPCxjRKc7m8JnyqjO6bsa50CnXeQV36Dh5H8lk8nlU/N9ePvqcRD
         wIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783014; x=1762387814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VMgrL4eh2mYx+l5oZfmNXv7av2SRwaUbOAevR++3T8=;
        b=jDCkhtEPl2XkL5qNKO7OlNqjgjkjhXBYzkjVkrJYcgGsDpc1vBY5dTTlwWz9qYRczH
         Wfj2I2G/msY17djShze6P+VARmbyq0DhhxlsHnm/UNCARr71mcJQ28e27xytGZ7a4qzC
         D+Na7rn4n0+ZW6yMRDx8hV9fnrRffcGOy1t+z2v3MP3/29VLIOUcjVt8guMbJ/gAhZUE
         CooMdaEri4WYTSGusdnHSRAOc3EZW3o+GolRpe8MuJL9Zak9QmJxksmsez2XdkpsQBW5
         js1tGqv4XJWWpvHCT4Bh5gt03ZfeuJ9v1qXDQaf3SYY3OOdtNbgdfX4+2IEgUc3TAerp
         qt9w==
X-Forwarded-Encrypted: i=1; AJvYcCVbjwrd0UgsW64LQxlYREMI0Mtr1vOeFRX8pNvtprIY2hBgPMh8tb38oGG4xWKCrMm2n+7n1s2GUR7oBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEYD/QdtXa9qjl0CmtwdsXXX2yNpTPtwcFhr12DCCUfGA2MBrF
	ZIw5HUNVP+Bd8+2j6qfTf7yquA5EgOvInRc505q0B/JT5I8DNLy7y/ul+2QVfJeFN0A=
X-Gm-Gg: ASbGncu1zyqqnYum5j8TN+k+nP04CX/bM5S1eV6/lzArBpPD5EWS0sVbwPzdl4+nYjp
	6TmvoJ7NIvo9ipLRRLqF64kwCbaRCq7DvfVRxf9C9BB7tIH3XxnDpw3RZnGp+qgo4HyrNLeaNOP
	OyaDqJsQpB1jjQi1DGmrFi7M9iZRwqtQHTOKCfoKZi7tmw2snI0hBQnW1GGl9l12BrawFxUviis
	pL7l/zcACvBZB+mKEl6uyOKdK8j4C/DGS/smveskCRVbsZQSs/ybqnud1pTq/t4Sw/rEbZEjVRX
	Elx+2+cx/3fOIg5o994SdUD+7mK0Y78dfMzjzVrbgml++5rXKvHwrOE43hBqQt4SSUk+JkkQum2
	nPZ3T0um2hRNScRvzGmwxhUslAWJJpcOzRG/FCDcxv6umgGgDdutvxu8ngyOkUnr5kaPAU1JwtG
	zaCKqEB4O7y+c1teTbI6So5ROUecvanOdwBT9dk91o
X-Google-Smtp-Source: AGHT+IGS7Sez1Zsjkc45MiOR9FLqorMzZtLxO54c8lUefypNW27H7J3DhzlOczc822LiC/qSjQNUVA==
X-Received: by 2002:a05:6e02:1805:b0:42e:d74:7260 with SMTP id e9e14a558f8ab-432f9071e91mr71017075ab.29.1761783014250;
        Wed, 29 Oct 2025 17:10:14 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea946de57sm5939330173.34.2025.10.29.17.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 17:10:13 -0700 (PDT)
Message-ID: <9bebde96-485f-4f30-b54c-be9e6c16f2d6@riscstar.com>
Date: Wed, 29 Oct 2025 19:10:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-6-elder@riscstar.com>
 <274772thveml3xq2yc7477b7lywzzwelbjtq3hiy4louc6cqom@o5zq66mqa27h>
 <4027609d-6396-44c0-a514-11d7fe8a5b58@riscstar.com>
 <paxtbwlvndtsmllhsdiovwqoes7aqwiltac6ah4ehrpkz554y6@uj5k3w5jxeln>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <paxtbwlvndtsmllhsdiovwqoes7aqwiltac6ah4ehrpkz554y6@uj5k3w5jxeln>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_171015_534748_1E4DBFA6 
X-CRM114-Status: GOOD (  59.52  )
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

On 10/28/25 2:06 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 27, 2025 at 05:24:38PM -0500, Alex Elder wrote:
>> On 10/26/25 11:55 AM, Manivannan Sadhasivam wrote:
>>> On Mon, Oct 13, 2025 at 10:35:22AM -0500, Alex Elder wrote:
>>>> Introduce a driver for the PCIe host controller found in the SpacemiT
>>>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>>>> The driver supports three PCIe ports that operate at PCIe gen2 transfer
>>>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>>>> configured for use for USB 3 instead.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---

. . .

>>>> +	ret = devm_regulator_get_enable(dev, "vpcie3v3-supply");
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret,
>>>> +				     "failed to get \"vpcie3v3\" supply\n");
>>>
>>> As mentioned in the bindings patch, you should rely on the PWRCTRL_SLOT driver
>>> to handle the power supplies. It is not yet handling the PERST#, but I have a
>>> series floating for that:
>>> https://lore.kernel.org/linux-pci/20250912-pci-pwrctrl-perst-v3-0-3c0ac62b032c@oss.qualcomm.com/
>>
>> I think that just means that I'll define a DT node compatible with
>> "pciclass,0604", and in that node I'll specify the vpcie3v3-supply
>> property.  That will cause that (pwrctrl) device to get and enable
>> the supply before the "real" PCIe device probes.
>>
> 
> Right.
> 
>> And once your PERST work gets merged into the PCI power control
>> framework, a callback will allow that to assert PERST# as needed
>> surrounding power transitions.  (But I won't worry about that
>> for now.)
>>
> 
> I'm still nervous to say that you should not worry about it (about not
> deasserting PERST# at the right time) as it goes against the PCIe spec.
> Current pwrctrl platforms supporting PERST# are working fine due to sheer luck.
> 
> So it would be better to leave the pwrctrl driver out of the equation now and
> enable the supply in this driver itself. Later, once my pwrctrl rework gets
> merged, I will try to switch this driver to use it.

As I understand it, PERST# should be only be deasserted after
all power rails are known to be stable.

This driver enables the regulator during probe, shortly
before calling dw_pcie_host_init().  That function calls
back to k1_pcie_init(), which enables clocks, deasserts
resets, and initializes the PHY before it changes the
PERST# state.

By "changing the PERST# state" I mean it is asserted
(driven low), then deasserted after 100 milliseconds
(PCIE_T_PVPERL_MS).

I have two questions on this:
- You say the PCI spec talks about the "right time" to
   deassert PERST# (relative to power).  Is that at all
   related to PCIE_T_PVPERL_MS?
- I notice that PERST# is in a deasserted state at the
   time I assert it in this sequence.  Do you see any
   reason I should assert it early as an initialization
   step, or is asserting it and holding it there for
   100 msec sufficient?

>> Is that right?
>>
>>>> +
>>>> +	/* Hold the PHY in reset until we start the link */
>>>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>>>> +			APP_HOLD_PHY_RST);
>>>> +
>>>> +	k1->phy = devm_phy_get(dev, NULL);
>>>> +	if (IS_ERR(k1->phy))
>>>> +		return dev_err_probe(dev, PTR_ERR(k1->phy),
>>>> +				     "failed to get PHY\n");
>>>
>>> Once you move these properties to Root Port binding, you need to have per-Root
>>> Port parser. Again, you can refer the STM32 driver.
>>
>> I see getting the PHY in stm32_pcie_parse_port(), but nothing
>> about the supply (which you mentioned in the other message).
>>
> 
> To conclude, you should move forward with defining the PHY and supply properties
> in the Root Port node, but parse/handle them in this driver itself.

Got it.

>>>> +
>>>> +	k1->pci.dev = dev;
>>>> +	k1->pci.ops = &k1_pcie_ops;
>>>> +	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>>> +
>>>> +	k1->pci.pp.ops = &k1_pcie_host_ops;
>>>> +	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
>>>
>>> This driver is just using a single 'msi' vector, which can only support 32 MSIs.
>>> But MAX_MSI_IRQS is 256. So this looks wrong.
>>
>> In dw_pcie_host_init(), if unspecified, MSI_DEF_NUM_VECTORS=32 is
>> used for num_vectors.  If it is specified, only if the value
>> exceeds MAX_MSI_IRQS=256 is an error returned.
>>
> 
> Yes, because the driver trusts the glue drivers to provide the num_vectors if
> they support more than 32.
> 
>> In dw_handle_msi_irq(), "num_ctrls" is computed based on
>> num_vectors / MAX_MSI_IRQS_PER_CTRL=32.  A loop then
>> iterates over those "controllers"(?) to handle each bit
>> set in their corresponding register.
>>
>> This seems OK.  Can you explain why you think it's wrong?
>>
> 
> So both 'ctrl' and 'msi' IRQs are interrelated. Each 'ctrl' can have upto 32 MSI
> vectors only. If your platform supports more than 32 MSI vectors, like 256, then
> the platform DT should provide 8 'msi' IRQs.

I have asked SpacemiT about this, specifically whether there
are additional interrupts (I don't think there are), or if
not that, additional registers to support MSI 32+ (see
below).  In their downstream driver they handle interrupts
differently.  I suspect num_vectors needs to be set to 32
(or I'll leave it unset and take the default).


In the DesignWare driver, there are up to 8 "ctrls", and each
ctrl has 32 bit positions representing 32 MSI vectors.  Each
can have an msi_irq defined.  An msi_irq is always set up for
ctrl 0.

For any ctrl with an msi_irq assigned, dw_pcie_msi_host_init()
sets its interrupt handler to dw_chained_msi_isr(), which just
calls dw_handle_msi_irq().

The way dw_handle_msi_irq() works, a single ctrl apparently can
handle up to 256 MSI vectors, as long as the block of 3 registers
that manage the ctrl (ENABLE, MASK, and STATUS presumably) are
consecutive in I/O memory for consecutive ctrls.


I looked for other examples.  I see that "pcie-fu740.c", which
supports compatible "sifive,fu740-pcie", sets num_vectors to
MAX_MSI_IRQS, but "fu740-c000.dtsi" defines just one "msi"
interrupt.  And "pci-dra7xx.c" seems to do something similar,
and maybe "pcie-rcar-gen4.c" too.

> Currently the driver is not strict about this requirement. I will send a patch
> to print an error message if this requirement is not satisfied.
> 
>>>> +
>>>> +	platform_set_drvdata(pdev, k1);
>>>> +
>>>
>>> For setting the correct runtime PM state of the controller, you should do:
>>>
>>> pm_runtime_set_active()
>>> pm_runtime_no_callbacks()
>>> devm_pm_runtime_enable()
>>
>> OK, that's easy enough.
>>
>>> This will fix the runtime PM hierarchy of PCIe chain (from host controller to
>>> client drivers). Otherwise, it will be broken.
>> Is this documented somewhere?  (It wouldn't surprise me if it
>> is and I just missed it.)
>>
> 
> Sorry no. It is on my todo list. But I'm getting motivation now.
> 
>> This driver has as its origins some vendor code, and I simply
>> removed the runtime PM calls.  I didn't realize something would
>> be broken without making pm_runtime*() calls.
>>
> 
> It is the PM framework requirement to mark the device as 'active' to allow it to
> participate in runtime PM. If you do not mark it as 'active' and 'enable' it,
> the framework will not allow propagating the runtime PM changes before *this*
> device. For instance, consider the generic PCI topology:
> 
> PCI controller (platform device)
> 	|
> PCI host bridge
> 	|
> PCI Root Port
> 	|
> PCI endpoint device
> 
> If the runtime PM is not enabled for the PCI Root Port, then if the PCI endpoint
> device runtime suspends, it will not trigger runtime suspend for the Root Port
> and also for the PCI controller. Also, since the runtime PM framework doesn't
> have the visibility of the devices underneath the bus (like endpoint), it may
> assume that no devices (children) are currently active and may trigger runtime
> suspend of the Root Port (parent) even though the endpoint device could be
> 'active'.

So this basically marks this controller as a pass-through device that
doesn't itself change state for runtime PM, but still communicates that
somewhere at or below it there might be devices that do participate.
  > For all these reasons, it is recommended to properly reflect the 
runtime PM
> status of the device even if the driver doesn't do anything special about it.
> This is also the reason why I asked you to set pm_runtime_no_callbacks() since
> this driver doesn't register any runtime PM ops.
OK, I think understand now.

> Since this controller driver is the top of the hierarchy, you may ask what could
> happen if this driver runtime PM status is not reflected correctly. Well, most
> controllers have some power domain associated with them controlled by the genpd
> framework. If the runtime PM framework thinks that there are no devices
> connected to the bus and the controller driver also doesn't have the state
> enabled, it may disable the power domain associated with it. If that happens,
> the PCI controller will not work and so the devices in the hierarchy.
> 
> Hope this clarifies.

Yes, it helps a lot.  Thank you.

					-Alex

> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
