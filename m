Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1A2C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 06:06:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE685610CE
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 06:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE685610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezV7JExGG5+hvEmD5kaJpTip2eRMx9MAlPOKEXRhDFo=; b=ffKQCVpJZjiVvPcVMU0XbXkZ6
	/2qYC1SR2LgISOU56eIwa2ac6FVnXw6lxBYwt/kPk6nkNQ1dQHo6qOcfsnv/5DZiypwQjOf7mYtfr
	+Q9KbRxW+f0UgPEm053M6e9YTzTDfMjKNGqR66H1hHe7gE6fJO+HhIbJnKL1624t7SH07DSurGp6D
	cLWuni0XL/KZT2iXSsjvs37AHzykvkEJSTvCO66k7z1PoQ8zwDocuaOXnUmH+UmxojgpvsbJ+Ig3N
	NxP2PkRkf3swC9C+0RV4/n1SiE+urIt8kDiQm812EC5LQhfdXk8EdbBVWa98pGnxcL5K6opwkTmf6
	RMKJqDymg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSCx2-00C2es-5S; Fri, 02 Apr 2021 06:06:36 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSCwx-00C2dt-CQ
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 06:06:33 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FBTy210HLzNs6x;
 Fri,  2 Apr 2021 14:03:38 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 14:06:13 +0800
Subject: Re: [PATCH] riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, <atish.patra@wdc.com>, <palmerdabbelt@google.com>
References: <20210329031307.153285-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <e9e582ad-90d7-a3fe-2b79-2c3cfd7330fa@huawei.com>
Date: Fri, 2 Apr 2021 14:06:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210329031307.153285-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_070631_826333_518D022F 
X-CRM114-Status: GOOD (  13.39  )
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

hi Palmer, maybe this one is missed ; )

On 2021/3/29 11:13, Kefeng Wang wrote:
> There is a spelling mistake when SPARSEMEM Kconfig copy.
>
> Fixes: a5406a7ff56e ("riscv: Correct SPARSEMEM configuration")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 87d7b52f278f..7541e44cbb22 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -153,7 +153,7 @@ config ARCH_FLATMEM_ENABLE
>   config ARCH_SPARSEMEM_ENABLE
>   	def_bool y
>   	depends on MMU
> -	select SPARSEMEM_STATIC if 32BIT && SPARSMEM
> +	select SPARSEMEM_STATIC if 32BIT && SPARSEMEM
>   	select SPARSEMEM_VMEMMAP_ENABLE if 64BIT
>   
>   config ARCH_SELECT_MEMORY_MODEL

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
