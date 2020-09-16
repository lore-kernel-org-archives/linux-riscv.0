Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F5C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 11:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4640C20732
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 11:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHfjHY1T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPLg9fMe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4640C20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GqcZ02HJ5J4yqlcd31N+i7rgfGYNuDrJfyyO5nGHMvc=; b=PHfjHY1TolMXrkkWVrZkTM7F9
	STTUox4zq21/LvxUKvK79ZwmPoIpul0+jzsMNjsEvdSDukrhmBheg17Z3iba19NBegV+deRVKglcz
	lhBOclTKDT8qxK/5a+6BmKGsEdgQ+EeAppv/nDWfgw28n1c1hEfy/yPCJhRR0376ALAj49tB67/l9
	y+9oIlByuCqN9tShk+rECvkt/IvzzEAG+ft2rcXOxAsMrCNGc8Boco6s/lyqfaDi/HZwP7OyRq6cG
	06rT+d/0EdMW1fy2dWG1BihXom6qdtktVRopuHut05nMvJ5u8BjnTf7jArTCVoOEA5HMzSRMe8GGv
	T/dUU6KeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIVdu-00069R-2f; Wed, 16 Sep 2020 11:30:30 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIVds-000698-HQ
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 11:30:29 +0000
Received: by mail-qk1-x741.google.com with SMTP id o16so7691727qkj.10
 for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2020 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1gIk6v5TF62sFNlGtchbQPOoV8km9VeR2gkuWnml/o=;
 b=GPLg9fMeOT/1FHLLTg+8TJbUM8TJ/yI+rYh+5dYLPls1R2M/vkPPZvK8bl3nX+tryx
 85XpmHBP1JsksXt3Ocpyp198R3biQ50U1AlfSsIq3bQEn+LsGBNfmXsW+/MTQYkB7C+u
 SqF/uW/ZquNrEXLePK3JXEL2g3GZ6Zete7HEdjTBJzE6MepV7gilvIBbbLu25bKaUILX
 BHgxc+1pSUWCBbSPxcS46iwe15GGxzwXu3gmyykg6rrLJDxxFn4XWGtvhDH2RO3b32Y/
 TB3MHsCstq4CsYYemuL+51g6T0HKYtKOXh8DjFllzbmBQo1BVEh/l41TluxAYwPq2Hlw
 1GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i1gIk6v5TF62sFNlGtchbQPOoV8km9VeR2gkuWnml/o=;
 b=tiSYN7dswZfKZ8xh67HfDLY7bvykgqcWr1+8m5tOcl4F3bf5kZTSULBFrK92JRM5rm
 SyrO9/k7Z7uO5kNhwZ0YZrPq19T7Xolwc4uauhJtBxTeID5pZtlMCbaQHL6RlOOayklk
 r7ovwfbKhi7GOR5ytEkx8yX1rjXp2dvyLq41PzVEbJuqDnTubktYSRRyjYzEh79cY1fS
 ETzAwlfqHUwtutlphXyqGv7qoMlEZvNuqa0o5dDTYKUBmUgDaYEUiqWxxyYxtqdXbT+B
 GJNhNo/FFwasMIxZkiKWnKrooMByR0W7E4fI/d1PeahNfu/jJIccWSZDswfiKkdIEnkV
 FFcQ==
X-Gm-Message-State: AOAM532g5urYbocC9TMaUl3/7N+zafQI7tgvqtLzDrz7steonMj/bw7P
 i7Vf83/7yoiRSzActqbz/H6Ox9S+cL96BPbb
X-Google-Smtp-Source: ABdhPJx5lSr+5UjNnKtRTfvS9GQ11k9lXXxVwo344wabaiNM/ItbMvGuQvn3iw5yk7qyum+SvGspsA==
X-Received: by 2002:a05:620a:1381:: with SMTP id
 k1mr22035229qki.140.1600255826371; 
 Wed, 16 Sep 2020 04:30:26 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id u46sm18298611qth.31.2020.09.16.04.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 04:30:25 -0700 (PDT)
Subject: Re: [PATCH] riscv: Fix Kendryte K210 device tree
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200915125501.110326-1-damien.lemoal@wdc.com>
 <78347150-d43e-9300-8d4c-db8cc74ec11f@gmail.com>
 <CY4PR04MB3751F5C2D0C0403596040E4FE7210@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <c90a5962-924e-bc7f-a164-970437098625@gmail.com>
Date: Wed, 16 Sep 2020 07:30:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751F5C2D0C0403596040E4FE7210@CY4PR04MB3751.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_073028_680321_CE208EF3 
X-CRM114-Status: GOOD (  24.14  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/15/20 11:08 PM, Damien Le Moal wrote:
> On 2020/09/16 11:15, Sean Anderson wrote:
>> On 9/15/20 8:55 AM, Damien Le Moal wrote:
>>> The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
>>> (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
>>> inline with the sifive timer definition documented in
>>> Documentation/devicetree/bindings/timer/sifive,clint.yaml. Rename the
>>> clint0 entry to "timer", fix the register mapping and fix the interrupt
>>> extended entry.
>>>
>>> This fixes boot failures with Kendryte K210 SoC boards.
>>>
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>>  arch/riscv/boot/dts/kendryte/k210.dtsi | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
>>> index c1df56ccb8d5..48d65fea45e9 100644
>>> --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
>>> @@ -95,10 +95,11 @@ sysctl: sysctl@50440000 {
>>>  			#clock-cells = <1>;
>>>  		};
>>>  
>>> -		clint0: interrupt-controller@2000000 {
>>> +		timer@2000000 {
>>>  			compatible = "riscv,clint0";
>>> -			reg = <0x2000000 0xC000>;
>>> -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
>>> +			reg = <0x2000000 0x10000>;
>>
>> Why the change in size? The docs from the SDK [1] (which I think were copied
>> from SiFive documentation around the time of their release) state that
>> the CLINT is 0xC000 bytes. In addition, accessing memory past 0x0200C000
>> yields a repeating memory pattern:
> 
> Oops. Copy-paste error. I will change that back to 0x0000C000.
>>
>>
>> 0200c000: 69823183 02020120 6083c006 00008002    .1.i ......`....
>> 0200c010: 69823183 02020120 6083c006 00008002    .1.i ......`....
>> 0200c020: 69823183 02020120 6083c006 00008002    .1.i ......`....
>> 0200c030: 69823183 02020120 6083c006 00008002    .1.i ......`....
>> (continues until 0x02010000)
>>
>> To me, it is clear that the CLINT is not 0x10000 in size, even though
>> the legal address space extends to that size.
>>
>> I am more curious how this fixes booting. What was the issue before?
> 
> There were 2 problems:
> 1) The old declaration of the entry as clint0: interrupt-controller@2000000 led
> to a failure to find the driver.
> 2) The interrupt extended entry was wrong
> 
>>
>>> +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>>> +						&cpu1_intc 3 &cpu1_intc 7>;
>>>  			clocks = <&sysctl K210_CLK_ACLK>;
>>
>> This clock is 50 times too fast(!) See [2] and [3] for a fix. I don't
>> know if adding a "virtual" clock is the best solution for Linux. I would
>> like to keep the device trees relatively in-sync, so please let me know
>> if you think there is a better solution.
> 
> Huu... Let me check that. Once booted, using commands such as date or time does
> not give me weird results, well at least, before this patch and clint changes. I
> forgot to check yesterday when I tested (I only boot tested). Will check.
> 
> And yes, I will make effort to keep the DT in sync. Is the Kendryte support
> upstream in U-Boot now ? I have not checked recently.

Yes, it was included with release v2020.07.

--Sean

> 
>>
>>>  		};
>>>  
>>>
>>
>> [1] https://github.com/kendryte/kendryte-standalone-sdk/blob/develop/lib/drivers/include/clint.h
>> [2] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-8-seanga2@gmail.com/
>> [3] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-9-seanga2@gmail.com/
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
