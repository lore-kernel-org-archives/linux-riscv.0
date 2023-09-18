Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA751CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDxzLbFrs5b6nfhHTFDCbQ5sguSO34nZc8u99mCK82A=; b=fLD3/9iDGGXKWz
	en920euv0P5XF69+QzpIJKNXqGWZuvgvJqtMZdNcb4IEsL0SygvU0l3s7Sk3fO2I7nDwQzjtorYgE
	S0SGvLZYFg7pkAMdn6//MlHbOFDMC8xooJtx0YZU3M6qPAxILZB1fVstaCjhbXZZilP7/SdCs5Bla
	yr5s8TIcN30RtGd32rI1HhU7YfPe4AJ5qtNKjo6K1HNlNTFqNwufaSq4P5++BRhMFHmZkzVvhXxvx
	wkMhL7pxhrsiMOQ8RGVbyZhuhrzV7Lef5BMljSD8npsIchHyxzirSqEbHIgm5Rgp8j3VB7n1iKWxx
	DUqhp0un6JWYg0htVACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGyR-00FrBS-2A;
	Mon, 18 Sep 2023 16:19:47 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGyN-00Fr8e-0S
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 16:19:45 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 38IGJFHZ028574;
	Mon, 18 Sep 2023 18:19:15 +0200
Date: Mon, 18 Sep 2023 18:19:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <ZQh4gwcxvqgn/9Nh@1wt.eu>
References: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
 <20230917-nolibc-syscall-nr-v2-2-03863d509b9a@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917-nolibc-syscall-nr-v2-2-03863d509b9a@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_091944_189309_FD0B3CF4 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Sun, Sep 17, 2023 at 05:36:17PM +0200, Thomas Wei=DFschuh wrote:
> The ENOSYS fallback code does not use its functions parameters.
> This can lead to compiler warnings about unused parameters.
> =

> Explicitly avoid these warnings.
> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> ---
>  tools/include/nolibc/sys.h | 44 +++++++++++++++++++++++++++-------------=
----
>  1 file changed, 27 insertions(+), 17 deletions(-)
> =

> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index b478750c9004..8389820e1928 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -43,6 +43,16 @@
>  		: __sysret_arg;                         /* return original value */ \
>  })
>  =

> +/* Syscall ENOSYS helper: Avoids unused-parameter warnings and provides a
> + * debugging hook.
> + */
> +
> +static __inline__ int __nolibc_enosys(const char *syscall, ...)
> +{
> +	(void)syscall;
> +	return -ENOSYS;
> +}
> +
>  =

>  /* Functions in this file only describe syscalls. They're declared stati=
c so
>   * that the compiler usually decides to inline them while still being al=
lowed
> @@ -133,7 +143,7 @@ int sys_chmod(const char *path, mode_t mode)
>  #elif defined(__NR_chmod)
>  	return my_syscall2(__NR_chmod, path, mode);
>  #else
> -	return -ENOSYS;
> +	return __nolibc_enosys(__func__, path, mode);
>  #endif
>  }
(...)

It's much cleaner like this.

Acked-by: Willy Tarreau <w@1wt.eu>

Feel free to push the whole series to the next branch.

Thank you!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
