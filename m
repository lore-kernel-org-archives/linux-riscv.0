Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E9C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QxhqEJwyzo+msrOb28b/FdeRWfpy4ww8yKLX3oGIxM=; b=NM4xBJrAMMcXeh2buTM/WCqEPp
	H43b9huSTBCbszUAE3GHAXM2JwHJeIsU0orU06swd9X7A26NgubotrO5oDErGD5QG5T6gye9AOYll
	ki4foPF2idmN6pxq2Dw3EO05PsWY1H2CA56tHi8OPOitDqwrfwdTld9YhpsYBeDLh2y+6DXsKdaGS
	I57AJccmVxSWo5FzEbERtrhc6F0tolzOWbbRszTH9Dyk+qv7cGnCiMlN/wDTMzQFW+ePWfDTE6uuh
	W5jAfvgg8cKQLx7BfyN/8uD/HwlidzyRXv1Lln/nRlZQjhkV7qIOYFD+SbwJidME6YUwHlgC2nWre
	HG3GjYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4m0O-0000000GWsQ-2sAg;
	Wed, 08 May 2024 18:27:05 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lwI-0000000GWDR-3oQo
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 18:22:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5E4040005;
	Wed,  8 May 2024 18:22:43 +0000 (UTC)
Message-ID: <43829e94-98ae-46a4-a3e6-dbabbe94d7c1@ghiti.fr>
Date: Wed, 8 May 2024 20:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Don't use hugepage mappings for vmemmap if it's
 not supported
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240508173116.2866192-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240508173116.2866192-1-namcao@linutronix.de>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_112251_175576_5F24F661 
X-CRM114-Status: GOOD (  13.08  )
X-Mailman-Approved-At: Wed, 08 May 2024 11:27:03 -0700
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

Hi Nam,

On 08/05/2024 19:31, Nam Cao wrote:
> Commit ff172d4818ad ("riscv: Use hugepage mappings for vmemmap") broke XIP
> kernel, because huge pages are not supported on XIP kernel.


I don't understand why XIP kernels can't support huge vmalloc mappings, 
so I think the right fix would be to enable such mappings on XIP. WDYT?

Thanks,

Alex


>
> Only use hugepage mapping if it is supported.
>
> Fixes: ff172d4818ad ("riscv: Use hugepage mappings for vmemmap")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: <stable@vger.kernel.org>
> ---
>   arch/riscv/mm/init.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 968761843203..c081e7d349b1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1414,6 +1414,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>   			       struct vmem_altmap *altmap)
>   {
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return vmemmap_populate_basepages(start, end, node, NULL);
>   	/*
>   	 * Note that SPARSEMEM_VMEMMAP is only selected for rv64 and that we
>   	 * can't use hugepage mappings for 2-level page table because in case of

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
