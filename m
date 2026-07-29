Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F345C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxrPhy2+u9PGSCSdC5R8ziAYGJJOzMF6H9fAciwZE08=; b=nt+LW4OkqaenHg
	jpC/dutz+gq2ioF1ek0zB/Dk7YM9TSCxJlGTG6v69LXGGjwwXTr+i7Zw47iHdePC5SianchxR7M3v
	Q2IqLE7pRaV704/dh5f31mNVTCOPlcNZwW8/GKvRHzTGdRRlt8kooWMpGAeQ7jLhNADA3clehyt2K
	ZXtI0Umd8MvjtUR4AI1WImokXL7aN46pxR5cdYMsbI1W5oUPqRidVB704YBaoDZ3EdcmEC2CgxKuu
	Dw8/mr/2mBdlssIpFNWW3N/L3zgZxuv5qEcMCvHa7dW/yIwVXUwZWIk6S4ttHZvybdKoAMk3BSWoN
	HT+0y6HMF8sEvRBgS0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Lk-00000007hk7-2X0B;
	Wed, 29 Jul 2026 11:21:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2Li-00000007hjH-0VGw
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 11:21:24 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2E60D3FBD1
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785324078;
	bh=uHQjuj6Xcqi1BVE9uzz71sr2eQbfCmUCgJ90Wi9b1Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=E98ISPU5CSfVeI8s7wy1wqjXwbRuGiW6VLQpr+KjBq21yMf9fC61O57EA+lJmBoEx
	 ad/gkX+3FPW4YyOf4EaLG0JoZp0nSoSiekcjm7/dklVPLiXEmZecs+5WOhnwmCSm6x
	 Wg/K5bCsOTnBS2OUvzgXuPrbIgOfp0mOtTnE1bZUoLsfFBZJV2QXRI+G7VvkxcKfIO
	 0Vk6kOeJclfNGK9pjuxUgFm0MBKVLsfXpUnnI7SMH5hCRpZ5zGu69SttACwUU3YC9k
	 llmZdfZPppgZBPsXYKomYNq6aiCkYVkDDSHn7N5J7Yz5hr210mRwaAlHxZy3TfW5Oy
	 YRsRNKhj8B3owVOmCwvcIQhWzJMNhsGwlrRv6ZPm/26eJQNWY0CnKSW8N96LCM5Aqd
	 KZ4U20bn4CLP/NI3PYbs1vgKhMIt3z9H72NRg59678rZJ4hkpMhd0P4F9Hy+o5c8cT
	 KVUk0wsN5lNxXlHuSlcW+430qPnOtXyMWnlgd43nT1x2COYejKYziWBcY1+oCTkazk
	 iNO2lCXC1JO/rTCynfnODSBvYq8W8WY1Ol/TDQGTI/VtyR8QDh0Ov556CNWltXgOTi
	 kNa01suMdCrCehHRClnukt1fF2BOCY7O5xBEQsbNqObNYmIBP4bJWY4T+WlmBstOa7
	 Je8A72Pct0MgR2Kl4jzzYBB0=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so7836665e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 04:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785324078; x=1785928878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHQjuj6Xcqi1BVE9uzz71sr2eQbfCmUCgJ90Wi9b1Bk=;
        b=by/GI75/d7plVkwOEfNIj+rtpTrBh7fw7LZELMaB75H+q8w5NqpigvLQzSYVxOvE6G
         Fd4i0igXv/fwtFqmhG2aOMogmS7Y85Eifn4Q2OLarRVktWZBA0z9Jz5nQDteiTdJS+5k
         iK5BKrzkK2Y/uZngz62GmBsR0EUpHIFEoTxpcoMYeDwg4c7WqDdJajsHlhU+DqaM6Eh2
         9/95kq61E/IkY5CaVbuDQGI/mrYNcalTdxcD068v/oukl7Xr3w5DeuxZGTzxgzyIQ2Hl
         SuGpeq2ehSeFC02MkHcyadcnKSY77C1culilvwDDy2Fa8S/7ZSNGGm1dggKw9Dyr/nJU
         G6Ag==
X-Forwarded-Encrypted: i=1; AHgh+RrzA/WOEslwXbIqG7Hlj+fk46qZ9eFEwqK8GAHQdkgIxzKNEaECHoR3Y20Zl8ADtziPW+w81fCE4FPfGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBqrLQP2I9WSl2W/YFV6R8Q5gcXMKZ+SS6u3Sm78bCTKOyHtyT
	VT+Hr+ozBzq7mSFQCjoPaVx4veM0AKeeuPisS1iUdxs2RfWoV2zpsYCJvep9TSi0eh2d4vqFTxW
	KgheQ/ZJwZaOpAZpwToXmS08SM8Y4EztVPAlRwdo1xDJ4W6AbEbvDnbR9SFAdnYgbosvWWo4ISW
	u9nSDM2l5LCQ==
X-Gm-Gg: AR+sD13njJQ69j9YHJ88oU1n7axk/neHtM80ShqKhhEGIIwJH3jfB1RNeD7s8ugpabB
	5mZdTKJlFt02dB92pWVPByM+Y3wQ8pUzc2APngECsV2eJj7bSeYKCsgjYg8oy7dnb0DDjJ1jAu8
	GztxNGjihHT63Cn9aHsUjp6XhVe9JClUAimRRXovKoTyeA7XFJ9O6gk+xaPhjZbQw/C6yNB6kW8
	eOjZWKQAIQ+0nBOHxPv37YWRIVitamX9p5vyjdvhW1+rs+YHD/isKIa0ZLYrUJyEMIxYFdLwJxO
	RFLJVdKS8P5MJxK2957IZ2CVRATElaB6JkCBaJpNnOJTb17EB/T6TEKWvY0EscUWOeAweOl3dny
	eUM8GkofCGJy246i9YdOtaEAB+7amnY96Nm/5LMi2C8/7uurbwbmaUiCqZl83UD47sP0HvRKmBL
	BR2nsmDU1ilV2MTwsunu0sCGU=
X-Received: by 2002:a05:600c:19cb:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496c60c111dmr63691975e9.0.1785324077577;
        Wed, 29 Jul 2026 04:21:17 -0700 (PDT)
X-Received: by 2002:a05:600c:19cb:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496c60c111dmr63691695e9.0.1785324077221;
        Wed, 29 Jul 2026 04:21:17 -0700 (PDT)
Received: from ?IPV6:2a02:3035:674:ff84:634a:fb9a:d64a:718e? ([2a02:3035:674:ff84:634a:fb9a:d64a:718e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496e905fa40sm43707215e9.2.2026.07.29.04.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:21:16 -0700 (PDT)
Message-ID: <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
Date: Wed, 29 Jul 2026 13:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <mail@conchuod.ie>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 Ilya Sorochan <k0tran@altlinux.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_042122_565650_D0BEE355 
X-CRM114-Status: GOOD (  16.10  )
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

On 7/29/26 11:39, E Shattow wrote:
> 
> 
> On 7/28/26 11:02, Conor Dooley wrote:
>> From: Conor Dooley <mail@conchuod.ie>
>>
>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>>
>>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>>
>>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>>
>>> [...]
>>
>> Right, I am going to try this again. I don't think there's actually a
>> valid technical argument against it, since it just affects the stage at
>> which configuration is applied rather than configuration itself.
>> If the configuration is wrong, and more devices don't use this configuration
>> than do, people need to move the node to where they think should be. That
>> shall be done separately.
>>
>> I don't want to hear about the politics about whether or not Starfive want
>> to support it or reverse engineering of binaries etc. All that I care about
>> is discussion of the hardware itself and which boards need this and which do
>> not.
>>
>> Applied to riscv-dt-fixes, thanks!
>>
>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>        https://git.kernel.org/conor/c/42c57c049054
>>
>> Thanks,
>> Conor.
> 
> Second NAK to this being applied, again, do not apply as-is.
> 
> As you're not interested in the technical discussion, then you won't
> have one.
> 
> -E

As E does not offer any reason for their NAK, I guess it can be safely 
ignored as invalid.

Best regards

Heinrich



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
