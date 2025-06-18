Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB85C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5w+MuLMZrBc6lxPWhPhVbF0BaaG8s/IP8+zkOstfeqg=; b=Yj8LUBhBFOFC4z
	Ti3/INhlP76RN4xJtqTfx7+yNA2o9puX8IB45uQdIQaJmglH4cG5cdG/jgfCNKWltDYaNPIZ+zQu2
	slTN52OZI6u8YaHCOBwoMmw5QnHIcsMUqVRxs0dctaSBueF0V9YrxSNVXQ49KS1UR4KepgSW2toEn
	vrdyLlx/76KeubRZYI6Du9G3r/LdOweQ9FxPeRVKjaY9QrHp82yfreAp3F9YFo9wCKXri1VJcfASa
	MJL3arepCRPoqfGxxGsgpk8Vb3JU9qapUAaKyH+zlK/ct3S/d++EhTQfwGjY3xEg7XM26hKdBfkRe
	cSsfPEgd06b/oq8W8wEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsYw-0000000AFry-1wtJ;
	Wed, 18 Jun 2025 13:10:46 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrBM-00000009z8a-20lw
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:42:22 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ddc9872e69so27538265ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750246939; x=1750851739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=N88NfwTm98KxGUQWu+lk8iJGYTC78lEFbCTT6ngSAtmzjHsGS7ZdZQs9knjK9VU8YL
         nRU3bC1e6V/XiPS7uaD07KDVnEOlY8hcBEmfyPg7eeT6v+v98eecrvVpY+C0v7M5d3Qk
         Es8YVWXVZ/cZqTmN6Vd33UC9QEq7fIZF2ExEOuQWiXdCTiKi1r4uOnKz3KwS4DpNdGwU
         MQFoZrz0bQTukSIAkRM22ax2HX4eafMjNtxfeExf/mv/gsidbOuT0NQshOmwGp9lUB8H
         leO8Xk5PWTaQI/KNdf0tiCKrWn3OKvrJXVsR8B/oy31KTQSu3PO0vPfI1bch35rDtO2l
         PIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246939; x=1750851739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=JCH7veKgyhodxwPfBDh7y07B4sA7j+O+zTsmSGfFp1UUs+XN4VbCTGMCHywhDL80Jl
         5yFCjtdPY2OscrXWO0OSFVPcThlPzp7hOzbREdxe9znr09Ldcya0Yr2+BzZCJQXlzKYd
         hWOjz006J6dtzLKUPPML1OJ/kc2QMEfevpItfn+1IfGvqlT6D7dxztd8esXK24LQa+4V
         DCg2LWwTZyAdMmmC/JeL0xT2JeM/79S1OohleCceF0ut7ISK4gaSd5yBTkSq5NxHWtrz
         spbcfYJzpGagwOiywUVycg6bhhgb36lVl/RQyc5dAWfU2pIJWCxZOcT75+b7vY6t6C7I
         Cu+g==
X-Forwarded-Encrypted: i=1; AJvYcCV89ddxHknLPi71lAIbV+QpfS8XHj6Te8DhfgQuLeuUDfa61YTgf6S1isfDUV8pbgh8FiqiyMK9SR99WA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZsNf6RJoagUhc4sqoTjr5Uw9Js2fIm4X0ku/NEe5/7OOWThDu
	eyttmobwWaZv1GxtOz4T08fBUlW87KSKmj8L20g22GcsC2DZL4eSIYf5xRqY3wpuxvo=
X-Gm-Gg: ASbGnctzfdMVwCppL17OZXQdqg5J99dt9H3c7+B5vuyAxUiunfZLoPIWbd3ft7NZGrF
	K//PsN8HQx+Zy4P6cLkPmP6/RTQTeuVke678K4vf9fjOpUKMg0/E6BlP4xH9PDeSq8aAPzos+a/
	7psq2hVZf9YkiybWYL2zrHqtG41SFeapziox0oYPRgYGClTFNIPOWEVkbC5mxTU4zzevQgSV4FC
	MF/Xk3CIzTUGFNcaJVVG1Quz95gTLPerLLiAjHhthUG4nM7OM2b26PQNG3zOt0K7YBmgiKdnYmR
	Q/sjsx0yajEeazKQ7F4nJONCkcT8WOdBpStQVyjhYDNWjGXSNTnNkFta7QacID/aAIcHnD7Es/m
	80SiDnlW8AW9F2jxFcMdMcl520Q==
X-Google-Smtp-Source: AGHT+IGZEcu6gwBAOkwxavLZ+RywP72ic1e+8WKzjWeayufFiBzYjvq43wkZd9VQN5U2/4NY0wJZaQ==
X-Received: by 2002:a05:6e02:2493:b0:3dd:ebb5:6382 with SMTP id e9e14a558f8ab-3de07c40cf8mr191072635ab.4.1750246939145;
        Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b9d9b0sm2675217173.38.2025.06.18.04.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:42:18 -0700 (PDT)
Message-ID: <5be51d5f-67cf-4e47-9bdd-e1e5956e184a@riscstar.com>
Date: Wed, 18 Jun 2025 06:42:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
 <20250618111935-GYA156140@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250618111935-GYA156140@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_044220_758479_1E212CE1 
X-CRM114-Status: GOOD (  11.64  )
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

On 6/18/25 6:19 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 21:44 Sat 14 Jun     , Alex Elder wrote:
>> On 6/12/25 8:11 PM, Alex Elder wrote:
>>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>>> device is an auxiliary device associated with a clock controller (CCU).
>>>
>>> This patch defines the reset controllers for the MPMU, APBC, and MPMU
>>> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
>>> and ACPB2 CCUs, which only define resets.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> v11: Redefined combined reset definitions into individual ones
>>
>> After I sent this, I realized the clocks use a different
>> naming convention for two of the PCIe symbols.  I think
>> reset should follow the same convention.
>>
>> Yixun if you accept this series, would you mind updating
>> these?
>>
>>     RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>>     RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
>>
>> (And similar changes for PCIE1 and PCIE2.)
>>
> sure, done, check here (let me know if I did wrong)
>   https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

Looks good to me.  Thank you.	-Alex

> 
>> Thank you.
>>
>> 					-Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
