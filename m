Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B45CA6017
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG+XYo3kkCJEz6VuYg4gocXloMopNP+svcqGjQYSGZc=; b=nDFXIX2HW+XR2l
	Epyo1J7Er4XkmN2RWho6/G/GX3icNB7MnLId+M1jUmlvTcnx73W8xRI6I6AzViulruPqgaJ3Sb393
	j7R0/cq9W+QyaA/1AweWwEz65QDD0WILsdpe4qlWsU42c+JV8RoQcqy3G7jrMlQdPDBi7CgppJ5gl
	CTBrEMFf5UKG2zLZe+aFTnNaXSogHczUvSSDcmWwLVHqr4zPL5gr2bIRaA4HzXwAU3aCAB8ppxK6v
	j9Kp8asc+EBXPkyYHd5+5s+NpI+tB/TdBnR1L0ZdN0a9v2990kfTPBsN8IzeZz0r16V8hIjBjkgGK
	/cHkG+hff3boKevN4OxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0v5-00000005JCb-3gst;
	Fri, 09 Oct 2026 03:05:15 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0uz-00000005JAv-0tM9
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 03:05:12 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2e609985789so9595685ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791515108; x=1792119908; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQfYvkNkqoOJCA+/6hCONW4bFzc6fazsqzcsWi6a4VE=;
        b=h+gIK8FBivgfM0nES6dDttsmi+XguJz/uG6f1vIKZmJaSqxYUFUid4fg5Esdb1qg9O
         9Ea/nYnHazSzorsy77pk40GViISoKZA6Y6+WLC64czYfRvQL8ddcM0MZPNsnPmj1eFmO
         +5pJ8CMAM+PhJjNRxZ01HsI4AdFXYUEysgHmQPe+eu3EbzlCLG0eQOALq6WFeUUT7ryK
         4MgPu1JGchn+kxvsSv9J8/jvIYEd2fYku3H44a1uSVPr5P+1UzHDkI2akygR3Wd1Xoy6
         aDT0+C5/xk+SekEuH9DAN3cvS8sux6gUxPoATrWlYi5WGZtXCmT+XM7dBxKUVjy9cUQA
         4coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791515108; x=1792119908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQfYvkNkqoOJCA+/6hCONW4bFzc6fazsqzcsWi6a4VE=;
        b=a2N96RSshBs04oI9TTGFwm5hy33JFsycPkeumXF096v+QNlRw60IczinzEbQR0qtZy
         nEBr/roncpdl6Lh25SN3pUee4NlpEEiqO4R/4RfRbQIW0GLQQjKf2aGLymONYAQFzals
         5I4/x/EgbvlJtxMVKY/QvOH8l0gO6ekxuUm19GLFHUeHGnB81trLbBoUkNOwIh+nx0uP
         fFiwMFbzwHEr/2OOfnwv4nNIkFopCUoe9u9aGWlwHASA4Sk0X68CSLAXq10zTz4t1Q1q
         jX2mvhm4OXdc4dNpGXisx0gKStUOqYwZd7/teuVOnYSUvFVCtpTXW59Nr6Hxu0NHPUSC
         QI5g==
X-Forwarded-Encrypted: i=1; AKwUvByjBM9WfUdkumh31dOS+HYp5oc+JCnH0FhMGkILGdbwLTYaUfoVH18/InenZ7JKw68emSkmYlY29UPl4w==@lists.infradead.org
X-Gm-Message-State: AFuF++n/3UYLNoIFsBte0B0MbLaOqAkQ3krN5KY6uYd65X+I0wKej6io
	6j/mLPVAz6efti3HKph6rhNt2ss1iARaAvfzhPVj3GQsHrblHVOwqz7N
X-Gm-Gg: AYBFou3NfBYIkdW7jwfx4ctOh3whXhYv2ofsfFgjB7VFYBjRPXl4I5H+sEq5GuI1a7M
	WfZhCfQ0g58i/rwHjWkvCWIJ5oUza9DCv4r0ETL5nE2naeAX47zfF+WOCh4/6FHDJW1sSpMp93f
	EmPBuHaiCPAiUFX56A01uRu7gSFa6rVfgkiFdBbVHG/uwayvv/LkCm28jnidCKg7YuNu4V+GD35
	1ghmFvNjgSaPmo9J/L3DiDU9ob2UUhxQ0+Uu7tcHFd+LruiEVT2dL8o/qQuBmd3pjfjE5V0qpsf
	DjoOoifq4XlaxwTaIlKeNuI0F1DrRJOwTKK3b2Q4AmJS2Fkkg88EcTtVSby2/zmM3uY25OIPwsZ
	UkyWwBBO479q2j/TfAmb1NseiZ1YrqVdj1eJbCKQUCZ7uojY+qwmbY+AY4qH2XKklobCvREmQaK
	+8kLd6LZgQ+4tDH8yxqY9G2RsO9CElDjZUdQkXaCy+nQ8PP9KwQCrGPFwg6V4QlPRFy1BiSVSpT
	WKuIw==
X-Received: by 2002:a05:6a21:e08c:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e16bdae93emr416704637.18.1791515107689;
        Thu, 08 Oct 2026 20:05:07 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08c89sm296018a12.8.2026.10.08.20.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:05:07 -0700 (PDT)
Message-ID: <80af60db-8c39-461c-a488-3dfee990bce8@gmail.com>
Date: Fri, 9 Oct 2026 11:04:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] kdump: reduce vmcore size and capture time
To: Mike Rapoport <rppt@kernel.org>
Cc: robh@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <ar9ogXc12cLjziHS@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <ar9ogXc12cLjziHS@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_200509_257331_124C39F3 
X-CRM114-Status: GOOD (  27.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/2/26 16:17, Mike Rapoport wrote:
> Hi Wandun,
> 
> On Tue, Sep 22, 2026 at 04:42:47PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>> camera ISP, ...), kdump currently dumps those carveouts as part of
>> system RAM even though their contents are firmware state that is not
>> useful for kernel crash analysis.
>>
>> This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
>> reserved memory on DT-based architectures (arm64, riscv, loongarch).
>> Reserved regions are marked MEMBLOCK_NODUMP by default so kdump omits
>> them; reusable CMA regions are different because their pages are handed
>> back to the buddy allocator and may carry crash-relevant data.
>>
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path; only DT-based systems currently fail to filter these
>> regions, which is what this series addresses. The flag lives in memblock
>> itself rather than in a DT-only structure, so both ACPI and DT systems
>> can benefit from it (suggested by Rob, thanks).
> 
Hi Mike,

Thanks for the review.

> Can you elaborate how ACPI systems filter their reserved memory?

In the EFI memory map, firmware carveouts are reported with the type
EFI_RESERVED_TYPE. This type of memory gets the nomap flag set in
memblock.memory (is_usable_memory() returns false in reserve_regions()
and mark these regions with nomap flag), during prepare_elf_headers(),
for_each_mem_range() filters out these nomap regions. Therefore, the
memory reserved on ACPI based systems will not be dumped into the vmcore.

I will add these description in next version.

> With your patches, the memblock flag becomes a part of DT-only
> infrastructure, so that claim that both ACPI and DT benefit from it does
> not hold, doesn't it?

You are right, the wording was misleading. Let me clarify what I meant.

In this series only DT marks regions as MEMBLOCK_NODUMP:
/reserved-memory and /memreserve/ entries are tagged in the OF
paths (of_reserved_mem.c, fdt.c). ACPI does not set the flag and
keeps filtering its reserved memory through the existing path, as
described above.


What I intended to convey is that the flag itself lives in memblock
rather than on the DT-only struct reserved_mem, so it is available
for reuse. If an ACPI system ever needed to exclude a firmware-owned
region from the vmcore, it could mark that region with MEMBLOCK_NODUMP
the same way DT does, instead of having to invent a parallel mechanism.
That is a future option, not something this series enables for ACPI
today.

Also will update these description in next verison.

Best regards,
Wandun

>  
>> Since the reserved memory regions are filtered out, the vmcore is
>> smaller in size and faster to produce.
>>
>> The series is based on linux-next and is organized as follows:
>>
>> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to memblock,
>> 	     fold the duplicated per-arch memblock walks into the weak
>>              defaults, and serialize crash header preparation against
>>              memory hotplug.
>> Patches 4-8: NODUMP infrastructure: switch crash_core to
>>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP flag,
>> 	     add a dumpable flag to struct reserved_mem, and mark
>> 	     /reserved-memory and /memreserve/ entries with MEMBLOCK_NODUMP
>> 	     flag.
>> Patch 9:     Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
>>              header.
>>
>> v6 --> v7:
>> 1. Fix a stale MEMBLOCK_NODUMP flag issue [1]. Memory reserved and
>>    marked as NODUMP may later be freed (the initrd, for example),
>>    so the NODUMP flag must be cleared accordingly. Since the fix is
>>    part of the NODUMP infrastructure introduced by patch 5, it has
>>    been folded into that patch.
>>
>> 2. Drop the "generic" related description in the cover letter.
>>
>> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>>    only one without a tag, as its Reviewed-by was dropped when the
>>    fix was folded in.
>>
>> 4. Drop patch 1 of v6, which has been merged separately.
>>
>>
>> v5 --> v6:
>> 1. Serialize crash header preparation against memory hotplug to avoid
>>    out-of-bounds or use-after-free issues.
>> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>>    avoiding a panic from too few regions before resize is permitted.
>> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
>>
>>
>> v4 --> v5:
>> 1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
>>    (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
>>    DT-only struct reserved_mem [2].
>> 2. Switch the riscv vmcore elf header preparation to use memblock
>>    instead of the resource tree, aligning it with arm64 and loongarch,
>>    so riscv also can exclude reserved memory from vmcore.
>> 3. Deduplicate the vmcore elf header preparation: arm64, riscv and
>>    loongarch open-coded the same logic, so fold it into shared
>>     __weak defaults in crash_core.
>> 4.  Drop the v4 patch that saved /memreserve/ entries into the
>>     reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
>>     directly.
>>
>> v3 --> v4:
>> 1. Rebase this series on v7.2-rc1.
>> 2. Add two cleanup patches (patch 02/03).
>> 3. Simplify patch 03 to avoid checking whether initial_boot_params is
>>    NULL multiple times, suggested by Rob.
>>
>> v2 --> v3:
>> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
>> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
>> 3. Add some prepare patches.
>>
>> v1 --> v2:
>> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>>    feedback [3], v2 drop that property and exclude reserve memory
>>    by default.
>> 2. Split some prepared patches from the original patches.
>> 3. Address coding-style comments on patch 5 from Rob.
>>
>> [1] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
>> [2] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
>> [3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
>>
>>
>>
>> Wandun Chen (9):
>>   riscv: build crash_mem ranges from memblock instead of resource tree
>>   crash_core: fold duplicated memblock arch hooks into the weak default
>>   crash_core: serialize crash header preparation against hotplug
>>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>>   memblock: introduce MEMBLOCK_NODUMP flag
>>   of: reserved_mem: add dumpable flag to opt-in vmcore
>>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>>   of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
>>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>>     header
>>
>>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>>  arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
>>  arch/riscv/Kconfig                         |  2 +-
>>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>>  arch/x86/kernel/crash.c                    |  2 +-
>>  drivers/of/fdt.c                           |  2 +
>>  drivers/of/of_private.h                    |  2 +
>>  drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
>>  include/linux/crash_core.h                 |  2 +
>>  include/linux/memblock.h                   |  9 ++++
>>  include/linux/of_reserved_mem.h            |  1 +
>>  kernel/crash_core.c                        | 51 ++++++++++++++++++++--
>>  kernel/dma/contiguous.c                    |  1 +
>>  mm/memblock.c                              | 43 +++++++++++++++++-
>>  14 files changed, 155 insertions(+), 97 deletions(-)
>>
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
