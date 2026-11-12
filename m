Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81B606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VqtuOQHs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=ubtI/Adm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:Mime-Version:Message-Id:
	Date:To:References:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RHzpqlM539cFzbIwsRixfJvi3mabliuHgKs8mVzzYz8=; b=VqtuOQHsGdtBRlEKwb5F90W/Qd
	897KpbydmtVd0eUK8aMkfWBOeFBXDPxa5J+lGKO+/E5lt3rFqCeR7WR9d+HX+KliBnkDIJVRL11fo
	Ecixl4pH/rEGke5/4etHMUQWfxYADLLhOnEzGYwaEpOh9EOaRSdIXiJn2ch6GaQi8shq4bnphI/ZN
	tB1AW8hyaHM/idldXV0OkUnNtoMnE8svMVV1uOk9uAq1WwsOYEI7KjedexAv54hVCYlrltN3wi9d7
	XDpggxxr5mcwWGWK0Jzn6KF5OBpr19gQWsHTKCNAdso0Zig1qMko7fb0tGRGyQFCVcv7P/5TArZjH
	ih2LTiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ4H-000000094rX-1GLe;
	Thu, 12 Nov 2026 08:22:02 +0000
Received: from va-2-40.ptr.blmpb.com ([209.127.231.40])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ3n-000000094e7-08Yc
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794471685; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mBIfK3o4iKarK872/zHsbPwNjbdGsJJ2EGo7hkRryuo=;
 b=ubtI/AdmuWch873AWa+G6EF2nNJhGeIaaVqOj9IGrCaMnm73By8PtP7pXJBLljxlWdvot9
 XfyTaZU1eGFkxOd+anZJfbyADN+VaX9WqaVyY/Nxr/0mlJf/f1hs8pltbxPqSmgX3D1pcu
 2fCa1cW3P/HsnWTbQaLcFh0f+iRwf2UwzmY/aNFr9KxvvaJNwIk+izEcMqE9TmNU85169F
 259Ld23Nl+Rm+svYwNDfddYCqeq/HBKPuX3o9/Hn3qGWHVP+7lTBsCoQsR3EFg1U3Vc8yJ
 ahzBhMzk/os3ONtV5WUHrVc2bQx5VKxhm/V0e8Q2keuuEhkamszHQLqDj+IacQ==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH] riscv: mm: Limit per-page TLB flushes for large PTE batches
References: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
To: <hu.shengming@zte.com.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>
Date: Thu, 12 Nov 2026 16:21:19 +0800
Message-Id: <c125c25d-c7be-4116-9837-09dd7fa91a91@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26af57703+7f9998+lists.infradead.org+yang.yicong@picoheart.com>
Received: from [100.86.214.79] ([58.250.106.102]) by smtp.feishu.cn with ESMTPS; Thu, 12 Nov 2026 16:21:22 +0800
Cc: <yang.yicong@picoheart.com>, <alex@ghiti.fr>, 
	<akpm@linux-foundation.org>, <baolin.wang@linux.alibaba.com>, 
	<wangruikang@iscas.ac.cn>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <zhang.run@zte.com.cn>, 
	<luo.haiyang@zte.com.cn>
Content-Language: en-US
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_002132_148715_C051AD98 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 11:05 AM, hu.shengming@zte.com.cn wrote:
> From: Shengming Hu <hu.shengming@zte.com.cn>
> 
> On systems without Svvptc, update_mmu_cache_range() performs one local
> TLB invalidation per PTE. With 4 KiB pages, installing a PTE-mapped
> 1 MiB anonymous folio requires 256 SFENCE.VMA instructions, or 256
> SINVAL.VMA instructions bracketed by SFENCE.W.INVAL and
> SFENCE.INVAL.IR.
> 
> Apply the existing local TLB range-flush policy to PTE batch updates.
> When nr exceeds tlb_flush_all_threshold, use local_flush_tlb_all_asid()
> to replace per-page invalidations with a single ASID-wide SFENCE.VMA.
> This orders the PTE writes before subsequent implicit page-table
> accesses and invalidates translations for the entire batch. As with
> range flushes, this may also evict unrelated translations for the same
> ASID.
> 
> Benchmark results from will-it-scale's page_fault1_processes under
> QEMU 9.1.93 (qemu-9.2.0-0.3.rc3.fc40), with svvptc=false and
> CONFIG_TRANSPARENT_HUGEPAGE=y (higher is better):
> 
> Folio size      Before       After     Change
> =============================================
> 4 KiB           116537      113503      -2.6%
> 512 KiB        1431962     1977519     +38.1%
> 1 MiB          1528457     2208209     +44.5%
> 
> Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
> ---
>  arch/riscv/include/asm/pgtable.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2ebd5fa5adc5..ebe42fcf35ae 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -571,6 +571,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
>  		return;
> 
> +	if (nr > tlb_flush_all_threshold) {
> +		local_flush_tlb_all_asid(asid);
> +		return;
> +	}
> +

could we reuse local_flush_tlb_range_threshold_asid() or
local_flush_tlb_range_asid()? now the logic is exactly
the same.

thanks.

>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
>  		local_sfence_w_inval();
>  		while (nr--)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
