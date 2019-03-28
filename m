Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B498C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E1621773
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPL0RbjF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Y0VdrD0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E1621773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKUkpFAEe2vkHJgaHBFV07lfQipKysGdmi7rOotKSnQ=; b=QPL0RbjF43D3/t
	O/iTOUWUQwAbupNvpYTnuomVjbrKylJIywrO82IHJ40/0Me+jQTxgcw46SRXFrhjHjED28lf0FoHd
	SOqYMqKuQsAxYgJ2tHdpTI9XU5Qth8V8WRvA2y94u3UQfU4HaR2anDWnuHuOGx4ZDqTHr5uj7pX65
	NVb+5lkn+SA5dH64npxFnE/o+nchzRHKWkYr59NWiIm1iKGX1QJ2i9BdWNygSkUDMiev+8CdMqtuy
	IgtiwjDfOzbhwN+iPoyOa3KffKWNrDRUf0FzxUtxAuFkC96xKtZUZSOfZP9/5IzVZ+0jkBeU00J7h
	y642kDvLavllnkkGY3Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9OsY-0002KE-5q; Thu, 28 Mar 2019 06:51:10 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9OsU-0002Jd-Tg
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 06:51:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id t17so638407wrw.13
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQS1Z+ZodYZylF1Ep2a2YOfBPVNkCmYo0Gc/+C2+kSE=;
 b=Y0VdrD0uibpHcUQ30r+Q1hhtMY2JT9XwLY4tpQ9Jyd16s/XDJawbHElZEwr4s9X7N1
 mqzoP0u1InmPNEi3T4WtnzalXqV9v2z3QLvQOabGM6pN2DMVTDj2O6wzmu+layXnf53e
 wjEwlMiwW1rbEA7cVH3ZHIcTg0GqWfbrqCY7by77iNRB4H22X3FV/g+WkRaG0NU8eVTk
 AoiHjyhMTWhtkx9LEl/6Rypq/EoJvAn7lA40e5QL9psik1/EWwAYTDQeWBlrxSHWlgqb
 b2K/VS7kskZHxhqKJRcOCQRAF35qCjUq612BXWgkwLnUwFXPA5hhq+uh1KrAKENX+LS6
 2pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQS1Z+ZodYZylF1Ep2a2YOfBPVNkCmYo0Gc/+C2+kSE=;
 b=PpU/5/PVGPW1gzRn3hxVGKSK+1gP/n6LM3dXMTYxchdMrbHbrvryhW2tzvHiGbMMT9
 Cmmx5df5DpYrBGjL/9ldqSi8zX6UxNUEr7QkeiVlz/VhJ0UtKZkSkLI7gEJVVNXKLk5I
 VL+wTqSEgVX8x4ccJo3UN+kKLF1qzEaLae751rlNisUPdIpCj5BS4eIcfxiAKOktqN8N
 uuInHGomkJTt1Z14Z0XMehA6aP3yz/vov68RkuRdkiZQeM6yeB9adFLXAw0o9k66+cWc
 WVUcrhfh0fHrbLR3yevtNc0yjlQD4QC58m5ahZHPC6t6aRNJd4kp3CdECecG5Uc4JVdI
 UZFg==
X-Gm-Message-State: APjAAAUP2gNdWWVAlGELNchAHakGjL3Y1khM4pGqv/pAWfR5jK2WD7hW
 9TbaqKVp4aBij6Ysqr/xEuHWigB/OdoQfG8XSFsJdw==
X-Google-Smtp-Source: APXvYqwKUVlEuTr51ECT9YnZnfqoVyJEVqDCRBePjeEazaehGdca+V3xSlSBqPYkXkTAg1h497n1G7liq2H51fZfhaI=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr12682279wrx.187.1553755864853; 
 Wed, 27 Mar 2019 23:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
In-Reply-To: <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 12:20:53 +0530
Message-ID: <CAAhSdy0jQnDkbJXFMy-L76Q8fS_yEb7vtoCnWtThTXpRAOZURA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_235106_961886_65057B1C 
X-CRM114-Status: GOOD (  20.95  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 6:11 AM Gary Guo <gary@garyguo.net> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This patch implements IPI-based remote TLB shootdown, which is useful
> at this stage for testing because BBL/OpenSBI ignores operands of
> sbi_remote_sfence_vma_asid and always perform a global TLB flush.
> The SBI-based remote TLB shootdown can still be opt-in using boot
> cmdline "tlbi_method=sbi".
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Tested-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  5 +
>  arch/riscv/mm/tlbflush.c                      | 99 +++++++++++++++++--
>  2 files changed, 98 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7a60edef09d2..afd34fa1db91 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4552,6 +4552,11 @@
>                         flushed.
>                         See arch/riscv/mm/tlbflush.c
>
> +       tlbi_method=    [RV]
> +                       Format: { "sbi", "ipi" }
> +                       Default: "ipi"
> +                       Specify the method used to perform remote TLB shootdown.
> +
>         tmem            [KNL,XEN]
>                         Enable the Transcendent memory driver if built-in.
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 33083f48a936..ceee76f14a0a 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -72,19 +72,106 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>
>  #ifdef CONFIG_SMP
>
> +/*
> + * SBI has interfaces for remote TLB shootdown.  If there is no hardware
> + * remote TLB shootdown support, SBI perform IPIs itself instead.  Some SBI
> + * implementations may also ignore ASID and address ranges provided and do a
> + * full TLB flush instead.  In these cases we might want to do IPIs ourselves.
> + *
> + * This parameter allows the approach (IPI/SBI) to be specified using boot
> + * cmdline.
> + */
> +static bool tlbi_ipi = true;
> +
> +static int __init setup_tlbi_method(char *str)
> +{
> +       if (strcmp(str, "ipi") == 0)
> +               tlbi_ipi = true;
> +       else if (strcmp(str, "sbi") == 0)
> +               tlbi_ipi = false;
> +       else
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +early_param("tlbi_method", setup_tlbi_method);
> +
> +
> +struct tlbi {
> +       unsigned long start;
> +       unsigned long size;
> +       unsigned long asid;
> +};
> +
> +static void ipi_remote_sfence_vma(void *info)
> +{
> +       struct tlbi *data = info;
> +       unsigned long start = data->start;
> +       unsigned long size = data->size;
> +       unsigned long i;
> +
> +       if (size == SFENCE_VMA_FLUSH_ALL) {
> +               local_flush_tlb_all();
> +       }

No brace required here.

> +
> +       for (i = 0; i < size; i += PAGE_SIZE) {
> +               __asm__ __volatile__ ("sfence.vma %0"
> +                                     : : "r" (start + i)
> +                                     : "memory");
> +       }

No brace required here as well.

> +}
> +
> +static void ipi_remote_sfence_vma_asid(void *info)
> +{
> +       struct tlbi *data = info;
> +       unsigned long asid = data->asid;
> +       unsigned long start = data->start;
> +       unsigned long size = data->size;
> +       unsigned long i;
> +
> +       if (size == SFENCE_VMA_FLUSH_ALL) {
> +               __asm__ __volatile__ ("sfence.vma x0, %0"
> +                                     : : "r" (asid)
> +                                     : "memory");
> +               return;
> +       }
> +
> +       for (i = 0; i < size; i += PAGE_SIZE) {
> +               __asm__ __volatile__ ("sfence.vma %0, %1"
> +                                     : : "r" (start + i), "r" (asid)
> +                                     : "memory");
> +       }

No brace required here as well.

> +}
> +
>  static void remote_sfence_vma(unsigned long start, unsigned long size)
>  {
> -       sbi_remote_sfence_vma(NULL, start, size);
> +       if (tlbi_ipi) {
> +               struct tlbi info = {
> +                       .start = start,
> +                       .size = size,
> +               };
> +               on_each_cpu(ipi_remote_sfence_vma, &info, 1);
> +       } else
> +               sbi_remote_sfence_vma(NULL, start, size);
>  }
>
>  static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
>                                    unsigned long size, unsigned long asid)
>  {
> -       cpumask_t hmask;
> -
> -       cpumask_clear(&hmask);
> -       riscv_cpuid_to_hartid_mask(mask, &hmask);
> -       sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
> +       if (tlbi_ipi) {
> +               struct tlbi info = {
> +                       .start = start,
> +                       .size = size,
> +                       .asid = asid,
> +               };
> +               on_each_cpu_mask(mask, ipi_remote_sfence_vma_asid, &info, 1);
> +       } else {
> +               cpumask_t hmask;
> +
> +               cpumask_clear(&hmask);
> +               riscv_cpuid_to_hartid_mask(mask, &hmask);
> +               sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
> +       }
>  }
>
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
