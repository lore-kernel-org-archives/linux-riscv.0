Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5o+YysIdbTze6Wi8M1yPHAOVhLVxn7rbek07IbB0W0=; b=zVUCSTGw7S1LzN
	18NCDftzm2pinqv6oGpk7TKgJWWltz5iqlnqldpmItdqyt8ia+JkbShlGSE5E8e2LWQKI8oHRSSxI
	GW5k3EbsBjhk4S3FKOG5dhHkZ1kknItAm6J0rmREFSa6/XZknzfeBAA0LruNCHk0KWM2CHqVPOjAo
	MykAKH0l9uJZn9fcwF2PCmd1Y+LnTmxM0dTNBCha13dCN7m+Y4hRyvsuBruPQ1pXSlB+ygcNtZzUe
	tro8ZVwkL/DBZRgDF8dSXich425W6KywX583gK5Y/ctBrACLFu17y6XjLbqDcFMvIOf6HPBmFGSJ0
	e96vDnITIgNUyMX3kAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjF1-002gUi-Pv; Fri, 10 Dec 2021 16:59:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjEi-002gMt-4W; Fri, 10 Dec 2021 16:59:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCDB8B827FA;
 Fri, 10 Dec 2021 16:59:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0827A60C4B;
 Fri, 10 Dec 2021 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1639155545;
 bh=kRdyzfTbRlA8Q6o9ozYIflNqTTqb1/yyQ+Zhl1bc2hI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qehFagygXXv8bbpl27U/7B/DcP1tIA/U/cWnuj39slg4mxEcbhuXFsss1NddlzBIE
 6PkBZYce8BgviUP9YWNtqY/WCPQTLOyw84eVboaBBjEOQla5+S27wj9ObPzqFGeOTI
 VhCCu+m1sjz5CsY/rSDNoqZ/fnHwKR72obNaOkn8=
Date: Fri, 10 Dec 2021 08:59:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-fsdevel@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kdump: vmcore: move copy_to() from vmcore.c to
 uaccess.h
Message-Id: <20211210085903.e7820815e738d7dc6da06050@linux-foundation.org>
In-Reply-To: <1639143361-17773-2-git-send-email-yangtiezhu@loongson.cn>
References: <1639143361-17773-1-git-send-email-yangtiezhu@loongson.cn>
 <1639143361-17773-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_085908_382810_468633EA 
X-CRM114-Status: GOOD (  20.21  )
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

On Fri, 10 Dec 2021 21:36:00 +0800 Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> In arch/*/kernel/crash_dump*.c, there exist similar code about
> copy_oldmem_page(), move copy_to() from vmcore.c to uaccess.h,
> and then we can use copy_to() to simplify the related code.
> 
> ...
>
> --- a/fs/proc/vmcore.c
> +++ b/fs/proc/vmcore.c
> @@ -238,20 +238,6 @@ copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
>  	return copy_oldmem_page(pfn, buf, csize, offset, userbuf);
>  }
>  
> -/*
> - * Copy to either kernel or user space
> - */
> -static int copy_to(void *target, void *src, size_t size, int userbuf)
> -{
> -	if (userbuf) {
> -		if (copy_to_user((char __user *) target, src, size))
> -			return -EFAULT;
> -	} else {
> -		memcpy(target, src, size);
> -	}
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PROC_VMCORE_DEVICE_DUMP
>  static int vmcoredd_copy_dumps(void *dst, u64 start, size_t size, int userbuf)
>  {
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index ac03940..4a6c3e4 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -201,6 +201,20 @@ copy_to_user(void __user *to, const void *from, unsigned long n)
>  	return n;
>  }
>  
> +/*
> + * Copy to either kernel or user space
> + */
> +static inline int copy_to(void *target, void *src, size_t size, int userbuf)
> +{
> +	if (userbuf) {
> +		if (copy_to_user((char __user *) target, src, size))
> +			return -EFAULT;
> +	} else {
> +		memcpy(target, src, size);
> +	}
> +	return 0;
> +}
> +

Ordinarily I'd say "this is too large to be inlined".  But the function
has only a single callsite per architecture so inlining it won't cause
bloat at present.

But hopefully copy_to() will get additional callers in the future, in
which case it shouldn't be inlined.  So I'm thinking it would be best
to start out with this as a regular non-inlined function, in
lib/usercopy.c.

Also, copy_to() is a very poor name for a globally-visible helper
function.  Better would be copy_to_user_or_kernel(), although that's
perhaps a bit long.

And the `userbuf' arg should have type bool, yes?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
