Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971EDCD4F5B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 03:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTbuKFB/uCgEbtTJhtNZU2a319F5FNjuMxdUc15uHBo=; b=xrHZbJ4LfSJgvj
	poyTMa9+OnrWvVPI3xUadDBTm01HY35Ob1CGkLEiknMSfAn6vhn4sJ0JcqaDSTavdpTzXwpG0NPJ9
	66RocAJwuGL8Y3BhWEama23nGKx+nhOlZrGmnaoEXjQBKPvLVWQxNjogCOy6uYXquFGdDqD71/yjk
	2ZTbRQquDw7E3j3Pw+E9l/frcKAfsxz15l4Ai+FPFgfhRQvkydq8GC6EyRy/qE4LnQ8NGxMxulN5K
	VpeViKV2y0hokgOBFigks+4JIyswtp+bqH8hqbtixTBa/n6ALewWmlU9yu7RQ2tVZWUN/XjsvIO5W
	XTmGYk/uzEVCA86lqA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGbM-00000009eFh-0UCU;
	Fri, 22 May 2026 03:31:08 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGbJ-00000009eF1-0svs
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 03:31:06 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-303f2fb7225so5407645eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20251104.gappssmtp.com; s=20251104; t=1779420664; x=1780025464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gtaHIZdTtoWRwcagu2t4Vb/Fs0NvogRICoTuD3wnfwg=;
        b=FOt/B4/DkZVLsNzGyvzlBPwWl42CNv/nTPV/5EmO5GrMCuFll0hkUte91z6TCbEgs0
         dgmA4yP9Tt1Ail3cAcgI/GlnpdzN6+ZT1FDeCv9+oCZMHxtP/sz/qKKJSne/xYXNIB2V
         sTRtWl9zZixloVSPnaXiUb2wl0yn9qu1SXjUz55SyWsXUyIaCBt4NZesrYPhD5KAiP1w
         Hx+75bSKHdZYghNlm9sujfybMXSKmEeY8FJ7r2dwh5CJDTqNOZk6BCQGZrU1tqqQB/wL
         C1LJ8UNq3vu4cqhV/zs+kEfgJP6Axn69vTzODm+k0PY08QchUMe0S55Qw5znoal7uE93
         3cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779420664; x=1780025464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtaHIZdTtoWRwcagu2t4Vb/Fs0NvogRICoTuD3wnfwg=;
        b=SmHvuYkfWj542J7MXsumv1t2zaNsE0we+r/tjaYWead8wY3jmhlqXLoyydllsTK8co
         Y0U0VZkdEvbQQJLUNgK4kQ9DNgk6zJK29jAHNJMM7CU4DG5hzVl9J2YxnSboQ14E8Dki
         dWsvBt0OYm0Y7I2DhefsSkfIAnmCrZ40hDuSnDLOrw2JuTUj2MjnyiGhaRs7+FkLp3X5
         diTNWMlc50aQ31iAM50I6hrdPowQ6OWw/bGHd/olwrA2zPRcXUOlvMiYDDKvTNhTaOir
         yhpZxLnLZ8cOa/6JN1Q/RACm0PX0w+VWdQcbZ+hOnwp1sz85MTp9OcFEoqAlamzM09Oe
         osIg==
X-Gm-Message-State: AOJu0YyWFfngxLQOAw7YyQvTe5EtWxA9Wvv50YzAMc8xCBsT7EWlA/cC
	eusrd+WRFyb4AjYAR47ekgfGiahgf/9toYLZWchBC1q8PFDW+MWh3HvUk4/EGMJz31k=
X-Gm-Gg: Acq92OFnUUzM7QDapS+QhZaHiClov/fUIANmC2nwS9zdIxlVU77qZFDvXq9T5ULP5ui
	jb+a3PUL3K/1MSZ6FTywENSdA6N9LxdwdJLN6zegHrukp4raQkWF9qJzje8nGz4h7d9gbOBtrHv
	iLx7+6j021/MO+J9Ned4aXuIdyYn2c8hqRmv2+exlZOQGUIXwUoKdBtmeEth2qamt3ZdImwFccS
	j/YnE7nvlVxmgREqmUMillQ45EWjsmmEYoRKOEFAuW9AAZtXsQETtlL8TBwIQLRRHmp8JJ+YFBS
	XMZZgUOzUFm0RS4u7UhvBIHtbsVmLJ2m2UwcuBhkp39datTmJqfLHQiMtCADlUC0IGHSz743zkf
	4bf/WmvBWE+b97jD+8U8MdQril9Lop8KNzaT1eu+3eCLn4qw7OZtKJknVl8lLmxDX91/io8xPH1
	OqK22sMrealtDe
X-Received: by 2002:a05:7301:fa8b:b0:2c4:4363:3742 with SMTP id 5a478bee46e88-30448ffc881mr969872eec.9.1779420663873;
        Thu, 21 May 2026 20:31:03 -0700 (PDT)
Received: from localhost ([99.152.116.91])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-30451ef4af0sm30644eec.3.2026.05.21.20.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 20:31:02 -0700 (PDT)
Date: Thu, 21 May 2026 20:30:56 -0700
From: Olof Johansson <olof@lixom.net>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dfustini@oss.tenstorrent.com, bjorn@kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com
Subject: Re: Re: [PATCH v3 0/4] riscv: optimize Vector context restore on
 syscall
Message-ID: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
 <ag9Zu57zc4HhVLeZ@chonkvm.lixom.net>
 <ag90lLMZTg3-AvAs@Tao-Chiu's-Mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag90lLMZTg3-AvAs@Tao-Chiu's-Mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_203105_505634_17DD1F6B 
X-CRM114-Status: GOOD (  44.14  )
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

On Thu, May 21, 2026 at 04:09:40PM -0500, Andy Chiu wrote:
> On Thu, May 21, 2026 at 12:15:07PM -0700, Olof Johansson wrote:
> > Hi Andy,
> > 
> > On Thu, May 21, 2026 at 11:25:16AM -0500, Andy Chiu wrote:
> > > This patch series optimizes riscv vector state handling across syscall
> > > boundaries and context switches. The kernel now keeps track of the
> > > INITIAL state in sstatus.vs to optimize unnecessary context management
> > > operations.
> > > 
> > > This version merges daichengrong's RFC patch [1] for the state tracking
> > > code as it looks cleaner than my v2/v1.
> > > 
> > > [1]: https://lore.kernel.org/linux-riscv/7ba2f4b7-8475-4ec3-ab31-58b332bda47e@iscas.ac.cn/#r
> > > Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/
> > 
> > A patchset like this would be really helped by some kind of numbers in the
> > cover letter to indicate how much performance moved, given a claim of
> > optimization.
> > 
> 
> Thanks for pointing it out, I totally agree with you. I had included a
> test result on sifive's hardware in v2[1]. But that was on FPGA, I will
> test it on a real silicon as soon as I have an access. Sorry for the
> confusing claim here.
> 
> My test was running on a vector enabled version of lat_ctx. I modified
> the main function to make sure the process touches vector, then run with
> 2 threads. Since lat_ctx uses syscall interface to notify another
> process, the kernel will trash their vector registers instead of wasting
> cycles on saving/restoring them.
> 
> > 
> > Just for kicks I tried a simple microbenchmark for syscalls from
> > a vector-enabled process:
> > 
> > #define _GNU_SOURCE
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <sys/syscall.h>
> > #include <unistd.h>
> > #include <time.h>
> > #include <stdint.h>
> > 
> > static inline uint64_t ns_now(void) {
> >     struct timespec t;
> >     clock_gettime(CLOCK_MONOTONIC, &t);
> >     return t.tv_sec * 1000000000ull + t.tv_nsec;
> > }
> > 
> > int main(int argc, char **argv) {
> >     int iters = argc > 1 ? atoi(argv[1]) : 10000000;
> >     int use_v = argc > 2 ? atoi(argv[2]) : 1;
> > 
> >     if (use_v) {
> >         asm volatile(
> >             ".option push\n\t.option arch, +v\n\t"
> >             "vsetivli x0, 1, e32, m1, ta, ma\n\t"
> >             "vmv.v.i v0, 1\n\t"
> >             ".option pop\n\t" ::: "memory");
> >     }
> > 
> >     for (int i = 0; i < 10000; i++) syscall(SYS_getppid);  // warmup
> > 
> >     uint64_t t0 = ns_now();
> >     for (int i = 0; i < iters; i++) syscall(SYS_getppid);
> >     uint64_t t1 = ns_now();
> > 
> >     printf("V=%d %.1f ns/call (%lu ns / %d iters)\n",
> >            use_v, (double)(t1 - t0) / iters, t1 - t0, iters);
> >     return 0;
> > }
> > 
> > 
> > I compiled with gcc -O3, default GCC 14.2 on Debian 13. Host is x280
> > (Blackhole). Base kernel sources is 7.1.0-rc4-next-20260520 defconfig. Ran
> > with taskset to pin to one of the CPUs.
> > 
> > The testcase doesn't use vector inbetween each syscall, but will obviously
> > have initiated the state (if started with '1' as second argument).
> > 
> > Without this patchset:
> > V=1 242.9 ns/call (12144527848 ns / 50000000 iters)
> > 
> > With this patchset:
> > V=1 264.5 ns/call (13226852900 ns / 50000000 iters)
> 
> This 9% regression is suprising to me as this patch set (without the fix
> below) should be equivalent in performance on this code path (and better
> if getpid takes one process switch).
> 
> Before the patch, nulling v resgisters happens at the entry point. After
> this patchset we mark sstatus.vs to INITIAL at the entry and nulling
> happens right before getting back to the user space.
> 
> > 
> > Interestingly enough, with V=0 test it sped up slightly (194.3 -> 189.5 ns).
> > 
> 
> This result is expected as with V=0 the kernel doesn't have to maintain
> vstate at all. But we are also looking into ways to improve mode switch
> latencies.
> 
> > I repeated the runs a few times, with similar results so I don't think it's
> > explainable as noise.
> > 
> 
> Thanks for carrying out the experiment, it's very sound! I actually
> missed one thing on this patch for it to be optimized on this specific
> case:
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 8c1e64e0dd0b..5d1282870a20 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -40,6 +40,15 @@
>  	_res;								\
>  })
>  
> +#define __riscv_v_vstate_check_gt(_val, TYPE) ({			\
> +	bool _res;							\
> +	if (has_xtheadvector()) 					\
> +		_res = ((_val) & SR_VS_THEAD) > SR_VS_##TYPE##_THEAD;	\
> +	else								\
> +		_res = ((_val) & SR_VS) > SR_VS_##TYPE;			\
> +	_res;								\
> +})
> +
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool insn_is_vector(u32 insn_buf);
> @@ -323,7 +332,7 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
>  
>  static inline void riscv_v_vstate_discard(struct pt_regs *regs)
>  {
> -	if (riscv_v_vstate_query(regs)) {
> +	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
>  		riscv_v_vstate_set_restore(current, regs);
>  		riscv_v_vstate_init(regs);
>  	}
> 
> In this way if the user never touch vregs again then we will not null
> out the context at syscall exit.

Significantly better indeed, now ~191ns without vector, ~192ns with -- so
a proper optimization.

> Again, I only have it functionally tested at the moment. I appreciate it
> if you could get the number with the above diff. Meanwhile, I am going
> souce and run on an actual hardware and hopefully find the reason for
> the above regression, before rolling out v4.

Sounds good.



-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
