Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB80C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:56:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2E7610C7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA2E7610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hh4qn5UgBHuVQ5rXPmyjWje3DsOQn/A+58m2vu/qLVg=; b=OPg/Aj55nzectN
	vN5I+wkujk6s+l2ZPVmrI2ZW+Nhf3wNkpmYK4SBOIac63FlTUj8C40HwhkpYGlPshto96/Ufs0qIc
	kuo0Zej4uFpFx2rbQUqX6CdsGh9ThX8KDEsSZEKb/hbM398K45qamhY0MInzOfwfWXKzw+ytnu2se
	8TcnwDGInkQ6iAnvwEpOLRyl/arM6by5MeH9lsx1OQCVFvVggSiqZ/nS23MblV/HOUESpHhBmdH/z
	G/yZC7r9cRWs+X1xzMTr+H2OdkaChqP97IX+S1iwY1VPlrPYkO0teU7eKmJQRiV3V7xCGyqEgHZVL
	LW4wpWHca3TZbcCtdONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfsmE-006YAj-QF; Wed, 27 Oct 2021 23:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfsmD-006YAW-1S
 for linux-riscv@bombadil.infradead.org; Wed, 27 Oct 2021 23:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uaHP/5CNeknkvdQqlYux9JKbF3Os/NOVgWFL4DmxVqo=; b=BEbjQ7BsDvBQr3vY3WnmnqH21A
 voYEItu/5E9foQ4IdcOEs8DWN/51FUC4KAVDkv0YU1rFuZ/oxH75MmkNiMku5eZu+tStFy2qilxJz
 QdpET5zKnO97HCcl0ifPOTc//wKPcPs2N23guzYK7XVvunSwNWTpIpgsejdBfOw/7YswYfktvN1jq
 JLmUTtnGDdUYQd0r2aTRrWDlsu4gDQYlbNqMtYznsSm/dmpHqxmS9LStRzd8+h7Q9yA1bUXazoeoR
 w+bALvVaMlxAeijtoKZ8nHoRakaVLqmzmed6fgpMtlVfTBkkrLwNbZsZ0aBR0h4dSHKBs3a7wDiM0
 cO6S1PGg==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfsmA-00Ce4b-1E; Wed, 27 Oct 2021 23:56:10 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 69326410A1; Wed, 27 Oct 2021 20:56:06 -0300 (-03)
Date: Wed, 27 Oct 2021 20:56:06 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 dvhart@infradead.org, tglx@linutronix.de,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 namhyung@kernel.org, mingo@redhat.com, atish.patra@wdc.com,
 linux-kernel@vger.kernel.org, arnd@arndb.de, alistair23@gmail.com,
 mark.rutland@arm.com, peterz@infradead.org, dave@stgolabs.net,
 Alistair Francis <alistair.francis@wdc.com>,
 Davidlohr Bueso <dbueso@suse.de>
Subject: Re: [PATCH v5 1/4] perf bench futex: Call the futex syscall from a
 function
Message-ID: <YXnnFj19AnEq4f+g@kernel.org>
References: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
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

Em Fri, Oct 22, 2021 at 11:33:40AM +1000, Alistair Francis escreveu:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> In preparation for a more complex futex() function let's convert the
> current macro into two functions. We need two functions to avoid
> compiler failures as the macro is overloaded.
> 
> This will allow us to include pre-processor conditionals in the futex
> syscall functions.

Thanks, applied both patches.

- Arnaldo

 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  tools/perf/bench/futex.h | 43 ++++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
> index b3853aac3021c..ebdc2b032afc1 100644
> --- a/tools/perf/bench/futex.h
> +++ b/tools/perf/bench/futex.h
> @@ -28,7 +28,7 @@ struct bench_futex_parameters {
>  };
>  
>  /**
> - * futex() - SYS_futex syscall wrapper
> + * futex_syscall() - SYS_futex syscall wrapper
>   * @uaddr:	address of first futex
>   * @op:		futex op code
>   * @val:	typically expected value of uaddr, but varies by op
> @@ -38,17 +38,26 @@ struct bench_futex_parameters {
>   * @val3:	varies by op
>   * @opflags:	flags to be bitwise OR'd with op, such as FUTEX_PRIVATE_FLAG
>   *
> - * futex() is used by all the following futex op wrappers. It can also be
> + * futex_syscall() is used by all the following futex op wrappers. It can also be
>   * used for misuse and abuse testing. Generally, the specific op wrappers
> - * should be used instead. It is a macro instead of an static inline function as
> - * some of the types over overloaded (timeout is used for nr_requeue for
> - * example).
> + * should be used instead.
>   *
>   * These argument descriptions are the defaults for all
>   * like-named arguments in the following wrappers except where noted below.
>   */
> -#define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> -	syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +static inline int
> +futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
> +	      volatile u_int32_t *uaddr2, int val3, int opflags)
> +{
> +	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
> +}
> +
> +static inline int
> +futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
> +			 volatile u_int32_t *uaddr2, int val3, int opflags)
> +{
> +	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
> +}
>  
>  /**
>   * futex_wait() - block on uaddr with optional timeout
> @@ -57,7 +66,7 @@ struct bench_futex_parameters {
>  static inline int
>  futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflags)
>  {
> -	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
> +	return futex_syscall(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
>  }
>  
>  /**
> @@ -67,7 +76,7 @@ futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflag
>  static inline int
>  futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
>  {
> -	return futex(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
> +	return futex_syscall(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
>  }
>  
>  /**
> @@ -76,7 +85,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
>  static inline int
>  futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
>  {
> -	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
> +	return futex_syscall(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
>  }
>  
>  /**
> @@ -85,7 +94,7 @@ futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
>  static inline int
>  futex_unlock_pi(u_int32_t *uaddr, int opflags)
>  {
> -	return futex(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
> +	return futex_syscall(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
>  }
>  
>  /**
> @@ -97,8 +106,8 @@ static inline int
>  futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wake,
>  		 int nr_requeue, int opflags)
>  {
> -	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
> -		 val, opflags);
> +	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
> +					val, opflags);
>  }
>  
>  /**
> @@ -113,8 +122,8 @@ static inline int
>  futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
>  		      struct timespec *timeout, int opflags)
>  {
> -	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
> -		     opflags);
> +	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
> +			     opflags);
>  }
>  
>  /**
> @@ -130,8 +139,8 @@ static inline int
>  futex_cmp_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
>  		     int nr_requeue, int opflags)
>  {
> -	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
> -		     val, opflags);
> +	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
> +					val, opflags);
>  }
>  
>  #endif /* _FUTEX_H */
> -- 
> 2.31.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
