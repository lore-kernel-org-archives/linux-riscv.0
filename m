Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE53C61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdu/GornikytJneCkHF/zYm5105TO2tDrojVH8bSOcc=; b=J43oCIirM3bQG8
	u259V4sKACYYPt42JkrH8ALFh1aiVnnLy9S25CiOkvYZ0+8rdotizsOwjVOFtY9AHtlw9epBhbrVM
	d5ATtRHWilpGW76hjtmMlljhCCXb9Wy3QsfvNXLXRf400n87JapfzbOUiaX5ZOWCbq1FiDBhlSiAy
	C+LdfwdoSfWZpX6/rTC3z2A5zxEmU237PQGzV8neH0dLWpPj1LtiZRTvoe5cIRL4aXZm9bO3zGlTv
	dXjvuu0Ovq4GHw9T2p13ALPikLqQm3B+Z3hQNC3JjIbUS3OqhkedJNbenqLSRYOiWmFHiqG/vsYxu
	SiXjei5sm3DNt8nuaE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwW8-00000005oCA-0sUa;
	Fri, 28 Aug 2026 13:21:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwW4-00000005oBN-1Nal
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 13:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787923265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2F7fOxUu4V0dP2Sv1iyT3HhBi0Yf+rjtTWsb6sJWmE=;
	b=LyrYBEXaPQX5WP754Q+rkkjI6tvVPOfDw6gVX/Ekswa2tJCtHtrbed27t3SHoef65OD8Ls
	kyn5tvGGVZHFF9K9upNIH+nbtzhnWF5xQDKO2ZQbI1Zzjjcu4B1J+st+bBQnngZZXq3q36
	TInTQhrApxnVG+t/e8L67keL7TZ82UU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-m8LjwEirOuiqAvt1imgGgw-1; Fri, 28 Aug 2026 09:21:02 -0400
X-MC-Unique: m8LjwEirOuiqAvt1imgGgw-1
X-Mimecast-MFC-AGG-ID: m8LjwEirOuiqAvt1imgGgw_1787923261
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7293f13c6so13536885ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 06:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923261; x=1788528061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2F7fOxUu4V0dP2Sv1iyT3HhBi0Yf+rjtTWsb6sJWmE=;
        b=rbefk7nzxSXWSrE2+Z7EmXxRk60S5gEp225IhAbX4v1TPp8mGisbYPjm4skNAATtQk
         P3C9Y16iprkIiMLUPNuCWQqZJ5YRASYGXiKuqFSU2nqhAmc3p8LqQme0mJ+Nl0hmBffR
         0Ccg1D4MBQZXuKdwyHND7hATayRXk8SwiCs7w4vGZlqtWAwXdLekLRZpeUxP3EYPuelG
         +NqOu7KIm+WmQ+pPXvUzM/APZ8r15VAs4ulOHhQK3Sf1EqQPIRUlSN5DUFBBguPj5QiK
         8EpcQDVoZbGCLTiM73EbGUXO9ktvVGKxQhTFnI22QawzdhJXkmYkYcWJoNiLhRmNXK+q
         yJXA==
X-Forwarded-Encrypted: i=1; AHgh+RqPZpGB63GVcSsj8a/pQ2AdAJLh6XxCvqcth/WzdS6Jqi485DDUwru1+/Z+Z9R8nJ8wDCJdDHrWeUWOYw==@lists.infradead.org
X-Gm-Message-State: AFuF++ktkS6e9tvO2LLDnAnXyrST/2Xu31dczrP39L6bZMidgy8a2E7L
	3QWjylgcLoyyEGFslRJXBLdsBtGMGhJVNLbuuI1nKor4S+/vXbDZ12pvY5XmwywhAQy1FEaC8bJ
	JY/b5mFGHtP4hzecb5FUMgx+fMbhCJbuo9fGRudxw6W9LmGWAHBYevJvnbls7kx1e4r/rSQ==
X-Gm-Gg: AR+sD11cCVMTZgNCg4bjbrD83juVOBOrpglpgmTOHgmcQpelB9p2v2FTBdgJSHCmP6S
	E9JKXBYP/11UDlYZcGPnaPfuhH7HzVGsQtwclB6shcd1rFV2s+kKQhB6ifgWoX4vvG5IrUd4x/g
	nXLMe9OqJDGKGsfOAdeNF/TX8k7VczYMmJGasJPNlKJWVZvXL2MrH0pINUhaThQwYOXxOKy7yfA
	7RyhH4icp0e1+anN8ffhBupiVZWAIMo8NZTquEFmBmxlTMyQOZK/a2MEncVIhoqLULLxVuuKEbS
	ldiN/ZEJsRIoaGXwOl8DJKOQ3B07tVtltEtWr3Ky+MjxYKi1Q5CJzg7O8KBVsQg8Tl1uZuaGVxe
	A6uQNnjqkztymPz6N
X-Received: by 2002:a17:902:ca13:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d74deed25dmr102924005ad.11.1787923261373;
        Fri, 28 Aug 2026 06:21:01 -0700 (PDT)
X-Received: by 2002:a17:902:ca13:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d74deed25dmr102923095ad.11.1787923260879;
        Fri, 28 Aug 2026 06:21:00 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6c7sm5149255ad.60.2026.08.28.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:21:00 -0700 (PDT)
Message-ID: <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
Date: Fri, 28 Aug 2026 18:50:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lY-uddB4QiRYz_eN5hjpnPgmvxrd89L4mhV6wQA6Lvo_1787923261
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_062108_433358_5ABDEDF5 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Sourabh,

The patch touches three files across three subsystems so kexec: would be
a more accurate prefix than kexec_file, for e.g.:

kexec: remove unused arch_kexec_locate_mem_hole hook

On 27/08/26 8:14 pm, Sourabh Jain wrote:
> No architecture provides an implementation of
> arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
> and remove the unused fallback wrapper from the kexec header.
> 
> This simplifies the kexec memory allocation path without changing
> its behavior.
> 
Also, it might be worth mentioning in the commit message that this hook
was originally introduced by commit f891f19736bd and that the last arch
override was removed in commit 6e5250eaa665; making it safe to remove now.

Otherwise, the change looks good to me. Feel free to add:
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/riscv/kernel/kexec_elf.c |  2 +-
>  include/linux/kexec.h         | 15 ---------------
>  kernel/kexec_file.c           |  2 +-
>  3 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
> index 3e9a32acb8f2..ca5abbad59e5 100644
> --- a/arch/riscv/kernel/kexec_elf.c
> +++ b/arch/riscv/kernel/kexec_elf.c
> @@ -91,7 +91,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
>  	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
>  	kbuf.cma = NULL;
>  	kbuf.top_down = false;
> -	ret = arch_kexec_locate_mem_hole(&kbuf);
> +	ret = kexec_locate_mem_hole(&kbuf);
>  	if (!ret) {
>  		*old_pbase = lowest_paddr;
>  		*new_pbase = kbuf.mem;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 0af8ae4fdd08..e5f1cfc11fef 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -259,21 +259,6 @@ int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
>  extern int kexec_add_buffer(struct kexec_buf *kbuf);
>  int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>  
> -#ifndef arch_kexec_locate_mem_hole
> -/**
> - * arch_kexec_locate_mem_hole - Find free memory to place the segments.
> - * @kbuf:                       Parameters for the memory search.
> - *
> - * On success, kbuf->mem will have the start address of the memory region found.
> - *
> - * Return: 0 on success, negative errno on error.
> - */
> -static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
> -{
> -	return kexec_locate_mem_hole(kbuf);
> -}
> -#endif
> -
>  #ifndef arch_kexec_apply_relocations_add
>  /*
>   * arch_kexec_apply_relocations_add - apply relocations of type RELA
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..9a981359addd 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -784,7 +784,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	kbuf->cma = NULL;
>  
>  	/* Walk the RAM ranges and allocate a suitable range for the buffer */
> -	ret = arch_kexec_locate_mem_hole(kbuf);
> +	ret = kexec_locate_mem_hole(kbuf);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,
Mukesh Pilaniya


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
