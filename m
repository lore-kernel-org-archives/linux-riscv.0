Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1F5C8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy0P4zCCyPBsHHVir2X71QvDj6Jc2V1k0/K+xjHT+IE=; b=UW6ZI9Y8JbkeKB
	Xfty00m6Rismp5ZEBH7edNthcjgWjTCtA7czuXrDNwheqtmzjnW+mlDmT4CD+IPlGSl/QwqUjcxBZ
	WoXqzNlr+d7JQ4OayiiIxD6GsWv3/bI1Yy5c1Ih9v0vaHzjvjYItWjXvQFIUKdsIsXO0043OJjPkJ
	iYYVO9p7eoUTCuawkZ48/LWxfFNQLj260hi+Y/a7+QAuCfo9GLLOWtGwFTPJ1NtW75AFs7Yp8BKFS
	DHAXhmPL614h3Tpz1iFe0TeCI/e+MevgDzc6AIKYjdXcJ1qn1Z8tNOuLuN0wcnDXDlry94V5QtWwQ
	vNDpuW38pjb/3JZQtb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY157-0000000GRRz-3tiD;
	Sat, 05 Jul 2025 11:29:21 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY154-0000000GRRd-2kYI
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 11:29:20 +0000
Received: from localhost (unknown [223.72.70.63])
	by APP-05 (Coremail) with SMTP id zQCowAAHYGCGDGlopD80AQ--.4990S2;
	Sat, 05 Jul 2025 19:29:10 +0800 (CST)
Date: Sat, 5 Jul 2025 19:29:09 +0800
From: Jingwei Wang <wangjingwei@iscas.ac.cn>
To: Olof Johansson <olof@lixom.net>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
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
Message-ID: <aGkMhWtWDmQDG8IT@Jingweis-MacBook-Air.local>
References: <20250627172814.66367-1-wangjingwei@iscas.ac.cn>
 <aGNhC3mtpT8x_Z6V@chonkvm.lixom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGNhC3mtpT8x_Z6V@chonkvm.lixom.net>
X-CM-TRANSID: zQCowAAHYGCGDGlopD80AQ--.4990S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8JrWkWw4kKrWfGw1xXwb_yoWrAr4kpa
	98Crs0vFy5JFWxua97Kw18Zr1Fqan5Gw1fXrnrK3yUXry7ZrnxJF9aq3y7Cr1DXFyv9w10
	vFy5WFZIk3y7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6xkF7I0En7xvr7AKxVWUJV
	W8JwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5HpBDUUUUU==
X-Originating-IP: [223.72.70.63]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_042919_060539_66A4D6CF 
X-CRM114-Status: GOOD (  24.52  )
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

Hi Olof,

On Mon, Jun 30, 2025 at 09:16:11PM -0700, Olof Johansson wrote:
> Hi,
>
> On Sat, Jun 28, 2025 at 01:27:42AM +0800, Jingwei Wang wrote:
> > The value for some hwprobe keys, like MISALIGNED_VECTOR_PERF, is
> > determined by an asynchronous kthread. This kthread can finish after
> > the hwprobe vDSO data is populated, creating a race condition where
> > userspace can read stale values.
> >
> > A completion-based framework is introduced to synchronize the async
> > probes with the vDSO population. The init_hwprobe_vdso_data()
> > function is deferred to `late_initcall` and now blocks until all
> > probes signal completion.
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
> >     	and Alexandre.
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
> >  arch/riscv/include/asm/hwprobe.h           |  8 +++++++-
> >  arch/riscv/kernel/sys_hwprobe.c            | 20 +++++++++++++++++++-
> >  arch/riscv/kernel/unaligned_access_speed.c |  9 +++++++--
> >  3 files changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474ae2c6..87af186d92e75ddb 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -40,5 +40,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
> >
> >  	return pair->value == other_pair->value;
> >  }
> > -
> > +#ifdef CONFIG_MMU
> > +void riscv_hwprobe_register_async_probe(void);
> > +void riscv_hwprobe_complete_async_probe(void);
> > +#else
> > +inline void riscv_hwprobe_register_async_probe(void) {}
> > +inline void riscv_hwprobe_complete_async_probe(void) {}
>
> These need to be:
>
> static inline void riscv_hwprobe_register_async_probe(void) {}
> static inline void riscv_hwprobe_complete_async_probe(void) {}
>
> Or else you get an global instantiation of them in every file that includes
> them, and compilation errors about duplicate symbols, as seen by
> nommu_virt_defconfig:
>
> riscv64-linux-gnu-ld: arch/riscv/kernel/process.o: in function `riscv_hwprobe_register_async_probe':
> process.c:(.text+0x170): multiple definition of `riscv_hwprobe_register_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x312): first defined here
> riscv64-linux-gnu-ld: arch/riscv/kernel/process.o: in function `riscv_hwprobe_complete_async_probe':
> process.c:(.text+0x17c): multiple definition of `riscv_hwprobe_complete_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x31e): first defined here
> riscv64-linux-gnu-ld: arch/riscv/kernel/ptrace.o: in function `riscv_hwprobe_register_async_probe':
> ptrace.c:(.text+0x714): multiple definition of `riscv_hwprobe_register_async_probe'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x312): first defined here
>
Thank you for spotting this. I'll apply this fix to the v5 patch.

Thanks,
Jingwei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
