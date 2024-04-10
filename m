Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D65C67861
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 00:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgstYBQqt38qwsFaukYiCHHkVwpROt+XFRVa2i76MgU=; b=watZA+N8lTIkoTz4T+CbPtGZMi
	bIDtJ+1Yp8F5Cz9j2EAPA5anSQQL3MdsxqnWmBx1QtrqqTYn99/EWL22zSCKlCdOte9aF7fi9gfGM
	pNE8P5ScfhrnDwWH3hGmRQCEfi/L/WAan7RbyiRkmvkTraEmawrpRG44uEOTKK5Qrj/bSXhpSqGqX
	LMsIe1G424NR19qvKAgw7mdsvg6QuBwKakPixpSrMFyfW9+3bHlCivLpiAqhy3aHUaUfu6BtpwWlY
	jV4TRkhXV1x/dNcLdDSCjVQO91lcxtuoq0p97Q2BE7HnvDarbK2wOTXHgxVakvqTrrt2EqtZzPNYb
	hyMShOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLZ1-00000004NZs-3o7w;
	Wed, 10 Apr 2024 00:11:43 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLYy-00000004NUu-2gdE
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 00:11:42 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-229a90b7aa9so2779569fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 17:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712707895; x=1713312695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtH2sd79QyaRF1BMJBe3s1Wc0LYZsHGHiseKLFNrnNM=;
        b=zwhpncCGHB37STuMqXdE2CTv7U7LW6GMK+pWd8djxOL5v4YAVotzhvvZiwukxAVI5r
         PXt9eqf3vaRsVJAXSJWqb1rLLIfp0ULkn872749wfCSJ5gH4/Ri7fuOIUGqixzi0R17Y
         BH7N+k7sn4o7b6mOyZudl6jU4QVcnhQalrJucggxWmCwIpfXOa3QeDuzekfTDWQWZk9+
         +R1tRYLTwauHgV7cUh7vuVGUg5HEPMjGifMtzOIprMaujdJ+h4tZ1wGbC3YZ8cciKVBW
         Ge+ZtzrIyikVInfAjYKpUMVeImB5l/UUP6oSOXfb3X1CZmpvdcF4HrYNv1OwBHywGvnm
         DwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712707895; x=1713312695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtH2sd79QyaRF1BMJBe3s1Wc0LYZsHGHiseKLFNrnNM=;
        b=kqOOQUNF+RV2GWbmiPaNJBn1NqDKkQmQBja6zIKlpbAUN1Hb3Mk8mW7wZ7D6OM2R3o
         /uth5rIN9mLITI7e2QCmeGsQJMhMjkP0iRZGHFm23KBzefvVCSVHrgH4KdEhh3ekr+NG
         J209OHGyJQLQMZ5uQ13sDhS9S9ke6bXGCRvkY0Q/PXNWOxdtsM1AJ5M/9RJ5e59EN8WJ
         pp4D3EMnPntE58eRUjUxt/o173kC5S0XGPmaP6QWI9nkB2MhEYx1wn/XdCLwmadUB4u0
         vqzostqDfEGLXZwNsjsIrns29xc8mL8C7OOQhrJRwPukchaHm1Ab7KmitvF/MuGrbjaM
         SlzA==
X-Forwarded-Encrypted: i=1; AJvYcCXqYtrXqZeYIyFjC7ln9uFoF3KPVAHVJKSSIAh8worpMzqHeda3K7fRj72WvaKW+qGvVzLlFZS6o4md2lEk4BwVYs61Uhy9N5iwU9LdNh/p
X-Gm-Message-State: AOJu0Yxa8bg0S5PUX4DC1c6hXT2viXw5OwX3Q+uxXGj8EKmgX0gKJIRT
	GMwbIT7A+O7CoxB/4EVUdIr8hINZ7cjpmf7RipJWH4ib3AJvsCzMBxZnW1nTys4=
X-Google-Smtp-Source: AGHT+IEeDpvGXBqH/je10IHPu14YT86VdOv9pM7mB36It6cqAwKg+lgXt6Z2O4u7jJXtXFs/Sn2j4g==
X-Received: by 2002:a05:6870:332b:b0:22a:7ce0:dd37 with SMTP id x43-20020a056870332b00b0022a7ce0dd37mr1322899oae.9.1712707894814;
        Tue, 09 Apr 2024 17:11:34 -0700 (PDT)
Received: from [10.0.16.226] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a056a001b4500b006e72c8ece23sm8926609pfv.191.2024.04.09.17.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 17:11:34 -0700 (PDT)
Message-ID: <388ef032-7030-47b5-bba5-852b00de7382@rivosinc.com>
Date: Tue, 9 Apr 2024 17:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] RISC-V: KVM: Add perf sampling support for
 guests
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-10-atishp@rivosinc.com>
 <20240302-f9732d962e5f7c7760059f2e@orel>
 <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
 <20240405-de92b25fdc1ecf53770c49d9@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240405-de92b25fdc1ecf53770c49d9@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_171140_984879_1CCE62C3 
X-CRM114-Status: GOOD (  28.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/5/24 05:05, Andrew Jones wrote:
> On Tue, Apr 02, 2024 at 01:33:10AM -0700, Atish Patra wrote:
> ...
>>> but it should be possible for the VMM to disable this extension in the
>>> guest. We just need to change all the checks in KVM of the host's ISA
>>> for RISCV_ISA_EXT_SSCOFPMF to checking the guest's ISA instead. Maybe
>>> it's not worth it, though, if the guest PMU isn't useful without overflow.
>>> But, sometimes it's nice to be able to disable stuff for debug and
>>> workarounds.
>>>
>>
>> As per my understanding, kvm_riscv_vcpu_isa_disable_allowed only returns
>> true for those extensions which can be disabled architecturally.
> 
> I think kvm_riscv_vcpu_isa_disable_allowed can return true for any
> extensions that KVM can guarantee won't be exposed in any way to the
> guest. Extensions that cannot be disabled architecturally must return
> false, since their instructions will still be present in the guest, even
> if KVM doesn't want to expose them, but extensions which KVM emulates
> can return true because KVM can choose not to emulate them. IIUC, sscofpmf
> falls in this latter category.
> 

hmm. The Sscofpmf is dependent on interrupt filtering via hvien and SBI 
PMU. So you are suggesting to toggle off the CSR_HVIEN bit for overflow 
interrupt or do more granular disabling for privilege mode filtering in 
SBI PMU as well.

Beyond that we can't disable SBI PMU. Is that okay ? A guest can still 
cause counter overflow and interrupt the host. However, the guest won't 
get any interrupt as hvien is not set.

It can also still filter the events as that is tied with SBI PMU.

We can put more granular checks in SBI pmu but I am just wondering if it 
provides anything additional beyond just disabling the sscofpmf in 
device tree.


>>
>> VMM can still disable any extension by not adding to the device tree.
>> In fact, that's how kvmtool can disable sstc or sscofpmf with
>> --disable-<isa-ext command>.
>>
>> The warning is bit confused though.
>>
>> For example: if you run kvmtool with --disable-sstc
>>
>> "Warning: Failed to disable sstc ISA exension"
> 
> I think Sstc should allow disabling since it has a corresponding henvcfg
> bit which KVM could not set in order to force accesses to the Sstc CSRs
> to raise ILL exceptions. So, let's put Sstc aside, since it's not a good

Agreed. I will send a separate patch for that.

> example. An extension like Zihintpause, OTOH, cannot be disabled since
> the 'pause' instruction will be present even if KVM does not put
> Zihintpause in the guest's ISA string. If a kvmtool user uses
> --disable-zihintpause, then I think this warning about failing to disable
> the extension is appropriate.
> 
>>
>> But sstc is disabled: Here is the cpuinfo output.
>> # cat /proc/cpuinfo
>> processor       : 0
>> hart            : 0
>> isa             : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf
>> mmu             : sv57
>> mvendorid       : 0x0
>> marchid         : 0x0
>> mimpid          : 0x0
>> hart isa        : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf
> 
> Removing from the ISA string is the best we can do in cases like
> Zihintpause, and is likely good enough for well-behaved guests, but the
> VMM's warning to the user is good for these cases too, since not all
> guests are well-behaved.
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
