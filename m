Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF68C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuTIkBfcf0G0zx3psaKLU4QdvZu5u60EZyh9Br1qqFU=; b=KqnFzi3voqPK36
	D+NSylxW17vKd7AkXBDWEH9qO/rp9M+XpxsQHOXyaRcHvCvKTAPDhOAMGKsD6GIGWh5/cYwDbsXL2
	uJmZ1rN4rFVQhfgy/c+cybq6/R5p54VhKuhxVTfRA+fbspkfuYoRtbE+HDnn0D7C24dbqt5OajPln
	0xGtnjlML7Es5bIBIWU7hOK+fJD1QvqinWNaqAsPQUTG4mwKwS7WWhXtrvIVQzS4GBh5l3dRqu5w9
	AVoTojtqHxnifAoLQ9HAJYMmMj67zs+7i5KekH2DBUucT0SvjPwd/qOkqGEZiw9Jnx3HfOse7kpYD
	3w23asgPj8cl372esCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzawS-007A0S-RE; Fri, 10 Jun 2022 09:28:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzavY-0079ay-90; Fri, 10 Jun 2022 09:27:40 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LKFsH4cZSzRhQJ;
	Fri, 10 Jun 2022 17:24:19 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 17:27:33 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 17:27:32 +0800
Message-ID: <bfa0b919-fbc1-056c-4ed9-e940edfb6125@huawei.com>
Date: Fri, 10 Jun 2022 17:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/6] arm64/mirror: arm64 enabling - find mirrored
 memory ranges
Content-Language: en-US
To: Wupeng Ma <mawupeng1@huawei.com>, <corbet@lwn.net>, <will@kernel.org>,
	<ardb@kernel.org>, <catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<anshuman.khandual@arm.com>, <thunder.leizhen@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-3-mawupeng1@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220607093805.1354256-3-mawupeng1@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_022736_779913_644A09E4 
X-CRM114-Status: GOOD (  14.28  )
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


On 2022/6/7 17:38, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
>
> Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
> introduced mirrored memory support for x86 and this could be used on arm64.
>
> Since we only support this feature on arm64, efi_find_mirror() won't be placed
> into efi_init(), which is used by riscv/arm/arm64, it is added in setup_arch()
> to scan the memory map and mark mirrored memory in memblock.

Move into efi_init() looks better, it won't bring negative effects on 
arm/riscv.

but let's maintainer to make a decision.

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>   arch/arm64/kernel/setup.c                       | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8090130b544b..e3537646b6f7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2301,7 +2301,7 @@
>   
>   	keepinitrd	[HW,ARM]
>   
> -	kernelcore=	[KNL,X86,IA-64,PPC]
> +	kernelcore=	[KNL,X86,IA-64,PPC,ARM64]
>   			Format: nn[KMGTPE] | nn% | "mirror"
>   			This parameter specifies the amount of memory usable by
>   			the kernel for non-movable allocations.  The requested
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index cf3a759f10d4..6e9acd7ecf0f 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -328,6 +328,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>   
>   	xen_early_init();
>   	efi_init();
> +	efi_find_mirror();
>   
>   	if (!efi_enabled(EFI_BOOT) && ((u64)_text % MIN_KIMG_ALIGN) != 0)
>   	     pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
