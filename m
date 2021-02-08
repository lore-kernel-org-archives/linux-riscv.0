Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CC2C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 23:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF9864DE1
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 23:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF9864DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IzigzAxJ10nm4M3/cnlAkeUJqUq70DfOWilYgsncxUE=; b=2R69OJSjfbn15gM0OcU1zYlPw
	EnNKOBYJtcBCOPB8zKPbnQWhL1e/USy3rieKgqtO5pQZR1kzcrrUcv3fSVS7ZxV5FzdFJsd5fjFj0
	9Ly0OutMIT1bSOuBlrckzXD35TOCT9ESiwLiTTISU0iCnMBQ8Mu86tVeQrOqeU8mE3/IYfWcHFUKp
	H6je8RZWj4kc9e0EKkjG3ggYeg6Dw19lPP5FOOliGZPX9MjdY3vJgubMeH5k3L7GRwcHTCzkxP+To
	Od7V3AMAfK8ODYZHhgYVrlDAE9qdZGcsBQxkK73PHhiJlhBOBV88ob3gud43mHW/U9+4Gp3FZ83Si
	d25sUeRCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FaZ-0000f7-Mb; Mon, 08 Feb 2021 23:05:03 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FaU-0000c1-Kg
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 23:05:00 +0000
Received: by mail-qk1-x730.google.com with SMTP id m144so491477qke.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 15:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TqVqy/3KmKk2Cf5ztpP7PXsRVgos+MMINVYs7YeFPNg=;
 b=sgRluMJG9W8EgoDG0k5uqZlg+P6LMczbp86En3W7plMxcC5b3Loqlcgm7oCRFi2FbW
 R4sbJHXqVPVLHMs9OW+NLiWsMebw0nJ3vX8WicIPlpFFTddJ73yRNs1Rvf0Mux3h1AsM
 u06isKJ3ByeYXGLd0evFpCZEs7t/aAYn9JnLALxm9pEk7gae8Qha4rQokxC1wX0wBxQZ
 +YQmNcffLLv03K9znpk4VNpKWc+uG9k7I3aBqWyYNQDJh9m70iOj5ifSdxtRsmyMVQN5
 fRu05urhBoGinhN3QGkFIy/jDS0YRvNWH+VVmhL+dvsWJ4Xrs3ooMj36TX+PM5vDm8y+
 ztRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TqVqy/3KmKk2Cf5ztpP7PXsRVgos+MMINVYs7YeFPNg=;
 b=m4twDwjwrpU1DCF51pS6vajt0+2u+B+NtIxwg13MSyqzfp9Y3QxLXhsqBYJLpjUSrd
 4ZGu8kauSgZ+XSQKud9OD23ZHDUsmMShf3E3xBan4PZb1Aigwzzo0l7KvU5LIYWzg3tk
 kBVW9b0bCCSHPHMFrvzDhjxCOWYNxMycTtnGmTVwSnQ7FUJ99PCfy+MeLkqq5msvcUWV
 55vtfW6m2DemsZT6C6k5EgJsFaDW3TX37UGj3nRKXVFxlJ2Vt4Nr4PuC4f+wFLvpgH3d
 j0xW4yrGYr/asuzZNEB3+zZq/JYWumegVazVA7LZ5GEjIWI/PqsXF/dAo2hrVLOcPvgn
 Abfw==
X-Gm-Message-State: AOAM531odMwXzkfMc5FUDd+aqwy8edqN5MbgAP1Ukjgvyo3APuv1NLHy
 XZ5tQCXckfKp7LcgN/VSK0emMRaLoEeQRQ==
X-Google-Smtp-Source: ABdhPJx8QIl3XctQx9nOI2jqAw6MD26244OAnaJ2RuuAcCoKy9g3zDAw2lKNOcXZOaTdlLRkGWJgiQ==
X-Received: by 2002:a37:dcf:: with SMTP id 198mr2281719qkn.257.1612825496859; 
 Mon, 08 Feb 2021 15:04:56 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id k90sm14206976qtd.0.2021.02.08.15.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 15:04:56 -0800 (PST)
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Rob Herring <robh@kernel.org>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
 <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
 <a924468e-9d6e-d66f-403c-77d7e0422651@gmail.com>
 <BL0PR04MB6514747C7AD8FA7E56D61CB9E78F9@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <e451a093-a37f-6078-d158-965b7fce4ebf@gmail.com>
Date: Mon, 8 Feb 2021 18:04:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB6514747C7AD8FA7E56D61CB9E78F9@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_180458_800430_112ED4C0 
X-CRM114-Status: GOOD (  26.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/8/21 5:55 PM, Damien Le Moal wrote:
> On 2021/02/09 7:53, Sean Anderson wrote:
>> On 2/8/21 3:00 PM, Rob Herring wrote:
>>> On Fri, Feb 5, 2021 at 6:13 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>
>>>> On Fri, 2021-02-05 at 14:25 -0600, Rob Herring wrote:
>>>> [...]
>>>>>> +                   otp0: nvmem@50420000 {
>>>>>> +                           #address-cells = <1>;
>>>>>> +                           #size-cells = <1>;
>>>>>> +                           compatible = "canaan,k210-otp";
>>>>>> +                           reg = <0x50420000 0x100>,
>>>>>> +                                 <0x88000000 0x20000>;
>>>>>> +                           reg-names = "reg", "mem";
>>>>>> +                           clocks = <&sysclk K210_CLK_ROM>;
>>>>>> +                           resets = <&sysrst K210_RST_ROM>;
>>>>>> +                           read-only;
>>>>>> +                           status = "disabled";
>>>>>
>>>>> Your disabled nodes seem a bit excessive. A device should really only be
>>>>> disabled if it's a board level decision to use or not. I'd assume the
>>>>> OTP is always there and usable.
>>>>
>>>> Please see below.
>>>>
>>>>>
>>>>>> +
>>>>>> +                           /* Bootloader */
>>>>>> +                           firmware@00000 {
>>>>>
>>>>> Drop leading 0s.
>>>>>
>>>>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>>>>> make it translateable.
>>>>>
>>>>>> +                                   reg = <0x00000 0xC200>;
>>>>>> +                           };
>>>>>> +
>>>>>> +                           /*
>>>>>> +                            * config string as described in RISC-V
>>>>>> +                            * privileged spec 1.9
>>>>>> +                            */
>>>>>> +                           config-1-9@1c000 {
>>>>>> +                                   reg = <0x1C000 0x1000>;
>>>>>> +                           };
>>>>>> +
>>>>>> +                           /*
>>>>>> +                            * Device tree containing only registers,
>>>>>> +                            * interrupts, and cpus
>>>>>> +                            */
>>>>>> +                           fdt@1d000 {
>>>>>> +                                   reg = <0x1D000 0x2000>;
>>>>>> +                           };
>>>>>> +
>>>>>> +                           /* CPU/ROM credits */
>>>>>> +                           credits@1f000 {
>>>>>> +                                   reg = <0x1F000 0x1000>;
>>>>>> +                           };
>>>>>> +                   };
>>>>>> +
>>>>>> +                   dvp0: camera@50430000 {
>>>>>> +                           compatible = "canaan,k210-dvp";
>>>>>
>>>>> No documented. Seems to be several of them.
>>>>
>>>> There are no Linux drivers for these undocumented nodes. That is why I did not
>>>> add any documentation.
>>>
>>> Documentation is required when dts files OR Linux drivers use them.
>>>
>>>> make dtbs_check does not complain about that as long as
>>>> the nodes are marked disabled.
>>>
>>> 'disabled' should only turn off required properties missing checks.
>>> Undocumented compatible strings checks are about to get turned on now
>>> that I've made it work without false positives.
>>>
>>>> I kept these nodes to have the DTS in sync with
>>>> U-Boot which has them.
>>>
>>> That's a worthwhile goal. Doesn't u-boot require documenting bindings?
>>
>> Generally, no. Usually if the bindings differ from the kernel they are
>> documented, but usually the device trees are just imported straight from
>> the kernel. This is a bit of an unusual case in that the device tree is
>> being imported from U-Boot instead of the other way around.
>>
>>>
>>>> Keeping them also creates documentation for the SoC
>>>> since this device tree is more detailed than the SoC specsheet...
>>>
>>> It's already 'documented' in u-boot it seems...
>>
>> I would like to keep Kernel and U-Boot device trees in-sync. However, if
>> there are significant divergences, that becomes more difficult.
> 
> Sean,
> 
> Are you OK with removing the nodes without a driver ? I think they are the same
> for the kernel and U-Boot but I have not checked in detail.

I suppose. The 8285 uarts should be kept as iirc someone was using them.
Same with i2c. WDT has a U-Boot driver, and probably has a Linux one too
(I haven't checked). I believe the timers also have working drivers, but
I haven't tested on Linux.

--Sean

> 
>>
>> --Sean
>>
>>>
>>> Rob
>>>
>>
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
