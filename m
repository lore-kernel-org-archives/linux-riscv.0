Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34930C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsvM6g2mMxWffLT03pJDb3lME4IXuA2NJqrpAZKLibU=; b=NZb/dmISsmARRV
	I9UkMfOAZISUYokltqwyJ4o3YST9Q+oQOWrzeUmdfbygFnySitXKATcTRWnBo9Sq8ytSbiXETiZtc
	Rjx17vqy9+SlDpBgCGxv9u5ygqQKu38UZJx1hPrdh3TE29JBjfRBcypWWEV5/Z/ewYdvw7wpfnX+H
	T0797eLtBa3MXSdVrAbxcMxF7QHRtqlVPrkA0vqPfxBJCsvyqHm3kD7s7fRmR1GjGz/Zyoen3rrgo
	7yM80XdwVixbecY6PEoE1+jC9vsl5cPaxEDJSv7wbubl84kJW6GdBEhKtEtTY+TY6C3p+RZYv4bQG
	dzvlrdt+HoP46WLjNs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbp0-007al6-Ny; Fri, 10 Jun 2022 10:24:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzboo-007ahf-80; Fri, 10 Jun 2022 10:24:44 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LKH9j4GNGzjXTF;
	Fri, 10 Jun 2022 18:23:37 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 18:24:37 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 18:24:35 +0800
Message-ID: <174f988c-ea14-9f10-40e1-7bdddcef5d35@huawei.com>
Date: Fri, 10 Jun 2022 18:24:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/6] arm64/mirror: arm64 enabling - find mirrored
 memory ranges
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
CC: Wupeng Ma <mawupeng1@huawei.com>, Jonathan Corbet <corbet@lwn.net>, "Will
 Deacon" <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart
	<dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mike Rapoport
	<rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>, Kees Cook
	<keescook@chromium.org>, <songmuchun@bytedance.com>, Randy Dunlap
	<rdunlap@infradead.org>, <damien.lemoal@opensource.wdc.com>, Stephen Boyd
	<swboyd@chromium.org>, Wei Liu <wei.liu@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, David Hildenbrand <david@redhat.com>, "Anshuman
 Khandual" <anshuman.khandual@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>,
	<gpiccoli@igalia.com>, Huacai Chen <chenhuacai@kernel.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, <vijayb@linux.microsoft.com>, "Linux
 Doc Mailing List" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, linux-efi
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, "Linux
 Memory Management List" <linux-mm@kvack.org>, linux-riscv
	<linux-riscv@lists.infradead.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-3-mawupeng1@huawei.com>
 <bfa0b919-fbc1-056c-4ed9-e940edfb6125@huawei.com>
 <CAMj1kXGku3Y5d6Z+AAFkEauMWFY6LYpQAybqkXiQdRCMpS5tbw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAMj1kXGku3Y5d6Z+AAFkEauMWFY6LYpQAybqkXiQdRCMpS5tbw@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_032442_674508_9C91BD63 
X-CRM114-Status: GOOD (  19.70  )
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


On 2022/6/10 17:34, Ard Biesheuvel wrote:
> On Fri, 10 Jun 2022 at 11:27, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> On 2022/6/7 17:38, Wupeng Ma wrote:
>>> From: Ma Wupeng <mawupeng1@huawei.com>
>>>
>>> Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
>>> introduced mirrored memory support for x86 and this could be used on arm64.
>>>
>>> Since we only support this feature on arm64, efi_find_mirror() won't be placed
>>> into efi_init(), which is used by riscv/arm/arm64, it is added in setup_arch()
>>> to scan the memory map and mark mirrored memory in memblock.
>> Move into efi_init() looks better, it won't bring negative effects on
>> arm/riscv.
>>
>> but let's maintainer to make a decision.
>>
>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>
> I don't disagree with that in principle, but x86 calls the efi fake
> memmap stuff between efi_init() and efi_find_mirror(), and I already
> indicated that I don't want to enable fake memmap on !X86.

I mean move into efi_init() in drivers/firmware/efi/efi-init.c which 
only used

in arm32/arm64/riscv.

>
> But I do think there is some room for improvement here: we could move
> things like efi_mokvar_table_init() and efi_esrt_init() into
> efi_init() as well, and make efi_fake_memmap() do nothing on !X86 so
> we can move it into efi_init() too.

x86 has own efi_init() in arch/x86/platform/efi/efi.c, it seams that all 
the above

function could move into x86's own efi_init(), not sure, but we could do 
it later

if it possible.

>
>>> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
>>> ---
>>>    Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>>    arch/arm64/kernel/setup.c                       | 1 +
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 8090130b544b..e3537646b6f7 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2301,7 +2301,7 @@
>>>
>>>        keepinitrd      [HW,ARM]
>>>
>>> -     kernelcore=     [KNL,X86,IA-64,PPC]
>>> +     kernelcore=     [KNL,X86,IA-64,PPC,ARM64]
>>>                        Format: nn[KMGTPE] | nn% | "mirror"
>>>                        This parameter specifies the amount of memory usable by
>>>                        the kernel for non-movable allocations.  The requested
>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>> index cf3a759f10d4..6e9acd7ecf0f 100644
>>> --- a/arch/arm64/kernel/setup.c
>>> +++ b/arch/arm64/kernel/setup.c
>>> @@ -328,6 +328,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>>>
>>>        xen_early_init();
>>>        efi_init();
>>> +     efi_find_mirror();
>>>
>>>        if (!efi_enabled(EFI_BOOT) && ((u64)_text % MIN_KIMG_ALIGN) != 0)
>>>             pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");
> .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
