Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F3B606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ana8cer2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/zM27bh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TNU8YJHVqZbLtwTdfUhuupSLg45drQ+YC19qEaPGofo=; b=ana8cer2McLDxZYC3WSOMaZxVJ
	pyTf2DzBlbXVnL6YZjy2srahFraAPP6INLeTp80IYVNNtAtm+S80L+O8egaT5SFtwbmE2K7358hzC
	gRRzadTTxPbDh0VcdQU1gtveLB/HrfooeBMVQkB13T73QuU+uDkWpgg2E7NV7FXUqzji2bipM1e0l
	7g2OEoAUCoVLRSLF5M2DV4IENXM//BXmycaPiIcHaXADcwV2k8fgXAixDeIoPtAtP25XotXZRa5J2
	2RpIXD+O7WtdLzF8eSXtiC3dwrtniLGBhUlOvjovx1shxnaEUJas4Ueoh30/TYuwY+KNov0ha6ZJN
	DKDxt1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPvF-000000092va-0Xgo;
	Thu, 12 Nov 2026 08:12:41 +0000
Received: from mail-pi2-x09.google.com ([2607:f8b0:4864:3a::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPvA-000000092tD-2Dws
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:12:39 +0000
Received: by mail-pi2-x09.google.com with SMTP id 41be03b00d2f7-cdd769c49dbso2164188a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 00:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471155; x=1795075955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=l/zM27bh+pnLukA9MOxsSbqUwMRJ1GkfDt6uxw1f9X8+E0utEPG4HnsKydIe0RXSsL
         k7b07QY2fXebirI9Hq9p9qkc4NnmU6dmPJxEgMCDmexPPNyYFfJlpMkwcmLgP9qnxtXK
         8LRLQD2a5Z+RjdJVXDSgXl8ybe1vCY9Omgvd0KYGPEWmlEV80qlbLiS7MuMSdkdT0k1J
         Rqgg3Scdc38UnBoS8V3WzMbXS8ypjMWeumz7qJmrROClKgwVoeaxZBYDfVZiIr33jq1V
         ujhGYoYOSvkh0bXMWu5QTwL0iP7eB9ULEOFeiGlvtMO1NnBVcqi77FTW0qIKZF9Dl99W
         EsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471155; x=1795075955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=kJxPNc+R4osx2tiGgMp8XzCOFDoYQeQWpwYw8tOZuggMfy2xS1SKwHPAt1t5oBQPVe
         3tbJgHjzTWo/pZX7EeDUVBQ5IRBvXTz6292FNRWIcbhVYgzkOLSShfzJcORnSUifw9p1
         WdfBF8xXJvNJ2eRUWSdQJzD9N4ZQnEYrbfYlU0rKvECrJNIJSr17nObdZo2pzO2Sg0hV
         qH2SeNTGyqBdGhFOZSLAxUzPZAsBN4nga4q0q4quxIOHc8sW8SjN7jEg7UrCti0+ylhq
         A7dch4/B8WrcvPhh9D75fZrcLNRn/GdPBLTCUlQwAwN0MR/d77qz/NDIQae+f+KaWVAI
         mm6A==
X-Forwarded-Encrypted: i=1; AL+hErFrrZAHNmE58g751P9gV/DEluOEEbz7zBzOHnMlSomrilrSf16LfF2ApVEivegthVHf6FJa5mM9z4BCpQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8l/HXBd6c3xrQ8bPSbaLfZWjRnpxgdbf/3RhCu/XluuK9gmDUI
	qkmmsJtfLxxBeZRYM1RY4SjQUN6Ed4B/sVye9hGZ3M+6XBVnZoHCFdxd
X-Gm-Gg: AYBFou1BYWsn5a2Okthp7YAWkcByGbQjVL5zeKemuvawCx9us4m8di9OGWN7AtCZRO+
	LwLBWm0E3SR3+AI6/QHrHsqyO76keRBIfnUtELXZjm71nBlv2JroCCHvWddXn487eHYXe9rEKOW
	vmNBYj/xRCvWhUh1l55Cef4NIvKpGG+x4oPO1Wov5I/VaF3294yf4OQWOQVXp4BiVCK0RJJjHMR
	tkYnrJiC6Z9IKNn2nD5Qt9AdQPqAoi4zIoeU19VNgpHb/i+Isj3iDW6V5VKcNryEWwJtRP5C53i
	vxuoGESf2AmH+aWNU/+65GPuZoIcBr/NEgXp+nEvCtd+dwiQirWEofNWRTYtrYYBb1EuGpmAZaS
	RUUqSWNf7LI0i9s/mm9cwBzQX6cZNiG9ZemAPoWD2FCmmtbGSmd19JiNDE+WDBxIWkSnpqRZA2D
	wKHy9AO6Lc9Ta2u7byorsN4hTBGEAw5P+N/GgOxFFkpaiLoL6SD/xm0ibc/vWSjxZMi6QEZFyOo
	6XDg78JpLog+Z5xX3Biu7eQMUUTkPDeMMVrshIuTCR/Xz3RVGRUGu0yo2xyH6HtwD4ZNk0VJ8ss
	SjzW7PSx1r7DscRbY4Pk8Z5ohwFfnYtuRxetqw==
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1bc with SMTP id d2e1a72fcca58-8bc1cd62e03mr5111050b3a.28.1794471154695;
        Thu, 12 Nov 2026 00:12:34 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3eecsm3105447b3a.1.2026.11.12.00.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:12:33 -0800 (PST)
Message-ID: <210ff30c-17a1-4bd1-b943-34a1d0688e43@gmail.com>
Date: Thu, 12 Nov 2026 16:12:18 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Mike Rapoport <rppt@kernel.org>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: robh@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <7773d026-4aef-4169-866a-71ec9a91da21@gmail.com>
 <avLaJxIrrnMQngO9@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <avLaJxIrrnMQngO9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_001236_587821_0DA1CFC3 
X-CRM114-Status: GOOD (  33.16  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/26 16:47, Mike Rapoport wrote:
> Hi Wandun,
> 
> On Mon, Nov 09, 2026 at 08:23:16PM +0800, Wandun wrote:
>>
>> On 10/21/26 16:30, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>>> camera ISP, ...), kdump currently dumps those carveouts as part of
>>> system RAM even though their contents are firmware state that is not
>>> useful for kernel crash analysis.
>>>
>>> ACPI systems already filter reserved memory out of the vmcore through
>>> their existing path: firmware reports those carveouts as unusable in
>>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>>> always skipped nomap regions; only DT-based systems currently fail
>>> to filter these regions, which is what this series addresses.
>>>
>>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>>> memblock to filter reserved memory on DT-based architectures. A new
>>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>>> so kdump omits them; reusable CMA regions are different because their
>>> pages are handed back to the buddy allocator and may carry crash-relevant
>>> data.
>>>
>>> Since the reserved memory regions are filtered out, the vmcore is
>>> smaller in size and faster to produce.
>>>
>>> The series is based on linux-next and is organized as follows:
>>>
>>> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>>>              memblock, fold the duplicated per-arch memblock walks
>>>              into the weak defaults, and serialize crash header
>>>              preparation against memory hotplug.
>>> Patches 4-7: NODUMP infrastructure: switch crash_core to
>>>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>>>              flag, add a dumpable flag to struct reserved_mem, and
>>>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
>>> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>>>              ELF header.
>>
>> Hi all,
>>
>> A gentle ping on this series.
>>
>> I'd appreciate any further feedback, particularly on the
>> MEMBLOCK_NODUMP discussion and the issues raised in the Sashiko
>> review.
> 
> I'm fine with MEMBLOCK_NODUMP.
> The issue Sashiko raised about bound check against cmem->max_nr_ranges
> seems valid. 

Hi Mike,

Thanks a lot for the review.

Some analysis and plan about "bound check against cmem->max_nr_ranges":

After patch 3, the remaining race is x86-specific. The weak defaults are
safe: every runtime modification of memblock.memory, hot-add and hot-remove
alike, happens under device_hotplug_lock, so with the lock held the count
and populate passes walk a stable snapshot.

x86 instead walks iomem_resource, and Xen balloon inserts its new System RAM
resource before taking device_hotplug_lock() (reserve_additional_memory),
which is the one remaining hole.

The issue is also pre-existing: before patch 3 there was no locking at all,
every hotplug path could race the two passes.

The proper fix is to switch x86 over to the memblock-based weak defaults,
as patch 2 already did for arm64/loongarch/riscv. Would you prefer to have
it in this series, or as a separate follow-up? Both work fine for me.

> 
> I didn't check the reserved mem one.

The two Sashiko findings on the reserved-mem (patch 7) will also be addressed
in next version.

>  
>> Please let me know if there are any other concerns or suggestions
>> before I prepare the next revision.
> 
> I believe that should be rebased to account for reserved memory changes.

Sure, the next verison will be rebased on latest linux-next.

> The riscv change from resources to memblock needs an Ack from riscv
> maintainers.

Hi Paul, Palmer, Albert,

Patch 1 builds the crash_mem ranges for the vmcore ELF header from
memblock instead of the resource tree, so the later MEMBLOCK_NODUMP
patches can filter reserved memory from the vmcore on the memblock
side. With this, the vmcore size reduction the series brings also
applies to riscv.

Could you take a look when you have a chance?


Best regards,
Wandun

> 
> And with all that I can take the next version via kexec tree.
>  
>> Thanks,
>> Wandun
>>
>>>
>>> v8 --> v9:
>>> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>>>    memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
>>>    neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
>>>    both are disabled.
>>>
>>> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
>>> that approach is superseded here):
>>> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>>>    /memreserve/ regions with NODUMP. But a bootloader may specify
>>>    a /memreserve/ entry for memory that the kernel later frees
>>>    (e.g. the initrd), and those pages would then be wrongly
>>>    filtered out of the vmcore after being reused as normal memory.
>>>    The v7 fix (clearing the flag in free_reserved_area()) caused
>>>    a lockless runtime mutation of memblock.memory [2]. Better solutions
>>>    exist but need extra preparation, so temporarily dropped the patch
>>>    that introduced the problem to keep this series simple in v8.
>>> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>>>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>>>    .init.data, and the weak defaults referencing them create section
>>>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>>>    is also unset.
>>> 3. RISCV recently gained crash hotplug support, so adapt its handler
>>>    like x86 in patch 3: use __crash_prepare_headers() instead of
>>>    crash_prepare_headers() to avoid self-deadlock.
>>> 4. Update the cover letter per review feedback: describe how ACPI
>>>    systems filter reserved memory and why a new flag is needed
>>>    instead of reusing NOMAP.
>>>
>>> v6 --> v7:
>>> 1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
>>>    marked as NODUMP may later be freed (the initrd, for example),
>>>    so the NODUMP flag must be cleared accordingly. Since the fix is
>>>    part of the NODUMP infrastructure introduced by patch 5, it has
>>>    been folded into that patch.
>>> 2. Drop the "generic" related description in the cover letter.
>>> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>>>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>>>    only one without a tag, as its Reviewed-by was dropped when the
>>>    fix was folded in.
>>> 4. Drop patch 1 of v6, which has been merged separately.
>>>
>>>
>>> v5 --> v6:
>>> 1. Serialize crash header preparation against memory hotplug to avoid
>>>    out-of-bounds or use-after-free issues.
>>> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>>>    avoiding a panic from too few regions before resize is permitted.
>>> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
>>>
>>> [1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
>>> [2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
>>> [3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
>>>
>>> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
>>> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
>>>
>>> Wandun Chen (8):
>>>   riscv: build crash_mem ranges from memblock instead of resource tree
>>>   crash_core: fold duplicated memblock arch hooks into the weak default
>>>   crash_core: serialize crash header preparation against hotplug
>>>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>>>   memblock: introduce MEMBLOCK_NODUMP flag
>>>   of: reserved_mem: add dumpable flag to opt-in vmcore
>>>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>>>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>>>     header
>>>
>>>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>>>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>>>  arch/riscv/Kconfig                         |  2 +-
>>>  arch/riscv/kernel/crash.c                  |  2 +-
>>>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>>>  arch/x86/kernel/crash.c                    |  2 +-
>>>  drivers/of/fdt.c                           |  1 +
>>>  drivers/of/of_private.h                    |  1 +
>>>  drivers/of/of_reserved_mem.c               | 18 ++++++++
>>>  include/linux/crash_core.h                 |  2 +
>>>  include/linux/memblock.h                   |  9 ++++
>>>  include/linux/of_reserved_mem.h            |  1 +
>>>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>>>  kernel/dma/contiguous.c                    |  1 +
>>>  mm/memblock.c                              | 16 +++++++
>>>  15 files changed, 103 insertions(+), 94 deletions(-)
>>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
