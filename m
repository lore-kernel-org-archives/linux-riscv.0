Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10CAC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsFaZGM0W8FCl2nHpcKuMZc06KdO8ik9xMFYlt1p+Gk=; b=hnqGu5vBjDRQcv
	tjIaX6nWgNbOMkUj8LQj8dxjmjzLrs4x+EIj8WwTRhuackliI3DnR8i7H0l4w+Bt9CJ3jlgaC0zDw
	UMj0uthBjYdSqDFe7SIvnAxGLFGYbDfftufpRZfdq1LFdZetoy2yVa+Sh8FB3iTDpUcbXwN9QukKN
	PY+guIUkbSTnmDmDvNcPks0hMPo/QpabsRVaQapZpdVmg4+pLgBO0nNYIgLtYntXun4bOB8G5329+
	i/m85EHQ0rSPr7T/YU7JpB+TlZG2apx7O945Mm88EL77wnSq3Q4adwKCqtJ/Z1j6T1Xa5CV8gdaD/
	HSI8KVhCCMffMUNJxLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKigO-0000000ABfx-0dtZ;
	Fri, 21 Jun 2024 18:08:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKigL-0000000ABfW-0aJy
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 18:08:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f9b364faddso20371575ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718993296; x=1719598096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZxed23lWK3xyToPkvhbyN/DYUsl81Hk6n86URYaIK8=;
        b=BPbV0WqH1RAvhN1y5/AJCLd3/6q8mT2szRrHrSzU/tNUh0/AM6fOIvbuFet4u/9Dm+
         IrsArJHXBw7VQ948qCbAh42nMYcKs+/tVia4zdx3RZ7QujvCsw7d1Z+XHUE0QJ1+iF7Q
         1h2IVcqZuDjaYrBiOqL0V2LSoLtCNbmuY4nyEorLt406pQL933utXXFn9r7gpKDIamTc
         oqlW/yzwCpc4HpxtUPJ8WzDHXWFxqXUd820FjYOgPn4Yq9dHsS6GO8ykCkddCeQNT2uW
         4nsyqGixyANTqDhgfFA/znEPYalGFk8WauZeY4cgFnWJUujFcIRXN8w7cnb5HRxZ8jO4
         8cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993296; x=1719598096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZxed23lWK3xyToPkvhbyN/DYUsl81Hk6n86URYaIK8=;
        b=kCqCF9+bAIOM+Sn0uXyYvPYRdyBTD3Qy2fAeDCs2OwhU6eGRFRCjK92IhGVVm3FwZp
         DZjf/IyDJjv+baEyIahnEGRpCFZEmctaT+IvZmh1UWeV+j3IuwIU0Yrlv0FxJIE9KVm9
         MYmBcTy/bprclf2mVCsi23PEn48ZF5NuR1CSpzCNmTbhgahH4Kn2o1CdL0O03Awg1dcC
         Ah3pdsYjljuPeARF9BgVhp0TEUDA9THDqKGEuc7uXyb5bC05i0FwMtrYF/p+r6Zjm6Rf
         lvvG4MF038mfERUc3xIcL6XlmjvkRpJhj7vStIKDu5dllTbDybBtZ09IiFkDVEjFyjSc
         Ptxw==
X-Gm-Message-State: AOJu0YxmfkTOiaPbaS0w6oFicPj0Eh0sr2mc9e3KSuW63IbblILHKJdq
	jbuWmtLYv3xSka4Wyk1ID6IjfmXVwrr6blY0vzXgWktc0p9UsmFHZMeBP5oUwm0=
X-Google-Smtp-Source: AGHT+IHIPg92rOqSXjhse5eDTBW8G59SbiAeZwSOHAEyGQrxlr0R0G7NdOB6xGx014mSNb9HFErLyQ==
X-Received: by 2002:a17:902:dacb:b0:1fa:2d1:105c with SMTP id d9443c01a7336-1fa02d11251mr11269355ad.65.1718993296107;
        Fri, 21 Jun 2024 11:08:16 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5fa9sm16878825ad.206.2024.06.21.11.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 11:08:15 -0700 (PDT)
Message-ID: <8c1167fb-9580-45bd-a798-f7d32477f1bd@rivosinc.com>
Date: Fri, 21 Jun 2024 14:07:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
To: Charlie Jenkins <charlie@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com> <ZnDmRK0ZtKzmWN5S@ghost>
 <ZnDsdzv4o/Xz9kWm@ghost> <e6f7a061-50f0-4a6a-a09b-468502703c20@rivosinc.com>
 <ZnSptpobfqjik3RM@ghost> <20240621-reveler-underfed-37600a9f16d5@wendy>
 <ZnW130PqW56CnZT8@ghost>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <ZnW130PqW56CnZT8@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_110817_228222_664668A7 
X-CRM114-Status: GOOD (  62.57  )
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



On 6/21/24 13:18, Charlie Jenkins wrote:
> On Fri, Jun 21, 2024 at 11:06:31AM +0100, Conor Dooley wrote:
>> On Thu, Jun 20, 2024 at 03:14:14PM -0700, Charlie Jenkins wrote:
>>> On Thu, Jun 20, 2024 at 05:31:28PM -0400, Jesse Taube wrote:
>>>>
>>>>
>>>> On 6/17/24 22:09, Charlie Jenkins wrote:
>>>>> On Mon, Jun 17, 2024 at 06:43:32PM -0700, Charlie Jenkins wrote:
>>>>>> On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
>>>>>>> Run a unaligned vector access to test if the system supports
>>>>>>> vector unaligned access. Add the result to a new key in hwprobe.
>>>>>>> This is useful for usermode to know if vector misaligned accesses are
>>>>>>> supported and if they are faster or slower than equivalent byte accesses.
>>>>>>>
>>>>>>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>>>>>>> ---
>>>>>>> V1 -> V2:
>>>>>>>    - Add Kconfig options
>>>>>>>    - Add insn_is_vector
>>>>>>>    - Add handle_vector_misaligned_load
>>>>>>>    - Fix build
>>>>>>>    - Seperate vector from scalar misaligned access
>>>>>>>    - This patch was almost completely rewritten
>>>>>>> ---
>>>>>>>    arch/riscv/Kconfig                         |  41 +++++++
>>>>>>>    arch/riscv/include/asm/cpufeature.h        |   7 +-
>>>>>>>    arch/riscv/include/asm/entry-common.h      |  11 --
>>>>>>>    arch/riscv/include/asm/hwprobe.h           |   2 +-
>>>>>>>    arch/riscv/include/asm/vector.h            |   1 +
>>>>>>>    arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
>>>>>>>    arch/riscv/kernel/Makefile                 |   4 +-
>>>>>>>    arch/riscv/kernel/sys_hwprobe.c            |  41 +++++++
>>>>>>>    arch/riscv/kernel/traps_misaligned.c       | 119 ++++++++++++++++++++-
>>>>>>>    arch/riscv/kernel/unaligned_access_speed.c |   9 +-
>>>>>>>    arch/riscv/kernel/vector.c                 |   2 +-
>>>>>>>    11 files changed, 221 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>>>>> index b94176e25be1..f12df0ca6c18 100644
>>>>>>> --- a/arch/riscv/Kconfig
>>>>>>> +++ b/arch/riscv/Kconfig
>>>>>>> @@ -723,6 +723,12 @@ config RISCV_MISALIGNED
>>>>>>>    	help
>>>>>>>    	  Embed support for emulating misaligned loads and stores.
>>>>>>> +config RISCV_VECTOR_MISALIGNED
>>>>>>> +	bool
>>>>>>> +	depends on RISCV_ISA_V
>>>>>>> +	help
>>>>>>> +	  Enable detecting support for vector misaligned loads and stores.
>>>>>>> +
>>>>>>>    choice
>>>>>>>    	prompt "Unaligned Accesses Support"
>>>>>>>    	default RISCV_PROBE_UNALIGNED_ACCESS
>>>>>>> @@ -774,6 +780,41 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
>>>>>>>    endchoice
>>>>>>> +choice
>>>>>>> +	prompt "Vector unaligned Accesses Support"
>>>>>>> +	depends on RISCV_ISA_V
>>>>>>> +	default RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>>>> +	help
>>>>>>> +	  This determines the level of support for vector unaligned accesses. This
>>>>>>> +	  information is used by the kernel to perform optimizations.
>>
>> I haven't actually checked the patchset, but is it actually used by the
>> kernel to perform optimisations?
> 
> No ;)
> 
> Right now this patch is just providing the information to userspace
> through hwprobe and doesn't optimize anything in the kernel.
> 
>>
>>>>>>> It is also
>>>>>>> +	  exposed to user space via the hwprobe syscall. The hardware will be
>>>>>>> +	  probed at boot by default.
>>>>>>> +
>>>>>>> +config RISCV_DETECT_VECTOR_UNALIGNED_ACCESS
>>>>>>
>>>>>> This is not used anywhere, what is the reason for including it?
>>>>
>>>> This is so that we can check if they are supported or not, but not check the
>>>> speed of them. Similar to RISCV_EMULATED_UNALIGNED_ACCESS.
>>>
>>> What do you mean? It isn't used anywhere so this "check if they are
>>> supported or not" is not guarded by this config.
>>>
>>>>
>>>>>>
>>>>>>> +	bool "Detect support for vector unaligned accesses"
>>>>>>> +	select RISCV_VECTOR_MISALIGNED
>>>>>>> +	help
>>>>>>> +	  During boot, the kernel will detect if the system supports vector
>>>>>>> +	  unaligned accesses.
>>>>>>> +
>>>>>>> +config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>>>> +	bool "Probe speed of vector unaligned accesses"
>>>>>>> +	select RISCV_VECTOR_MISALIGNED
>>>>>>> +	help
>>>>>>> +	  During boot, the kernel will run a series of tests to determine the
>>>>>>> +	  speed of vector unaligned accesses if they are supported. This probing
>>>>>>> +	  will dynamically determine the speed of vector unaligned accesses on
>>>>>>> +	  the underlying system if they are supported.
>>>>>>> +
>>>>>>> +config CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED
>>>>>>
>>>>>> This should not be prefixed with CONFIG and does not include VECTOR in
>>>>>> the name.
>>>>
>>>> Huh thought it would warn fixed though
>>>
>>> What do you mean by "warn fixed"?
>>>
>>>>
>>>>> I assume you meant to put
>>>>>> "RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED" here?
>>>>
>>>> This is to leave a faster path like SLOW or FAST to say that unaligned
>>>> access arent suported.
>>>
>>> I am not sure what you are responding to. This comment seems to be
>>> responding to my correction of
>>> CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED->RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED
>>> so I don't see how that ties into SLOW/FAST.
>>>
>>>>
>>>>>>
>>>>>> This was also intentionally left out on the scalar side [1]. The
>>>>>> implication here is that having this config will cause people to compile
>>>>>> kernels without unaligned access support which really shouldn't be
>>>>>> something we are explicitly supporting.
>>>>>>
>>>>>> If somebody does want to support hardware that does not handle vector
>>>>>> unaligned accesses, the solution should be to add emulation support to
>>>>>> the kernel.
>>>>
>>>> Yes but we dont have emulation support yet so I do think its a good idea.
>>>
>>> I am hesitant because it is very likely that somebody will add support
>>> for unaligned vector emulation. When there is emulation support, this
>>> config option should not exist to be consistent with scalar. However if
>>> we add this option in now, we must expect a user to enable this config,
>>> and then
>>
>> I dunno, I think there could be value in having the option here. For
>> scalar, we couldn't have an option that would break the uABI, so the
>> unsupported option wasn't okay. That's not a constraint that we have for
>> vector.
>>
>> For vector, if you have a system that doesn't support misaligned access,
>> you probably don't want to emulate the accesses either, since that's
>> likely remove any performance gains you get from using vector in the
>> first place, so I can see benefit in the option.
> 
> We have the RISCV_MISALIGNED option that disables the scalar emulation,
> but doesn't break the UABI because it's not saying that misaligned
> scalar is not supported, but just that the kernel doesn't emulate.
> Having an UNSUPPORTED option explicitly breaks the UABI which doesn't
> seem like something that the kernel should support. If we are okay with
> having options that break the UABI then this is fine, but I was under
> the impression that we did our best to avoid that.
> 
> There definitely is value in having an option like this for hardware
> that never wants to run misaligned code, but since we decided with the
> scalar accesses that we should not break the UABI I think vector should
> do the same.

The rational for scalar accesses was slightly different as
The base ISA spec said/says: ". The base ISA supports misaligned 
accesses, but these might run extremely slowly depending on the 
implementation."

Section: 2.6 Load and Store Instructions. Available: 
https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

> 
>> Enabling the probing is going to end up with same outcome for userspace
>> as having this option on such a system, so it comes down to whether you
>> want to allow people to skip the probing if they know their system has
>> this problem.
>>
>>> we will have to get rid of it later. Users are not always happy
>>> when config options are removed.
>>
>> I dunno, I don't think that adding emulation requires that we remove
>> this unsupported option.
> 
> I am probably being too paranoid about this but I am hesistant to cause
> vector and scalar misaligned access implemenations to diverge. It is
> inconsistent to allow an unsupported option for vector but not for
> scalar when both support emulation. The probing is very fast as it just
> checks if a misaligned access causes a trap and then sets the access
> speed to unsupported if it does trap.

Charlie is right about probing for support being fast. There is
RISCV_DETECT_VECTOR_UNALIGNED_ACCESS to only detect support not the 
speed. I thought it might be a good idea to add this config option, but
I'll just drop it to shorten this thread.

> 
>>
>> Additionally, what are we doing in the kernel if we detect that
>> misaligned stuff isn't supported? Are we going to mandate that kernel
>> code is aligned only

As of now yes.

>> disable in-kernel vector or some other mechanism
>> to make sure that things like crypto code don't have/introduce code
>> that'll not run on these systems?

I'm not too familiar with the uses of unaligned vector accesses, but if
it significantly improves performance then I think there should be a 
faster unaligned access pathway, and a aligned access pathway, so both 
are supported. This also ties into your first question.

Thanks,
Jesse Taube

> UNSUPPORTED will still be set by the quick probe so it would be possible
> for the kernel/userspace to avoid running misaligned vector when it's
> unsupported. Any kernel methods would probably want to always run
> aligned vector unless misaligned support was determined to be FAST
> anyway, I am doubtful that code will have different optimizations for
> FAST, SLOW, and UNSUPPORTED but it is possible.
> 
> I would prefer consistency between scalar and vector misaligned support,
> but this is not a deal breaker for this patch. I am not convinced it is
> the best choice, but I am okay with leaving this option in the kernel.
> 
> - Charlie
> 
>>
>> Cheers,
>> Conor.
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
