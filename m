Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0ADC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 05:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsDkmKGJUu4zsZlLeyd8Ut7vNJOHc9pWSeuu7yO59dY=; b=reOAHJIH9WMDRy
	4y6YDhGyzotorYPXlozMdfJ8TnjwCzCr0VrX9ZrS98i/2GuQCQXDpdm4+M8Ov2zqA3g6br0a94B7N
	CiH3CpKHmO85pCvzlkpD2ctN+mwhwBy9iNo0Vqxb2+2rC+p3KwMoy22D2TXniffs2hBnQSStUbHES
	g92hY3XRo8sVQomSrksFR1mXfk5tCnrp+k+X7vnNIbKZGTDOxArt9Etyn1nWBh5rZGjBauI8y3ecX
	CP+Rk8HjX3OQUmNZYhX2yJ5sI40b8cR4cGizi+B2IPPuZX5FIiLBPMB9b03WP7Kobzf4E1Myej3jH
	BKEUd1XQrQ5iqlnkDrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbbCl-004Qhz-OP; Mon, 13 Mar 2023 05:58:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbbCi-004QhE-IM
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 05:58:42 +0000
Received: by mail-lj1-x229.google.com with SMTP id b13so11417229ljf.6
        for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 22:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678687117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r42O6Y5cB+VDeHMbarldOxJ8LK3WTSPXYQqJukkf3Co=;
        b=HULX4dIJAgeRdwtS5mfYykOMh13+Xqj/QT2rPJ1a+3ODMjiCUDWTKdK06fSvfPJ4HF
         4/F8JZBua8UMySt2uLzxP4tPjKwDsogQ9+4TVtXfAAqGg3xwNKVYq1aS65bTyZoWlTs2
         xevewOLFKBAQPf3mNOOvgSNr9LsqYI/ovCZGRTlJvqkHGD8RQDOlV/AVUT0pKVwrnt9g
         uC3Lx5G5wj+Ouv2NtmVmew0mymJar+LWESghOlxK7N4sjc0xRDufn+DbPpBvViDUCMAR
         uA+1IiQLPbIMxeXeFCE8jXiyC3e39cxSkDYsM3fLuTkHowWUwuml1F0DwpfnJnBa/Zr0
         AAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678687117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r42O6Y5cB+VDeHMbarldOxJ8LK3WTSPXYQqJukkf3Co=;
        b=YgQZjZsgK92nzg9l3Zql4KMgPbcwBJ8NfugmtNeZYvA20uGfKb5THz8M7ulPym5Oqn
         ExRn75g1qLjddVaUK546ECOlu7QRx1bkJrhx/UsRr04buvy0JOLHrVpIEjqIuyXNaQs/
         yMi3qZliDVwUHutFNxKn9MtTniEYxA0MVzzRdS9U8kfCiGMlVncObcWATitBh+09NMKx
         0nplkdbAHpzeGV8RS74AWEOWaMOC9DsyfmsWHhd2Odw3/Px8UwqMaUybMSgozVDxvn64
         JYzWg1vVyM6F56j1gydyMu3Ag/V5W7npuK+pXB/13oBCjKCASW1iFcDZyvNV+rleIAT+
         ULtA==
X-Gm-Message-State: AO0yUKVyeW4YuB8TOfgpwpmmi3y4FzSi5FDp9oe2LIcm5yFO7eQKztLe
	4ITcRtY56RgTywiDB7uMhMA=
X-Google-Smtp-Source: AK7set/VsUuMbBC5VMNZ+AreBezxbJCALlZZ3PkWVlsYj7vuYmyIll1BbItD6I0MhHQ5BEbf1diYTw==
X-Received: by 2002:a2e:8012:0:b0:294:899:afc3 with SMTP id j18-20020a2e8012000000b002940899afc3mr11764874ljg.35.1678687116950;
        Sun, 12 Mar 2023 22:58:36 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id e17-20020a05651c039100b00293526a0c87sm888637ljp.41.2023.03.12.22.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 22:58:35 -0700 (PDT)
Date: Mon, 13 Mar 2023 08:58:34 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Dylan Jhong <dylan@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	guoren@kernel.org, sergey.matyukevich@syntacore.com,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	x5710999x@gmail.com, tim609@andestech.com, peterlin@andestech.com,
	ycliang@andestech.com
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing
 TLB
Message-ID: <ZA67iqLoX9DUjGm/@curiosity>
References: <20230313034906.2401730-1-dylan@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313034906.2401730-1-dylan@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_225840_649502_2B7D2C24 
X-CRM114-Status: GOOD (  17.74  )
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

> Currently, we pass the CONTEXTID instead of the ASID to the TLB flush
> function. We should only take the ASID field to prevent from touching
> the reserved bit field.
> 
> Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
> Changes from v2:
> - Remove unsued EXPORT_SYMBOL()
> ---
>  arch/riscv/include/asm/tlbflush.h | 2 ++
>  arch/riscv/mm/context.c           | 2 +-
>  arch/riscv/mm/tlbflush.c          | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 907b9efd39a8..597d6d8aec28 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -12,6 +12,8 @@
>  #include <asm/errata_list.h>
>  
>  #ifdef CONFIG_MMU
> +extern unsigned long asid_mask;
> +
>  static inline void local_flush_tlb_all(void)
>  {
>  	__asm__ __volatile__ ("sfence.vma" : : : "memory");
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 80ce9caba8d2..6d1aeb063e81 100644
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
> index ce7dfc81bb3f..ba4c27187c95 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -27,7 +27,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>  	/* check if the tlbflush needs to be sent to other CPUs */
>  	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>  	if (static_branch_unlikely(&use_asid_allocator)) {
> -		unsigned long asid = atomic_long_read(&mm->context.id);
> +		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
>  
>  		/*
>  		 * TLB will be immediately flushed on harts concurrently

Reviewed-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Thanks !

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
