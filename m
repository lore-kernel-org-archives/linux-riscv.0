Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71AFEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzXAvZMaVS5aYjBQrYmn26MvgkqKJD3NCMKL6fR43HQ=; b=jGv/N8qtj8XeKO
	OvwkL7wPdbKCnkUEz/a4qfxC/r2jIJZw+VUhnhIfiqcmJy5Og1WAviujMO6xrTDoGvXTzUnP/0u9T
	tGJ5KTdfy9deXCLnyiNZydRmHq64H9flcJuWAqQfPe49p8Jv4aRKEF52VAzb6Ye2umPOcu7iEE/i0
	2jLSanYa1sUoIUQ14+VapFB67kw8+g19cNY3wLvGYUOeMXtGN+3n6ZOLRK25zZ3kVNULCs2IJNjnV
	sRiYjgyk0zMJFYG83sLcCl/iMB4c4y5tJrroP0ih+v7oJ6cBngyj/f2AKvql0AjEFoKt9QsaviugW
	su2bW3QvJKHgjDCbsv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2sw-00FSAC-1l;
	Wed, 21 Jun 2023 18:48:54 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2ss-00FS5u-1R
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:48:52 +0000
Date: Wed, 21 Jun 2023 20:48:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1687373324; bh=K7GIk7uEvmoc9FWOicXHtA/QKVy8xu48Me8OQ6sPdtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sndpqHdOhqYDseVfPJKdVYV8EPQpnkKnbMjylWcvseJzuXOOeCFxH/HHGQZw1zETm
	 t5T5zd11sqSxgxI9tDY8MkGBV6S9041mlWP3nmtZdLHrDQRruUxrGFgJMwPsgUOe/3
	 88AcTxzv/nCpQ4WMnVN1lpQp94jcsQ87kc8E7U40=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, david.laight@aculab.com, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 07/10] tools/nolibc: clean up mmap() support
Message-ID: <31d85464-5731-4df6-8fcd-2b0be11eac90@t-8ch.de>
References: <cover.1687187451.git.falcon@tinylab.org>
 <b1162bc16ce5c397e99925e49317756c110e6f1a.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1162bc16ce5c397e99925e49317756c110e6f1a.1687187451.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_114851_126926_D2675017 
X-CRM114-Status: GOOD (  16.61  )
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

On 2023-06-19 23:51:20+0800, Zhangjin Wu wrote:
> Do several cleanups together:
> 
> - Since all supported architectures have my_syscall6() now, remove the
>   #ifdef check.
> 
> - Move the mmap() related macros to tools/include/nolibc/types.h
> 
> - Apply the new __sysret() to convert the calling of sys_map() to
>   oneline code
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h   | 24 +-----------------------
>  tools/include/nolibc/types.h | 11 +++++++++++
>  2 files changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 8a6e16472d54..1c02cec3bcd9 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -624,26 +624,11 @@ int mknod(const char *path, mode_t mode, dev_t dev)
>  	return __sysret(sys_mknod(path, mode, dev));
>  }
>  
> -#ifndef MAP_SHARED
> -#define MAP_SHARED		0x01	/* Share changes */
> -#define MAP_PRIVATE		0x02	/* Changes are private */
> -#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
> -#endif
> -
> -#ifndef MAP_FAILED
> -#define MAP_FAILED ((void *)-1)
> -#endif
> -
>  #ifndef sys_mmap
>  static __attribute__((unused))
>  void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
>  	       off_t offset)

This could return a plain integer type instead to save some casts.
Not sure if API compatibility is guaranteed for the raw sys_ functions.

>  {
> -#ifndef my_syscall6
> -	/* Function not implemented. */
> -	return (void *)-ENOSYS;
> -#else
> -
>  	int n;
>  
>  #if defined(__NR_mmap2)
> @@ -654,20 +639,13 @@ void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
>  #endif
>  
>  	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
> -#endif
>  }
>  #endif
>  
>  static __attribute__((unused))
>  void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
>  {
> -	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
> -
> -	if ((unsigned long)ret >= -4095UL) {
> -		SET_ERRNO(-(long)ret);
> -		ret = MAP_FAILED;
> -	}
> -	return ret;
> +	return (void *)__sysret((unsigned long)sys_mmap(addr, length, prot, flags, fd, offset));
>  }
>  
>  static __attribute__((unused))
> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index f96e28bff4ba..f889d4e0ac7e 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -81,6 +81,17 @@
>  #define MAXPATHLEN     (PATH_MAX)
>  #endif
>  
> +/* flags for mmap */
> +#ifndef MAP_SHARED
> +#define MAP_SHARED		0x01	/* Share changes */
> +#define MAP_PRIVATE		0x02	/* Changes are private */
> +#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
> +#endif
> +
> +#ifndef MAP_FAILED
> +#define MAP_FAILED ((void *)-1)
> +#endif
> +
>  /* whence values for lseek() */
>  #define SEEK_SET       0
>  #define SEEK_CUR       1
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
