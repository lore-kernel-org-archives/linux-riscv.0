Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA497C8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rn/lAwz5UleTNlQBEMun0NI+gve7I/iaFkqg/rTC+8=; b=Y+Ysshe0h0Noje
	bYfLuTNBkR5McWKr4efWHyjopm4OdEx0xy4hFNuDDkKPWetxOtqQWHvtosUvH0VfV3YijH6kh7lNm
	MCw/dFRO4UO9Hu/T5g4z9sfFpg+XvS8DJmVCsvxLQYA5ai1t/jdKIoWPy9l3i6X2p45oC0jr3ptsj
	bOkuM9D9A/hdD9bOWri3XOFlWo8WGAQ1HVbAGfVM6WiIYYutUe2HMdRKS+xi2IEewqq1KSSVeW4TU
	M05DdvIxG+npM5d9l5T+QIdbMyX97eWYkdCBc+0sUAGToGnQrnQBJOBUsK2H7JV2Z9XPee0qH7EU3
	++bruhD6YkewBtdobvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY10N-0000000GR94-04rt;
	Sat, 05 Jul 2025 11:24:27 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY10J-0000000GR7x-0Vsb
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 11:24:25 +0000
Received: from localhost (unknown [223.72.70.63])
	by APP-05 (Coremail) with SMTP id zQCowADnP2BYC2loYu0zAQ--.4844S2;
	Sat, 05 Jul 2025 19:24:08 +0800 (CST)
Date: Sat, 5 Jul 2025 19:24:08 +0800
From: Jingwei Wang <wangjingwei@iscas.ac.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>, Yixun Lan <dlan@gentoo.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Tsukasa OI <research_trasio@irq.a4lg.com>, stable@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4] riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot
Message-ID: <aGkLWItEnzYkc9VJ@Jingweis-MacBook-Air.local>
References: <20250627172814.66367-1-wangjingwei@iscas.ac.cn>
 <a57e83be-c506-4ab4-962d-4cdbce4aaed9@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a57e83be-c506-4ab4-962d-4cdbce4aaed9@ghiti.fr>
X-CM-TRANSID: zQCowADnP2BYC2loYu0zAQ--.4844S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw4kGF1UArWrJFWrJr4Dtwb_yoW7Gr48pF
	Wqkr4YyFZ5JrWxuF9rKr1IvF10qan5Gr13Jr1DKryUXryjvr13Jr93KrsrAr1DZF98K340
	vF45Wa9Ik3y7ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Kb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ec7CjxVAajcxG14v26r1j6r
	4UMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyItCDUUUU
X-Originating-IP: [223.72.70.63]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_042423_537825_0A5D0D46 
X-CRM114-Status: GOOD (  31.96  )
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

Hi Alexandre,

On Mon, Jun 30, 2025 at 09:34:28AM +0200, Alexandre Ghiti wrote:
> Hi Jingwei,
>
> On 6/27/25 19:27, Jingwei Wang wrote:
> > The value for some hwprobe keys, like MISALIGNED_VECTOR_PERF, is
> > determined by an asynchronous kthread. This kthread can finish after
> > the hwprobe vDSO data is populated, creating a race condition where
> > userspace can read stale values.
> >
> > A completion-based framework is introduced to synchronize the async
> > probes with the vDSO population. The init_hwprobe_vdso_data()
> > function is deferred to `late_initcall` and now blocks until all
> > probes signal completion.
>
>
> Can you add an explanation of why the move to late_initcall() here?
>
Sure. I'll add that in the next version.
>
> >
> > Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> > Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
> > Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> > ---
> > Changes in v4:
> > 	- Reworked the synchronization mechanism based on feedback from Palmer
> >      	and Alexandre.
> > 	- Instead of a post-hoc refresh, this version introduces a robust
> > 	completion-based framework using an atomic counter to ensure async
> > 	probes are finished before populating the vDSO.
> > 	- Moved the vdso data initialization to a late_initcall to avoid
> > 	impacting boot time.
> >
> > Changes in v3:
> > 	- Retained existing blank line.
> >
> > Changes in v2:
> > 	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
> > 	- Updated commit message to provide a high-level summary.
> > 	- Added Fixes tag for commit e7c9d66e313b.
> >
> > v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u
> >
> >   arch/riscv/include/asm/hwprobe.h           |  8 +++++++-
> >   arch/riscv/kernel/sys_hwprobe.c            | 20 +++++++++++++++++++-
> >   arch/riscv/kernel/unaligned_access_speed.c |  9 +++++++--
> >   3 files changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474ae2c6..87af186d92e75ddb 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -40,5 +40,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
> >   	return pair->value == other_pair->value;
> >   }
> > -
> > +#ifdef CONFIG_MMU
> > +void riscv_hwprobe_register_async_probe(void);
> > +void riscv_hwprobe_complete_async_probe(void);
> > +#else
> > +inline void riscv_hwprobe_register_async_probe(void) {}
> > +inline void riscv_hwprobe_complete_async_probe(void) {}
> > +#endif
> >   #endif
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 0b170e18a2beba57..8c50dcec2b754c30 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -5,6 +5,8 @@
> >    * more details.
> >    */
> >   #include <linux/syscalls.h>
> > +#include <linux/completion.h>
> > +#include <linux/atomic.h>
> >   #include <asm/cacheflush.h>
> >   #include <asm/cpufeature.h>
> >   #include <asm/hwprobe.h>
> > @@ -467,6 +469,20 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> >   #ifdef CONFIG_MMU
> > +static DECLARE_COMPLETION(boot_probes_done);
> > +static atomic_t pending_boot_probes = ATOMIC_INIT(0);
> > +
> > +void riscv_hwprobe_register_async_probe(void)
> > +{
> > +	atomic_inc(&pending_boot_probes);
> > +}
> > +
> > +void riscv_hwprobe_complete_async_probe(void)
> > +{
> > +	if (atomic_dec_and_test(&pending_boot_probes))
> > +		complete(&boot_probes_done);
> > +}
> > +
> >   static int __init init_hwprobe_vdso_data(void)
> >   {
> >   	struct vdso_arch_data *avd = vdso_k_arch_data;
> > @@ -474,6 +490,8 @@ static int __init init_hwprobe_vdso_data(void)
> >   	struct riscv_hwprobe pair;
> >   	int key;
> > +	if (unlikely(atomic_read(&pending_boot_probes) > 0))
> > +		wait_for_completion(&boot_probes_done);
>
>
> To me it's not working: if a first async probe registers and completes
> before another async probe registers, pending_boot_probes will be > 0 but
> wait_for_completion() will proceed before the second async probe completes
> (since the first async probe marked the completion as done).
>
> Let me know if I missed something,
>
You're right, I made a mistake here when I rewrote my patch. I will
rework this in v5 to use the "sentinel-count" pattern (initializing the
atomic counter to 1).Thank you so much.

I was having some issues with my email client, and it seems my previous
replies might not have gone through. It appears to be working now, and
I will send out the v5 patch shortly.

Thanks,
Jingwei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
