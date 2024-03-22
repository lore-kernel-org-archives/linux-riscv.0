Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0CC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMG4x8xqZa3QogWEBMAdJdKR1aa1Ox/E/lAy7jnBhq0=; b=C33HfJmq1HlWPR
	iXcCVBhcMlL1vLRNBJB8++yS/tTNMIzzFs6cCkuvoR0coi/Ll1seWq0VfdA4f23VOG38YCXTCupxI
	NaKymcxtKAfZbzyjRjIvzKWlFMb/EbUhpV05EFd+Vmd8l3vintE95XgOH5DGxTgoM3CLCKeqDeULM
	KG1pjAnjwkg871/H+hVbVi4MkpNwV52qKFZ/Nip1FO6zNDXtYmcm1XDUbg0cOpMsuYSJvQfRsoR4q
	P5giqHeWh1wvzSPEkPVPuliXAbC9Wxh3p8udPHoUNm2Cp7+t7AbZNxbuHvRCgI4nbgQhuyuo5Cc50
	MGh9siXYszmLH/X3+eQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniOB-000000086HL-2Its;
	Fri, 22 Mar 2024 17:09:07 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniO7-000000086Da-1el6
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 17:09:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7849F40007;
	Fri, 22 Mar 2024 17:08:55 +0000 (UTC)
Message-ID: <0a1e9afc-e999-451f-8d4f-670f7c15e609@ghiti.fr>
Date: Fri, 22 Mar 2024 18:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sifive-plic: Fix error handling of
 of_property_read_u32
Content-Language: en-US
To: Qingfang Deng <dqfext@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
 Qingfang Deng <qingfang.deng@siflower.com.cn>
References: <20240322090002.311645-1-dqfext@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240322090002.311645-1-dqfext@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_100903_607657_5F2B7789 
X-CRM114-Status: GOOD (  15.74  )
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

Hi Qingfang,

On 22/03/2024 10:00, Qingfang Deng wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>
> nr_irqs will not be initialized if of_property_read_u32 returns an
> error. Check the error first.
>
> Fixes: 8237f8bc4f6e ("irqchip: add a SiFive PLIC driver")
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> ---
>   drivers/irqchip/irq-sifive-plic.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 5b7bc4fd9517..f436b61d74b0 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -428,8 +428,11 @@ static int __init __plic_init(struct device_node *node,
>   		goto out_free_priv;
>   	}
>   
> +	error = of_property_read_u32(node, "riscv,ndev", &nr_irqs);
> +	if (error)
> +		goto out_iounmap;
> +
>   	error = -EINVAL;
> -	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
>   	if (WARN_ON(!nr_irqs))
>   		goto out_iounmap;
>   


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
