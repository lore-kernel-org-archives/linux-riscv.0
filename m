Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D87C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkQSHmbYa1J6OFqtFo+qDPnHOhruGsoq8aa+dtSGZOQ=; b=mgLIL2+44/I9eH
	SuEj0FDknjCIXcFtdIhqUx2OPENdj8Zz3SToDTI0ZvVIycU4Svl6sbLfgO40lvi5Q5wHo5JDXbHAw
	SsuTJi/wN0XWhLnfryaOMiSr1AfizQg0a2gqtb6d5+3Iwb6BWpVTPXKRJ9Ag6t6lpLurR0/SmhLNi
	oV3h9A5rH9Yd8aZOVtNm0O8WVyjWzxs0h50a4wvxPl80XnzBCSAI89ySL6Exc9CyH3X/kwXHaSsE8
	Souits1KEumCN156I7LVo7l8fUu71Y+d0XVPD62zvp9S0TTzoS7OW+1kjHsjFXtS/4FHMQVhcIPv6
	sSdgZr6kQIn/8iKzTOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKdZ-00000004SmD-1zQR;
	Tue, 20 Aug 2024 08:54:45 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKdW-00000004Sls-1dp0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 08:54:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wp3725pvrz2Cn5v;
	Tue, 20 Aug 2024 16:49:34 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A69F1401F2;
	Tue, 20 Aug 2024 16:54:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 Aug 2024 16:54:33 +0800
Message-ID: <ae6a4702-3225-620c-e83b-b8736ac486a8@huawei.com>
Date: Tue, 20 Aug 2024 16:54:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in
 probe()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Anup Patel
	<apatel@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
References: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_015442_795373_0DE206B3 
X-CRM114-Status: GOOD (  12.88  )
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



On 2024/8/20 16:42, Dan Carpenter wrote:
> The devm_platform_ioremap_resource() function doesn't return NULL, it
> returns error pointers.  Fix the error handling to match.
> 
> Fixes: 2333df5ae51e ("irqchip: Add RISC-V advanced PLIC driver for direct-mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/irqchip/irq-riscv-aplic-main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> index 28dd175b5764..981fad6fb8f7 100644
> --- a/drivers/irqchip/irq-riscv-aplic-main.c
> +++ b/drivers/irqchip/irq-riscv-aplic-main.c
> @@ -175,9 +175,9 @@ static int aplic_probe(struct platform_device *pdev)
>  
>  	/* Map the MMIO registers */
>  	regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (!regs) {
> +	if (IS_ERR(regs)) {
>  		dev_err(dev, "failed map MMIO registers\n");
> -		return -ENOMEM;
> +		return PTR_ERR(regs);

LGTM
Reviewed-by:  Jinjie Ruan <ruanjinjie@huawei.com>

>  	}
>  
>  	/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
