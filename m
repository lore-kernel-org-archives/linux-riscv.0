Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424BC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbyj4kyQm1yr1ynO9oaqvBfROmAuEh9OyeS1FqzA3WA=; b=N6v0/NFBLEazs4igzq2fSGRZrO
	HsXS5mOugeUi2xlsP0/irSttzrOevNFXEym2G/M+9MpWpUy62oFrNjoEncT8nbBthKvAjUpKW+0Iq
	FiPN+/p/3yDaidehy3Kk9MFWZoiO8lwvMcH9YG0KpcA8xXotp9fKCZ62yRkH829uyooQssqu02hYg
	RM/wDyBt8CYBRcu7TFvxGtVLb9Iw4TTcd9khEJ3rTk6wmtAa4Ci9GA4bnv4oEGI8Au815haSooGO+
	4A2gFn/8nn5EuZ2/zia1wTnXavQAjsx3os6BIn9VNa9oiBDafJ/pT6hBe5OtaapjXKaQlHojvHZ0r
	EI4wk75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Aof-006IQH-Ib; Tue, 28 Jun 2022 12:59:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6AoL-006IDX-91
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 12:59:23 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LXPkK2Xv6zdZrk;
	Tue, 28 Jun 2022 20:56:57 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 28 Jun 2022 20:59:12 +0800
Received: from [10.67.111.195] (10.67.111.195) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 28 Jun 2022 20:59:12 +0800
Subject: Re: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<akira.tsukamoto@gmail.com>, <jszhang@kernel.org>,
	<wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alankao@andestech.com>
References: <20220615014714.1650349-1-chenlifu@huawei.com>
From: chenlifu <chenlifu@huawei.com>
Message-ID: <11a0698c-5726-15e8-2448-3529d2d0b098@huawei.com>
Date: Tue, 28 Jun 2022 20:58:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20220615014714.1650349-1-chenlifu@huawei.com>
X-Originating-IP: [10.67.111.195]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_055921_582594_B3B71C4C 
X-CRM114-Status: GOOD (  12.33  )
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

> Since commit 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> and commit ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code"),
> if __clear_user and __copy_user return from an fixup branch,
> CSR_STATUS SR_SUM bit will be set, it is a vulnerability, so that
> S-mode memory accesses to pages that are accessible by U-mode will success.
> Disable S-mode access to U-mode memory should clear SR_SUM bit.
> 
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")
> 
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>   arch/riscv/lib/uaccess.S | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 8c475f4da308..ec486e5369d9 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -173,11 +173,11 @@ ENTRY(__asm_copy_from_user)
>   	ret
>   
>   	/* Exception fixup code */
>   10:
>   	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>   	mv a0, t5
>   	ret
>   ENDPROC(__asm_copy_to_user)
>   ENDPROC(__asm_copy_from_user)
>   EXPORT_SYMBOL(__asm_copy_to_user)
> @@ -225,10 +225,10 @@ ENTRY(__clear_user)
>   	j 3b
>   
>   	/* Exception fixup code */
>   11:
>   	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>   	mv a0, a1
>   	ret
>   ENDPROC(__clear_user)
>   EXPORT_SYMBOL(__clear_user)
> 

friendly ping ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
