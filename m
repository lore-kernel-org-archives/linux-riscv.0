Return-Path: <SRS0=kDER=NE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AF4C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 01:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C660610A4
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 01:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C660610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03EeJP4IklAF6stUu0WoIfysZRnk5mgv4ISFV5d6tqw=; b=xkYJL8J5xyI7IwWPgCMpVtzXhP
	m84lU/QZkYSL5IAMBx7jeqUS+eHzIWXEk41Fi7lU7BdqrvTS15Vul3R52yDGj98tgVrHtTJRw3Sun
	IKb3Mb0xwtxOOilmTUvCWBDI6ZwHJZgkx8dj39DTxUUeMjBHelwu5M/Ng7msHmNyLGJuAhX/Ae9dP
	2D/Yz4AMTmFqzbvwy+3pG0HgB9x5krrbKHqPtKyQhKM4ZDTfvWNG87rmDNHodd0LIUJRePTQoCUnA
	kbdl4WT8dNE663IMYIl6M5qtl5HQtZzVfWyavi9hvLkf1h+pwzgdWmF9p9yBmfoEHVLhIVhw3Km4k
	sa7ILdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEMHo-00BYkL-Oj; Fri, 13 Aug 2021 01:47:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEMHX-00BYk1-GP
 for linux-riscv@lists.infradead.org; Fri, 13 Aug 2021 01:46:49 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gm5xt0rJ5zYmt0;
 Fri, 13 Aug 2021 09:46:26 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 13 Aug 2021 09:46:43 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 13 Aug 2021 09:46:42 +0800
Subject: Re: [PATCH] riscv: Improve stack randomisation on RV64
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
References: <20210812114702.44936-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <cd7f3cf2-6e3e-f142-c606-001fc0bd26e9@huawei.com>
Date: Fri, 13 Aug 2021 09:46:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210812114702.44936-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_184647_770886_B4E5C5B4 
X-CRM114-Status: GOOD (  15.89  )
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

+cc Jonathan

On 2021/8/12 19:47, Kefeng Wang wrote:
> 54c95a11cc1b ("riscv: make mmap allocation top-down by default") support
> ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, which will select ARCH_HAS_ELF_RANDOMIZE
> from commit e7142bf5d231 ("arm64, mm: make randomization selected by generic
> topdown mmap layout"), so riscv has support ELF ASLR feature, update the
> documentation.
>
> And enlarge STACK_RND_MASK from 8M to 1G to increase stack randomisation
> on RV64 like x86/arm64 does.
>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
>   arch/riscv/include/asm/elf.h                        | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> index 99cb6d7f5005..2949c99fbb2f 100644
> --- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
> +++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
> @@ -22,7 +22,7 @@
>       |    openrisc: | TODO |
>       |      parisc: |  ok  |
>       |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>       |        s390: |  ok  |
>       |          sh: | TODO |
>       |       sparc: | TODO |
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index f4b490cd0e5d..f53c40026c7a 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -42,6 +42,9 @@
>    */
>   #define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
>   
> +#ifdef CONFIG_64BIT
> +#define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
> +#endif
>   /*
>    * This yields a mask that user programs can use to figure out what
>    * instruction set this CPU supports.  This could be done in user space,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
