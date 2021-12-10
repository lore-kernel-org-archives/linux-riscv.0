Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF17C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBtZhTMUUod7znT9i7Jox9z/9DudvE8ZUbKFeyY3unk=; b=m2BFz8x00h7zgf
	U6k1gpWvabzHUhLxvAdYWviDKTYna4ILbWu95tN2Z4LB/uPq4vZCtz+OLVAYhWYBvtsoSgEN97XA/
	3/JiarUU0S/A5GFDdTUyTzV0umHyHrjnilHm3Jj/IOHejGdgfEgIv+eaodxnDx3dTNrhoYzLZZqDS
	hICL+wm7WkC+2HYo5GC8i3n/18n0A1/qtBL8GrXyxKHznIe8Or8TbvMbbcOu0R39rUz/8NoRBzr5z
	Q/zBcwTXxVipieE2Yvbj4BJipYnxNZ9ihMXNZjpHBCd47jgOpkfm03H5VO7X2U69VXqJKr/ON0YLh
	oUrhVGLMOjLKbIQDqyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvfhd-001uz4-RH; Fri, 10 Dec 2021 13:12:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvfhc-001uyu-An
 for linux-riscv@bombadil.infradead.org; Fri, 10 Dec 2021 13:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5FONlJM8hw/gQTawNHcRISE0snN2sXVcBQBbOBF9P+0=; b=fq3q+OG6zqjJVCvQf7rwGpHGZS
 lu5q7ZuIsYPxe+z70GyJ+4Oui3tNnIXZYuQaKz7nFGJ3Q5UVHdrW8eTZsdjXHI1voIaH3bN1IP+xX
 0IRK/+M1unoDWMKZ02zQE+DmBpU9TfawiruMiYmzN0B6r+9cuze1Gexp5r4H67ayP/WMkmHyfgCxZ
 PZuHFyLweU4Vo0EhC86QM9sD3KDxsq+89Xxs7vmsBd47bOM2yeXGkugYuCQuI6FD/Qn0uTwAhLUhj
 B1FuoYeg645kywiQkVs4RcQkz+kz8SdT63jpgXb2YFB8Tp+OIKf1iKAs0wFfE1ueyaBdHUDhBcHDT
 7Xj67dmQ==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvfhZ-000ZAT-92; Fri, 10 Dec 2021 13:12:41 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id F1419405D8; Fri, 10 Dec 2021 10:12:37 -0300 (-03)
Date: Fri, 10 Dec 2021 10:12:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Davidlohr Bueso <dbueso@suse.de>
Cc: linux-kernel@vger.kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 alistair23@gmail.com, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/6] perf bench futex: Add support for 32-bit systems
 with 64-bit time_t
Message-ID: <YbNSRcSrAaurqDEv@kernel.org>
References: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
X-Url: http://acmel.wordpress.com
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

Em Fri, Dec 10, 2021 at 09:58:52AM +1000, Alistair Francis escreveu:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> time_t and as such don't have the SYS_futex syscall. This patch will
> allow us to use the SYS_futex_time64 syscall on those platforms.
> 
> This also converts the futex calls to be y2038 safe (when built for a
> 5.1+ kernel).
> 
> This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
> "Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".
> 
> The original commit was reverted as including linux/time_types.h would
> fail to compile on older kernels. This commit doesn't include
> linux/time_types.h to avoid this issue.

The reverted commit had:

    Reviewed-by: Arnd Bergmann <arnd@arndb.de>
    Acked-by: Davidlohr Bueso <dbueso@suse.de>

Does that stands for this new patch?

Thanks,

- Arnaldo
 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Alistair Francis <alistair23@gmail.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Jiri Olsa <jolsa@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-riscv@lists.infradead.org
> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  tools/perf/bench/futex.h | 52 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
> index ebdc2b032afc..385d2bdfaa9f 100644
> --- a/tools/perf/bench/futex.h
> +++ b/tools/perf/bench/futex.h
> @@ -8,6 +8,7 @@
>  #ifndef _FUTEX_H
>  #define _FUTEX_H
>  
> +#include <errno.h>
>  #include <unistd.h>
>  #include <sys/syscall.h>
>  #include <sys/types.h>
> @@ -28,7 +29,17 @@ struct bench_futex_parameters {
>  };
>  
>  /**
> - * futex_syscall() - SYS_futex syscall wrapper
> + * This is copied from linux/time_types.h.
> + * We copy this here to avoid compilation failures when running
> + * on systems that don't ship with linux/time_types.h.
> + */
> +struct __kernel_old_timespec {
> +	__kernel_old_time_t	tv_sec;		/* seconds */
> +	long			tv_nsec;	/* nanoseconds */
> +};
> +
> +/**
> + * futex_syscall() - __NR_futex syscall wrapper
>   * @uaddr:	address of first futex
>   * @op:		futex op code
>   * @val:	typically expected value of uaddr, but varies by op
> @@ -49,14 +60,49 @@ static inline int
>  futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
>  	      volatile u_int32_t *uaddr2, int val3, int opflags)
>  {
> -	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
> +#if defined(__NR_futex_time64)
> +	if (sizeof(*timeout) != sizeof(struct __kernel_old_timespec)) {
> +		int ret = syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout,
> +				  uaddr2, val3);
> +	if (ret == 0 || errno != ENOSYS)
> +		return ret;
> +	}
> +#endif
> +
> +#if defined(__NR_futex)
> +	if (sizeof(*timeout) == sizeof(struct __kernel_old_timespec))
> +		return syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
> +
> +	if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
> +		struct __kernel_old_timespec ts32;
> +
> +		ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
> +		ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
> +
> +		return syscall(__NR_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
> +	} else if (!timeout) {
> +		return syscall(__NR_futex, uaddr, op | opflags, val, NULL, uaddr2, val3);
> +	}
> +#endif
> +
> +	errno = ENOSYS;
> +	return -1;
>  }
>  
>  static inline int
>  futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
>  			 volatile u_int32_t *uaddr2, int val3, int opflags)
>  {
> -	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
> +#if defined(__NR_futex_time64)
> +	int ret =  syscall(__NR_futex_time64, uaddr, op | opflags, val, nr_requeue,
> +			   uaddr2, val3);
> +	if (ret == 0 || errno != ENOSYS)
> +		return ret;
> +#endif
> +
> +#if defined(__NR_futex)
> +	return syscall(__NR_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
> +#endif
>  }
>  
>  /**
> -- 
> 2.31.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
