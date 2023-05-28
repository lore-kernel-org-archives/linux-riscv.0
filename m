Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10320C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHlP1e6YVpa8ijL6SUAJXI8bCQfOTwjyNmmqMUOxOxs=; b=Yoo6BojESMREd4
	qr3CwB7+bfGbR7ZStmfMYlWHzQwpxUVlqfQ9BGVSbQ1BrXRyTbqHWgD8TMIHPtmY+VyemG3v2g0EB
	zAgTfhv/1UK9iKnE0ikhAQ9wlYGjU6Ce+vTeR8EE8xvBXgBD8VbmBH/8jheyaYUSsGH/G9Cmeo1fp
	mOaMpDEbjV8u8UsqudrUjJNIKZs/5rzztzNVVHeW5gx/KFL8a7zA9DUjin4j0CV7mrIciuDFwTFNk
	7AbkpxTCyK6K3MKTB+EYPoVoULUZfFiJcopOUfoLBujWuJBbHETWYI8xBg4z64+zmtluUEbA4vceP
	pLewTrW6bCleTPT+7zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Dew-007M4K-1e;
	Sun, 28 May 2023 10:29:58 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Det-007M3n-1M
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 10:29:57 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34SATllc002024;
	Sun, 28 May 2023 12:29:47 +0200
Date: Sun, 28 May 2023 12:29:47 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, thomas@t-8ch.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use
 __NR_ppoll_time64 for rv32
Message-ID: <20230528102947.GH1956@1wt.eu>
References: <83ab9f47-e1ed-463c-a717-26aad6bf2b71@app.fastmail.com>
 <20230528082509.293250-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528082509.293250-1-falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_032956_296941_861D5BB5 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Zhangjin,

On Sun, May 28, 2023 at 04:25:09PM +0800, Zhangjin Wu wrote:
> Just a status update ...
> 
> I'm working on the pure time64 and 64bit off_t syscalls support, it almost
> worked (tested on rv32/64, arm32/64), thanks very much for your suggestions.
> 
> It includes:
> 
> * Based on linux/types.h and
>     * Use 64bit off_t
>     * Use 64bit time_t
>     * the new std.h looks like this
> 
>     typedef uint32_t __kernel_dev_t;
>     
>     typedef __kernel_dev_t          dev_t;
>     typedef __kernel_ulong_t        ino_t;
>     typedef __kernel_mode_t         mode_t;
>     typedef __kernel_pid_t          pid_t;
>     typedef __kernel_uid32_t        uid_t;
>     typedef __kernel_gid32_t        gid_t;
>     typedef __kernel_loff_t         off_t;
>     typedef __kernel_time64_t       time_t;
>     typedef uint32_t                nlink_t;
>     typedef uint64_t                blksize_t;
>     typedef uint64_t                blkcnt_t;
> 
> * Use __kernel_timespec as timespec
> * Use 64bit time_t based struct timeval
>     * Disable gettimeofday syscall completely for 32bit platforms
>         * And disable the gettimeofday_bad1/2 test case too

When you say "disable", you mean "remap", right ? Or do you mean
"break in 2023 code that was expected to break only in 2038 after
the hardware supporting it no longer exists" ?

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
