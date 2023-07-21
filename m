Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1ABEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTmcM1R/wkQiyuYByycLrOn6jKX+nVhdKvrbqSE2mtQ=; b=gvyU7+LxzGz0uB
	qgupV+qDfKdrum7e1bK5bmP1vCFuFd41j62VWyQqGPzPINf/lxILd0Aie/UzMX71gu6UdaBHoCR5E
	hCSmmkNVCooC/QiAJ6bj6CXPLLO5ypNDP/sqR+V0ww8qjn+tDPIGQw2m8tlvcb5Q4+3quBUAyxNuF
	TS+IpJOUGNkxpLSxxDuiBHa92tzO5cDhL5WCwe9xBzUTQFRRFkiR06JkhvfMUuy41lT+M9qOo7aNV
	7f1Vt0pgDeSdnmwPq2uQM3wEYwdANwAPDDW5kFuH2w4HJiii1CuM1n+jPmDVr69v1W4UJQZni6los
	9gYYAySsHPPmmfWrvmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMruR-00EPp7-1R;
	Fri, 21 Jul 2023 15:19:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMruP-00EPob-07
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 15:19:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8058E60004;
	Fri, 21 Jul 2023 15:18:58 +0000 (UTC)
Message-ID: <5e5be2d4-c563-6beb-b5f5-df47edeebc83@ghiti.fr>
Date: Fri, 21 Jul 2023 17:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: mm: Fixup spurious fault of kernel vaddr
Content-Language: en-US
To: guoren@kernel.org, palmer@rivosinc.com, paul.walmsley@sifive.com,
 falcon@tinylab.org, bjorn@kernel.org, conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230721145121.1854104-1-guoren@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230721145121.1854104-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_081909_235214_E419D39D 
X-CRM114-Status: GOOD (  16.21  )
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


On 21/07/2023 16:51, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> RISC-V specification permits the caching of PTEs whose V (Valid)
> bit is clear. Operating systems must be written to cope with this
> possibility, but implementers are reminded that eagerly caching
> invalid PTEs will reduce performance by causing additional page
> faults.
>
> So we must keep vmalloc_fault for the spurious page faults of kernel
> virtual address from an OoO machine.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   arch/riscv/mm/fault.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 85165fe438d8..f662c9eae7d4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -258,8 +258,7 @@ void handle_page_fault(struct pt_regs *regs)
>   	 * only copy the information from the master page table,
>   	 * nothing more.
>   	 */
> -	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
> -	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
> +	if (unlikely(addr >= TASK_SIZE)) {
>   		vmalloc_fault(regs, code, addr);
>   		return;
>   	}


Can you share what you are trying to fix here?

I have a fix (that's currently running our CI) for commit 7d3332be011e 
("riscv: mm: Pre-allocate PGD entries for vmalloc/modules area") that 
implements flush_cache_vmap() since we lost the vmalloc_fault.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
