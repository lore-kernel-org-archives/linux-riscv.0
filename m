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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A84BC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC5C664E28
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC5C664E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLLdMH6R5g1WVuChkxqfCHYNAqg04VJt4d+Cj/1sse0=; b=DsaWwSOuuv5LZ8xJvYkd9YFXo
	i5HzAUSuWM6x6T37h5wuCbQcrSmIgvXWDBLPL88RGW6auTgwhYeQdzKONseTRYL570ubkoMIv6/vx
	kZXMLTjAyB9e++kq9ec8+4k39VSGD+hwn5eZYrF6/mAT4Flxn21FphSsxuQj4KeU/uFh/8lrf/QHf
	lQyhPkYR9tNn2FXMcuyT4FHe+W95zAnj7WMPC6q0w6/mm7zXuESSyvMC0QoTfe+Lz6/JUNXE9UNrE
	It9bMoFLy0Getx8e0XDy6KpPsm7Lo4k5vNAyVniWJmnBvtT3EvezSFCTQptZC+vEamaAbz2srqhfW
	G4REOpwVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FPP-0007sf-Qt; Mon, 08 Feb 2021 22:53:31 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FPM-0007rI-L8
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 22:53:29 +0000
Received: by mail-qk1-x72a.google.com with SMTP id l27so16210170qki.9
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LNObx/xsKx0muGd8o1UdmLNQwbfWnKf1Zhlj9wUcgLk=;
 b=puPBo81BTM6aQFml9nbQ9JmMBD3XfODsW8PGsRouYdnjPo7p+UPIZnKevuHfuUhU5Q
 xjsDnAKKl/O/ly0gLz1oxNrDrGaeVCmYfbh6OXTINu1qKGb99AUsHyBsjf92TwfpTNr3
 Azi0w1zHwxZFPKzoRyHlOBfGjLDCxyoVhwBo5zFNAFI38SA6eyEU0QO8n2vq46ukEt0r
 82Ev1x9KZvfmhI5PgJkOInApJSjciqQaFk1SJMlcDDJOATQeQwdGrQiGsc8fdpcgkRaH
 JnXfLWl49UU6cNs3VyT2mqEKsDAAcT5a1GMZcGYX6FnU/t6SIMfxG57wEuXkwNWUJtg0
 fMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LNObx/xsKx0muGd8o1UdmLNQwbfWnKf1Zhlj9wUcgLk=;
 b=rdO4JS1TjY/JhA7n/NJWL7SaSH4H13n/vKzcZHqvyJbdVtUiWfg2ZMJIe7evafOPMK
 vaFt93ZLPD29w6MJqlJ8yvqxfv4Sf/oLWSBhWMQVbUDGL4ZCyLutRnUFtnlYmpIwLkoH
 10r0pv0/qwdggQ3puWWjQuUJrtXtjSzNQv4rKkiRKw6bv80wVWO43gfmubrkj5G+V2B8
 MRJCrQQI09b29XqegrkB3KGHV9egUatFGo6G3fcbOY9Szri9D8VptuFE3FEFGiDq4hjA
 voYhX1xakF3wbG4XHCOKHUjjiYuqL0OYfCAoOfAIu1c46dPq0KGclxLlrCzUt2yhxLdr
 O3kw==
X-Gm-Message-State: AOAM531P27oNzyn9hUcRTm9SBS0NjZ1t7vqXeP24ciPhUDLnEJFiBy+4
 jq9MgNFHBPpaGt8+V9kk3MDr7JM2qmToug==
X-Google-Smtp-Source: ABdhPJy9MvLaVUfwTXT5pTO0nfI3HQoC5oiuH7jPfgl7vi70YhHUGzP8mhBjgu0a9BN1LFJOh4iUVA==
X-Received: by 2002:a37:aa94:: with SMTP id t142mr1154343qke.40.1612824805248; 
 Mon, 08 Feb 2021 14:53:25 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id o17sm16404744qtl.47.2021.02.08.14.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:53:24 -0800 (PST)
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
To: Rob Herring <robh@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
 <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <a924468e-9d6e-d66f-403c-77d7e0422651@gmail.com>
Date: Mon, 8 Feb 2021 17:53:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_175328_776332_39E09F1C 
X-CRM114-Status: GOOD (  23.56  )
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

On 2/8/21 3:00 PM, Rob Herring wrote:
> On Fri, Feb 5, 2021 at 6:13 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>
>> On Fri, 2021-02-05 at 14:25 -0600, Rob Herring wrote:
>> [...]
>>>> +                   otp0: nvmem@50420000 {
>>>> +                           #address-cells = <1>;
>>>> +                           #size-cells = <1>;
>>>> +                           compatible = "canaan,k210-otp";
>>>> +                           reg = <0x50420000 0x100>,
>>>> +                                 <0x88000000 0x20000>;
>>>> +                           reg-names = "reg", "mem";
>>>> +                           clocks = <&sysclk K210_CLK_ROM>;
>>>> +                           resets = <&sysrst K210_RST_ROM>;
>>>> +                           read-only;
>>>> +                           status = "disabled";
>>>
>>> Your disabled nodes seem a bit excessive. A device should really only be
>>> disabled if it's a board level decision to use or not. I'd assume the
>>> OTP is always there and usable.
>>
>> Please see below.
>>
>>>
>>>> +
>>>> +                           /* Bootloader */
>>>> +                           firmware@00000 {
>>>
>>> Drop leading 0s.
>>>
>>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>>> make it translateable.
>>>
>>>> +                                   reg = <0x00000 0xC200>;
>>>> +                           };
>>>> +
>>>> +                           /*
>>>> +                            * config string as described in RISC-V
>>>> +                            * privileged spec 1.9
>>>> +                            */
>>>> +                           config-1-9@1c000 {
>>>> +                                   reg = <0x1C000 0x1000>;
>>>> +                           };
>>>> +
>>>> +                           /*
>>>> +                            * Device tree containing only registers,
>>>> +                            * interrupts, and cpus
>>>> +                            */
>>>> +                           fdt@1d000 {
>>>> +                                   reg = <0x1D000 0x2000>;
>>>> +                           };
>>>> +
>>>> +                           /* CPU/ROM credits */
>>>> +                           credits@1f000 {
>>>> +                                   reg = <0x1F000 0x1000>;
>>>> +                           };
>>>> +                   };
>>>> +
>>>> +                   dvp0: camera@50430000 {
>>>> +                           compatible = "canaan,k210-dvp";
>>>
>>> No documented. Seems to be several of them.
>>
>> There are no Linux drivers for these undocumented nodes. That is why I did not
>> add any documentation.
> 
> Documentation is required when dts files OR Linux drivers use them.
> 
>> make dtbs_check does not complain about that as long as
>> the nodes are marked disabled.
> 
> 'disabled' should only turn off required properties missing checks.
> Undocumented compatible strings checks are about to get turned on now
> that I've made it work without false positives.
> 
>> I kept these nodes to have the DTS in sync with
>> U-Boot which has them.
> 
> That's a worthwhile goal. Doesn't u-boot require documenting bindings?

Generally, no. Usually if the bindings differ from the kernel they are
documented, but usually the device trees are just imported straight from
the kernel. This is a bit of an unusual case in that the device tree is
being imported from U-Boot instead of the other way around.

> 
>> Keeping them also creates documentation for the SoC
>> since this device tree is more detailed than the SoC specsheet...
> 
> It's already 'documented' in u-boot it seems...

I would like to keep Kernel and U-Boot device trees in-sync. However, if
there are significant divergences, that becomes more difficult.

--Sean

> 
> Rob
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
