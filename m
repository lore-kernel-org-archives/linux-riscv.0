Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3652FEF9002
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+JiOIW8/R6nhRKNpvTPNm445Q5UQnGW+L5OlrhBRc4=; b=rRJAMG3GCQNpUm
	Cv3Mt0UBzBSQrvJjkUjNkvuRr7GwXLBpzZUd1H8oNRLN3LX815vW7kBQkPbeG7wcb2ALor1GqCrQP
	rIxpHt1gi5cBgLY+n6/lQY1eEPTLj/L7e9qw/By0tBRM7dW58s/m2dc/6shjZjqvwX5tWtFpRybIT
	UR2vDifGemGK2aEAlVosdS3bmcf8kxG6vnyGn3zGHHm1eOscouidCj8gJBJPA7pyPB4BwEo3nXbtw
	HanKfwPjXAQ0LjaJPpQK5q8MXzEjokQ6ngH+57s5hmHg8fkicwCVuH4UtA+rUyrc5PRwbauKjvgPp
	26RCmzdf86eznj2WFVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxorM-000000003DO-2JGu;
	Wed, 04 Mar 2026 16:14:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxorJ-000000003Cw-1hC7
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 16:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772640841; x=1804176841;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=USt/Ik/mS1ig2nRKigD2oYLhMSZUIkB2Kl9ok/F8KCc=;
  b=k5IzxwqUqaGxEdSKwVCaG/EOvbBzLbX+6XI2fFHjR+iubZycPg3FBbV5
   pEOmZ4/G3wLwZTRP51P1IyRoRfSmaOx424XW6J6D+Ja5I5GAdSSDcpvwe
   cdSJTsgLJIFY8UMBdPH66ng3A8eVQYc+reQ8RP2TncYCvZvvQh/+fslZ8
   C6XJsU1pBVHJfWu5geSuhKvGPol7ZJQ9glMj2GWALR2rI1OEpxm4yztiF
   qPRwTmY189fZJkAjavbdCOuWx2aBaM1xaarxDjsTxaVWi9ding4T+uXIo
   MTO/B5rxawd99vjI0uO1wgGqbfXqE7H9ijyZpiXNPvskAbTgSQtkMwY+k
   A==;
X-CSE-ConnectionGUID: cr6leHxTRLKOjVNzYWDNfA==
X-CSE-MsgGUID: GJo9GULbS3auvwHEFpkAQQ==
X-IronPort-AV: E=Sophos;i="6.21,324,1763449200"; 
   d="scan'208";a="54217680"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2026 09:13:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 4 Mar 2026 09:13:34 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 4 Mar 2026 09:13:34 -0700
Message-ID: <cb782e55-29f9-46c5-8213-397202b326ec@microchip.com>
Date: Wed, 4 Mar 2026 09:13:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2,2/8] net: macb: rename macb_default_usrio to
 at91_default_usrio as not all platforms have mii mode control in usrio
To: Conor Dooley <conor@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>, <andrew+netdev@lunn.ch>,
	<richardcochran@gmail.com>, <abin.joseph@amd.com>, <robh@kernel.org>,
	<edumazet@google.com>, <netdev@vger.kernel.org>, <theo.lebrun@bootlin.com>,
	<pjw@kernel.org>, <Valentina.FernandezAlanis@microchip.com>,
	<krzk+dt@kernel.org>, <sean.anderson@linux.dev>, <aou@eecs.berkeley.edu>,
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
 <a1e36563-0e74-48b2-ae02-813cb28fc931@microchip.com>
 <20260303-stardust-shaky-c8a757ec149d@spud>
 <1d35173d-b364-4c4a-a083-388d3bd27ce5@microchip.com>
 <20260303-speech-reversing-b3fdf4817798@spud>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20260303-speech-reversing-b3fdf4817798@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_081401_459825_E614403F 
X-CRM114-Status: GOOD (  61.37  )
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

On 3/3/26 15:44, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 03:04:19PM -0700, Ryan Wanner wrote:
>> On 3/3/26 11:01, Conor Dooley wrote:
>>> On Tue, Mar 03, 2026 at 10:35:05AM -0700, Ryan Wanner wrote:
>>>> On 2/28/26 17:06, Conor Dooley wrote:
>>>>> Yo,
>>>>>
>>>>> On Sat, Feb 28, 2026 at 03:26:00PM -0800, Jakub Kicinski wrote:
>>>>>> This is an AI-generated review of your patch. The human sending this
>>>>>> email has considered the AI review valid, or at least plausible.
>>>>>>
>>>>>> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
>>>>>> ---
>>>>>> net: macb: rename macb_default_usrio to at91_default_usrio as not all
>>>>>> platforms have mii mode control in usrio
>>>>>>
>>>>>> This patch renames macb_default_usrio to at91_default_usrio to better
>>>>>> reflect that the usrio configuration is platform-specific, and
>>>>>> introduces a new capability flag (MACB_CAPS_USRIO_HAS_MII) to gate MII
>>>>>> mode configuration code for platforms that actually support it.
>>>>>>
>>>>>>> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
>>>>>>> --- a/drivers/net/ethernet/cadence/macb.h
>>>>>>> +++ b/drivers/net/ethernet/cadence/macb.h
>>>>>>> @@ -779,6 +779,7 @@ #define MACB_CAPS_DMA_64B			BIT(21)
>>>>>>>  #define MACB_CAPS_DMA_PTP			BIT(22)
>>>>>>>  #define MACB_CAPS_RSC				BIT(23)
>>>>>>>  #define MACB_CAPS_NO_LSO			BIT(24)
>>>>>>> +#define MACB_CAPS_USRIO_HAS_MII			BIT(25)
>>>>>>>
>>>>>>>  /* LSO settings */
>>>>>>>  #define MACB_LSO_UFO_ENABLE			0x01
>>>>>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>>>>>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>>>>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>>>>>> @@ -4614,13 +4614,15 @@
>>>>>>>
>>>>>>>  	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
>>>>>>>  		val = 0;
>>>>>>> -		if (phy_interface_mode_is_rgmii(bp->phy_interface))
>>>>>>> -			val = bp->usrio->rgmii;
>>>>>>> -		else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
>>>>>>> -			 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>>>>>> -			val = bp->usrio->rmii;
>>>>>>> -		else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>>>>>> -			val = bp->usrio->mii;
>>>>>>> +		if (bp->caps & MACB_CAPS_USRIO_HAS_MII) {
>>>>>>> +			if (phy_interface_mode_is_rgmii(bp->phy_interface))
>>>>>>> +				val = bp->usrio->rgmii;
>>>>>>> +			else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
>>>>>>> +				 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>>>>>> +				val = bp->usrio->rmii;
>>>>>>> +			else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
>>>>>>> +				val = bp->usrio->mii;
>>>>>>> +		}
>>>>>>>
>>>>>>>  		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
>>>>>>>  			val |= bp->usrio->refclk;
>>>>>>
>>>>>> Can bp->usrio be NULL here? The new MACB_CAPS_USRIO_HAS_MII capability
>>>>>> gates the MII-related dereferences of bp->usrio, but bp->usrio is also
>>>>>> dereferenced when MACB_CAPS_USRIO_HAS_CLKEN is set.
>>>>>>
>>>>>> With the change to default_gem_config later in this patch:
>>>>>>
>>>>>> static const struct macb_config default_gem_config = {
>>>>>> 	...
>>>>>> 	.usrio = NULL,
>>>>>> 	...
>>>>>> };
>>>>>>
>>>>>> A device that matches the generic 'cdns,macb' compatible string (without
>>>>>> specific .data) will get bp->usrio = NULL during probe. If the device
>>>>>> tree then has 'cdns,refclk-ext', macb_configure_caps() adds
>>>>>> MACB_CAPS_USRIO_HAS_CLKEN without checking if bp->usrio is valid:
>>>>>>
>>>>>> macb_configure_caps() {
>>>>>> 	...
>>>>>> 	if (of_property_read_bool(np, "cdns,refclk-ext"))
>>>>>> 		bp->caps |= MACB_CAPS_USRIO_HAS_CLKEN;
>>>>>> 	...
>>>>>> }
>>>>>>
>>>>>> Then in macb_init(), the code would dereference bp->usrio->refclk with
>>>>>> bp->usrio being NULL, causing a crash.
>>>>>>
>>>>>> The MACB_CAPS_USRIO_HAS_MII gate only protects the MII-related
>>>>>> dereferences above, not the CLKEN dereference.
>>>>>
>>>>> AI makes a good point here, but in one way this isn't even a problem
>>>>> with the patchset, it's actually another example of the sort of thing
>>>>> that I am trying to get rid of from the driver. As far as I can tell,
>>>>> this was added very recently, for the emac on sama7g5. The sama7g5-emac
>>>>> sets this cap in its match data, as do several other devices, so this
>>>>> code that sets the cap based on the dt property isn't needed.
>>>>>
>>>>> I would like to get rid of setting the cap based on the dt property,
>>>>> because it is inherently tied to how at91 have their USRIO set up.
>>>>> Other platforms that want to use this external refclk might use a
>>>>> different mechanism for the selection, or only support an external
>>>>> source. What USRIO does is very platform specific, so it should be
>>>>> something that is opted in to explicitly. I didn't ask for the property
>>>>> to be bound to only the at91 devices that use it when I reviewed the
>>>>> binding, because I figured other platforms might be able to reuse the
>>>>> property and that's also why I didn't ask for a microchip prefix on the
>>>>> property. For the driver to reflect that general use, it shouldn't then
>>>>> do at91-specific things when the property is present.
>>>>>
>>>>> Ryan, how does this property actually work now, given your removal
>>>>> of the cap from match data was reverted? I feel like it just doesn't do
>>>>> what you want it to do anymore? Before the revert, having the property
>>>>> meant that the value in sama7g5_usrio.refclk would be written to the
>>>>> hardware and not having the property meant that the bit would remain
>>>>> unset. You then had to revert to avoid breaking old devices, because
>>>>> your property changed the default behaviour for the emac, so now having
>>>>> the property means that the value in sama7g5_usrio.refclk is written to
>>>>> the hardware, but that also happens without the property because the cap
>>>>> is set in the match data.
>>>>
>>>> So even with the revert the patch still does what it is intended to do,
>>>> mainly for the sama7g5_gem and the newer SAM devices, sam9x75 and sama7d65.
>>>
>>> Oh, the gems actually have this, but with the default the other way to
>>> the emacs? I had figured that only the emacs actually had it, given they
>>> were all added prior to your change. Obviously the property then cannot
>>> be removed if the gems need it.
>>
>> Yes that is correct, I am not sure why this was left out in the initial
>> implementation of the gems maybe others can give some insight. The gems
>> can, similar to the emacs, take an external or internal ref clock that
>> is decided by the usrio registers. The difference with the gems and the
>> emacs is the gems can have 125MHz refclk for RGMII (50Mhz for RMII)
>> either internal or external where as the emacs can only switch refclk
>> for RMII.
>>
>>>
>>>> Currently with the removal of the change to the emac there is no
>>>> functional difference. With the newer SAM devices that need this usrio
>>>> flexibility this patch still works.
>>>>
>>>> How this works now is for sama7g5_gmac configs, the default is to use
>>>> the internal clock for refclk then adding that dt property will set that
>>>> bit to 1 and refclk will be from an external source. For the
>>>> sama7g5_emac configs this has no effect due to ABI.
>>>>>
>>>>> Unless I am missing something, should we not actually revert
>>>>> dce32ece3bb8f ("net: cadence: macb: Expose REFCLK as a device tree
>>>>> property") and 1b7531c094c88 ("dt-bindings: net: cdns,macb: Add external
>>>>> REFCLK property"), and instead add a property like
>>>>> "microchip,refclk-internal", because that would actually let you
>>>>> override the default behaviour of the driver?
>>>>
>>>> I think this could be the better way to go as this keeps the existing
>>>> behavior for the legacy devices while still allowing the initial goal of
>>>> the patch series. Seems it would be more strait forward in the ABI sense
>>>> to have a "microchip,refclk-internal" property than an "refclk-ext"
>>>> property and having the risk of breaking older devices.
>>>
>>> By the sounds of things, you actually need both to be functional. The
>>> gems default to internal, so need refclk-external and the emacs default
>>> to external so need refclk-internal. Maybe it'd be better to have
>>> "microchip/cdns,refclk-source" that can be set to a string to deal with
>>> both cases?
>>
>> Since a dt string would need to be placed either way could the default
>> be setting be 1 like how the emacs is set then make a
>> "microchip,refclk-internal" flag, this seems to have the minimal amount
>> of conflicts with legacy implementation.
> 
> Unless I misunderstand what you're saying, you're suggesting changing
> the default for the non-emacs? I don't think this can be done, for the
> same reason that your emac patch got reverted - it breaks existing
> devices. With my suggestion, the driver support for refclk-ext would
> remain, so as not to break any existing setups, but it would be removed
> from the binding or marked deprecated.

I understand what you are saying now about the gem and emcas being flipped.

> 
>>> I'd also like to decouple setting the USRIO_HAS_CLKEN cap from what
>>> direction it is set in. That way, all devices with the bit in their
>>> USRIO would set the cap, but the value would come from either a default
>>> in match data or from the dt property if set. I think that's more
>>> natural behaviour for the capability, since the bit is in the usrio
>>> register regardless of which refclk source is used.
>>>
>>> Does that seem reasonable?
>>
>> So to leave the "USRIO_HAS_CLKEN" caps flag in the existing configs for
>> emacs, then have this be a toggle for the gem configs, and the
>> "microchip/cdns,refclk-source" would be parsed to either set this bit to
>> 1 or 0? The USRIO refclk bit will be set in the macb_init() based on if
>> the dt property is there rather than how it is currently implemented now
>> if I understand correctly?
> 
> No, I don't think this is what I am suggesting. I am suggesting adding
> USRIO_HAS_CLKEN to the gem configs, and then modifying the usrio struct
> to have a member called something like "refclk_default_enable" and setting
> it to true for emacs and false for gems. Then in init code somewhere, we
> would do:
> 
> 	if (property_present(refclk-source))
> 		if (property_read_string(refclk-source) == "external"
> 			refclk_enable = true
> 		else
> 			refclk_enable = false
> 	else if (property_present(refclk-ext))
> 		refclk_enable = true
> 	else
> 		refclk_enable = usrio.refclk_default_enable
> 
> Then later on in init, when configuring the caps, we would do:
> 
> 	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
> 
> 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
> 			val |= refclk_enable;
> 
> 		macb_or_gem_writel(bp, USRIO, val);
> 	}
> 
> Or maybe we just roll all that up together inside the !USRIO_DISABLED
> code. 
> 
> The code currently in macb_configure_caps() about refclks would be
> deleted.
> 
> This would produce one property that works for both emacs and gems, not
> change any defaults for existing devices and retain support for whatever
> devicetrees made it into the wild with your property.
> 
> Does that make sense?

If we are set to have an external and internal clock dt property than I
think we should just keep those if statements inside the !USRIO_DISABLED
code block just to keep it more organized and clean and keeping the
current HAS_CLKEN if statement be the fallback default case to set the
register bit value. Some thing like this:

if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
		if (property_present(refclk-source)) {
			if (property_read_string == "external")
				val |= true;
			else
				val |= false;
		}
		else if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
			val |= bp->usrio->refclk;

		macb_or_gem_writel(bp, USRIO, val);
}

Would this be a good middle ground?

Ryan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
