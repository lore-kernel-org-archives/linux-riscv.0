Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF10C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 16:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503466113B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 16:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 503466113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LXvUa6XJsLj94ceQsB095vj3rl4EWGYJ9rYgOiP1DU=; b=HDu25BCGkGfiAd
	jDovxxOPIIqoFVk3Aig3OoTswdFMTus8Eais1IX6IX9meOj88HM9cyUXXnkPbhCvDrWeiDEq73zRB
	XXBvWFIjCf+VS8KPvbHHCUs9vElx2Ukb8+jvPnlGY2J73vzrBjaqlN4p7OMgae8Nhy04qpIpDn+et
	Gwodu6AvY4yRUkCWvcuWaGaLhvh8R54Uw5h5FvK434P9EAaWqPsVztZ2lrQhfYrJVNoaB6nDCbR4Z
	nFq6zTged05vlsGAY1F0GAtk+UhtPkbOV5yoLgx6jmtBC7prossZSZlwc4/ZiA16YZ6i1MW0IqgSj
	6DW0tGe1JO77MdducnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcsPn-0023bs-2U; Tue, 19 Oct 2021 16:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcsPm-0023bQ-F2
 for linux-riscv@bombadil.infradead.org; Tue, 19 Oct 2021 16:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VxC7XYAjzmlhlT7F20Z2kfib8cAVAY8N7CbD+2h9SJs=; b=bFMp9xfQt+rW/ry3zd9u4ihrgq
 jRsM43xe5lA9LAswZmgxpSPlft4tPt9S3pVUA0c8sxUg0zenQTGkR3TV0SqrEVv9oIiLXL/SBuJRD
 2BM7ZyuEGO54oxCk593yHxBYaIC1ujVqDBXh0GfljVCIaOOR44o4nlfZxNdYEsy7ozV6JAUMWKCeS
 oueGPfY9blTwpmpl43Tw9CjLtpcNf4S0sV4dno7K33XK57gBHFKit620PivHiYfaDcBrU8Z78kZuM
 ojnunCGOIo3KQphnFP3vHZNNz04lSvrJUl8YtEFO41ZsQ1o6MeqXjvIYFmHoxiPwmTVTvRKaTLV1x
 wQpC8e4w==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcsPj-00Anlo-JW; Tue, 19 Oct 2021 16:56:36 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id E68B8410A1; Tue, 19 Oct 2021 13:56:32 -0300 (-03)
Date: Tue, 19 Oct 2021 13:56:32 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, alistair23@gmail.com,
 namhyung@kernel.org, jolsa@redhat.com,
 alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 dave@stgolabs.net, dvhart@infradead.org, peterz@infradead.org,
 mingo@redhat.com, tglx@linutronix.de, atish.patra@wdc.com,
 arnd@arndb.de, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
Message-ID: <YW74wK03ibOS3jVZ@kernel.org>
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
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

Em Fri, Oct 15, 2021 at 10:56:33AM +1000, Alistair Francis escreveu:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Convert tools/perf to only use a 64-bit time_t. On 64-bit architectures
> this isn't a functional change. On 32-bit architectures we now only
> perform 64-bit time_t syscalls (__NR_futex_time64) and use a struct
> timespec64.
> 
> This won't work on kernels before 5.1, but as perf is tied to the kernel
> that's ok.

No, perf is not tied to the kernel, one can use a new perf tool on any
previous kernel, and an old perf tool should work on new kernels as
well.

- Arnaldo
 
> This allows us to build perf for 32-bit architectures with 64-bit time_t
> like RISC-V 32-bit.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tools/perf/bench/futex.h | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
> index b3853aac3021c..b9665d43d2988 100644
> --- a/tools/perf/bench/futex.h
> +++ b/tools/perf/bench/futex.h
> @@ -12,6 +12,7 @@
>  #include <sys/syscall.h>
>  #include <sys/types.h>
>  #include <linux/futex.h>
> +#include <linux/time_types.h>
>  
>  struct bench_futex_parameters {
>  	bool silent;
> @@ -27,12 +28,14 @@ struct bench_futex_parameters {
>  	unsigned int nrequeue;
>  };
>  
> +#define timespec64 __kernel_timespec
> +
>  /**
>   * futex() - SYS_futex syscall wrapper
>   * @uaddr:	address of first futex
>   * @op:		futex op code
>   * @val:	typically expected value of uaddr, but varies by op
> - * @timeout:	typically an absolute struct timespec (except where noted
> + * @timeout:	typically an absolute struct timespec64 (except where noted
>   *		otherwise). Overloaded by some ops
>   * @uaddr2:	address of second futex for some ops
>   * @val3:	varies by op
> @@ -47,15 +50,26 @@ struct bench_futex_parameters {
>   * These argument descriptions are the defaults for all
>   * like-named arguments in the following wrappers except where noted below.
>   */
> -#define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> -	syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +/**
> + * We only support 64-bit time_t for the timeout.
> + * On 64-bit architectures we can use __NR_futex
> + * On 32-bit architectures we use __NR_futex_time64. This only works on kernel
> + * versions 5.1+.
> + */
> +#if __BITS_PER_LONG == 64
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +	syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#else
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +	syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#endif
>  
>  /**
>   * futex_wait() - block on uaddr with optional timeout
>   * @timeout:	relative timeout
>   */
>  static inline int
> -futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflags)
> +futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec64 *timeout, int opflags)
>  {
>  	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
>  }
> @@ -74,7 +88,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
>   * futex_lock_pi() - block on uaddr as a PI mutex
>   */
>  static inline int
> -futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
> +futex_lock_pi(u_int32_t *uaddr, struct timespec64 *timeout, int opflags)
>  {
>  	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
>  }
> @@ -111,7 +125,7 @@ futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wak
>   */
>  static inline int
>  futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
> -		      struct timespec *timeout, int opflags)
> +		      struct timespec64 *timeout, int opflags)
>  {
>  	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
>  		     opflags);
> -- 
> 2.31.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
