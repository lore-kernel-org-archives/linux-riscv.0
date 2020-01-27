Return-Path: <SRS0=yeT2=3Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B6BC2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2020 15:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F33C2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2020 15:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2T3LNp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F33C2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H6geSFx+S+IgHqUf4VcaZNtH+08l5FRugbxfs8MuzRM=; b=C2T3LNp13eFYBaSGCveZNTBJN
	wfRIALkBOo5288K+tCigYyrL5NyvURQ6dmgi0SN+TtCfEWfOhgB5FU56q85CVwdUkl29FxI19pIPm
	wD3QC4K0lovU/RfE0N/e67q4i8BuDS0qXX+YcNZwa1eo05ng3lxXZA2E2uNkqRSOwUdYlc1eUCAJ0
	z+SQrnQxWyYDlm6DsNwmsPG51qDQk6p5DyYIc/lBYZhQ2y29m8joG7tlMu7PSRAsy2WhvngmX+2TD
	a+Tp0BDP3WvLTJDDnJs7/NOn9/dS0efn89c1BAygPVWAGXtR0/y+jf12ANTJmrF/u1BlPi2QZkmN9
	L1jzVyK1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw6H6-0008P5-CZ; Mon, 27 Jan 2020 15:26:04 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw6H3-0008OU-Ny
 for linux-riscv@lists.infradead.org; Mon, 27 Jan 2020 15:26:03 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488; MF=guoren@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0TociXAZ_1580138757; 
Received: from localhost(mailfrom:guoren@linux.alibaba.com
 fp:SMTPD_---0TociXAZ_1580138757) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Jan 2020 23:25:57 +0800
Date: Mon, 27 Jan 2020 23:25:57 +0800
From: Guo Ren <guoren@linux.alibaba.com>
To: paul.walmsley@sifive.com, andrew@sifive.com, palmer@dabbelt.com
Subject: Re: [PATCH V2] riscv: Use flush_icache_mm for flush_icache_user_range
Message-ID: <20200127152557.GA8980@parallels-Parallels-Virtual-Platform>
References: <20200127145008.2850-1-guoren@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127145008.2850-1-guoren@linux.alibaba.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_072601_959692_3CD09404 
X-CRM114-Status: GOOD (  15.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

No ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1 in this patch, I'll remove it
in V3.

The update_mmu_cache() is wrong with sfence.vma and I'll give another
patch to fixup it with ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1.

Best Regards
 Guo Ren

On Mon, Jan 27, 2020 at 10:50:08PM +0800, Guo Ren wrote:
> The patch is the fixup for the commit 08f051eda33b by Andrew.
> 
> For copy_to_user_page, the only call path is:
> __access_remote_vm -> copy_to_user_page -> flush_icache_user_range
> 
> Seems it's ok to use flush_icache_mm instead of flush_icache_all and
> it could reduce flush_icache_all called on other harts.
> 
> Add (vma->vm_flags & VM_EXEC) condition to flush icache only for
> executable vma area.
> 
> ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE is used in a lot of fs/block codes.
> We need it to make their pages dirty and defer sync i/dcache in
> update_mmu_cache().
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Andrew Waterman <andrew@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> 
> ---
> Changelog V2:
>  - Add VM_EXEC condition.
>  - Remove flush_icache_user_range definition.
>  - define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
> ---
>  arch/riscv/include/asm/cacheflush.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index b69aecbb36d3..ae57d6ce63a9 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,7 +8,7 @@
>  
>  #include <linux/mm.h>
>  
> -#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
> +#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>  
>  /*
>   * The cache doesn't need to be flushed when TLB entries change when
> @@ -62,7 +62,8 @@ static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
>  #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
>  	do { \
>  		memcpy(dst, src, len); \
> -		flush_icache_user_range(vma, page, vaddr, len); \
> +		if (vma->vm_flags & VM_EXEC) \
> +			flush_icache_mm(vma->vm_mm, 0); \
>  	} while (0)
>  #define copy_from_user_page(vma, page, vaddr, dst, src, len) \
>  	memcpy(dst, src, len)
> @@ -85,7 +86,6 @@ static inline void flush_dcache_page(struct page *page)
>   * so instead we just flush the whole thing.
>   */
>  #define flush_icache_range(start, end) flush_icache_all()
> -#define flush_icache_user_range(vma, pg, addr, len) flush_icache_all()
>  
>  void dma_wbinv_range(unsigned long start, unsigned long end);
>  void dma_wb_range(unsigned long start, unsigned long end);
> -- 
> 2.17.0

