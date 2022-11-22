Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D44C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIjPAY65BQYTl09l0MvsXWlPsWlbBGBJedWM9NcdaVI=; b=09+29QbcHnPyMw
	NIY2eSIJSHWudgqw2tAb05UbIdJNsH23HsmUv9waO+dedhjjxyCBV99GSCgBqfjbJt8r9Ju6HLSZJ
	vITgsKLZMMPZk1usR7YN9qLJmZbTFIZ9nFAshKgjN7446M0g9uyS4aI2IwGVG/+05aJj9GlSUXL42
	aBObqqMThu/ARIPB14XWVfJFVOcrdU67qb+Sb3lgMGkSufkLnixnHxfe8WNg+Y/3Jc+gGX9ynWvDP
	C03VwPgSSduija3PNKtfibtURtkkF2Kru9n7PYv4K70p6yvlOCWruVRrwttTX13sR5XcAhovxGZ/D
	GuFbQ5SrwUMTKmiNgzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPI2-006oRW-7T; Tue, 22 Nov 2022 09:10:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPHy-006oNW-Cg
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:10:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l14so4808773wrw.13
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAEf/N2Kcc6QiozdeJRmjduJZZwfTly5ktRq7kriq+k=;
        b=G9jd4DKcrO/BCVJQHENt/pXmQaZoQECvuwDwpRj9+/3AW2g1GrafS6R+0+5Gt+CExY
         tLwrALHr73bzxxlLUcaKt4qbxzGrYMvZt73tDnWF/B0EzANYSV9xgfg48xJWoap8S/Ah
         BbCuqqy8T9LSfpKytFWleLBmsT6VhwwHCCXEZSevVNWoKBTgoXKqWrYd1SeMJR0D/7Zp
         4CIyMl0UOhIJHAvZeCb6MZPMX0bF95TuwJk892T4sM4MC7anWrJwaeV0j7nJ96MFEpOC
         gUnImyLOJg9ThNdvmlh/yMkga+zt2BxGJD64Wb/LTQafOT/nfspIMQj+YDfJUYdUdz8B
         BM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAEf/N2Kcc6QiozdeJRmjduJZZwfTly5ktRq7kriq+k=;
        b=d2KwZu3BZIc+L6/rvt2MMfQjmT8hqVYSUEbYwip8kNuh5j232VsG4b06yUHAQR2OBw
         AzQcuY9cY7jAbOf/hS9/xDLz01y/2tvoepLCuPULN9MVKmaugfBiS65eaciRgIEg4IlY
         UB1J0DZpkHyMhXlbyCwclJYjZVwzb30Jp9j9zmYP1EgkkA2GQ4usNI9LIzGC0YKsyJ+i
         Pw/sCc6bHWwck4t+xyIIoFN5BKxN1lBXDQRU4Dd7D3m3e+iouCOgFAqzybh/ixIUm8hV
         /AYY0Y5BdyQz++RHwdZur3W95duh24c0beS9M6FY+4jQjjEoWksKFAoCSFWtqEN1ffYW
         8/bA==
X-Gm-Message-State: ANoB5pmg2MwEpZLhVyhc2NDHiQHhviwqNfXLgYBWQYcALrSWcUYgBwPn
	vqdQ4gCUn6yK6mMhcuRuculmww==
X-Google-Smtp-Source: AA0mqf6PQYw2G8uhrT/UhhlijiC7GTWn3uWCN/t+08mg9FWAJlCVfhDRQjbjNh9Z8AzQiXksdA6REw==
X-Received: by 2002:a5d:460e:0:b0:22e:391c:6192 with SMTP id t14-20020a5d460e000000b0022e391c6192mr2341341wrq.104.1669108195077;
        Tue, 22 Nov 2022 01:09:55 -0800 (PST)
Received: from [192.168.0.17] (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id y8-20020adfee08000000b0024194bba380sm13323599wrn.22.2022.11.22.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 01:09:54 -0800 (PST)
Message-ID: <f22b8ede-6796-08a3-4c12-f507f5b8dc85@sifive.com>
Date: Tue, 22 Nov 2022 09:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Content-Language: en-GB
To: Conor Dooley <conor.dooley@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com> <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
 <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
 <Y3yRTuo69JUsfLqk@wendy>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <Y3yRTuo69JUsfLqk@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_010958_536925_DD5583AC 
X-CRM114-Status: GOOD (  17.43  )
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

On 22/11/2022 09:07, Conor Dooley wrote:
> On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
>> On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
>>> On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
>>>> On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>
>>>>> This cache controller is also used on the StarFive JH7110 SoC.
>>>>
>>>> "... and configured identically to that of the FU740"?
>>>> Anyways,
>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Actually, after looking at the next patch - why can you not fall back to
>>> the fu740 one since you appear to have the same configuration as it?
>>
>> Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
>> compatible in dts.
> 
> Uh, that's not quite what I was suggesting. Rather than using that one
> in isolation, you can do the following in your dt:
> "starfive,jh7110-ccache", "sifive,fu740-c000-ccache"
> 
> And then in the driver we need to make no changes - unless down the line
> we find some sort of issue that requires special handling etc. There's
> no harm in having a "starfive,jh7110-ccache" IMO.

Yeah, sifive,ccache0 is probably the generic one which would get
this working.

-- 
Ben





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
