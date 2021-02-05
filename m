Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455CFC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:06:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA37E64FB8
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA37E64FB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uuRtdblI8RmtZ6QfyhN05YWnMA8m+AMaaR5azR3Ee78=; b=sCSRr18s6S4Z8Ct94HHRfMDoE
	L7EN/TmOHe9sqaUvhTiRB3i65OrBpLDiAghqkoj7i2QOPtnu5su8ZGu8k52pQfgWrcsbR4mdVWuxo
	lqcAOvZq+2Fj6Uda+FeG/udJm8uyglH1vaAanM5QTPl08CvnxY1DQlQBWV6Z4b6objEoRFqBQInpp
	tV/q4Jh1HzxCrZn9h+ns3TEwSR7TgZBHpcZJdQz+/eBvKT90g+3qRLah6Om9X3ifRaGjam9JIcD5e
	BtqD8Hcpo9e05oG2C7oiYYBJuPus8y+nWUfz3wjUnOF8kimxtKPAGrxQnFrS09bWDQGoPbxE1IrZs
	pUWjiWS8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vCT-0005b3-2a; Fri, 05 Feb 2021 07:06:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vCR-0005aK-2U
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 07:06:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id o21so2494433pgn.12
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 23:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EWF76HYflOSB1OrBYTPsvdsM7e0I+FAmlSYnAn8ZKQc=;
 b=ecmHbBQ8yqsVKLhzbA0PGceRRKqh0al5tfdBU+2k1tKH9lOppdOyxzqWfTcEJhArKu
 hxQxDBdcQP1lzPPsGZBWotsLtToKpaa8jIw+nTlJEmx430J/2gHvapfRjCZ083UzOlSy
 Nxagae9Va1XnM/S8g8s0wBQED6jpjFj+jdhC0erEolBmihf3CPsVAI5TOLeZoAow20gn
 mBXaRPd0QY1N+0stmP/HI080xU9rbkUNv1Sw2YXBR3LR94DOxowbeBzoHv+0KtFqhKwU
 nBsJyOO3UygcMB+hH0mzs2feA+kYeI0rNOizUij/1j3iPEkuj5zbDu1JqGHJLLtCjiv0
 ukqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EWF76HYflOSB1OrBYTPsvdsM7e0I+FAmlSYnAn8ZKQc=;
 b=S+yLQYl/pEtk5J+Z/lAniic9TSe9l1wLM7liBxiY0i6ERpdZw7VShFLt6c+KC0N7Me
 awEjHI/fPXAZqcdN1v0rfYDQEuaI3VD80llOlIebMDj1O1ftqPNCyLx/HceibjoD2wef
 5YMF3Uvl+ex+nFjhkv/7CC7l/49eEV3Ervrd7L6mQPT66scXfE4cYMvZrTXJWpenQb6u
 rTscp3dfwbcRny+C1i/FQRgYsOIA+RbkHKAm2H0xjBdVYpL15MeKuuJDVr5YN9ic3SSc
 MmF5/h0Zum1fAuC3SXX5Qq5YFSnm6NB3IuRVnQHziNym3ELhbJT6wXYgN6TmXI7l7M5j
 jTLg==
X-Gm-Message-State: AOAM531ZyfurjGhyqGGjcxgtq6m5GNQXFZRvisHyjT2MyV683QIsAMP3
 5YCKtStpYRwZt6J1+1nh4pLPag==
X-Google-Smtp-Source: ABdhPJylwFkYzxiOHze5TcoGUYtRuKQUb2qZfzxlF6Y+Unn8qBXdovj05IYLlEshzFUrFV2FuDXbiA==
X-Received: by 2002:a62:ddd1:0:b029:1b7:5651:f6ea with SMTP id
 w200-20020a62ddd10000b02901b75651f6eamr3231028pff.62.1612508796836; 
 Thu, 04 Feb 2021 23:06:36 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l11sm4671266pjh.6.2021.02.04.23.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:06:35 -0800 (PST)
Date: Thu, 04 Feb 2021 23:06:35 -0800 (PST)
X-Google-Original-Date: Thu, 04 Feb 2021 23:03:10 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
In-Reply-To: <20210204052643.1608586-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-754d5fdb-23eb-45a0-b167-6bd4f674b6b6@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_020639_155082_0E7139B5 
X-CRM114-Status: GOOD (  26.91  )
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
Cc: wangkefeng.wang@huawei.com, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 21:26:43 PST (-0800), Atish Patra wrote:
> SBI v0.2 functions can return an error code from SBI implementation.
> We are already processing the SBI error code and coverts it to the Linux
> error code.
>
> Propagate to the error code to the caller as well. As of now, kvm is the
> only user of these error codes.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 10 +++++-----
>  arch/riscv/kernel/sbi.c      | 32 ++++++++++++++++----------------
>  2 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 1b26ec8e6a15..3e7141a7d11f 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -116,13 +116,13 @@ int sbi_console_getchar(void);
>  void sbi_set_timer(uint64_t stime_value);
>  void sbi_shutdown(void);
>  void sbi_clear_ipi(void);
> -void sbi_send_ipi(const unsigned long *hart_mask);
> -void sbi_remote_fence_i(const unsigned long *hart_mask);
> -void sbi_remote_sfence_vma(const unsigned long *hart_mask,
> +int sbi_send_ipi(const unsigned long *hart_mask);
> +int sbi_remote_fence_i(const unsigned long *hart_mask);
> +int sbi_remote_sfence_vma(const unsigned long *hart_mask,
>  			   unsigned long start,
>  			   unsigned long size);
>
> -void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
> +int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>  				unsigned long start,
>  				unsigned long size,
>  				unsigned long asid);
> @@ -163,7 +163,7 @@ static inline unsigned long sbi_minor_version(void)
>
>  int sbi_err_map_linux_errno(int err);
>  #else /* CONFIG_RISCV_SBI */
> -static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
> +static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
>  static inline void sbi_init(void) {}
>  #endif /* CONFIG_RISCV_SBI */
>  #endif /* _ASM_RISCV_SBI_H */
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 8d60b2ebcad3..f904af48635d 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -352,7 +352,7 @@ static int __sbi_rfence_v02(int fid, const unsigned long *hart_mask,
>   * sbi_set_timer() - Program the timer for next timer event.
>   * @stime_value: The value after which next timer event should fire.
>   *
> - * Return: None
> + * Return: None.
>   */
>  void sbi_set_timer(uint64_t stime_value)
>  {
> @@ -363,11 +363,11 @@ void sbi_set_timer(uint64_t stime_value)
>   * sbi_send_ipi() - Send an IPI to any hart.
>   * @hart_mask: A cpu mask containing all the target harts.
>   *
> - * Return: None
> + * Return: 0 on success, appropriate linux error code otherwise.
>   */
> -void sbi_send_ipi(const unsigned long *hart_mask)
> +int sbi_send_ipi(const unsigned long *hart_mask)
>  {
> -	__sbi_send_ipi(hart_mask);
> +	return __sbi_send_ipi(hart_mask);
>  }
>  EXPORT_SYMBOL(sbi_send_ipi);
>
> @@ -375,12 +375,12 @@ EXPORT_SYMBOL(sbi_send_ipi);
>   * sbi_remote_fence_i() - Execute FENCE.I instruction on given remote harts.
>   * @hart_mask: A cpu mask containing all the target harts.
>   *
> - * Return: None
> + * Return: 0 on success, appropriate linux error code otherwise.
>   */
> -void sbi_remote_fence_i(const unsigned long *hart_mask)
> +int sbi_remote_fence_i(const unsigned long *hart_mask)
>  {
> -	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
> -		     hart_mask, 0, 0, 0, 0);
> +	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
> +			    hart_mask, 0, 0, 0, 0);
>  }
>  EXPORT_SYMBOL(sbi_remote_fence_i);
>
> @@ -391,14 +391,14 @@ EXPORT_SYMBOL(sbi_remote_fence_i);
>   * @start: Start of the virtual address
>   * @size: Total size of the virtual address range.
>   *
> - * Return: None
> + * Return: 0 on success, appropriate linux error code otherwise.
>   */
> -void sbi_remote_sfence_vma(const unsigned long *hart_mask,
> +int sbi_remote_sfence_vma(const unsigned long *hart_mask,
>  			   unsigned long start,
>  			   unsigned long size)
>  {
> -	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> -		     hart_mask, start, size, 0, 0);
> +	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> +			    hart_mask, start, size, 0, 0);
>  }
>  EXPORT_SYMBOL(sbi_remote_sfence_vma);
>
> @@ -411,15 +411,15 @@ EXPORT_SYMBOL(sbi_remote_sfence_vma);
>   * @size: Total size of the virtual address range.
>   * @asid: The value of address space identifier (ASID).
>   *
> - * Return: None
> + * Return: 0 on success, appropriate linux error code otherwise.
>   */
> -void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
> +int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>  				unsigned long start,
>  				unsigned long size,
>  				unsigned long asid)
>  {
> -	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> -		     hart_mask, start, size, asid, 0);
> +	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> +			    hart_mask, start, size, asid, 0);
>  }
>  EXPORT_SYMBOL(sbi_remote_sfence_vma_asid);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
