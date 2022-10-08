Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011D1C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjhAzc5LZzSA8gcGTaolpSijMTCpKFtIG7Rm/pX7maA=; b=shUvavDxEHfci4
	NDh9ecEHI11uNwK0BNGjUO7zBIn8ePaKroBMXdHjvttHU14Aias0zuSGThIotOC7L+4qzLRi8Ns3B
	B3XePEY0Cj42F3l27tGN6UO0ue0LlnxvGr1OVmFSovHTvYbNGx93en70kXSUmdupPU0+2QWrZCcE9
	po0yLzNDlZ4dIYJJq0aqRPQPPB8tNQ7Gt+EaQIHy42Mndiy/35y3afPj1NPi5XyKKaDwA763pZOAF
	ncOPLiE9jRBMN6utCRaE3K3qofQyBclOa4OfVN17PSm7eN4jZey8DMaJngdgbreWMPNSlQ+SgncGW
	W/bpI6ap9wv8ilglxh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogzQW-00BR9I-Ae; Sat, 08 Oct 2022 02:18:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogzQS-00BR7y-HY
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 02:18:54 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mkpdj3F77zlXYj;
	Sat,  8 Oct 2022 10:14:17 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 10:18:46 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 10:18:46 +0800
Message-ID: <775c7be8-e73a-af1b-0584-5f52e922098b@huawei.com>
Date: Sat, 8 Oct 2022 10:18:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT
Content-Language: en-US
To: Liu Shixin <liushixin2@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<conor@kernel.org>
References: <20220915065027.3501044-1-liushixin2@huawei.com>
 <20220915065027.3501044-3-liushixin2@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220915065027.3501044-3-liushixin2@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_191852_794536_99C85800 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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


On 2022/9/15 14:50, Liu Shixin wrote:
> After we support HAVE_ARCH_HUGE_VMAP, we can now enbale HAVE_ARCH_HUGE_VMALLOC
> too. This feature has been used in kvmalloc and alloc_large_system_hash
> for now. This feature can be disabled by kernel parameters "nohugevmalloc".
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 336b925570c0..d567dca3ae75 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>   	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>   	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HUGE_VMALLOC

should be "select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP"

this could also fix the lkp build issue.

>   	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
