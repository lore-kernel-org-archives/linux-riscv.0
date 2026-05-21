Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D350DCD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8Uj9XF29t93DlOvDR1z3Z5hbOf/fpiz6QxBIXAfnAM=; b=N5XzA8jlglWMP1
	Iv8SGfJC1xrQnMSy+0lRXUJX4PLZ1m2F+DeqkN3wTwyASJm5RR6VFA9HEIYipuhab54lvPIGzXbhH
	rOfnPRW5ZcZZXBrFUv1vQtTnSfK2Ko0Ym+jA2mxXZG1IjJwUjePSB42RVPtmvOxz8SwlQyzFogmNH
	8vlMolGzg9V+hM3tnZgZ9sR206Vz3IIvp2Pt7EsE74jj9qVBIcusxa0aOSiLTPYQF6jRIIi15MWLi
	AXt7YaxSjQvdjB4uaJUZIbiH3sCSXR+kZg8OamahPxSTnckrujXJlc5NWHd8YYTJ1ZRmkqM4eYDZX
	TeawpKDSz3JKrwXFbtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAeI-00000009676-2XJ6;
	Thu, 21 May 2026 21:09:46 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAeF-0000000966H-3nNi
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 21:09:45 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7c52e49d978so68830687b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779397782; x=1780002582; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnwTtzxvzHH7n2Zx46WfpIsLRrMwnSk8ge5NDUU/LRw=;
        b=gGbKowKtJhb/CpnYtwa6Yh/yK5UL4a93rXMsPAFMhZ6skD08dUSeM1xJGkcZKZvXA5
         hDuq8GvBIEn8vR7tTZ0S/O+x+puL9HwGkb7cgZcS/16rGSg0p+kDuBTgQnyi6Wn8P5Ff
         q4PVHqyiIa8OBOurKCxmbMIyHzqfGEL4L5gnB87ir084tYjknjvUTDm1OdKPOxbhGw/N
         lpjyV2dUyRd4Ly43RSIojVtxFRUQlCiapBm3GKhDFDTu65TRLDekP4T9XlZo2D+Jnz0G
         8Gy/12jvhgz4ee6jL2OinbfREVEuoLdZEs1JDchCf4ws1DcIIIjo8My1Ff8TIeimUpHV
         EpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397782; x=1780002582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnwTtzxvzHH7n2Zx46WfpIsLRrMwnSk8ge5NDUU/LRw=;
        b=O1DdyWLy4deVgW5WqfdGJzkrVhQJ3DCLN5FbltYJawdzsuhFtpFBUACeMAr9kUC3I2
         4KjckYLFq34Buk6G/CXhgKUxGDsKaNY8sCTmR3Bjy2DSYm0Lok5cfdFYKbNv9Y4MYRYo
         doHyfL6g0wF8Z1FHrq5qsjULqLlbaIQzSrBw1mjtNXATCuxz9+vgMMjE2BFU5Y31YASw
         uiHGftL7gL10qLhmWHV1t/fUvdtQUbBvLHFhdF9tuZklXG0EPQ3hJwy8q20ZCtJ2waPe
         KmAQf3JfJF3YEENWZS09U7ZeUU2pD6VnAGql7ujmhtFClErl5jDIq8ZSfF/P2TgCItVI
         KyJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9APT8w7JgthzYsgVmn/R8LzAT55eQDVUqdlOR75ZJfewlOsr12myTTo4I4ynIBOZdtzknaEkt5Kr4Bxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YweGPDfXJ6mz6lpeVBzMWwFWL1ks6bgdHzUlkJxl8HVFnQ3SYY0
	6Aba776xifSRLfmIIZkCcf4j6GXEibqz9+bd2zLeZ/BKy0oxnMokxyhNL3OC94gFa2E=
X-Gm-Gg: Acq92OG1EEksWQM0/fx1mUpEdUeNu7C+e/2vvBMWfdpl3kJUZk4BhfQbdYMybhelVg6
	OtMaH0bbaeeyIVDr+IIMWLOvLEqemqdpL8sAnYf+OfwmPsY96du7kE2Z7yFSmxiPb+pep5P7EbB
	VlsVuSvLaqJRh/0VbfGljY3DCuRnu8D3f66JyzOM2xvHvP32gFfOc4cw/6YussufE7ksCdGlwz1
	tNnFNzzzXlxH36K/Niyg5s8cGSyUvW2m0fq0cBRhVCVVgxbeEOQw3rnTRlUAwLzXyD6R17q4oY0
	9oCBXXtuToQkNf3twO/HNJ0DPpRVN+YzDN3CrUxy0EYq21QNq9Vla8PsvyqW0FmwvDSw2n22uYy
	LDQrwoi2MMe8hTAu9+DMQHZpCV9GgIj64fsAp4zoiSU7dnfUoTP1GjU/+fHSeQywWAh2PblzhAl
	mhTjMEDgziia9poCwhDNCJ3HmOimuANg==
X-Received: by 2002:a05:690c:6109:b0:7bd:5c9d:dc6f with SMTP id 00721157ae682-7d3355dbaa2mr13616417b3.1.1779397782116;
        Thu, 21 May 2026 14:09:42 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d35cfcc531sm1437407b3.8.2026.05.21.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:09:41 -0700 (PDT)
Date: Thu, 21 May 2026 16:09:40 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dfustini@oss.tenstorrent.com,
	bjorn@kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com
Subject: Re: Re: [PATCH v3 0/4] riscv: optimize Vector context restore on
 syscall
Message-ID: <ag90lLMZTg3-AvAs@Tao-Chiu's-Mac>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
 <ag9Zu57zc4HhVLeZ@chonkvm.lixom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag9Zu57zc4HhVLeZ@chonkvm.lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_140943_974797_88A17C63 
X-CRM114-Status: GOOD (  40.83  )
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

On Thu, May 21, 2026 at 12:15:07PM -0700, Olof Johansson wrote:
> Hi Andy,
> 
> On Thu, May 21, 2026 at 11:25:16AM -0500, Andy Chiu wrote:
> > This patch series optimizes riscv vector state handling across syscall
> > boundaries and context switches. The kernel now keeps track of the
> > INITIAL state in sstatus.vs to optimize unnecessary context management
> > operations.
> > 
> > This version merges daichengrong's RFC patch [1] for the state tracking
> > code as it looks cleaner than my v2/v1.
> > 
> > [1]: https://lore.kernel.org/linux-riscv/7ba2f4b7-8475-4ec3-ab31-58b332bda47e@iscas.ac.cn/#r
> > Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/
> 
> A patchset like this would be really helped by some kind of numbers in the
> cover letter to indicate how much performance moved, given a claim of
> optimization.
> 

Thanks for pointing it out, I totally agree with you. I had included a
test result on sifive's hardware in v2[1]. But that was on FPGA, I will
test it on a real silicon as soon as I have an access. Sorry for the
confusing claim here.

My test was running on a vector enabled version of lat_ctx. I modified
the main function to make sure the process touches vector, then run with
2 threads. Since lat_ctx uses syscall interface to notify another
process, the kernel will trash their vector registers instead of wasting
cycles on saving/restoring them.

> 
> Just for kicks I tried a simple microbenchmark for syscalls from
> a vector-enabled process:
> 
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/syscall.h>
> #include <unistd.h>
> #include <time.h>
> #include <stdint.h>
> 
> static inline uint64_t ns_now(void) {
>     struct timespec t;
>     clock_gettime(CLOCK_MONOTONIC, &t);
>     return t.tv_sec * 1000000000ull + t.tv_nsec;
> }
> 
> int main(int argc, char **argv) {
>     int iters = argc > 1 ? atoi(argv[1]) : 10000000;
>     int use_v = argc > 2 ? atoi(argv[2]) : 1;
> 
>     if (use_v) {
>         asm volatile(
>             ".option push\n\t.option arch, +v\n\t"
>             "vsetivli x0, 1, e32, m1, ta, ma\n\t"
>             "vmv.v.i v0, 1\n\t"
>             ".option pop\n\t" ::: "memory");
>     }
> 
>     for (int i = 0; i < 10000; i++) syscall(SYS_getppid);  // warmup
> 
>     uint64_t t0 = ns_now();
>     for (int i = 0; i < iters; i++) syscall(SYS_getppid);
>     uint64_t t1 = ns_now();
> 
>     printf("V=%d %.1f ns/call (%lu ns / %d iters)\n",
>            use_v, (double)(t1 - t0) / iters, t1 - t0, iters);
>     return 0;
> }
> 
> 
> I compiled with gcc -O3, default GCC 14.2 on Debian 13. Host is x280
> (Blackhole). Base kernel sources is 7.1.0-rc4-next-20260520 defconfig. Ran
> with taskset to pin to one of the CPUs.
> 
> The testcase doesn't use vector inbetween each syscall, but will obviously
> have initiated the state (if started with '1' as second argument).
> 
> Without this patchset:
> V=1 242.9 ns/call (12144527848 ns / 50000000 iters)
> 
> With this patchset:
> V=1 264.5 ns/call (13226852900 ns / 50000000 iters)

This 9% regression is suprising to me as this patch set (without the fix
below) should be equivalent in performance on this code path (and better
if getpid takes one process switch).

Before the patch, nulling v resgisters happens at the entry point. After
this patchset we mark sstatus.vs to INITIAL at the entry and nulling
happens right before getting back to the user space.

> 
> Interestingly enough, with V=0 test it sped up slightly (194.3 -> 189.5 ns).
> 

This result is expected as with V=0 the kernel doesn't have to maintain
vstate at all. But we are also looking into ways to improve mode switch
latencies.

> I repeated the runs a few times, with similar results so I don't think it's
> explainable as noise.
> 

Thanks for carrying out the experiment, it's very sound! I actually
missed one thing on this patch for it to be optimized on this specific
case:

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 8c1e64e0dd0b..5d1282870a20 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -40,6 +40,15 @@
 	_res;								\
 })
 
+#define __riscv_v_vstate_check_gt(_val, TYPE) ({			\
+	bool _res;							\
+	if (has_xtheadvector()) 					\
+		_res = ((_val) & SR_VS_THEAD) > SR_VS_##TYPE##_THEAD;	\
+	else								\
+		_res = ((_val) & SR_VS) > SR_VS_##TYPE;			\
+	_res;								\
+})
+
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -323,7 +332,7 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
 		riscv_v_vstate_set_restore(current, regs);
 		riscv_v_vstate_init(regs);
 	}

In this way if the user never touch vregs again then we will not null
out the context at syscall exit.

Again, I only have it functionally tested at the moment. I appreciate it
if you could get the number with the above diff. Meanwhile, I am going
souce and run on an actual hardware and hopefully find the reason for
the above regression, before rolling out v4.

> 
> Given that more code will be vector enabled in the new shiny RVA23 world
> we are entering, I'm uncertain whether this is the right trade-off. You won't
> get the syscall perf cost returned unless you need the vector context swapped
> in without the lazy fault between calls.
> 
> I suspect running userspace workloads on a RVA23 platform (SpaceMIT
> K3) with Ubuntu 26.04 would be the most meaningful data to collect. My
> ordered board is still in shipping, unfortunately.
> 
> 
> PS: There's a new build warning due to an unused 'uvstate' variable in
> riscv_v_start_kernel_context() that you might want to fix.
> 
> 
> -Olof

[1]: https://lore.kernel.org/linux-riscv/20260402043414.2421916-2-andybnac@gmail.com/

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
