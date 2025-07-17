Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5FEC83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 02:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9B/7tBJt4IfuAHocNRo3pE0k7p87u+mEP2E7FUio5M=; b=HS6ePMOOR0Gve5
	4RpBJSHVwlzayuojWu9DrPxNBzA9kFGVo46tKhU2K0JHEwJL6+srRgbpkYQem1rK8ZdQUJRHZyDjV
	uezdxz5kCjNcDyFXduQDDezKJ75zY686fHpH0o5YImR6cEqyHVLQOSFHXpghibdzhB/IyaqOfTTlh
	fGuwls7WWtBQSglVXYlBSyJFSykQ1yOnF+QgYAbGjFf8uofaaKQ/QwOcyhQA58pZUT/d/o7jPfFdn
	POC4q01WuHNCjy3vPesq9mpC+vggu5kt0g7o6mfJ1R7mBlfQnXSvh7oZQWE7vQ5GjHx6G1xOmj/Vt
	HSeKGBsdw1U7UJJszzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucDvt-000000091to-2Z2I;
	Thu, 17 Jul 2025 02:01:14 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucDvl-000000091qr-3hzG
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 02:01:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bjGHw4xl0zdbwV;
	Thu, 17 Jul 2025 09:56:44 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A02C18007F;
	Thu, 17 Jul 2025 10:00:52 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 17 Jul 2025 10:00:51 +0800
Message-ID: <fa509f25-cbd6-41d5-8f34-bbd45062a8b7@huawei.com>
Date: Thu, 17 Jul 2025 10:00:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Pu Lehui <pulehui@huaweicloud.com>
References: <20250711090443.1688404-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20250711090443.1688404-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_190107_402436_16834592 
X-CRM114-Status: GOOD (  11.38  )
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



On 2025/7/11 17:04, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> The implement of cmpxchg() in riscv is based on atomic primitives and
> has NMI-safe features, so it can be used safely in the in_nmi context.
> ftrace's ringbuffer relies on NMI-safe cmpxchg() in the NMI context.
> Currently, in_nmi() is true when riscv kprobe is in trap-based mode, so
> this config needs to be selected, otherwise kprobetrace will not be

Gentle ping~

The issue can be reproduced by the following steps:

cd /sys/kernel/debug/tracing/
echo 'p do_nanosleep' > kprobe_events
echo 1 > events/kprobes/enable
sleep 1
cat trace # trace log will not show without this patch

> available.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36061f4732b7..0e2dfa98338a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>   	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>   	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>   	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> +	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
>   	select ARCH_HAS_CRC64 if 64BIT && RISCV_ISA_ZBC

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
