Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D41BC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3Pb7oLefcM5znrtd2FavIKagZWA1qOJs+sNRRkIpGQ=; b=jjP6iKQgvSzBc0ue58wvXzLYAK
	IdiRIFv/+gM4bZRnazn94JaOzjFF5ZDm7Cqp3BYUS0l2HnexW0aMCppaTMC7kriDHSJPt7X+nWfVs
	cLOCJO8s8W46/PtdYfIdEij8Sa8YPnOZe3thktAcD6nrVVVZhMr47Dr5BWMWjcWgJuaEW67tDcKns
	2Li3LSLhRK0OYkDIHKY+aWL8EAG/W+csFXz5clLIJen7zz/xkdhLkkpNSIdW1J/YfclIcu6NLGcWi
	HhnxYkIl0MWz7aYxW8RYGoY262xbzmp8bCbQRQmmsjA0fqONugx5a4Q3PUZqA8XJGqkDoMi7fOaNa
	gqRH1lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seYEm-00000009jdZ-0bfY;
	Thu, 15 Aug 2024 11:01:48 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seYEj-00000009jcb-3lMa
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 11:01:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 986191C0002;
	Thu, 15 Aug 2024 11:01:38 +0000 (UTC)
Message-ID: <afaa4192-da08-4180-a09b-2b953293ba76@ghiti.fr>
Date: Thu, 15 Aug 2024 13:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: add a warning when physical memory address
 overflows
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, punit.agrawal@bytedance.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, chenjiahao16@huawei.com, guoren@kernel.org,
 vishal.moola@gmail.com, stuart.menefy@codasip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240814062625.19794-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240814062625.19794-1-cuiyunhui@bytedance.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_040146_117735_E3AF7ECC 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Yunhui,

On 14/08/2024 08:26, Yunhui Cui wrote:
> The part of physical memory that exceeds the size of the linear mapping
> will be discarded. When the system starts up normally, a warning message
> will be printed to prevent confusion caused by the mismatch between the
> system memory and the actual physical memory.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/mm/init.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 52290c9bd04bd..c93164dc51658 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -236,8 +236,12 @@ static void __init setup_bootmem(void)
>   	 */
>   	if (IS_ENABLED(CONFIG_64BIT)) {
>   		max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
> -		memblock_cap_memory_range(phys_ram_base,
> -					  max_mapped_addr - phys_ram_base);
> +		if (memblock_end_of_DRAM() > max_mapped_addr) {
> +			memblock_cap_memory_range(phys_ram_base,
> +						  max_mapped_addr - phys_ram_base);
> +			pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
> +				max_mapped_addr);
> +		}
>   	}
>   
>   


A bit weird to review and test my own patch, but here it is anyway :)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
