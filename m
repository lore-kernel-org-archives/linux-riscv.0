Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26267C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EA923730
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EA923730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tGnPKFu0+aM1mxWnJiC7whQ5qp14Z26iDb/ET+M9Z/k=; b=duCO79NM5YLKRgWi0dCT59zsN
	Fe4FWa90hAl9frZrgZlrz1N874IAbDMFIXpoeFG0yUR2vYtNWMfppopxmJz8nGcG2lnNfo5wA+2cN
	xw9ANL6bNdZtAsuoG3H80uleV5ckf3lSy5lav4OaPO6UQpwxZHaDI13C1sCHNxtF49tpbn5UePKwL
	ix0E3K8AxiBQAhTICohEXD1qLF+fOhKoWH8oK3/dYAq22UU4SpiXGsal5Inlbk4YjSy1Bs0cQK67c
	OFre6UI66kymerpOVr9T43e/ui5oCoGAprdXZqKJQXQXz594AwjgZvmTP/3Y1y9xOMabdK6wie59u
	Z8U81JLJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Cdl-0007lP-2Y; Fri, 15 Jan 2021 00:06:57 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Cdj-0007l6-4o
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 00:06:55 +0000
Received: by mail-qt1-x82d.google.com with SMTP id v5so4918602qtv.7
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iiavs5qkw112m2pBXQLwohsOWWB1hJoR5NwHiDhTMeQ=;
 b=sxMPnsDbzmk2N5kkrQkVjIFmyI7tfz5MoRtdMAaASzcqVGRLFFlCaTfxzY7KqY3iB+
 NgMDP3uj6d1rHYZUHwnsfsK20rooDOtENzkTTSbUCUKVeHRFeDhg0Ow5JK1Mnyc17Pkw
 6jGUM02mbX/+xy9Agh9j8MAqA5WsH9cbj4nzuj2+3c455EsOAWqt6LNYSL4kgpDk/4fC
 V0ZDIFc55TAm2b59+ZsK+gNofP8/rF6phxP4XRe42RkgaRerxhdPUJ2T8wI06AxIBtaY
 dMG3Yh/2modjYCJ/R7RZ1o3maYRBNeRuVblbdNHuNH2jcjBTn7dk5hjm14tDsQUXic/p
 8TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iiavs5qkw112m2pBXQLwohsOWWB1hJoR5NwHiDhTMeQ=;
 b=YGUtS0uBpm0FnzJ7A1liKDwEZELemLIPvim/gMqmvb3C8iaZLIfEddQEBn2sQeNnCD
 TwDmYC+3MBht+knCgdeZduA5/L2Y6QmzjncZPWTCkV7vJJ7gI4mkkzxrLNcnM4wiojbH
 2GEycWAiz8wm/wHWuNFaSzJFYv99Kb7lAyV0HztqE9nFcP5XkDC329YxEDqrk2KMCIID
 4dOVrWOVlO3h6mQIO64lMex+o0dy1DyzX34r4XCElh5CiBrZGEPQWZR3PyiAAk91Gm86
 a9zpW/C0WBFFHdNAEdHF4zD+Aeaexmxl61D29bpK4NtAaWcIP+rEkYT0GoLfy8iHS5vG
 vN+Q==
X-Gm-Message-State: AOAM5330Ngn/i7As/wVA6JTUavMzP2kP2X7CXg+FggXud6A6UVns7AsQ
 kDIlDQgLXkG7L5iAcolcEwCVw5XFAgY=
X-Google-Smtp-Source: ABdhPJyac4D7faAzN2Xf0W4A0hmVKhrFN5tWnuIPls4V4Q7tzANRIgH3G//0twtIgP2ZPCwSEznDiA==
X-Received: by 2002:ac8:82b:: with SMTP id u40mr9688514qth.332.1610669211119; 
 Thu, 14 Jan 2021 16:06:51 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id k187sm4064319qkc.74.2021.01.14.16.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 16:06:50 -0800 (PST)
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
From: Sean Anderson <seanga2@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
 <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
Message-ID: <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
Date: Thu, 14 Jan 2021 19:06:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_190655_231852_465C2FC7 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/14/21 7:01 PM, Sean Anderson wrote:
> 
> On 1/14/21 6:32 PM, Palmer Dabbelt wrote:
>> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>> all peripherals of the SoC, their clocks and reset lines. The device
>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>> configuration option. No device beside the serial console is defined by
>>> this device tree. This makes this generic device tree suitable for use
>>> with a builtin initramfs with all known K210 based boards.
>>>
>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>> removed from the dt-bindings k210-clk.h header file.
>>>
>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>> U-Boot support for the K210.
>>>
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>> ---
>>>  arch/riscv/Kconfig.socs                     |   2 +-
>>>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>  arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>  include/dt-bindings/clock/k210-clk.h        |   1 -
>>>  5 files changed, 573 insertions(+), 50 deletions(-)
>>>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>
>> [Snipping this to the relevant bits, in case you missed it before.]
>>
>>> @@ -81,40 +107,515 @@ in0: oscillator {
>>>      soc {
>>>          #address-cells = <1>;
>>>          #size-cells = <1>;
>>> -        compatible = "kendryte,k210-soc", "simple-bus";
>>> +        compatible = "canaan,k210-soc", "simple-bus";
>>>          ranges;
>>>          interrupt-parent = <&plic0>;
>>>
>>> -        sysctl: sysctl@50440000 {
>>> -            compatible = "kendryte,k210-sysctl", "simple-mfd";
>>> -            reg = <0x50440000 0x1000>;
>>> -            #clock-cells = <1>;
>>> +        debug0: debug@0 {
>>> +            compatible = "canaan,k210-debug", "riscv,debug";
>>
>> I'm still getting lots of warnings about undocumented DT compatible strings
>> from checpatch.  Some of them might be in flight, but I don't see many of them
>> (including both of these debug ones) having been defined anywhere.  We went
>> through a whole process to sort out the SiFive DT naming conventions, I don't
>> want to just circumvent that for the Canaan stuff by merging it as-is.
> 
> As far as I'm aware, it's recommended practice to add device-specific compatible
> 

Here it's because "riscv,debug" doesn't exist. This is the "debug"
device as described in the debug spec. AFAIK Linux never needs to
configure this device. It could probably be removed.

I am going to try and go through the list of nonexistant compatibles and
see if there are any other devices like this (nothing else like it in
Linux).

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
