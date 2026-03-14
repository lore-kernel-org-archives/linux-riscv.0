Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C989107BCEF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 00:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNiJ4IsA1c+9/bmfGMCoDN39gS5NciwRSPQcrZ/vAro=; b=jdPjfjwYaZfzPb
	efbgYiuGV4s8/4Tr1ocNZmIA1XCQD/S17JHWIaG3Ncw4BTqn301oI5b6/bEdd8EolFpYhTBGYfVNs
	RlCUfRRH61XTWvJrr1W4/HgmtCJkpNbUCf52TM3VpUqdHlRcjI17DnVpkshy4a3wwAiQcukQZKEbH
	I2CFPP0CdNQpPUsDuP1devCKdYRTcZofN7/u9Vt1p3sDAKEFQol4KBW/dClUQ94k1ETD9UAlQTfEb
	yVkjwUGs+dECwVdZ0fUBjplQCcLqydusB+tsYPnpwGQ74k7noV4nwm1UCw26piWgEShptgBBx9rep
	Rp6pB06dVi45bvmoLpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CoA-00000001Lwb-2YIM;
	Sat, 14 Mar 2026 00:24:46 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Co7-00000001LwF-2xRl
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 00:24:45 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2bea8220c38so246986eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 17:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773447883; x=1774052683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUQbXFzRWv42EKkNfoDDsBdsogIZ8MSrAt4p0nD/KCs=;
        b=T4fKtcokctgmx2LYvnidX+JwMpF7RtG069zzUG7XclAoe+Jjd7A3f01QLLCktsDrkU
         T29Aez6WGd9WTRVXREVn3K2s1B8BhqiIb3wg79MOW4FBOyWWZ9o8MLRWIzBS97Ns+Re7
         1td/4QU0AistqHB5Fd3vy/Ea7MtCrw+lyEW3ODvFksqk9gXODcpuuZCXwxGrBvy0wUrf
         ADOi3Fp6mv3mNnBIPvGVomrSuNgQ45gd9WAhsYELM9AIlUraQ1tkoAitaw8Yu1b2df5A
         MEvQxnGprK/ckzo4Hib960o1WBRBkfa6LAGnoIS5jjQ3wR9LHYc24r7Hc2i8P9LfO9FY
         8Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773447883; x=1774052683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUQbXFzRWv42EKkNfoDDsBdsogIZ8MSrAt4p0nD/KCs=;
        b=b7A/iYjUpdH6KKxWA7ecx2WtLf+KShKYANh1m0wgDZfrVuB3FqAk86P6xsEphyHiKH
         rjiYsHKvetdVghEAhQ5eF9LmAwxUaa6r2TB3qwf+9eT7egc3pj1MqbjanhUAlg2gvXJm
         XzD64gjwZTGDD5DCO/ISN+JZHKLa5tBFyAeXg1Gqhh/Xko316NFPwOOQ0XS9/VXHSmli
         mHbPWsRySM9NiyveTFXoXA7LBcO6Zmdt5p/3IH7xu31Pfezbmm6LPZuNbOV3Rbxb630F
         as+shtd8Zm56HcLoNc2bn98B2pVWdHuJuganyTd8Tl7AhtWmqd+n8ZqR69jNDOnC+7Z9
         sgMA==
X-Gm-Message-State: AOJu0YxGknMdHhYoouE3PYEXQM/SkiaXFYxFdWJhUUQKAReAnT6aibx/
	lzBXjILamVoYHlbJoTPuWfsQltKMRng4r7QaEW0UpZxCPNwrPfhPZ+OL
X-Gm-Gg: ATEYQzx6rsg3nbmV8+SkJjwLs3V0WMqjHt/PvXeAsSzMyuNMCrc5p+imbIDYkePIOBd
	/RyAWjxBoFNEGIyD9btS3ttEcu4n6j28lQSIwEFrfgtP4Cx4QXhyar5pfDxl9FleXrf4v0m1K/P
	4DPx8zUNGmx3SDSeFuYjFHrm7nN91X+ekDzM3UfcMfY3ce4gAeUzk31CtSA5iXU8QVSiFJnAd3S
	ux2q1uLOIQT0B1CZ66GGmfeEquvmY2AE332J6Lsa6vqPKglLtBxl1fxEhQfu4QQMw71AuoImVhp
	6Y6UP7Ax7Hxw7hV4kDEtlUCP814ot3rwW3ImVvkXRQzAPtK7Qka6Ta3cKvFcsk/GzVaI+7NbMc1
	6UShB0nppWKlX/oh4bZt6bMhzX8Kl11yUdlbCqU9iZsBFLDZdLTYRO5i+LBl8KyQWi3335vP4y2
	3nWXjehbkjW5K1UJXmmqM9NWF+0SKMxfXwGk6jF1yaWmWm9+4=
X-Received: by 2002:a05:7301:4b03:b0:2ba:96d8:530b with SMTP id 5a478bee46e88-2bea55f6892mr2515723eec.32.1773447882614;
        Fri, 13 Mar 2026 17:24:42 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ea2cfsm5522621eec.11.2026.03.13.17.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 17:24:41 -0700 (PDT)
Message-ID: <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
Date: Fri, 13 Mar 2026 17:29:53 -0700
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
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-spiny-duration-702fff6bca17@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_172443_957881_58BB10BA 
X-CRM114-Status: GOOD (  36.87  )
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

On 3/13/26 16:55, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 02:33:16PM -0700, Bo Gan wrote:
>> Hi Conor,
>>
>> Thanks so much for the prompt review. See inline.
>>
>> On 3/13/26 06:24, Conor Dooley wrote:
>>> Hey,
>>>
>>> Gonna offer some feedback on the detail of what's been done in this
>>> series, without providing any commentary on whether this is the correct
>>> approach to take.
>>>
>>> On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
>>>> On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
>>>> sometimes map the system memory twice in physical address space, one
>>>> as cached, and the other as uncached. Through the uncached window,
>>>> device drivers will be able to map DMA buffer for noncoherent devices.
>>>> Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
>>>> Make use of such feature by modeling it as "XPbmtUC", a customized
>>>> version of Svpbmt, where a single bit in PTE is used for UC control.
>>>> There's no IO bit with such scheme, as it's assumed that the PMA
>>>> (usually hard-wired on these SoCs) will properly convey the strongly-
>>>> ordered, non-idempotent attribute of the MMIO region.
>>>>
>>>> The enablement of such position of "XPbmtUC" is controlled by the
>>>> device-tree property "riscv,xpbmt-uncache-bit".
>>>
>>> Firstly, the naming generally I take some exception to. If this is some
>>> fake vendor extension for linux purposes, it needs to have "xlinux" in
>>> it, like our xlinuxenvcfg does. It should also be consistent, don't use
>>> "xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.
>>>
>> Makes sense. I can certainly change that to be conformant.
>>
>>> Athough, I think I disagree fundamentally with this property, as it seems
>>> to me like "software configuration" that shouldn't be permitted in
>>> devicetree. Maybe I am misunderstanding, but the numbers you chose are
>>> convenient, not set in stone by the specific hardware, right?
>>
>> For JH7110, the bit 32 (PPN bit 34) matches exactly with the HW. Meaning
>> toggling this bit would re-map the page to the uncached window, which
>> matches perfectly with the synthetic UC bit in the scheme.
> 
> What does "matches exactly with the hardware" mean? AFAICT, you picked
> it because it was the best value, but you could also have picked another
> less optimal value?
> 
>>
>> For EIC770X, the bit 38 (PPN bit 40) is hand picked to be able to map all
>> physical memory space (40 bit), while making it very easy for the thin-
>> hypervisor, which can utilize Sv39x4 (41 bit) page scheme in G-stage.
>>
>> I also considered the sbi call approach, where the kernel can query for
>> the support and position of the uncache bit. The thing is that JH7110
>> can just hard-code the bit without any changes to firmware, and I want
>> to have a consistent way for both SoC, thus the device-tree approach, to
>> let the EIC770X firmware/bootloader adding the property to dt at runtime.
>> Any better ideas?
> 
> Is the only thing that's variable on your eic770x platform whether or
> not the bit is enabled? Or are you looking to vary the bit depending on
> the specific platform?
> 

It'll be "fixed" for eic770x if a thin-hypervisor re-mapping is enabled
underneath. It just so happens that the physical address space is 40 bits
(ignoring the 40bit+ upper uncached region for interleaved memory, which
we don't need when the "xpbmt-uc" is enabled anyway), and the hypervisor
can use Sv39x4 (also 41bit) to re-map everything.

The variation comes with different SoCs, JH7110 vs. EIC770X. I'd like to
make it a variable, to make a unified kernel binary boot on all SoCs, so
I need to fix the alternative logic for PC-relative instructions to read
from a global variable "xpbmtuc_bit/mask". Also I want to avoid adding
too many branches to the alternative macro.

>>> I'd be much more comfortable with adding xlinuxwhatever to
>>> riscv,isa-extensions, to signal that a soc supports this stuff than with
>>> a property for the bit itself. I suppose that bit information could then
>>> come from a LUT in the vendor extensions, that a validate callback could
>>> check (via root compatible) before enabling. There's not a super neat
>>> way to do that at the moment though I don't think, code currently
>>> expects that vendor extensions are in a different "namespace" to
>>> standard ones, and this would blur the lines because it's not from a
>>> specific vendor, nor is it a standard extension.
>>> I guess, it could be done by keeping it as a standard number, but then
>>> it's a bit trickier to neatly access the LUT while keeping it split
>>> apart.
>>> I know this means having to modify the kernel if there's a new device,
>>> but I'm inclined to say "deal with it" because they could've done
>>> something standard and opted not to.
>>>
>>> Could also argue that this should be shoved into a sifive specific
>>> thing, but I don't expect that they're the only ones with devices like
>>> this that could benefit.
>>>
>>
>> I've thought about riscv,isa-extensions. The issue with that is that it's
>> a per-CPU thing, but I'm adding a global extension, and I don't want to
> 
> Most of the extensions in that string are effectively global. There's no
> need to worry about "polluting" it.
> 

Got it. So I can use something like "xlinuxpbmtuc38" in isa-string? (until
someone comes up with a better naming. Naming things is hard...)

>> pollute the isa-extension string. Thus, I followed Samuel's approach --
>> He uses "riscv,physical-memory-regions" in the root node.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
