Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020D1C10DAA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F3121D40
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 04:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VkrlqEJ4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="gt2ptyzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F3121D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZX/UW9IF1rJn5R/V/LiIZJg5exlOGoouqe1A6UiVqHc=; b=VkrlqEJ44f7f6L9kwRxJn+OOx
	FgwqLsa3oOKYd74hQBvb0IJoNUlbYZcY8NPeTsFh9b0UvWnqRIbvqpb03qqwNVuz/H9QajM7xexJ2
	esUXeqVSvPDgWaXW6RdWMFCrx/tdL9eCY4xiq1L2HBA7gBeNWejU+xzObj1qxM6JLFZLLx49psDdS
	MTUTF3XWJAU4SAhszCq78FWLwa7PXiFlUQjVfeKwCG79AeWDsgJ3n2ps9FbLS6m8jYD2Z8CXrLvaQ
	6+bdGbn36h9V5DVsGsfZ0wn0pHluEG4uNPO5te0ThmucRbHU/DIr56/+8UHRJMSINqjfFFZtwJFSQ
	4mRtVUJPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFsCg-0000Mk-RQ; Wed, 09 Sep 2020 04:59:30 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFsCd-0000LG-Ps
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 04:59:28 +0000
Received: by mail-pf1-x444.google.com with SMTP id l126so1093565pfd.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lzl1nSqPEjvQ3P6IDrY13pelwMPXHe0DcJfFr0dx4o0=;
 b=gt2ptyzv2ItTIpWBA0/oN6tSIk6OUk6cOoPmRPr9hsur5LdyWRyP//DDdOadHbY0H7
 d6irVWl5BOTFP2ut9oPfBSu7s92umv3jMLa202XMQmXXvWs372sFv+f+BOkZ8WjzVnRt
 jBwS5f27WcP+lbjcRcQlcSpkHTq1R03zDC3GULMg60XPVJEFO9BGBZCgEbvqzOOZyVQY
 GnXDdsHLh04gF598ciKuZ1gtpe7cTbDE3iKO+oNitxCN4Z2FmtyvzhIwLe9jRTLWn3Y0
 4CT5Juyn9k8i0V3dgQVrUIAd9XmzpWRTCS3mqzssOn0xYbBvXVLN7avQcGb2t8R/xa7q
 u0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lzl1nSqPEjvQ3P6IDrY13pelwMPXHe0DcJfFr0dx4o0=;
 b=rWcL2w1h85pokdx9ZbZvcf0zwXoHDe/dSZE9RLmAQU2aJLgOReMUndGSF5mBmnlNNV
 GxM7XmB9vLq/wjT3bGZsgA+T0aTKsNrZi+QqY1KJ67Pi2Ig546181+LkoO7hgGNneKXQ
 DgBq5dWqhb8EjY7to2ou4yjv5LaA8m9olh7fTP/CPJLQcZ7Qr67iGiyblU1kU1XXCnBI
 wIeNdoGo2ntZw6h9dJdr5RaRrCrPBtpab4y8uZozf/oDkUFmmCxQgbXLPrgNHo2BB0kl
 B8nF4+vqehrFM33YdbRAqNfYphW6p8YvyOpMmKywx+n2wUNREhahQj889gHtVwyCLVeX
 jz+A==
X-Gm-Message-State: AOAM532pia1ON88k67bSNioVMJth8+RMB2JWr2LoDMQM4dm0VPd+9R6A
 XCCB2/0b+cQ3lonY579JYvfnYA==
X-Google-Smtp-Source: ABdhPJxfdYGYwS7HdGn7Zame0oZeEcDOohwbP50ya7FCE+hsBnnfqPe4WNacmhnhsvI/Absvu7VVdQ==
X-Received: by 2002:a62:ab06:: with SMTP id p6mr2016830pff.131.1599627565164; 
 Tue, 08 Sep 2020 21:59:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y29sm1115400pfq.207.2020.09.08.21.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 21:59:24 -0700 (PDT)
Date: Tue, 08 Sep 2020 21:59:24 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 21:42:29 PDT (-0700)
Subject: Re: [PATCH 5/8] riscv: use memcpy based uaccess for nommu again
In-Reply-To: <20200907055825.1917151-6-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-05de1a3d-fcf4-4a1a-949f-a59f91678f58@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_005927_842402_BCDA4D52 
X-CRM114-Status: GOOD (  21.84  )
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

On Sun, 06 Sep 2020 22:58:22 PDT (-0700), Christoph Hellwig wrote:
> This reverts commit adccfb1a805ea84d2db38eb53032533279bdaa97.
>
> Now that the generic uaccess by mempcy code handles unaligned addresses
> the generic code can be used for all RISC-V CPUs.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/uaccess.h | 36 ++++++++++++++++----------------
>  arch/riscv/lib/Makefile          |  2 +-
>  3 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 07d53044013ede..460e3971a80fde 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -87,6 +87,7 @@ config RISCV
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select SET_FS
> +	select UACCESS_MEMCPY if !MMU
>
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index f56c66b3f5fe21..e8eedf22e90747 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -13,24 +13,6 @@
>  /*
>   * User space memory access functions
>   */
> -
> -extern unsigned long __must_check __asm_copy_to_user(void __user *to,
> -	const void *from, unsigned long n);
> -extern unsigned long __must_check __asm_copy_from_user(void *to,
> -	const void __user *from, unsigned long n);
> -
> -static inline unsigned long
> -raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> -{
> -	return __asm_copy_from_user(to, from, n);
> -}
> -
> -static inline unsigned long
> -raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> -{
> -	return __asm_copy_to_user(to, from, n);
> -}
> -
>  #ifdef CONFIG_MMU
>  #include <linux/errno.h>
>  #include <linux/compiler.h>
> @@ -385,6 +367,24 @@ do {								\
>  		-EFAULT;					\
>  })
>
> +
> +unsigned long __must_check __asm_copy_to_user(void __user *to,
> +	const void *from, unsigned long n);
> +unsigned long __must_check __asm_copy_from_user(void *to,
> +	const void __user *from, unsigned long n);
> +
> +static inline unsigned long
> +raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	return __asm_copy_from_user(to, from, n);
> +}
> +
> +static inline unsigned long
> +raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> +{
> +	return __asm_copy_to_user(to, from, n);
> +}
> +
>  extern long strncpy_from_user(char *dest, const char __user *src, long count);
>
>  extern long __must_check strlen_user(const char __user *str);
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 0d0db80800c4ed..47e7a82044608d 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -2,5 +2,5 @@
>  lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
> -lib-y			+= uaccess.o
> +lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
