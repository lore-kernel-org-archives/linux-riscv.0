Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E145C46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 01:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5AUySV6FtOEngTXuuFrvEk49m0LXq79ehBnu9YHswM=; b=sVymxtPOdQVebl
	tOYDmxMBfoWQD5TX2C6105LaAoJLIMHQrOocKuvNN2DUhfflHJdcILzmhRnEtCVhFHAnBwqmbRYa2
	p0FZxPugRQPKFDgbB0xi+WYf/wFwaFQ+Lgl2ZeNVkTqP5cWMKCobMk6CI8iQ6VJTPkzg8TmqQv3mv
	B63cVJw1R5x4528zj3Mw++3h1/xJepELa0mF6nP2Bb4SjHXnr+5W7lN8UeF+YyGY5UBt4TTjk2fcF
	B8vUPhI8hQLAq21f/m9pPalGsd9w4vLzWld8PDTbNyDQnJtd50Dj6VITrulE+712eyT95UPV/d9Li
	p8i8ZsW/YCcoTTcbF+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUhI-004dTc-09;
	Fri, 22 Dec 2023 01:51:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUhF-004dSy-0o
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 01:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703209887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nN/8wghPJhB2Oh8gNGg0tlhxxcx+OK+Kvi1mD9v1Gs8=;
	b=EDrvzrFi2h35zWLk4LR0dOBZM6wwKUPPMJt5RuL7dMke5op8nJu7l1Rq3zPgIrEMYBkmID
	NsCYgZhTPml/+7zptttwNob9frPit0giHn/JlA1tGXcq8eBWdxEaQs5xXcpBIAp6DglODx
	AZWir9ByP5we2JjcmS1O0awUWyqpOfA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-4kbepJm2MteISyDvx_sPew-1; Thu, 21 Dec 2023 20:51:25 -0500
X-MC-Unique: 4kbepJm2MteISyDvx_sPew-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28b492f0702so1471780a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 17:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703209884; x=1703814684;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nN/8wghPJhB2Oh8gNGg0tlhxxcx+OK+Kvi1mD9v1Gs8=;
        b=OZexKZ8AyqU4IU/vM/AhvLryKQPQ3N6HR3KRx7iZ0Cc1tGgFAeiIAdHUMvvRj1XsOK
         P6pGouxDuw0cl9CuYgbK338T9MUIHWbCMoSz9jI7jpz89POqavuPzkMbAZ3ZE12tFko9
         Sar8QAnlOcTFAiqZYXocDlIu35eScSxbgKBFfx7jgCa62tmr+0mSs8OWcx77SpGoEzhZ
         +G9Jdpy3FrzjuAAQmjw+Z1SITg4HcZyivHb+ywlWx0ZPAN28Dhreq7q54OKhm/TtF/Nl
         sazS1qIGQMyKNWUKuZ1jDk5GJ+kbc0+bixkQ0gcFicm0aCRZlCK6nbVXuUOTTCbEtfPn
         Q3tg==
X-Gm-Message-State: AOJu0YyXL7MJ5PWNQRe5VYr7LNoFjiwlRVkiB0SWC36C9BIWnfzvXeo6
	aw1UiipdqIywH1E+hhnyot29Ipbgo3tXpV+FSF+HqmvkZxp7sPTwr98ImTxtLUFRTcGPMXZDR9l
	FRNGNyUrqJgQcb4PRpZ8gdwzZj01Fx7hIbIQw
X-Received: by 2002:a17:903:1c9:b0:1d3:bc88:59af with SMTP id e9-20020a17090301c900b001d3bc8859afmr583118plh.136.1703209884003;
        Thu, 21 Dec 2023 17:51:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqK9sjO3boko2Euac1Jio1zRfdmiG73LJTSADdDmxStfdygllQ8qRIUhBvzNbygwsIwnluxA==
X-Received: by 2002:a17:903:1c9:b0:1d3:bc88:59af with SMTP id e9-20020a17090301c900b001d3bc8859afmr583099plh.136.1703209883697;
        Thu, 21 Dec 2023 17:51:23 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001d3ebfb2006sm2285019plh.203.2023.12.21.17.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:51:22 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
Date: Thu, 21 Dec 2023 22:51:04 -0300
Message-ID: <ZYTriK9hjOFQou9Z@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221154702.2267684-2-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-2-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_175129_382955_4F3AE3C4 
X-CRM114-Status: GOOD (  19.07  )
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

Hello Guo Ren,

On Thu, Dec 21, 2023 at 10:46:58AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> In COMPAT mode, the STACK_TOP is 0x80000000, but the TASK_SIZE is
> 0x7fff000. When the user stack is upon 0x7fff000, it will cause a user
> segment fault. Sometimes, it would cause boot failure when the whole
> rootfs is rv32.

Checking if I get the scenario:

In pgtable.h:
#ifdef CONFIG_64BIT
#define TASK_SIZE_64    (PGDIR_SIZE * PTRS_PER_PGD / 2)
#define TASK_SIZE_MIN   (PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)

#ifdef CONFIG_COMPAT
#define TASK_SIZE_32    (_AC(0x80000000, UL) - PAGE_SIZE)
#define TASK_SIZE       (test_thread_flag(TIF_32BIT) ? \
                         TASK_SIZE_32 : TASK_SIZE_64)
#else
[...]

Meaning CONFIG_COMPAT is only available in CONFIG_64BIT, and TASK_SIZE in 
compat mode is either TASK_SIZE_32 or TASK_SIZE_64 depending on the thread_flag.

from processor.h:
#ifdef CONFIG_64BIT
#define DEFAULT_MAP_WINDOW      (UL(1) << (MMAP_VA_BITS - 1))
#define STACK_TOP_MAX           TASK_SIZE_64
[...]
#define STACK_TOP               DEFAULT_MAP_WINDOW


where:
#define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)
with MMAP_VA_BITS_64 being either 48 or 37.

In compat mode,
STACK_TOP = 1 << (32 - 1) 	-> 0x80000000
TASK_SIZE = 0x8000000 - 4k 	-> 0x7ffff000

IIUC, your suggestion is to make TASK_SIZE = STACK_TOP in compat mode only.

Then why not:
#ifdef CONFIG_COMPAT
#define TASK_SIZE_32    STACK_TOP

With some comments explaining why there is no need to reserve a PAGE_SIZE 
in the TASK_SIZE_32.

Does that make sense?

Thanks!
Leo

> 
> Freeing unused kernel image (initmem) memory: 2236K
> Run /sbin/init as init process
> Starting init: /sbin/init exists but couldn't execute it (error -14)
> Run /etc/init as init process
> ...
> 
> Cc: stable@vger.kernel.org
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ab00235b018f..74ffb2178f54 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -881,7 +881,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>  
>  #ifdef CONFIG_COMPAT
> -#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
> +#define TASK_SIZE_32	(_AC(0x80000000, UL))




>  #define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
>  			 TASK_SIZE_32 : TASK_SIZE_64)
>  #else
> -- 
> 2.40.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
