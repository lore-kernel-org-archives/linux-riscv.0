Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64BEC2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 14:39:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23FB6206E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 14:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a7J02iYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23FB6206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3xjeSTVhT+35dyo19gPDz3OAv7N0bNdeDriWcyDeNQ=; b=a7J02iYBfQe7SBioFBETJ3VCn
	QmVXCDkSqJ5QOAu2SaM7onP/OVJp6tkDI6WHxIY0UAE3pMG3LIk1ud2uYSybxe4GPJU2+evUnLE1z
	50kuTAP/TygudBhog2YZrvzKjHHfvqZWmWtRMWoDwFEYHwHR9z/P65pZVgEDYPdJa3Ey6Me4MftKV
	APFzPH5iYw04YelZyKr8vvU6B92BY+jwrwY+XzvOQORZu8TAOQkreO9DWPLDoG2bV4tYw2LVkzt9B
	d+cCGigJd58kob10p2avMZU37z2He21YQXl70lIpQyAQx8DsEjYrMpR2db51c2LcJmCdacdB5wVUs
	aqS4pDHgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZTj-0004C3-Ce; Tue, 24 Nov 2020 14:39:35 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZTh-0004Bj-Bh; Tue, 24 Nov 2020 14:39:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EFED53012DF;
 Tue, 24 Nov 2020 15:39:31 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D902820222D65; Tue, 24 Nov 2020 15:39:31 +0100 (CET)
Date: Tue, 24 Nov 2020 15:39:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
Message-ID: <20201124143931.GI2414@hirez.programming.kicks-ass.net>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606225437-22948-2-git-send-email-guoren@kernel.org>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, arnd@arndb.de, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 01:43:54PM +0000, guoren@kernel.org wrote:
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 59dd7be..6f5f438 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -6,3 +6,6 @@ generic-y += kvm_para.h
>  generic-y += local64.h
>  generic-y += user.h
>  generic-y += vmlinux.lds.h
> +generic-y += mcs_spinlock.h
> +generic-y += qrwlock.h
> +generic-y += qspinlock.h
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 5609185..e178700 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -16,7 +16,43 @@
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(new) __new = (new);					\
>  	__typeof__(*(ptr)) __ret;					\
> +	register unsigned long __rc, tmp, align, addr;			\
>  	switch (size) {							\
> +	case 2:								\
> +		align = ((unsigned long) __ptr & 0x3);			\
> +		addr = ((unsigned long) __ptr & ~0x3);			\
> +		if (align) {						\
> +		__asm__ __volatile__ (					\
> +			"0:	lr.w %0, 0(%z4)\n"			\
> +			"	move %1, %0\n"				\
> +			"	slli %1, %1, 16\n"			\
> +			"	srli %1, %1, 16\n"			\
> +			"	move %2, %z3\n"				\
> +			"	slli %2, %2, 16\n"			\
> +			"	or   %1, %2, %1\n"			\
> +			"	sc.w %2, %1, 0(%z4)\n"			\
> +			"	bnez %2, 0b\n"				\
> +			"	srli %0, %0, 16\n"			\
> +			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
> +			: "rJ" (__new), "rJ"(addr)			\
> +			: "memory");					\
> +		} else {						\
> +		__asm__ __volatile__ (					\
> +			"0:	lr.w %0, (%z4)\n"			\
> +			"	move %1, %0\n"				\
> +			"	srli %1, %1, 16\n"			\
> +			"	slli %1, %1, 16\n"			\
> +			"	move %2, %z3\n"				\
> +			"	or   %1, %2, %1\n"			\
> +			"	sc.w %2, %1, 0(%z4)\n"			\
> +			"	bnez %2, 0b\n"				\
> +			"	slli %0, %0, 16\n"			\
> +			"	srli %0, %0, 16\n"			\
> +			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
> +			: "rJ" (__new), "rJ"(addr)			\
> +			: "memory");					\
> +		}							\
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"	amoswap.w %0, %2, %1\n"			\

I'm pretty sure there's a handfull of implementations like this out
there... if only we could share.

Anyway, this too should be an independent patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
