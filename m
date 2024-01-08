Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE33C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYVBezrdpn2CFkqLCpwp0cnzvqnS1+nRTMOIjvsXr5A=; b=11vL9YAU0VwW16
	EvTOjQP9QMqh3ZF9COMaNVXNWY7AJSQZE9puG5s8Qw5eTVs66i8y5dHZe8waxR3oPKMBEXE9VFQvE
	dGB+ypUPfL4odspjg3rJHnH5U4YNFk+X68BNo/n6NXa1x5s5t9BVsbuL2ak5DqtmFIsNiJ7LPqeNy
	v/rHHvtR9oMfyyI3VT6KtipoYFVgXfp+hg3u3ClSnA0l5AjoikOcCyEOJsT8Lt3ysjL70CErINV81
	xEU3x7s/P9mdMaafPWlB9ZI4ORfnpDDkA2BlO6j5QxVNIad2ouchyA7ICC7CEedfukydtft5NrrYZ
	uJmxg5h3VZLKHAYBcidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwTW-006BmG-1d;
	Mon, 08 Jan 2024 20:43:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwTT-006Bk8-38
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 20:43:57 +0000
Date: Mon, 8 Jan 2024 21:43:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1704746629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VV0nzTHtCZc+si0IK+/GbDKwN1YnszLL2QEQ1ZBeZ3g=;
	b=x1zvwAIyiiZjVQhft+G+0WDvbad+rpt4AwvwqlRLniUgt95/lFK4CsAyX8SZLmB1SHZqST
	gmwnxKTIwIP+gGCUY7XvmMrAT0Fk5AlVWZCPSMsFBEw5XmYp7tt2/4q+1lVJivBF2Gkxza
	VCnk0bmOxMRP/Pxg/XwhUd28uaNwdv1irbFLYYgqdMMRVeKSNa5q+vap6ouonsA1y6B2QP
	G8A51tZ4TEtQsaAg/l/Z/p2tLBjhbNmXAWkGX9b+UKgTd1VVZK1NvE5cL8w9YoWiub9O/m
	emmdzz9keUXDkjK7bI11+C5cStnJLc7uj1EIbcXYjLN+GlvqQ03r+guNJVJgDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1704746629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VV0nzTHtCZc+si0IK+/GbDKwN1YnszLL2QEQ1ZBeZ3g=;
	b=H43+TDbz7wiW1b8KHXyk/tfck3QSmu4ILFH+4XlAnaRphFcXG8ItFSuORnDPFExbJ1TmMM
	/F+VIDKCVrXJJoAQ==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
Message-ID: <20240108214346.5fd93127@namcao>
In-Reply-To: <20240108193640.344929-1-alexghiti@rivosinc.com>
References: <20240108193640.344929-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_124356_165667_568C1C9F 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon,  8 Jan 2024 20:36:40 +0100 Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> Allow to defer the flushing of the TLB when unmapping pages, which allows
> to reduce the numbers of IPI and the number of sfence.vma.
> 
> The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
> batched/deferred tlb shootdown during page reclamation/migration") that
> was multithreaded to force the usage of IPI shows good performance
> improvement on all platforms:
> 
> * Unmatched: ~34%
> * TH1520   : ~78%
> * Qemu     : ~81%
> 
> In addition, perf on qemu reports an important decrease in time spent
> dealing with IPIs:
> 
> Before:  68.17%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call
> After :   8.64%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call
> 
> * Benchmark:
> 
> int stick_this_thread_to_core(int core_id) {
>         int num_cores = sysconf(_SC_NPROCESSORS_ONLN);
>         if (core_id < 0 || core_id >= num_cores)
>            return EINVAL;
> 
>         cpu_set_t cpuset;
>         CPU_ZERO(&cpuset);
>         CPU_SET(core_id, &cpuset);
> 
>         pthread_t current_thread = pthread_self();
>         return pthread_setaffinity_np(current_thread,
> sizeof(cpu_set_t), &cpuset);
> }
> 
> static void *fn_thread (void *p_data)
> {
>         int ret;
>         pthread_t thread;
> 
>         stick_this_thread_to_core((int)p_data);
> 
>         while (1) {
>                 sleep(1);
>         }
> 
>         return NULL;
> }
> 
> int main()
> {
>         volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>                                          MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>         pthread_t threads[4];
>         int ret;
> 
>         for (int i = 0; i < 4; ++i) {
>                 ret = pthread_create(&threads[i], NULL, fn_thread, (void *)i);
>                 if (ret)
>                 {
>                         printf("%s", strerror (ret));
>                 }
>         }
> 
>         memset(p, 0x88, SIZE);
> 
>         for (int k = 0; k < 10000; k++) {
>                 /* swap in */
>                 for (int i = 0; i < SIZE; i += 4096) {
>                         (void)p[i];
>                 }
> 
>                 /* swap out */
>                 madvise(p, SIZE, MADV_PAGEOUT);
>         }
> 
>         for (int i = 0; i < 4; i++)
>         {
>                 pthread_cancel(threads[i]);
>         }
> 
>         for (int i = 0; i < 4; i++)
>         {
>                 pthread_join(threads[i], NULL);
>         }
> 
>         return 0;
> }
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Tested-by: Jisheng Zhang <jszhang@kernel.org> # Tested on TH1520

Before:
    real 0m36.674s
    user 0m0.173s
    sys  0m36.493s
After:
    real 0m18.016s
    user 0m0.125s
    sys  0m17.885s

Tested-by: Nam Cao <namcao@linutronix.de>

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
