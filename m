Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD46E107BCF1
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 05:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmLke6/VXORZK74YijaYqTi/PFdwCysk/mT4n2nZi1s=; b=QqAAls/sekjoOq
	Ds3CQQmPQ++pjchVq9dr7FtkrgaCNSz2n11nyMJ8CGimeudjkdbGPEvbsXTPi2qc0QVes98aHUzrs
	G6cHFYoh6f2nQBYCeMQszXR90NVu21egPQxnr83ooAs6cgD7ROrLtzL11rbkn3mzi4nLD3M4asJNw
	oqapwqrshfuMV1aa7IzyZdEigBql1sUA9Z6zKvr1cG3SjoWwYKqvjjqi9OYW6z8V81yAu/T785Kkc
	QAs63fT0KIUW5CBH7DOYW8QbPqF6z+e8K8Z4kPhZe00L2sKuOdIKfeBfQJAOx+WIp0XKa2uu3YNLF
	b31sfHP96t2GCC5qoLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HFO-00000001VOq-1U3Z;
	Sat, 14 Mar 2026 05:09:10 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HFK-00000001VOM-0rbM
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 05:09:08 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8cb40149037so322102185a.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 22:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773464945; x=1774069745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/e/9v0Sp4Vhwdmz1g84yGNuM71VzfuGISYjVINsFhk=;
        b=fdXtq3+Ikb37WoOV7a/KnZBKAw7s8LLCeHEJkOcb/XRV+g56WYVApZr+Az3uz2leVi
         kxiKJoiiClojK/UEqQ+l2olxfnNx8Pb+x/Fyx74jq/GV3WlzhnfajbPhp2iUmjFWIWUG
         PSk1SIToq92TkNk+Qp1CFeariATC30H3TLcwF77LMtweBhuTfc2XcSzWt0gLQ4DX8ifa
         bWHehgXePfffzTC/Ga6zh9/OzVoCgTUE2ff3CXYDcoGcD6IHThs+/yfKugt1UbKaWeu6
         wH/binAU6aIa+NAqgnDIFKWbewxvyQDAhttn7K2Ghv+8EmKWHpKh8CMmUubTojR3prfo
         B7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773464945; x=1774069745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/e/9v0Sp4Vhwdmz1g84yGNuM71VzfuGISYjVINsFhk=;
        b=avAHGhLWcn37/D2FHhjK5JK1B4u0GUeKhvSw3Jhf7Dn5b7CRCzIzO0R2XpX+w22C38
         96FE90P+palF8KQuQkUhOqU03WHfHWAm+1jo5RywJjFrC05HgaIHUPATuwdvJEDsMHf+
         L5GZEFGX2P6f7eMTedxPX/XXW9cLJa3hm/JZtZOdjOirXZUIdRk3b+bgiLhyH4/pOt7s
         UVoQnrNPntaefUbKogj2w+s8g9Tjf2mU6jGvZPEblZwUfHyTLaA8nM1SBtWwi6DTyXXK
         bYbzRQN6rZtyToxtK7XtHYo5NjhzEDPkzyBZ4jC8tXE9P28CXS0pt1onoxy0naN9VxEH
         WlCw==
X-Gm-Message-State: AOJu0YzrU2X8CSiLBpiWr0PSEbCUphYNM38RAitEWCSTxCLLWjHW31Wg
	c+efQ0yDYP2J9hyUUBNj+/XeLef/mpnTx3A9+/FUHApVQesDGFDBKUvigbqYwTI0
X-Gm-Gg: ATEYQzzdLlLJYGbY+KQyFkFyL/C7kcySROU1JW6+L03So/rn82yp3MZZwx1c9OTs+fO
	WBx/uiFN/aPtY4aDFYUoqoWe20eGag7wCbET6fMEinYEgBkZV4ulOwI4FofbF1H8ydx4ZnYi4Gi
	vpI1NM9wLTHbdpeTOjET22iyxb5QVkxjGLziBAu5ZvEXTquEkzeLUo9lB9DBzMhX9SaH6xOioni
	LMV86dkgcmTI+Gz7vZxCu3QSplA7e4KWrfdp5FSkepq7HszDGxOkwZTM3NzAJAtc931F8VPiUNl
	yN6G69/sLgi2oSHfZ9QaLn4AyU557YDhoKguLxPLmxFwWKZ4z/8X7fQ8HTgSZ8mhOYcqf9HF4hB
	YWUaDP1/pTUaeOYJdDQusZA0huxmT6WR73Z0kxBVmTA3V1w/zkJ0qxfNHiwW0wNiyzzTgCqlhO/
	+EMB+LkU291pBIEhIQp6bejy6O
X-Received: by 2002:a05:620a:4613:b0:8c8:753a:7d9 with SMTP id af79cd13be357-8cdb5b6f808mr807185585a.66.1773464944670;
        Fri, 13 Mar 2026 22:09:04 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cdaac435dbsm559487285a.16.2026.03.13.22.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 22:09:03 -0700 (PDT)
Message-ID: <9592ecf2-8410-4df7-9b2c-17564426240d@gmail.com>
Date: Fri, 13 Mar 2026 22:06:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of Svpbmt
 "XPbmtUC"
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
 <20260313-spiny-duration-702fff6bca17@spud>
 <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
 <20260314-errant-gnarly-dcca92457051@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260314-errant-gnarly-dcca92457051@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_220907_442074_9B660CD8 
X-CRM114-Status: GOOD (  45.84  )
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

On 3/13/26 18:18, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 05:29:53PM -0700, Bo Gan wrote:
>> Hi Conor,
>>
>> On 3/13/26 16:55, Conor Dooley wrote:
>>> On Fri, Mar 13, 2026 at 02:33:16PM -0700, Bo Gan wrote:
>>>> Hi Conor,
>>>>
>>>> Thanks so much for the prompt review. See inline.
>>>>
>>>> On 3/13/26 06:24, Conor Dooley wrote:
>>>>> Hey,
>>>>>
>>>>> Gonna offer some feedback on the detail of what's been done in this
>>>>> series, without providing any commentary on whether this is the correct
>>>>> approach to take.
>>>>>
>>>>> On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
>>>>>> On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
>>>>>> sometimes map the system memory twice in physical address space, one
>>>>>> as cached, and the other as uncached. Through the uncached window,
>>>>>> device drivers will be able to map DMA buffer for noncoherent devices.
>>>>>> Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
>>>>>> Make use of such feature by modeling it as "XPbmtUC", a customized
>>>>>> version of Svpbmt, where a single bit in PTE is used for UC control.
>>>>>> There's no IO bit with such scheme, as it's assumed that the PMA
>>>>>> (usually hard-wired on these SoCs) will properly convey the strongly-
>>>>>> ordered, non-idempotent attribute of the MMIO region.
>>>>>>
>>>>>> The enablement of such position of "XPbmtUC" is controlled by the
>>>>>> device-tree property "riscv,xpbmt-uncache-bit".
>>>>>
>>>>> Firstly, the naming generally I take some exception to. If this is some
>>>>> fake vendor extension for linux purposes, it needs to have "xlinux" in
>>>>> it, like our xlinuxenvcfg does. It should also be consistent, don't use
>>>>> "xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.
>>>>>
>>>> Makes sense. I can certainly change that to be conformant.
>>>>
>>>>> Athough, I think I disagree fundamentally with this property, as it seems
>>>>> to me like "software configuration" that shouldn't be permitted in
>>>>> devicetree. Maybe I am misunderstanding, but the numbers you chose are
>>>>> convenient, not set in stone by the specific hardware, right?
>>>>
>>>> For JH7110, the bit 32 (PPN bit 34) matches exactly with the HW. Meaning
>>>> toggling this bit would re-map the page to the uncached window, which
>>>> matches perfectly with the synthetic UC bit in the scheme.
>>>
>>> What does "matches exactly with the hardware" mean? AFAICT, you picked
>>> it because it was the best value, but you could also have picked another
>>> less optimal value?
>>>
>>>>
>>>> For EIC770X, the bit 38 (PPN bit 40) is hand picked to be able to map all
>>>> physical memory space (40 bit), while making it very easy for the thin-
>>>> hypervisor, which can utilize Sv39x4 (41 bit) page scheme in G-stage.
>>>>
>>>> I also considered the sbi call approach, where the kernel can query for
>>>> the support and position of the uncache bit. The thing is that JH7110
>>>> can just hard-code the bit without any changes to firmware, and I want
>>>> to have a consistent way for both SoC, thus the device-tree approach, to
>>>> let the EIC770X firmware/bootloader adding the property to dt at runtime.
>>>> Any better ideas?
>>>
>>> Is the only thing that's variable on your eic770x platform whether or
>>> not the bit is enabled? Or are you looking to vary the bit depending on
>>> the specific platform?
>>>
>>
>> It'll be "fixed" for eic770x if a thin-hypervisor re-mapping is enabled
>> underneath. It just so happens that the physical address space is 40 bits
>> (ignoring the 40bit+ upper uncached region for interleaved memory, which
>> we don't need when the "xpbmt-uc" is enabled anyway), and the hypervisor
>> can use Sv39x4 (also 41bit) to re-map everything.
>>
>> The variation comes with different SoCs, JH7110 vs. EIC770X. I'd like to
>> make it a variable, to make a unified kernel binary boot on all SoCs, so
> 
> FWIW, I have no interest in things that are not multiplatform-safe, so
> anything I've been suggesting has been with that in mind. When I was
> talking about not conveying the bit via DT, but storing the value in the
> kernel, I was still considering that the values would be stored for
> specific soc compatibles.
> 
> To be honest, I'm not completely dead-set opposed to a property that has
> the bit positioning, but any property being added for what is
> effectively an erratum needs to pass a high bar when the info could be
> gathered in another way. That the eic7700 one depends on firmware for
> what the bit may be is points in your favour, since firmware variability
> is part of what dt is there to do. The jh7110 is points against, since
> it could be fished out of the errata handling code.
> 
Even for JH7110, I don't think it can be handled through the errata. It
describes the errata of the core (if I'm not mistaken), and there can be
other SoCs using the same core with the same archid/impid, but maps the
peripherals differently, and the UC bit position doesn't apply there. I
think you are probably looking for "SoC level errata" handling. It's not
there AFAIK. Hence I guess both SoC cases point in favor of the dt prop?

>> I need to fix the alternative logic for PC-relative instructions to read
>> from a global variable "xpbmtuc_bit/mask". Also I want to avoid adding
>> too many branches to the alternative macro.
>>
>>>>> I'd be much more comfortable with adding xlinuxwhatever to
>>>>> riscv,isa-extensions, to signal that a soc supports this stuff than with
>>>>> a property for the bit itself. I suppose that bit information could then
>>>>> come from a LUT in the vendor extensions, that a validate callback could
>>>>> check (via root compatible) before enabling. There's not a super neat
>>>>> way to do that at the moment though I don't think, code currently
>>>>> expects that vendor extensions are in a different "namespace" to
>>>>> standard ones, and this would blur the lines because it's not from a
>>>>> specific vendor, nor is it a standard extension.
>>>>> I guess, it could be done by keeping it as a standard number, but then
>>>>> it's a bit trickier to neatly access the LUT while keeping it split
>>>>> apart.
>>>>> I know this means having to modify the kernel if there's a new device,
>>>>> but I'm inclined to say "deal with it" because they could've done
>>>>> something standard and opted not to.
>>>>>
>>>>> Could also argue that this should be shoved into a sifive specific
>>>>> thing, but I don't expect that they're the only ones with devices like
>>>>> this that could benefit.
>>>>>
>>>>
>>>> I've thought about riscv,isa-extensions. The issue with that is that it's
>>>> a per-CPU thing, but I'm adding a global extension, and I don't want to
>>>
>>> Most of the extensions in that string are effectively global. There's no
>>> need to worry about "polluting" it.
>>>
>>
>> Got it. So I can use something like "xlinuxpbmtuc38" in isa-string? (until
>> someone comes up with a better naming. Naming things is hard...)
> 
> I don't think the encoding of the bit should be in the name, otherwise
> we'd need to many different variations, if using riscv,isa-extensions is
> the approach that ends up being used.
> 
>>>> pollute the isa-extension string. Thus, I followed Samuel's approach --
>>>> He uses "riscv,physical-memory-regions" in the root node.
>>
>> Bo

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
