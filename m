Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FFDC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSk+TPSJY3vLd+JNpkd3iMorMnHpQtbMYcg8vVA5Kzg=; b=aeHzGMys0bjqrC
	e/3tnnsKFRKIyyNG+8NEdSy7TKvC47wwOiaF+J2/8K31NrB+UZODbrZ/bFNmwRNITyEq3NLRuL5vt
	zmMOOu9k9Yp3Mfo5F36/igiCWNJhv7kKn3194ii+H+Vx3sNFRp6M9CA5LgLbpR5QMuRk41vyl5RZd
	iMb5Nxo01QrJi4TDt1ft+2U8MjzaLoZpvgU0/Aja/iutKSgKFbhGFUDsPHc0RwJnhud+sgJ4XBY2h
	gAMsLI3b0QILwLru1ethez0AQW0nGltPdW52Wq4VfA8z5rQJdJUPvgJ54jZr+EdcUbhyrbAbPz4bf
	ATfQ0QXEItpEw9jjK+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNlR-0000000DZP9-2At4;
	Thu, 04 Jul 2024 14:48:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNlP-0000000DZNX-0n5n
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 14:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720104525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXECjDJrtIl4BpVTyYC6fwJS8w+7LK06QJNYlI1sP8Y=;
	b=F1XK8eGbhgmZNsFwq2rfnDRAf3BPfXleOBkeCm3cw4oYsmxA0mHEBIqj8Tn4L5kaUEPf4I
	bTFDeRWaPSVsRglrR1qL+XMO4keWgdgP+27tY5Um/kv39gHcKlyXcCjuxisiOVZLcF5IJX
	V7xHuhGPaWdxdZMGrhstfIk71dtK5fw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-cB6EdK8ONWOKbxMLZ71gTw-1; Thu, 04 Jul 2024 10:48:38 -0400
X-MC-Unique: cB6EdK8ONWOKbxMLZ71gTw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-445e1f933c6so2026431cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 07:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104518; x=1720709318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXECjDJrtIl4BpVTyYC6fwJS8w+7LK06QJNYlI1sP8Y=;
        b=HAsqamBUE23z5hQt+qbJklzGABPJsPoGAdwIA2lozL2azeElFvgheJI82tQ6+KntAm
         NZ4unxLLkWKRguzu1UkBpPL7CtSXD+bqfbvXI5f8pKEmtdjlNkSNxUbZvplMmIQB5cdC
         PbKF3f9uMZMsZ8jkFCbq2/CZdew//aJa4yULJaeUI0S8xb/rYxOQ+A/KxgR6j+JAi36Z
         hphb7ruXz+WOe4A6pbpXutPfTArgdHbi2zOfsMGkt9RLtg8e944dgW8ZYVj1OroPO5jn
         Bk9WRVArLjfnTFJ/VP+snabYbl91UJ04I85TK6j1ikKqcF2SgLkimfEGkerfeEsws18U
         D46Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMhenQ9yDQimdGoHq6dK+1ymSzJ/LpC6BVUOCQzMGUORgzJczpyW825xS4X01b0DRJT9Mb2it5FbXwTlJYdUy5+7qjuqmYqFEkxhQpJeSU
X-Gm-Message-State: AOJu0YyrkhnrwAaVmyVJGh2pgsJ2tpqrLbLyZ117eI/0IZtv7ubhnw0G
	js5USFGveo2nykM20BNfM8Q1ZouIlUnbHEv1mfSnW0vkGCnEyCyfTsuATje56sm4aoBYXc+R4kb
	2ax4W63kkrj4AryY9qWCZPMV/c4kMDGXr7eHjJVRLWb7QwYCIWgIMbTn6uds2ATVl+A==
X-Received: by 2002:a05:6214:19ca:b0:6b5:de38:d6ee with SMTP id 6a1803df08f44-6b5ed25fef8mr17983526d6.3.1720104518271;
        Thu, 04 Jul 2024 07:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbfJ4Dl8q9Di4ADjKh3fKHELg53QNLbtDJ7V6Dfgq9r/AZUi3Tjq7eYCPt4FX3A5juSme39A==
X-Received: by 2002:a05:6214:19ca:b0:6b5:de38:d6ee with SMTP id 6a1803df08f44-6b5ed25fef8mr17983356d6.3.1720104517861;
        Thu, 04 Jul 2024 07:48:37 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5f04c9fdcsm3194276d6.34.2024.07.04.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:48:37 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:48:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Message-ID: <Zoa2Qnpzl97hmpHC@x1n>
References: <b601e1a88e3a5d4d93b130fa20184b555e2a2bea.1720074307.git.christophe.leroy@csgroup.eu>
 <c8cb83b709740f7ac835997b88c5ddda610f66ab.1720074307.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <c8cb83b709740f7ac835997b88c5ddda610f66ab.1720074307.git.christophe.leroy@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_074847_355751_B65F36C1 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, Jul 04, 2024 at 08:30:05AM +0200, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_leaf() in include/asm-generic/pgtable-nopmd.h
> 
> Do the same for p4d_leaf() and pgd_leaf() to avoid getting them
> erroneously defined by architectures that do not implement the
> related page level.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/asm-generic/pgtable-nop4d.h | 1 +
>  include/asm-generic/pgtable-nopud.h | 1 +
>  include/linux/pgtable.h             | 6 +++---
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
> index 03b7dae47dd4..75c96bbc5a96 100644
> --- a/include/asm-generic/pgtable-nop4d.h
> +++ b/include/asm-generic/pgtable-nop4d.h
> @@ -21,6 +21,7 @@ typedef struct { pgd_t pgd; } p4d_t;
>  static inline int pgd_none(pgd_t pgd)		{ return 0; }
>  static inline int pgd_bad(pgd_t pgd)		{ return 0; }
>  static inline int pgd_present(pgd_t pgd)	{ return 1; }
> +static inline int pgd_leaf(pgd_t pgd)		{ return 0; }
>  static inline void pgd_clear(pgd_t *pgd)	{ }
>  #define p4d_ERROR(p4d)				(pgd_ERROR((p4d).pgd))
>  
> diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
> index eb70c6d7ceff..14aeb8ef2d8a 100644
> --- a/include/asm-generic/pgtable-nopud.h
> +++ b/include/asm-generic/pgtable-nopud.h
> @@ -28,6 +28,7 @@ typedef struct { p4d_t p4d; } pud_t;
>  static inline int p4d_none(p4d_t p4d)		{ return 0; }
>  static inline int p4d_bad(p4d_t p4d)		{ return 0; }
>  static inline int p4d_present(p4d_t p4d)	{ return 1; }
> +static inline int p4d_leaf(p4d_t p4d)		{ return 0; }
>  static inline void p4d_clear(p4d_t *p4d)	{ }
>  #define pud_ERROR(pud)				(p4d_ERROR((pud).p4d))
>  
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 2a6a3cccfc36..b27e66f542d6 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1882,13 +1882,13 @@ typedef unsigned int pgtbl_mod_mask;
>   * - It should cover all kinds of huge mappings (e.g., pXd_trans_huge(),
>   *   pXd_devmap(), or hugetlb mappings).
>   */
> -#ifndef pgd_leaf
> +#if !defined(__PAGETABLE_P4D_FOLDED) && !defined(pgd_leaf)
>  #define pgd_leaf(x)	false
>  #endif
> -#ifndef p4d_leaf
> +#if !defined(__PAGETABLE_PUD_FOLDED) && !defined(p4d_leaf)
>  #define p4d_leaf(x)	false
>  #endif
> -#ifndef pud_leaf
> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(pud_leaf)
>  #define pud_leaf(x)	false
>  #endif
>  #ifndef pmd_leaf

Is it possible to do it the other way round, so that we can still rely on
"ifdef pxx_leaf" to decide whether to provide a fallback, and define them
properly when needed?

IMHO it was a neat way to avoid worrying on any macro defined; it'll be as
simple as "if function xxx not defined, let's define a fallback for xxx".
Per my limited experience it helped a lot on avoid compile issues here and
there..

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
