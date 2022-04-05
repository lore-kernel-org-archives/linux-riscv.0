Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695CEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vl8UfQEjbKM5Eew08eP60y6CKtoCVehJPCihL7b4Jyw=; b=Al+ZEQX7jdp4gv
	UHbso0RfyuvdIJhOzk9q2t3AGBU/N0MM4OLJiIxcp45ezV5xIdDwjkZDSxDlJi+jYFvPBOFVdQQNa
	qIQ42lSu9pjAIBaOZ1/DJmv1FBAstKcqwnxhrIcypncu5k739aw31mDhf9VCD+q0MouObQsTpGsbn
	ya0LEnSErNXUBXVnKdKt2XQDDJPrcDAFGs7mR5vwic2tGuIQWwcE6BRXyOsnv3eo4xvpgLL7gYMZZ
	2TYrADEytR6Mx6d7HujfvzIDihkGFZjs1tGYn2mREqXTdLa1f/kp3hjSqXVmUckVOZa2qo+5nfWwb
	Hl+kYu+JxnutGkBDhMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbo1b-002E7Y-LP; Tue, 05 Apr 2022 18:35:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbo1Y-002E63-K6
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 18:35:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h4so20610922wrc.13
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 11:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fMfK7hmCnbrxv84hU70wjXKP41CBHA8Tij4U12U5HGc=;
 b=6aTeEx0imUwl6lvQlIFGBzuBgW6bSzbe1GtQiiGT62QGUqRtuqc9wY7zWWfyxerxTW
 f6cy2XGL9VRfIzApuLSuYsp8COb64RmnLH5H7lhpXGwgn+V5XDAvaw0ZoAoihcj71ryt
 hFny7cIE3afYaj2eMsOV/20RpdSoaOBmiM1pNd6Uviqm5bySN04f4FnidN1lZ36K9uh+
 FkOf4FwBqvNgqvj2+NludQticqsIFlGdVY7/6llIsnJGuiv6eZr/p2fTnPTSolLqcjRz
 XVSr2dmzIrPhKzMnAfvDA7CWNZEWK5GHODlB4qc2QAvWrdNXjmNwfQLwN2NrrLRsoMkr
 C7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fMfK7hmCnbrxv84hU70wjXKP41CBHA8Tij4U12U5HGc=;
 b=OhIMZ3hqScwXaeoiL1DBg9VePWl6UYhYXThtmarSwJrVtAwq8E7YuMWVnJDF/OHx69
 8hdJQBg8hW7WN2em+0LL9Rn1sRoF/wlpOMNrkVNqYYYmp1VjmyndxCDOIHi+z8tde38J
 XtOFlLbeqxhjo5Y6G44M1QYYIMDdB6Ly2G+JPJkZt3OgEi/1fdoWPOZ3+rTU4k7BBlsS
 vTGJ1wlFxXf1AL1cIRT/6onibksd263dE5M+L0g4XleqpCA/6Xr4PMrZAu6O+yeTEruh
 Vv3K8v5CaE5lTcKQBHmnW8iSpkHf4N5mJrFEkX9R/EigVB0YL5A5AQUxrcEN3yZ88BlI
 iaTg==
X-Gm-Message-State: AOAM531YLnR/Y041xU3hcFDtyNfo/Sq+ajy6Iye0qozHVW004RM+FGOr
 fnV/BrBjkENt121P5eAMEcs/YQ==
X-Google-Smtp-Source: ABdhPJzYjwxU8FIT7JcOynGd8Y6dSpW4pLRiNTuRwI2G7mW+uofCg/127Pj59Imt33TasJ39dZfArA==
X-Received: by 2002:adf:ef8e:0:b0:206:1b61:7c20 with SMTP id
 d14-20020adfef8e000000b002061b617c20mr3595492wro.543.1649183723105; 
 Tue, 05 Apr 2022 11:35:23 -0700 (PDT)
Received: from [192.168.2.116] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm12563088wrv.10.2022.04.05.11.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 11:35:22 -0700 (PDT)
Message-ID: <a0b05792-678f-2ecb-ac18-01a88fb0873b@conchuod.ie>
Date: Tue, 5 Apr 2022 19:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux@armlinux.org.uk,
 Conor.Dooley@microchip.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 hkallweit1@gmail.com, linux-riscv@lists.infradead.org
References: <mhng-524fe1b1-ca51-43a6-ac0f-7ea325da8b6a@palmer-ri-x1c9>
 <25acda81-4c5c-f8ba-0220-5ffe90bb197e@conchuod.ie> <YkyFOqAqA2IyTCOp@lunn.ch>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YkyFOqAqA2IyTCOp@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_113528_933343_EB642D09 
X-CRM114-Status: GOOD (  20.13  )
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



On 05/04/2022 19:06, Andrew Lunn wrote:
>> I tried using the one for the VSC8662 (0007.0660) since that's whats on,
>> the board but that didn't help.
>> Without the revert:
>>
>> [    1.521768] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at
>> 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
>> [    3.206274] macb 20112000.ethernet eth0: PHY
>> [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
>> [    3.216641] macb 20112000.ethernet eth0: configuring for phy/sgmii link
>> mode
>> (and then nothing)
>>
>> If I revert the CONFIG_PM addition:
>>
>> [    1.508882] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at
>> 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
>> [    2.879617] macb 20112000.ethernet eth0: PHY
>> [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
>> [    2.890010] macb 20112000.ethernet eth0: configuring for phy/sgmii link
>> mode
>> [    6.981823] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow
>> control off
>> [    6.989657] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>>
>> I will try again tomorrow with "ethernet-phy-id0007.0771" to see if
>> anything changes, since that would use the Microsemi driver rather
>> than the Vitesse driver that VSC8662/0007.0660 uses.
> 
> The numbers here should be the same as what you find in registers 2
> and 3 of the PHY. They identify the manufacture, version and revision
> of the PHY. With a normal probe, these two registers are read, and the
> PHY driver found which says it supports the particular ID. The only
> time you need to actually list the IDs in DT is when you cannot find
> the PHY using the normal probe, generally because its regulator/reset
> is turned off, and only the PHY driver knows how to fix that.
> Chicken/Egg.
> 
> You don't have this issue, you always seem to be able to find the PHY,
> so you don't need these properties.

Good to know.

> Also, using the Microsemi driver for a Vitesse hardware is like using
> the intel i210 Ethernet driver for an amd xgbe Ethernet hardware....

Ehh, not sure that this is the best comparison. Microsemi bought Vitesse
in 2015, and the PHYs supported by the Microsemi driver are all VSC*
products. I was going to try it in the off chance that the reset was
handled differently, but point taken!

> 
>      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
