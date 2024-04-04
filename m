Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96846CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZxsHcizuLG2SNyojLZaN3GH11SdG+bdJXchdZ1f/EA=; b=yEdr8ZwIqbUdMT
	PWi6ILcqmQ8dVO2xXEGt1ZyshyGk8N+/+luqF2DSs0pcsPCb/DT579nA7lSz+Bsj8x9WFdzhGUEdC
	UAiCbr5aH9X9R6fbpmJ0sl6jCPZPpg0oyBJOKIfj44n4hosMsq8Zrxw81JTCImil5B3N3np7jt949
	p1RFu9lzXtBVDz8lMKq5g8ykrZtDPNbykO2j7M24IeYSPc0acNyNfQV1ZdBB9Lt0KMVLVdxL4f7UV
	sTeHErOEuwVxNGuc/XkXOes7fQe9BEnH+c1gOi37tbFHmqBFmyyseSv6V+Hk1sPBKQAUdckadOzNe
	Z0Va+6PMC5ustf4GbbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsI51-00000001kuQ-0R2b;
	Thu, 04 Apr 2024 08:04:15 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsI4y-00000001ksX-34Vn
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 08:04:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54BBAE0011;
	Thu,  4 Apr 2024 08:04:06 +0000 (UTC)
Message-ID: <ee75e516-87fd-462f-ba6a-8c33506057e1@ghiti.fr>
Date: Thu, 4 Apr 2024 10:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] riscv: Only send remote fences when some other
 CPU is online
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
 <20240327045035.368512-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240327045035.368512-6-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_010412_949811_C915C1C8 
X-CRM114-Status: GOOD (  14.15  )
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


On 27/03/2024 05:49, Samuel Holland wrote:
> If no other CPU is online, a local cache or TLB flush is sufficient.
> These checks can be constant-folded when SMP is disabled.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v4)
>
> Changes in v4:
>   - New patch for v4
>
>   arch/riscv/mm/cacheflush.c | 4 +++-
>   arch/riscv/mm/tlbflush.c   | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index d76fc73e594b..f5be1fec8191 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -21,7 +21,9 @@ void flush_icache_all(void)
>   {
>   	local_flush_icache_all();
>   
> -	if (riscv_use_sbi_for_rfence())
> +	if (num_online_cpus() < 2)
> +		return;
> +	else if (riscv_use_sbi_for_rfence())
>   		sbi_remote_fence_i(NULL);
>   	else
>   		on_each_cpu(ipi_remote_fence_i, NULL, 1);
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index da821315d43e..0901aa47b58f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -79,7 +79,9 @@ static void __ipi_flush_tlb_all(void *info)
>   
>   void flush_tlb_all(void)
>   {
> -	if (riscv_use_sbi_for_rfence())
> +	if (num_online_cpus() < 2)
> +		local_flush_tlb_all();
> +	else if (riscv_use_sbi_for_rfence())
>   		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
>   	else
>   		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);


Could this be done directly in __sbi_rfence() instead?

Otherwise:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
