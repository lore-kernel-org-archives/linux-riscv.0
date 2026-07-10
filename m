Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF7C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdPeqmG2jXK8ftS0QXlxeTfdwsYeYoWNAKiGXFnguwY=; b=s5cTzyOZ1MJfkB
	6AZN2nsM2O7uBphpCPUGrDddVgGUHdDSbYVg0vn8pRck84q8D4Oau3CRuWRvlPQ8bH2CTL7aZ3xpO
	nx/yvqMl4t7hXknAru1o8KXOWPeHMavf446I28m+ZDe535t4LePbneRQdQDLACyycBkdB3mJ2LbWv
	B5akR8VacBMju6m/eyzuxd0nfVmRFvETwts8seI8SnZBGhOr6cP+O8oOD+teMfRblIZrHhdKF5RUZ
	ejZmLl/Ywf7RIHp1LVzJAWHvhD8IWPxY+f8Cebegwvlj7vQfQaPMK39HKR571QsomYYnVkm1IvlRD
	+fQReqbkqYuXlIU+OVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCJm-000000055rB-2ITr;
	Fri, 10 Jul 2026 14:35:06 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCJj-000000055pW-1gES
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 14:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1783694084;
	bh=86FHXPa2XXe0jpQafsCvPbpMnYcFK7y2K3Df68+mJKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lYd2+YJCdkpWfiyt34fYgzav+QBwTBrGQ8g8y14C2NJaYu2FaZgoEvPxcNJVg5CQx
	 SGaIpwkn/Nc3/2cgIpEtIp0dlEVq+ayUjQxo4LYmXeEdIR6gZDLEsupr4gOamtyuvB
	 fwY8snMn84TiVbX7+nOzgR9SImP5eBhsXLhhVmMJbl0FY9hZV9OZaEoSwwFhapeEHV
	 mHLk+kumdOGOwOCOF+OLGdHp/cyRNOp3dYbeCPtKzA9/Xts43s99Kbw1JEJTsQntm9
	 tz9cnPYuWzq3SKmrddGUIpR0L2oQuBerK3yLoMM2FxwufklZ4WJL9+FhorLhktD2rR
	 JOs+ncGQ7qrFQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 42B5FB221FCB;
	Fri, 10 Jul 2026 16:34:43 +0200 (CEST)
Message-ID: <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
Date: Fri, 10 Jul 2026 07:34:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Yixun Lan <dlan@kernel.org>
Cc: Andrew Rembrandt <kernel@rembrandt.dev>,
 Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260710022551-GKA106000@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_073503_900638_E219A19E 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Yixun,

On 7/9/26 19:25, Yixun Lan wrote:
> Hi E Shattow,
> 
> On 00:29 Thu 11 Jun     , E Shattow wrote:
>> Hi Andrew,
>>
>> On 6/10/26 02:05, Andrew Rembrandt wrote:
>>> On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
>>>> Do not do this, just leave the rx-internal-delay-ps untouched.
>>>
>>> Sounds good, I'll leave v1 as-is. Many thanks for the review.
>>>
>>> Regards,
>>>
>>> Andrew
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> I do not notice any difference with or without this property present,
>> tested Linux -next with U-Boot modification to devicetree:
>>
>> load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
>> fdt addr $fdt_addr_r
>> fdt resize
>> fdt header get filesize totalsize
>> fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
>> load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
>> # throwaway use of ping is workaround for broken vendor U-Boot
>> ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r
>>
>> Aside, there is still some problem with the driver which does cause it
>> to fail. This can be reproduced by unloading the module and then loading
>> the module; built from -next with 'olddefconfig' of debian Kconfig for
>> kernel 7.1, no patches.
>>
>> # modprobe -r dwmac_spacemit
>> # modprobe dwmac_spacemit
>> [   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
>> PHY (error: -ENODEV)
>>
>> [   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
>> PHY (error: -ENODEV)
>>
> The problem is unrelated to this patch itself, but I can actually confirm here
> 
>> If not reloading the module then I don't see any difference, traffic
>> passes (ping 1.1.1.1) with or without your suggested
>> tx-internal-delay-ps property. Is there a specific test to run to
>> observe expected difference?
>>
> 
> Although I haven't narrowed down to the root cause, but it's kind of
> something wrong with the reset procedure, remove it from phy node will fix
> this issue..
> 
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -232,9 +232,6 @@ mdio {
>                 phy0: phy@1 {
>                         compatible = "ethernet-phy-ieee802.3-c22";
>                         reg = <1>;
> -                       reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> -                       reset-assert-us = <10000>;
> -                       reset-deassert-us = <10000>;
> 
> 

Yes, confirming that workaround (removing nodes as you suggested) is
functional for debian-installer where that reset trouble is being
observed. If there is a patch or discussion later I will follow up then,
also.  On the topic of this ethernet TX timing thread I don't know what
this does? Is there a test situation I may try to know if it is doing
anything? Thanks very much, -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
