Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C17CC43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A024E21D43
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvGYaOa1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="dXk9To9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A024E21D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8sUMUwx5Nmrx+6Jd3Pn1uMcXWUMN+1YuXyCG62Ea5I0=; b=LvGYaOa1MLRAwCykf5VJbBOrc
	ea/SSfJcQwX9YyzMli/FUE7zefqXhfs6aY9cwgCA6zob1f6r/11P6s3a6y30m8ozxpSvnHvgec/k2
	C9zmbfwn2OTZspei13Yle1RhspkksoDCZqTtZYmqVg8yK3ZFZeTAKsvX3AamZUKfZnI2kFawWSj+J
	34Pycy8g+jvQIef//qOerp6YK5x7e6Q39J717aWFuj6cvtssHGBPVgxNS761UiHFjyZUBijjUx/Ho
	gECHbvRZO/IdFJtwF3eKQmuw+nJzJp/E1FmDo0W5efSBGMyps1LHPa2WlRwP2NFd6fyPADNgOcoOQ
	a5tb5Tbbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFsCk-0000Oy-3e; Wed, 09 Sep 2020 04:59:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFsCg-0000Mj-U8
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 04:59:31 +0000
Received: by mail-pg1-x541.google.com with SMTP id m5so1170473pgj.9
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 21:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HusqWcfyGC+ql/Zjk8Q/vdT8PXZvHACLiqB7zBTzSvM=;
 b=dXk9To9Q1v53+uIxoDd356SC63Me668w/PlIGfYaPZoiOq+kn5JzBDG8ISHZzGFR/k
 w6AdfCOfQQlYd55zyhFFzYbLm1I0TPelctdgEe/K9UMvxGwjkSzTtfrc1LT1sKDfT03Z
 dno8EwQRVyVcB8ZtO7RcNpgHhYzbLVFqj2C/j7zM9pq/KypLsbvt/Fany2AguiScA1Ey
 EPBF/OTN5dgB6E+LZ7CfaDQjxRQHj6mr2sUqN8fvo1AoHZhdWukXGh77ZrwkYllqc5gt
 mf+j9mk3CClJcSqPaMOz/Z/4FqfVFjDk3n4YfpUEbOWsOulYfeo/VKskrzezIDCeMubf
 5/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HusqWcfyGC+ql/Zjk8Q/vdT8PXZvHACLiqB7zBTzSvM=;
 b=G6DEQwbMPATntliJIptgLzoJkehlsEwmDMLgacc2NYHQsugdWYxQEUqb/8H+A2zEC8
 f1s6zrCtYpFG+ebHjDmf2hgWGKQHsO4HfVHDAEI8tWxGN3Z5nqe0MSJNM588ETIGW2Nu
 mqCmyfqP8RHlCvjGoahZI/HzCbTG4aTItoGph0eXoDqf8N9/5qV3iV4ETEK+NSDUXssf
 HU3scnXndKFVyUu3zJQJiXpGR5pWp3/VWtUj9/OuVPlqNF3uuzy2vjeZfc3iHxtUC2/l
 amv3CdM4ru2S/QPdo00A4TPr0tABykbF/nb2pKPHGC4Uav42p5VgApsthHSy3l3lx+7x
 DJag==
X-Gm-Message-State: AOAM533OvD8PrxeSERBZMPy78TpZ6OjqrsrqMjUnrfMHcSAFSnnB0Dk2
 lZWvS6cfkXTyoTjY8MRTaXIg6A==
X-Google-Smtp-Source: ABdhPJy4MS198jyOfSH08aNpUpExBegNhbKMjNLEX4M8IafVuBqxEO3l93M82iDwSb1jkLq+09tyxg==
X-Received: by 2002:aa7:8756:: with SMTP id g22mr2064694pfo.37.1599627569034; 
 Tue, 08 Sep 2020 21:59:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u71sm1061068pfc.43.2020.09.08.21.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 21:59:28 -0700 (PDT)
Date: Tue, 08 Sep 2020 21:59:28 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 21:55:52 PDT (-0700)
Subject: Re: [PATCH 8/8] riscv: remove address space overrides using set_fs()
In-Reply-To: <20200907055825.1917151-9-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-ca158d54-5e36-4407-a4da-097c9ddc7dfc@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_005931_038936_C354FA05 
X-CRM114-Status: GOOD (  27.38  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 22:58:25 PDT (-0700), Christoph Hellwig wrote:
> Stop providing the possibility to override the address space using
> set_fs() now that there is no need for that any more.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig                   |  1 -
>  arch/riscv/include/asm/thread_info.h |  6 ------
>  arch/riscv/include/asm/uaccess.h     | 27 +--------------------------
>  arch/riscv/kernel/process.c          |  1 -
>  4 files changed, 1 insertion(+), 34 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 460e3971a80fde..33dde87218ddab 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -86,7 +86,6 @@ config RISCV
>  	select SPARSE_IRQ
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> -	select SET_FS
>  	select UACCESS_MEMCPY if !MMU
>
>  config ARCH_MMAP_RND_BITS_MIN
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 464a2bbc97ea33..a390711129de64 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -24,10 +24,6 @@
>  #include <asm/processor.h>
>  #include <asm/csr.h>
>
> -typedef struct {
> -	unsigned long seg;
> -} mm_segment_t;
> -
>  /*
>   * low level task data that entry.S needs immediate access to
>   * - this struct should fit entirely inside of one cache line
> @@ -39,7 +35,6 @@ typedef struct {
>  struct thread_info {
>  	unsigned long		flags;		/* low level flags */
>  	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
> -	mm_segment_t		addr_limit;
>  	/*
>  	 * These stack pointers are overwritten on every system call or
>  	 * exception.  SP is also saved to the stack it can be recovered when
> @@ -59,7 +54,6 @@ struct thread_info {
>  {						\
>  	.flags		= 0,			\
>  	.preempt_count	= INIT_PREEMPT_COUNT,	\
> -	.addr_limit	= KERNEL_DS,		\
>  }
>
>  #endif /* !__ASSEMBLY__ */
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 264e52fb62b143..c47e6b35c551f4 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -26,29 +26,6 @@
>  #define __disable_user_access()							\
>  	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
>
> -/*
> - * The fs value determines whether argument validity checking should be
> - * performed or not.  If get_fs() == USER_DS, checking is performed, with
> - * get_fs() == KERNEL_DS, checking is bypassed.
> - *
> - * For historical reasons, these macros are grossly misnamed.
> - */
> -
> -#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
> -
> -#define KERNEL_DS	MAKE_MM_SEG(~0UL)
> -#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
> -
> -#define get_fs()	(current_thread_info()->addr_limit)
> -
> -static inline void set_fs(mm_segment_t fs)
> -{
> -	current_thread_info()->addr_limit = fs;
> -}
> -
> -#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
> -#define user_addr_max()	(get_fs().seg)
> -
>  /**
>   * access_ok: - Checks if a user space pointer is valid
>   * @addr: User space pointer to start of block to check
> @@ -76,9 +53,7 @@ static inline void set_fs(mm_segment_t fs)
>   */
>  static inline int __access_ok(unsigned long addr, unsigned long size)
>  {
> -	const mm_segment_t fs = get_fs();
> -
> -	return size <= fs.seg && addr <= fs.seg - size;
> +	return size <= TASK_SIZE && addr <= TASK_SIZE - size;
>  }
>
>  /*
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 2b97c493427c9e..19225ec65db62f 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -84,7 +84,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	}
>  	regs->epc = pc;
>  	regs->sp = sp;
> -	set_fs(USER_DS);
>  }
>
>  void flush_thread(void)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
