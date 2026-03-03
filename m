Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233CDEDA6BE
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfvNcD98EcdFm0FvZQLChMowtnYg8QqdytNkUOZ6A1A=; b=X7EtWCmX+PL+8Z
	2zFndVVbT1y3y1S04AbIiV0qEPh14+8HUKBV4b+8aIwGzgnUIok4naP1bt59f6ZwtKbrnrhELabh1
	nuJmCcHrwcyqvCE84mMY/s5uk7tcQxb+jt5JT5D2SyFBogKbHG0/fsx3jKplm217XTujktuVkkA+H
	93aBWoYXnfJly03xSIFXJRaFdpVq1gsvrfU4xuS06roQt4qqGhXAaZyo3meZlKWey3WWZT0FOJ6JX
	0fyrnoqq+cpri4NTloc3ktl/DEYnApf7fEGa0JVPA9l3Z9jIfsKeuO+qHjmvGtdFDJMRO7dsSUOE5
	UpCwy1/qC1UrF+jUlFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTeT-0000000Fejs-0Adb;
	Tue, 03 Mar 2026 17:35:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTeR-0000000FejD-1REw
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 17:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772559319; x=1804095319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zDi+9ip27KvaZgXDANm1Jv8MZl7/WZGTtKX3IVlD78E=;
  b=bmruRbfykpsLQDXVifONA+TOyp0APWNvlXJX6gZ7uwC20DMFULS/cXt9
   7CcjTIKItJPjtgZkSSGk01TNkYVlwqwbpxCBaRmIi7OU4nry9AE2sYK2W
   vPLKG2l80m9nsqzIAt3NXU4m1xtjdFHoaBbL1e9/+IGhSmIekmZrOgG6I
   g+JKWnKTIXMArePN6DvBzqf+Z6evp9jbajuexrWVOT+wKFMhvZ/HPQjE9
   BESfeiA2+AkLeSjWVmhmuUEAIMHbwaTr8ybCfMT4kk4H9URSGa2vXxPTb
   C/LCGDktHB7PehyEiedmtfvFfH2vCRqacU9+eSIx2JbrimtKrx72oLj2y
   Q==;
X-CSE-ConnectionGUID: l+McZhTnR1KWxB6hU/HDTg==
X-CSE-MsgGUID: Qt3zyM1aTdSLW8AmyjYHNQ==
X-IronPort-AV: E=Sophos;i="6.21,322,1763449200"; 
   d="scan'208";a="53416880"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2026 10:35:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 3 Mar 2026 10:35:00 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 3 Mar 2026 10:35:00 -0700
Message-ID: <a1e36563-0e74-48b2-ae02-813cb28fc931@microchip.com>
Date: Tue, 3 Mar 2026 10:35:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2,2/8] net: macb: rename macb_default_usrio to
 at91_default_usrio as not all platforms have mii mode control in usrio
To: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>
CC: <andrew+netdev@lunn.ch>, <richardcochran@gmail.com>,
	<abin.joseph@amd.com>, <robh@kernel.org>, <edumazet@google.com>,
	<netdev@vger.kernel.org>, <theo.lebrun@bootlin.com>, <pjw@kernel.org>,
	<Valentina.FernandezAlanis@microchip.com>, <krzk+dt@kernel.org>,
	<sean.anderson@linux.dev>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <alex@ghiti.fr>,
	<devicetree@vger.kernel.org>, <palmer@dabbelt.com>,
	<nicolas.ferre@microchip.com>, <vineeth.karumanchi@amd.com>,
	<claudiu.beznea@tuxon.dev>, <samuel.holland@sifive.com>,
	<daire.mcnamara@microchip.com>, <conor+dt@kernel.org>,
	<dave.stevenson@raspberrypi.com>, <linux-riscv@lists.infradead.org>,
	<davem@davemloft.net>, <conor.dooley@microchip.com>,
	<narmstrong@baylibre.com>, <pabeni@redhat.com>
References: <20260226-enjoyer-shock-e17f9dc7cbdb@spud>
 <20260228232600.4187398-1-kuba@kernel.org>
 <20260228-shopping-april-a8c4d2481cbe@spud>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20260228-shopping-april-a8c4d2481cbe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_093519_479173_D7D1DCBF 
X-CRM114-Status: GOOD (  45.87  )
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

On 2/28/26 17:06, Conor Dooley wrote:
> Yo,
> 
> On Sat, Feb 28, 2026 at 03:26:00PM -0800, Jakub Kicinski wrote:
>> This is an AI-generated review of your patch. The human sending this
>> email has considered the AI review valid, or at least plausible.
>>
>> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
>> ---
>> net: macb: rename macb_default_usrio to at91_default_usrio as not all
>> platforms have mii mode control in usrio
>>
>> This patch renames macb_default_usrio to at91_default_usrio to better
>> reflect that the usrio configuration is platform-specific, and
>> introduces a new capability flag (MACB_CAPS_USRIO_HAS_MII) to gate MII
>> mode configuration code for platforms that actually support it.
>>
>>> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
>>> --- a/drivers/net/ethernet/cadence/macb.h
>>> +++ b/drivers/net/ethernet/cadence/macb.h
>>> @@ -779,6 +779,7 @@ #define MACB_CAPS_DMA_64B			BIT(21)
>>>  #define MACB_CAPS_DMA_PTP			BIT(22)
>>>  #define MACB_CAPS_RSC				BIT(23)
>>>  #define MACB_CAPS_NO_LSO			BIT(24)
>>> +#define MACB_CAPS_USRIO_HAS_MII			BIT(25)
>>>
>>>  /* LSO settings */
>>>  #define MACB_LSO_UFO_ENABLE			0x01
>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>> @@ -4614,13 +4614,15 @@
>>>
>>>  	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
>>>  		val = 0;
>>> -		if (phy_interface_mode_is_rgmii(bp->phy_interface))
>>> -			val = bp->usrio->rgmii;
>>> -		else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
>>> -			 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>> -			val = bp->usrio->rmii;
>>> -		else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>> -			val = bp->usrio->mii;
>>> +		if (bp->caps & MACB_CAPS_USRIO_HAS_MII) {
>>> +			if (phy_interface_mode_is_rgmii(bp->phy_interface))
>>> +				val = bp->usrio->rgmii;
>>> +			else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
>>> +				 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>> +				val = bp->usrio->rmii;
>>> +			else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>> +				val = bp->usrio->mii;
>>> +		}
>>>
>>>  		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
>>>  			val |= bp->usrio->refclk;
>>
>> Can bp->usrio be NULL here? The new MACB_CAPS_USRIO_HAS_MII capability
>> gates the MII-related dereferences of bp->usrio, but bp->usrio is also
>> dereferenced when MACB_CAPS_USRIO_HAS_CLKEN is set.
>>
>> With the change to default_gem_config later in this patch:
>>
>> static const struct macb_config default_gem_config = {
>> 	...
>> 	.usrio = NULL,
>> 	...
>> };
>>
>> A device that matches the generic 'cdns,macb' compatible string (without
>> specific .data) will get bp->usrio = NULL during probe. If the device
>> tree then has 'cdns,refclk-ext', macb_configure_caps() adds
>> MACB_CAPS_USRIO_HAS_CLKEN without checking if bp->usrio is valid:
>>
>> macb_configure_caps() {
>> 	...
>> 	if (of_property_read_bool(np, "cdns,refclk-ext"))
>> 		bp->caps |= MACB_CAPS_USRIO_HAS_CLKEN;
>> 	...
>> }
>>
>> Then in macb_init(), the code would dereference bp->usrio->refclk with
>> bp->usrio being NULL, causing a crash.
>>
>> The MACB_CAPS_USRIO_HAS_MII gate only protects the MII-related
>> dereferences above, not the CLKEN dereference.
> 
> AI makes a good point here, but in one way this isn't even a problem
> with the patchset, it's actually another example of the sort of thing
> that I am trying to get rid of from the driver. As far as I can tell,
> this was added very recently, for the emac on sama7g5. The sama7g5-emac
> sets this cap in its match data, as do several other devices, so this
> code that sets the cap based on the dt property isn't needed.
> 
> I would like to get rid of setting the cap based on the dt property,
> because it is inherently tied to how at91 have their USRIO set up.
> Other platforms that want to use this external refclk might use a
> different mechanism for the selection, or only support an external
> source. What USRIO does is very platform specific, so it should be
> something that is opted in to explicitly. I didn't ask for the property
> to be bound to only the at91 devices that use it when I reviewed the
> binding, because I figured other platforms might be able to reuse the
> property and that's also why I didn't ask for a microchip prefix on the
> property. For the driver to reflect that general use, it shouldn't then
> do at91-specific things when the property is present.
> 
> Ryan, how does this property actually work now, given your removal
> of the cap from match data was reverted? I feel like it just doesn't do
> what you want it to do anymore? Before the revert, having the property
> meant that the value in sama7g5_usrio.refclk would be written to the
> hardware and not having the property meant that the bit would remain
> unset. You then had to revert to avoid breaking old devices, because
> your property changed the default behaviour for the emac, so now having
> the property means that the value in sama7g5_usrio.refclk is written to
> the hardware, but that also happens without the property because the cap
> is set in the match data.

So even with the revert the patch still does what it is intended to do,
mainly for the sama7g5_gem and the newer SAM devices, sam9x75 and sama7d65.

Currently with the removal of the change to the emac there is no
functional difference. With the newer SAM devices that need this usrio
flexibility this patch still works.

How this works now is for sama7g5_gmac configs, the default is to use
the internal clock for refclk then adding that dt property will set that
bit to 1 and refclk will be from an external source. For the
sama7g5_emac configs this has no effect due to ABI.
> 
> Unless I am missing something, should we not actually revert
> dce32ece3bb8f ("net: cadence: macb: Expose REFCLK as a device tree
> property") and 1b7531c094c88 ("dt-bindings: net: cdns,macb: Add external
> REFCLK property"), and instead add a property like
> "microchip,refclk-internal", because that would actually let you
> override the default behaviour of the driver?

I think this could be the better way to go as this keeps the existing
behavior for the legacy devices while still allowing the initial goal of
the patch series. Seems it would be more strait forward in the ABI sense
to have a "microchip,refclk-internal" property than an "refclk-ext"
property and having the risk of breaking older devices.

Just my train of thought with this,
Ryan
> 
> Cheers,
> Conor.
> 
>>
>>> @@ -4638,13 +4640,6 @@
>>>  	return 0;
>>>  }
>>>
>>> -static const struct macb_usrio_config macb_default_usrio = {
>>> -	.mii = MACB_BIT(MII),
>>> -	.rmii = MACB_BIT(RMII),
>>> -	.rgmii = GEM_BIT(RGMII),
>>> -	.refclk = MACB_BIT(CLKEN),
>>> -};
>>> -
>>
>> [ ... ]
>>
>>> @@ -5219,6 +5214,13 @@ static int eyeq5_init(struct platform_device *pdev)
>>>  	return ret;
>>>  }
>>>
>>> +static const struct macb_usrio_config at91_default_usrio = {
>>> +	.mii = MACB_BIT(MII),
>>> +	.rmii = MACB_BIT(RMII),
>>> +	.rgmii = GEM_BIT(RGMII),
>>> +	.refclk = MACB_BIT(CLKEN),
>>> +};
>>> +
>>
>> [ ... ]
>>
>>> @@ -5432,7 +5448,7 @@ MODULE_DEVICE_TABLE(of, macb_dt_ids);
>>>  	.dma_burst_length = 16,
>>>  	.clk_init = macb_clk_init,
>>>  	.init = macb_init,
>>> -	.usrio = &macb_default_usrio,
>>> +	.usrio = NULL,
>>>  	.jumbo_max_len = 10240,
>>>  };
>>>
>> -- 
>> pw-bot: cr


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
