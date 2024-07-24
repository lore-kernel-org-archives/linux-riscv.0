Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D3C3DA7E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2ggphrxmguWGpw3EYbbUU1oAAty/OX7jxVvI9VQohds=; b=fDzNf7aG9oUExH2QTyYFf67Iao
	Bh1gzWxhUcUyfE3bcbwGBFd6LYXRjJakI0OadX/Qtthnkq+4OlCjX73cAEJRwfmbemwP0Y4SLd5PA
	uqhSwreQXDKEUYCpBt8pBm0qm/a9EuelpYd2LCCVnS3OsjHW+tem6DjIfipqdPunQNZ79W3DEEvlE
	2TxBZ4xMZ2ftpyqRKJ0brngvX6Qibwta6ZBMVx01edrsf8/qXLAAvmNpPF34wUs2cLgEKClYlKtCA
	B8GALdFbXspJZ+PUgRvY1pkzr4EdM8v2+/C3Mmwz2v1ekdzTJmML0PUZ1KDlCe76nB93PhkuJwbFF
	7M6a52AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdKs-0000000Fg3p-2WQY;
	Wed, 24 Jul 2024 14:51:22 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWdKS-0000000Ffua-0sGx
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 14:50:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fd66cddd4dso19055075ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721832655; x=1722437455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ8EOFuu7vB+SiN9WcOSWsfMWAn/pybVkBUfGTLMLI0=;
        b=FkISZlDN63u5lhYgG1N9+SXYOt+S9HVV3HASi9Q840dC2/0Y9fgckBowwO2AwMbgPE
         5GwVfOjfV+il9XQRIypeahswm/5FDGs1k5gKPVni9sWf8o0ZDNkV+LM+2O0Io6U4FJvz
         wg92TA9wV6rsVLTj5poJxDk9zotPdDwTWjiokpb0SU83zcL0xKAmNnjWZ9khc5VF+0fQ
         IsI2BChP5uSIBmz0Aqti06fLU6kVZbbJiRq23k0cfIlmobxk50FcoOkq/Ntq0BNA1+J8
         bVeHjX04hrIEQcKkE0VwuDpVX4xpu1MBUSl0rzL0x2AoCGfx52Ed4Q3mTNiDSZbv9sDC
         0DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721832655; x=1722437455;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ8EOFuu7vB+SiN9WcOSWsfMWAn/pybVkBUfGTLMLI0=;
        b=py+0rc3uhqYYIHzNS0E9QqM8V9Fh679CD+ND2BDulCpmF0Qt0TNIVbWlncRSK0dAoE
         iY2jdlbIsvBQ3gUXy9EYjqPYFeBpyZ/m8B07DwH8QEOEazo3XdWoLQbNODvVGyQjrDlZ
         LEHbTuPffPWT9w8wmAqBk+CSLmP8Pjd17WZ01yBzCJG7Z0YWAjf2MzsKFjlnPSaIx9dF
         dO6ci4wpZhyxGg+R9wwY7TOuu+rGoDuMxeTVbol040Supzc0nePGx+PZs1M0euJad6Dc
         eQuZREOgr2j4KugxBZ1keMLGmAhiGV3BjfRVdg78b4IWPw4Vw0OQ4eHb3S7SRqNynF0K
         AP9w==
X-Gm-Message-State: AOJu0YxdAIjwkgfhMiKR5InAHpugnYIVxI6+NZyDUG3vCrx1Qt6Xh98m
	QNicObTeuWuHFAuVpvHpKDClu+QQYuzkpZaCJQlMEgpYu13YoEiNohGfA7EkKiAkwhZDQKVt9Ed
	d
X-Google-Smtp-Source: AGHT+IGPM0RZbkYZEg6h1kJV/6aaKS0BcId2ZV9yXzR111FIf7xwltEw9bDtF36tKb2aVWhOS43ROQ==
X-Received: by 2002:a17:902:d2ca:b0:1fa:a03e:349a with SMTP id d9443c01a7336-1fdd5577320mr23338705ad.52.1721832655015;
        Wed, 24 Jul 2024 07:50:55 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f436cc2sm94911955ad.202.2024.07.24.07.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:50:54 -0700 (PDT)
Date: Wed, 24 Jul 2024 07:50:54 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 07:50:51 PDT (-0700)
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
In-Reply-To: <20240702102637.9074-1-mchitale@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  mchitale@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_075056_272484_B049D33D 
X-CRM114-Status: GOOD (  28.49  )
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

On Tue, 02 Jul 2024 03:26:37 PDT (-0700), mchitale@ventanamicro.com wrote:
> The Svinval extension splits SFENCE.VMA instruction into finer-grained
> invalidation and ordering operations and is mandatory for RVA23S64 profile.
> When Svinval is enabled the local_flush_tlb_range_threshold_asid function
> should use the following sequence to optimize the tlb flushes instead of

Do you have any performance numbers for the optimization?  As per here 
<https://lore.kernel.org/all/mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508@palmer-ri-x1c9a/>.

> a simple sfence.vma:
>
> sfence.w.inval
> svinval.vma
>   .
>   .
> svinval.vma
> sfence.inval.ir
>
> The maximum number of consecutive svinval.vma instructions that
> can be executed in local_flush_tlb_range_threshold_asid function
> is limited to 64. This is required to avoid soft lockups and the
> approach is similar to that used in arm64.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> Changes in v8:
> - Fix line wrap
> - Add RB tag
>
> Changes in v7:
> - Use existing svinval macros in the insn-def.h
> - Rename local_sinval_vma_asid to local_sinval_vma
>
> Changes in v6:
> - Rebase on latest torvalds/master
>
> Changes in v5:
> - Reduce tlb flush threshold to 64
> - Improve implementation of local_flush_tlb* functions
>
> Changes in v4:
> - Rebase and refactor as per latest changes on torvalds/master
> - Drop patch 1 in the series
>
> Changes in v3:
> - Fix incorrect vma used for sinval instructions
> - Use unified static key mechanism for svinval
> - Rebased on torvalds/master
>
> Changes in v2:
> - Rebased on 5.18-rc3
> - update riscv_fill_hwcap to probe Svinval extension
>
>  arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9b6e86ce3867..782147a63f3b 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -6,6 +6,27 @@
>  #include <linux/hugetlb.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
> +#include <asm/cpufeature.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +static inline void local_sfence_inval_ir(void)
> +{
> +	asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +}
> +
> +static inline void local_sfence_w_inval(void)
> +{
> +	asm volatile(SFENCE_W_INVAL() ::: "memory");
> +}
> +
> +static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
> +{
> +	if (asid != FLUSH_TLB_NO_ASID)
> +		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
> +	else
> +		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
> +}
>
>  /*
>   * Flush entire TLB if number of entries to be flushed is greater
> @@ -26,6 +47,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>  		return;
>  	}
>
> +	if (has_svinval()) {
> +		local_sfence_w_inval();
> +		for (i = 0; i < nr_ptes_in_range; ++i) {
> +			local_sinval_vma(start, asid);
> +			start += stride;
> +		}
> +		local_sfence_inval_ir();
> +		return;
> +	}
> +
>  	for (i = 0; i < nr_ptes_in_range; ++i) {
>  		local_flush_tlb_page_asid(start, asid);
>  		start += stride;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
