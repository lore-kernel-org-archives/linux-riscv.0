Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C1C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288D82077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZWu+h8Kb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Vcbq47qD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288D82077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YMJ2qxK5bSqS4ZDVk9ODrqhv53azkBSzNu+yK2KCyPE=; b=ZWu+h8Kb7Ck/KpctxzoXLx3oy
	JN/MVAxeiP7jBE7elayA4wSZU8fbnqFz68gTWZziIADo+q/kyfmqUfeGXT6Dt1Iu8elBgmFG2iD0f
	/CDQ0GMnkPxzyxbu+bBaRU7bZ5187bptWEp07rJkQG/RdoYv3M2ISwuPT3oyjZJtqqZo6n4YL8cCZ
	iIJfRaiPDr4dYWKXH9BitxMYirXpgk1uGsD0jBqcmirSvOiPh7aSPPBKguOou5p51ceUqiphoJhvj
	21G3IKUuCDOs9SjBxfM8/LoJEXVHDuVbLBg4qVlRBvLegdaboY01aOxOFk+BZDg/priAFcjgBfCyD
	vqXhGoi2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkoS-0006x5-2Q; Thu, 25 Apr 2019 20:17:44 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkoP-0006vJ-9R
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 20:17:42 +0000
Received: by mail-pg1-x544.google.com with SMTP id z16so381968pgv.11
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fA5KHm6WYeqpbYfv6EOm14l5ImEX/Mjdl/+EKZUHPNk=;
 b=Vcbq47qDVPeF8IWnK7max0BflmgJkP/VmZSdCFTqJLYPbNIOsdYWCc+p/4EOYkkNhy
 tnCqIsZW5upw4Jo4iffX+PjdGqktr/fJObI4vSTvKSyUnq2cszeZIV9ivAKMNyR6iXIk
 hrZihzPyOkEgedegO1/lRZcvbKKBlf9eLeAeI0yJglExsJD2fjMTM+kZHk/AcsoVsht4
 HO9MFEu55YLkWOO3L9IQVDGXMN+bEBWZuh5hn0GYMNloari/j16lOxIRGjeIvOiSTo9g
 +7wDhecQCFYmj3aTgmamVMn2REZPUi1QFQocJC+2LhiGETiQJvj5fWjEZ1UK7Zmnc6l5
 Q4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fA5KHm6WYeqpbYfv6EOm14l5ImEX/Mjdl/+EKZUHPNk=;
 b=YKAUqe/+edRDigr4xsSNJbof3oEKshFt34CPNDaVeJ8OOevdaFGJnIctxW02AE6CTD
 bIV8JIkDZa5rRyIQrDgw2V2SmnC68pEaYsEbTx1gaHLICAWzEnc6cLZzZf2A7KXwm/0S
 JUP1hiyVF91t8TKYn9YeixXBgjrYFWGoNOLD7CdglUqxrkqIC/anbvQsa7bCpdokaELy
 7g9VA6NvDdbmH5d7uBlQwv4p0T9LP9YyTNGAXijZRPQA3JIrGUH2iC/kKnyo3qe6tO72
 08Y67vu9HWqT79BROeyT8U9Z5wZlF/t5Xcs6cqceWagYx+0eKSslCB5VTvFD7/4/pUuJ
 yaXA==
X-Gm-Message-State: APjAAAWaOMn0vMrM4ClcDk2g7Rn8zrNq8bpqCBd1j41NTdOx+pWnMjUM
 I18LlPBlLdvx1D4M7Rmiic6EoQ==
X-Google-Smtp-Source: APXvYqw0Jw7SDAvQhijd6DulFd4/QSMb1rNE5tFSJiOnCpdjd7KC8iuteodKG/6pa2bIqLGYuboCzg==
X-Received: by 2002:a65:484a:: with SMTP id i10mr39358793pgs.408.1556223460514; 
 Thu, 25 Apr 2019 13:17:40 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id w23sm33833071pgj.72.2019.04.25.13.17.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 13:17:39 -0700 (PDT)
Date: Thu, 25 Apr 2019 13:17:39 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 13:16:38 PDT (-0700)
Subject: Re: [2/3] RISC-V: Update tlb flush counters
In-Reply-To: <20190410224449.10877-3-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-beb18d22-55b3-4a5f-9e29-a560ab168dff@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_131741_323489_88FDC790 
X-CRM114-Status: GOOD (  15.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, mingo@redhat.com,
 bp@alien8.de, gary@garyguo.net, hpa@zytor.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, luc.vanoostenryck@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 10 Apr 2019 15:44:48 PDT (-0700), atish.patra@wdc.com wrote:
> The TLB flush counters under vmstat seems to be very helpful while
> debugging TLB flush performance in RISC-V.
>
> Update the counters in every TLB flush methods respectively.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/tlbflush.h |  5 +++++
>  arch/riscv/mm/tlbflush.c          | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 29a780ca232a..19779a083f52 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -9,6 +9,7 @@
>  #define _ASM_RISCV_TLBFLUSH_H
>
>  #include <linux/mm_types.h>
> +#include <linux/vmstat.h>
>
>  /*
>   * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
> @@ -16,11 +17,13 @@
>   */
>  static inline void local_flush_tlb_all(void)
>  {
> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
>  	__asm__ __volatile__ ("sfence.vma" : : : "memory");
>  }
>
>  static inline void local_flush_tlb_mm(struct mm_struct *mm)
>  {
> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
>  	/* Flush ASID 0 so that global mappings are not affected */
>  	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
>  }
> @@ -28,6 +31,7 @@ static inline void local_flush_tlb_mm(struct mm_struct *mm)
>  static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>  	unsigned long addr)
>  {
> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ONE);
>  	__asm__ __volatile__ ("sfence.vma %0, %1"
>  			      : : "r" (addr), "r" (0)
>  			      : "memory");
> @@ -35,6 +39,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>
>  static inline void local_flush_tlb_kernel_page(unsigned long addr)
>  {
> +	count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ONE);
>  	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>  }
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index ceee76f14a0a..8072d7da32bb 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -4,6 +4,8 @@
>   */
>
>  #include <linux/mm.h>
> +#include <linux/vmstat.h>
> +#include <linux/cpumask.h>
>  #include <asm/sbi.h>
>
>  #define SFENCE_VMA_FLUSH_ALL ((unsigned long) -1)
> @@ -110,6 +112,7 @@ static void ipi_remote_sfence_vma(void *info)
>  	unsigned long size = data->size;
>  	unsigned long i;
>
> +	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
>  	if (size == SFENCE_VMA_FLUSH_ALL) {
>  		local_flush_tlb_all();
>  	}
> @@ -129,6 +132,8 @@ static void ipi_remote_sfence_vma_asid(void *info)
>  	unsigned long size = data->size;
>  	unsigned long i;
>
> +	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
> +	/* Flush entire MM context */
>  	if (size == SFENCE_VMA_FLUSH_ALL) {
>  		__asm__ __volatile__ ("sfence.vma x0, %0"
>  				      : : "r" (asid)
> @@ -158,6 +163,13 @@ static void remote_sfence_vma(unsigned long start, unsigned long size)
>  static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
>  				   unsigned long size, unsigned long asid)
>  {
> +	int cpuid = smp_processor_id();
> +
> +	if (cpumask_equal(mask, cpumask_of(cpuid)))
> +		count_vm_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
> +	else
> +		count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
> +
>  	if (tlbi_ipi) {
>  		struct tlbi info = {
>  			.start = start,

Looks good, but it's not applying on for-next (based on rc6).  Do you mind
re-spinning the patches?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
