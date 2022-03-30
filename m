Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2D5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdBcKz/BuhOMNLzo6GcaKu8IroEfRyu4BKwjISWOjn8=; b=kzmXLEdg5aFOtk
	YT+XRwgut0xcGtYbSrwZ/Uu+xHYdymkCgcsRDDhiT6PuSAdo8Du29ROZwQTjGDBMQSESsNxShKuah
	b4dcAdX65Kw/x/khiOGaqfALORdpc//Y+8PBGnDUhZUFOoQTip/y5YWD/1cDdCInXIEn5h43SlZOL
	rTqoivK0DY9NwfUzIMFy8w2decXLy8c5NUwNvBYX6qN8ZX/7fr8oGarRThpjG9JKCfoq740HIUo/o
	5Yn7etNtirO8RyI2T77r3sShpIHKZ4eWBrbMJk4B//YhYu3QIAilRWfepxdExiGPq729n6lJov/6J
	KyNg94xQbyHzKAo8Ur6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZT8A-00Eesv-S5; Wed, 30 Mar 2022 07:52:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZT88-00Ees9-2Q
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 07:52:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id r13so27975209wrr.9
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghHV0zTkwP6Ex+XA+hsxUv5AW9dRVc+dHJyFR6M/CLc=;
 b=MsUahD2sxOxVEYlWECPO8kAt9VWOJpDQrtlreD3+bqkhw6vqNTK7bkZs6OOon1C6qX
 GpbFyKlDNhAqt8EU07FcYzmKQCKWU8+dLr7J2vWKm07zQpKdZWWdJsUKMjmFwO7z3kgO
 ljbjsPLVmaqLtD2DX1UFh9cXZZ3nXDr8NqkLOpvAbNesPZlas4vzAyG4MqMRk8iTnZEt
 Cp9dEq/u/8ZXj0C9UnfxccSpro0iLZKhgkpdWEzBo/MGugutUi4WcBZkJHaTGc0yW17O
 7v8SPsemPb5HX/KxdDLzvzO3EMoTD8wyuMik9aADy6vTeF4jsF0AwzoZO1OmKEIxd0Ur
 L4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghHV0zTkwP6Ex+XA+hsxUv5AW9dRVc+dHJyFR6M/CLc=;
 b=5zwEmzd+r+cq/l+EYSZ9Bk7/b/T4lRn+FKjVX2BZfFJ/0uECD7TXR8cQmjrxRmBcxw
 5Ykgcppl79aqlPSTwyFdDmv2T9/UJbvWiOQH+2Anm8ugs+XJR+MTMcvLZey7vtb/fExc
 YdB5V/h7b/JU+xm6ERsPxPiFleGwEZ5Z+LQKjRjJTzz9Ca2lBOy22uo7rg2no1+Azmzt
 HDivUzCSus8ULOqRvdke3R6byTc2OLxo7+8FnsVHNwOrizyk47MboD5y1PAjhvFpP04W
 WI4DwHCFlRf+hUPy7pWKrsFdx/FpbOpwwJ2YiFtmtsLTzqwyCrHOrDzDdzPf4OKJ8bnX
 PILg==
X-Gm-Message-State: AOAM533KyFU/iNZN7E3k40/0ENljMOxnZCucMDzxd9vfvyexqs0N9YY1
 QWS+TlPqToUUKPv7iNWuL7X8dQZbuGhyd60CQ3tO8w==
X-Google-Smtp-Source: ABdhPJzepy5AOyGRMOgIpV3fZQiTxXLPOoyrx2VNjPNO79OjwG8bFdpXPMisRjuyVZgy6iL646iokaYe4dVaM6pp8hA=
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id
 u6-20020adfdb86000000b00205bccf8cbfmr19955087wri.346.1648626753267; Wed, 30
 Mar 2022 00:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220330073347.3898802-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220330073347.3898802-1-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Mar 2022 13:22:21 +0530
Message-ID: <CAAhSdy1dSM4e_EwN8znKgkiOiV56JM=44SGpYBMBsKPp1Vxd1A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Ensure only ASIDLEN is used for sfence.vma
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Guo Ren <guoren@kernel.org>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_005236_210788_D9615DE7 
X-CRM114-Status: GOOD (  25.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 30, 2022 at 1:04 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When we set the value of context.id using __new_context() we set both
> the asid and the current_version with this return statement in
> __new_context():
>
>     return asid | ver;
>
> This means that when local_flush_tlb_all_asid() is called with the asid
> specified from context.id we can write the incorrect value.
>
> We get away with this as hardware ignores the extra bits, as the RISC-V
> specification states:
>
> "bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
> standard use. Until their use is defined by a standard extension, they
> should be zeroed by software and ignored by current implementations."
>
> but it is still a bug and worth addressing as we are incorrectly setting
> extra bits.
>
> This patch uses asid_mask when calling sfence.vma to ensure the asid is
> always the correct len (ASIDLEN). This is similar to what we do in
> arch/riscv/mm/context.c.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Instead of fixing various local_flush_tlb_xyz() functions, I suggest fixing the
__sbi_tlb_flush_range() in tlbflush.c which passes incorrect ASID.
(Refer line 45, "unsigned long asid = atomic_long_read(&mm->context.id);")

Also, please add the "Fixes: " tag.

Regards,
Anup

> ---
>  arch/riscv/mm/context.c  | 2 +-
>  arch/riscv/mm/tlbflush.c | 4 ++--
>  include/linux/mm_types.h | 2 ++
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..4329fe54176b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -22,7 +22,7 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>
>  static unsigned long asid_bits;
>  static unsigned long num_asids;
> -static unsigned long asid_mask;
> +unsigned long asid_mask;
>
>  static atomic_long_t current_version;
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 37ed760d007c..4469615aa07f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -10,7 +10,7 @@ static inline void local_flush_tlb_all_asid(unsigned long asid)
>  {
>         __asm__ __volatile__ ("sfence.vma x0, %0"
>                         :
> -                       : "r" (asid)
> +                       : "r" (asid & asid_mask)
>                         : "memory");
>  }
>
> @@ -19,7 +19,7 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>  {
>         __asm__ __volatile__ ("sfence.vma %0, %1"
>                         :
> -                       : "r" (addr), "r" (asid)
> +                       : "r" (addr), "r" (asid & asid_mask)
>                         : "memory");
>  }
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 8834e38c06a4..5fa7cc0af853 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -666,6 +666,8 @@ struct mm_struct {
>
>  extern struct mm_struct init_mm;
>
> +extern unsigned long asid_mask;
> +
>  /* Pointer magic because the dynamic array size confuses some compilers. */
>  static inline void mm_init_cpumask(struct mm_struct *mm)
>  {
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
