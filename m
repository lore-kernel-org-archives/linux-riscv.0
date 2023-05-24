Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6EBC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3wC+aCXnTFHtrq1lHa/p+5Ihitm66zLFbg8U4bcdu4=; b=3W0aotJ7NgII8J
	uKhjz3L3E4NoAPGNzy2IhYmCPjzgI8WxBpetH/nz42uUDx6U3+ZOVmia6C10DInfk7vKDPU2PYoLQ
	Q4KhahV4mzd9UMAKzabjq84uGvCd2ot86tqFQaa/ls4c5E/PCnMiblmvFHm0pzVDUj9D0fq7bIdbC
	l1tJ65yLDMnFJLJZ7Nz27l3zbKyQ34XvODir2i9wLjJTg+YAcLgcqniIM+5w2JeMOKVTHP4aEjWCC
	GOo0nSSUD9Ek9MzAl4Pok3/ipGMRUT9NOGNpjNYq8aE3jYVtLdePTpL8bJpaLDn7/kEvdRZeCC1sn
	LzTwJlIC+lrZQXvKvt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mGv-00DGYd-1P;
	Wed, 24 May 2023 11:03:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mGr-00DGXL-3C
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 11:03:11 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QR7Sl6jPdzTktn;
	Wed, 24 May 2023 18:57:59 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 19:02:58 +0800
Message-ID: <2d609a02-1877-bb4d-a0ef-6ba7c838b7e4@huawei.com>
Date: Wed, 24 May 2023 19:02:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/4] vmlinux.lds.h: use correct .init.data.* section
 name
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
References: <20230523165502.2592-1-jszhang@kernel.org>
 <20230523165502.2592-4-jszhang@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230523165502.2592-4-jszhang@kernel.org>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_040310_203560_3DF249F0 
X-CRM114-Status: GOOD (  10.72  )
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



On 2023/5/24 0:55, Jisheng Zhang wrote:
> If building with -fdata-sections on riscv, LD_ORPHAN_WARN will warn
> similar as below:
> 
> riscv64-linux-gnu-ld: warning: orphan section `.init.data.efi_loglevel'
> from `./drivers/firmware/efi/libstub/printk.stub.o' being placed in
> section `.init.data.efi_loglevel'
> 
> I believe this is caused by a a typo:
> init.data.* should be .init.data.*

Fixes tag?

266ff2a8f51f kbuild: Fix asm-generic/vmlinux.lds.h for 
LD_DEAD_CODE_DATA_ELIMINATION

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>


> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   include/asm-generic/vmlinux.lds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index d1f57e4868ed..371026ca7221 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -688,7 +688,7 @@
>   /* init and exit section handling */
>   #define INIT_DATA							\
>   	KEEP(*(SORT(___kentry+*)))					\
> -	*(.init.data init.data.*)					\
> +	*(.init.data .init.data.*)					\
>   	MEM_DISCARD(init.data*)						\
>   	KERNEL_CTORS()							\
>   	MCOUNT_REC()							\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
