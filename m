Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A646107BCE8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaglJqIKbTAmKoR/oGWGD2gudzbIrntFkxQ1bJwaL+A=; b=QGs9l+ebpu78F3
	IhrteQklUFLqKFKoNRDmdbxPhOp/m3IiInC0JbMKrM4QoDKrO9juOlmBcws4CWkzDexWWWrCdP26p
	2H8kyD8Gb9yuOLf/8zc3IGlFugWa+EG6oYmPVc9kapaLJFNBKOhHdc016JAPa/3+XXjgI+TlMOH1d
	mt/FEpyylY0wU/d0GeE18s4tm3We5bmzqDXpT8XB5eiWdhvSuuMh9R3ozAoyf3TISEiq+guakehoY
	F/RpAnSDVv2FpLRfFnsNk1U8tKxdtM0tB/XMS8GiUSh/H8bi0qZ768p7PRj/oL+DtD3Pz78eaSFNf
	jc0HxBJbabLWbE3tzQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ASq-00000001FFo-2elb;
	Fri, 13 Mar 2026 21:54:36 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ASo-00000001FFT-00iR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 21:54:35 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1271195d2a7so1689643c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773438873; x=1774043673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8G/at76670ycOzH91CNexS5yCq4aAux5TqZxX053qrI=;
        b=CFCPb51hvM15bsSpTHdH1seU9rlcX4UQNwbzGna4IZI6P1xV1LbnaWH1KtMABJQtfS
         IPD8Lsc41ALF5Tzo1nxot7c1djo4y/umL0O6XA9rgH0m+v+FU0AfceMJ4CcsJnAuHQHK
         Fv5nZhLi76w11qwcq0aeanT5nXeFO5dIQSB+Q5Qoe+GDnx+/visHvOEOyiyJquACL+MZ
         iD6iMRvI3iqE/fCNvGDeljlSb9YYBs/u3st8jI4q6v00S9iUHYfTnxVuAkOZhrinw7W/
         3dvrHi87YVSUHLv0h02Qn7JxiySadA4wPRC+NmlJ3JAG0wAoXW8E+BLinYNBCsQ30x7V
         LXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773438873; x=1774043673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8G/at76670ycOzH91CNexS5yCq4aAux5TqZxX053qrI=;
        b=PaFUNTBX8MaV0n8eHGRJaThdI38aDP7juZ6qxh3h66/2WSvI4A9mQLYyH3AkcZoqya
         IDsXII8uZBQp0Oa0VeEq457kX2eO69h4Clsgb4tGLAHAzXstxeHjR44lL1qmEyDumkrC
         BMRewR8em39J5lMApibsyAgwlvsfw4jya5AsUHwZPsX/RX/dU4X76+ZJsiLW83KqWceL
         sgmCCrVkaGzeWlXstqqpzniiZRQ44+XoN4dKOav3bDCP87pkeAFqRKQc+iGJ9F49w3Dm
         QgwxVhtZw1nBfJfNHE8om2NjvmG+Izxo+sgZfvae/IekswuysTZ9ygNf+64SJ7NvJ0Ps
         iHAw==
X-Gm-Message-State: AOJu0YwRRVCaM16/8D7l6mlxn3/te8BqWy0hHOWS1ANTQQAxVobYJSKN
	G9zQH7s2lPAD4uiuab9NxregqVCmBPMjGvQ7vmLkKfbGGNvLZrjbxypo
X-Gm-Gg: ATEYQzzRv5ExabwxS/GX80zw5Tg6FA5Q8sP+HOe0qC6yb9IMl5ZvHPVSrvQ6IIKkn83
	1CnQsnkYM0YMfyyx7Ar3TO+dwadrDwWNwjI0q7NemoEYpLRkvKaSbUVeDMQ/jycXeyrbYKYb0X7
	po5E97J8YQhnZ/TrO9Typ06u9VHUhH1ClVZ+6KVVJmwZXTYt3/0gr1asHroeCqoRmSUadqz6KI/
	Vwa7Hhas5QetVstOWanH79WbPHevxykzOIXChY5cb9pJdLWfVHZXuVyDpSACFz9uN+ndxlqL1Cd
	L4LM0APe/1AiTQgLUOWe1nlNPSZjRJZzppHtnrTPguijBM7LWdwLgb+x7QPNA2gyUAjJe/2cyfA
	SUNxmb00/iFXFzyaX8S0IogqkwznJ5OTei36dA+yNHEIR8lSYgB9BmHAKCa71ni9F2wydSOXeY/
	c0Sfxd3le1aDNjVmGD+k2chZ8rVmKnOnmxgPCjCOLBez2RuPI=
X-Received: by 2002:a05:7022:309:b0:123:2c98:f65d with SMTP id a92af1059eb24-128f3d3cbe0mr2285425c88.13.1773438872617;
        Fri, 13 Mar 2026 14:54:32 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6384e7asm3541611c88.11.2026.03.13.14.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 14:54:31 -0700 (PDT)
Message-ID: <f2cd9698-1200-4752-a61a-e4f311473523@gmail.com>
Date: Fri, 13 Mar 2026 14:59:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] riscv: dts: starfive: jh7110: activate XPbmtUC
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-6-ganboing@gmail.com>
 <20260313-overstep-viscosity-23f4f23e1871@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-overstep-viscosity-23f4f23e1871@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_145434_088178_797600CC 
X-CRM114-Status: GOOD (  22.20  )
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

Hi Conor,

On 3/13/26 06:48, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 01:44:06AM -0700, Bo Gan wrote:
>> Set riscv,xpbmt-uncache-bit to 32 to match SoC memory map:
>>
>>             [0x0,   0x40000000) Low MMIO
>>      [0x40000000, 0x2_40000000) Cached Mem
>>    [0x4_40000000, 0x6_40000000) Uncached Mem UC+
>>    [0x9_00000000, 0x9_d0000000) High MMIO
>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
> 
> 
> What I want know is how this whole setup interacts with the existing
> support that we have for these devices?
> Samuel's patchetset removed from the devicetree all of the nodes related
> to having two mappings of the same memory, and modified the existing
> erratum to only be required for older devicetrees.
> You've not removed them, only added a new property. The non-coherent
> peripherals on jh7110 already work prior to this patchset, is there not
> going to be funky behaviour with both of these things operating in
> parallel?
> 

I just want to clarify that Samuel's change is not touching JH7110, but
*JH7100*. They are very similar chips, can can confuse people sometimes,
but JH7110 evolved to put more devices such as gmac/sdio/usb/pcie through
the front port to make them cache coherent. The left over noncoherent
device are dealt by the driver through cache flushes, I believe. That's
why we have out-of-box support for JH7110 even without Samuel's patch. On
the older JH7100, none of the peripheral is DMA coherent, so we either
use ERRATA_STARFIVE_JH7100, making kernel NONPORTABLE or Samuel's patch.
Refer to this pdf for a detailed comparison:
https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf

My patch doesn't touch anything JH7100. It's an enhancement to JH7110 (the
newer chip). The issue is that even though basic peripherals are coherent,
the video subsystem, GPU/VPU/ISP... is still not. (See page 6 in that pdf)
Hence technically, we still need to deal with the same issue on JH7110.
E.g., part of the reason we can't have GPU driver working is because we
can't map a DMA page as uncached in userspace. There's no cache flush insn
in userspace, either. This change tries to solve the issue in a simple yet
elegant way.

There's no other changes to the device-tree required, just adding the prop
for JH7110, and things should just work. As for JH7100 (the older chip), I
don't plan to support it, as the cached/uncached region are offsetted by
0xf80000000, so it can't be modeled by a single UC bit (w/o hypervisor
re-mapping it underneath, and there's no H for JH71x0) The chip was also
superseded very quickly after the release of JH7110. I don't imagine too
many users demanding support.

>> ---
>>   arch/riscv/boot/dts/starfive/jh7110.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 6e56e9d20bb06..6dfeb31538fba 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -14,6 +14,7 @@ / {
>>   	compatible = "starfive,jh7110";
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>> +	riscv,xpbmt-uncache-bit = <32>;
>>   
>>   	cpus: cpus {
>>   		#address-cells = <1>;
>> -- 
>> 2.34.1
>>

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
