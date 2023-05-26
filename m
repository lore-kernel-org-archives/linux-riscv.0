Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B437C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXP3fLh9K3msy/7IdV5zoCCEsrfSBdlfkupZoIwHecs=; b=QdMcrty33ygnrP
	0AHjsAHZnOlZT95FjSX8gRqP081AqVWGu1uSg2KfY3luUQfL2xFWa9ssSmz9RlmVnb6FvCasU+WEc
	bxwbiCZQp9XwEcU4v3C/dltecFY7BqoZRyK3G8w+6kOe5g5qrO+ISxEqJYiCSzV+PkfvBpWQMFx8D
	mZ9/hbwJgpL1UaEYW0Hp5hnSW3xIy4YkyDfO0elfC1JBtNYFiVKcVkiV4R04xyQFqmkVt8PvFdZUf
	FivI08IG44y/XLqCpMs+P7PYBYa7NQVS/5cqF+vH2f5fErL6AB2owQnS9WJlv75tNI2cB9UGTKlb3
	l8/tkGMVAREV7mLBkarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RfT-001Nn8-0e;
	Fri, 26 May 2023 07:15:19 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RfQ-001Nlj-11
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 07:15:17 +0000
Date: Fri, 26 May 2023 09:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685085311; bh=rEZjZ7jb112xctWDeTzmzbvGkTYxGoBvCV4K9U7x4Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDvP36KkQDB/msyE6X9PkQOMhUADIby45vq3TxdlP5SKnqWYJYDKLVN8940oQU5Xt
	 snRCrStgmWdheBAeetdgxvwrS6ajR/r5rPA4tzQti1PzuSXiD8iotOU/IwPy5jWEGH
	 oYRiMtqWVGPA3rl4VZwFBnzyj9pg3Xv74JBjLkqs=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use
 __NR_ppoll_time64 for rv32
Message-ID: <78d91061-1bcd-4031-89e1-706c3f49d762@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <ec5af2ae25264eddce4b50380bfd24f9490eca75.1684949268.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5af2ae25264eddce4b50380bfd24f9490eca75.1684949268.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_001516_534120_3DAD8881 
X-CRM114-Status: GOOD (  17.87  )
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

On 2023-05-25 01:57:24+0800, Zhangjin Wu wrote:
> rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> __NR_ppoll after kernel commit d4c08b9776b3 ("riscv: Use latest system
> call ABI"), use __NR_ppoll_time64 instead.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/std.h   | 1 +
>  tools/include/nolibc/sys.h   | 7 ++++++-
>  tools/include/nolibc/types.h | 6 ++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
> index 83c0b0cb9564..221385c0e823 100644
> --- a/tools/include/nolibc/std.h
> +++ b/tools/include/nolibc/std.h
> @@ -32,6 +32,7 @@ typedef   signed long         off_t;
>  typedef   signed long     blksize_t;
>  typedef   signed long      blkcnt_t;
>  typedef   signed long        time_t;
> +typedef     long long       time64_t;
>  typedef     long long        loff_t;
>  
>  #endif /* _NOLIBC_STD_H */
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 0ff77c0a06d7..08d38175bd7b 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -923,8 +923,13 @@ int pivot_root(const char *new, const char *old)
>  static __attribute__((unused))
>  int sys_poll(struct pollfd *fds, int nfds, int timeout)
>  {
> -#if defined(__NR_ppoll)
> +#if defined(__NR_ppoll) || defined(__NR_ppoll_time64)
> +#ifdef __NR_ppoll
>  	struct timespec t;
> +#else
> +	struct timespec64 t;
> +#define __NR_ppoll __NR_ppoll_time64
> +#endif
>  
>  	if (timeout >= 0) {
>  		t.tv_sec  = timeout / 1000;
> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index 15b0baffd336..ee914391439c 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -203,6 +203,12 @@ struct stat {
>  	time_t    st_ctime;   /* time of last status change */
>  };
>  
> +/* needed by time64 syscalls */
> +struct timespec64 {
> +	time64_t	tv_sec;		/* seconds */
> +	long		tv_nsec;	/* nanoseconds */
> +};

A question to you and Willy, as it's also done the same for other types:

What is the advantage of custom definitions over using the one from the
kernel (maybe via a typedef).

From linux/time_types.h:

struct __kernel_timespec {
	__kernel_time64_t tv_set;
	long long tv_nsec;
};

> +
>  /* WARNING, it only deals with the 4096 first majors and 256 first minors */
>  #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
>  #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
