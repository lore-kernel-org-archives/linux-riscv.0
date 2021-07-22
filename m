Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A8CC6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 13:47:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D9E61289
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 13:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D9E61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5/HL3mHN2pLCIarMhSWJbOWmzO7V4rK7ZhoiUBlyDc=; b=2rnMYJ+ULNMCTY
	bfZsIXGHrxl8+ecy6KQsEjJGc/VlKaQlR+PrtofNQkczEPZJ2Fm9EYUR1bz0nGjpAeocMT5gpfZvR
	StVEZ/jsU6mF5DNzFQCImGZ03R5BmsBv+nxiL7SeLOSrFfPmjYWZo5W7uXz1Bqe3jLSBNp3i56RS/
	9r8LCzz8UThPu9GUWPX8V609YTe0kRpGfgA7kmtEbpxeqU87alg3rRnxE491yTUYl0BZ+tP6TK4Y4
	p6gMtOKw8Sm8uc0xo7Hlgyy4V+alZb/CdpE/wSX3rZ4kwUvToFFTAGHFgYaFvCrn01oYUUzzwauAk
	2UU04LiH7hux2iV6/bwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Z2B-001k2F-B5; Thu, 22 Jul 2021 13:46:43 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Yzj-001jJb-SV
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 13:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=l8zDJN5bZAFId48Si81LajFQMuJUpb9aZV
 tz4iKiX70=; b=pDSuexZRJSwskhXS56Ku+e485AW1Of13d4IeKO5gdv/Amhkdkj
 7oetqXQ/hxI4Q2uq9Nz7mXZg3QJ202tNc9q/BL1hoLUgkIu/IYisWTyhonHj3ndw
 WUT6Os8qYOS40vzhN83BW+3PNv/XG2ZIgwire7BBXq1k+9H68Cpp8OyqU=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygB3fm75dflgWBgmAA--.466S2; 
 Thu, 22 Jul 2021 21:43:21 +0800 (CST)
Date: Thu, 22 Jul 2021 21:37:24 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andreas Schwab
 <schwab@linux-m68k.org>, tongtiangen@huawei.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210722213724.1f12a0e7@xhacker>
In-Reply-To: <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygB3fm75dflgWBgmAA--.466S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyxXFyDAFykXF45Gry3urg_yoW8trW3pF
 45Gan09FWDtr1rtwn2vw1kWrW0vrnxJ3yaq3s8JFy5XryqvF15Xr1DWF15CrsrZrn8K3Wj
 vr4jgwsruw1DJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxUqEoXUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_064412_593229_E79DAA7E 
X-CRM114-Status: GOOD (  23.66  )
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

On Thu, 22 Jul 2021 01:35:23 -0700
Atish Patra <atishp@atishpatra.org> wrote:

> On Wed, Jul 21, 2021 at 11:12 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Mon, 19 Jul 2021 00:23:06 PDT (-0700), schwab@linux-m68k.org wrote:  
> > > On Jul 19 2021, tongtiangen wrote:
> > >  
> > >> On 2021/7/17 14:55, Andreas Schwab wrote:  
> > >>> Please use
> > >>> https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
> > >>> and run it in qemu with u-boot as kernel.
> > >>>
> > >>> Andreas.
> > >>>  
> > >>
> > >> Hi andreas:
> > >> I used today's latest mainline code and .config provided by you, and I
> > >> can't reproduce this panic.  
> > >
> > > Did you test it like I said above?
> > >
> > > Andreas.  
> >
> > I'm getting this on and off, with just
> >
> > CONFIG_VMAP_STACK=y
> >
> > on top of defconfig, when running on QEMU.  It's not showing up right
> > now: I'd thought it was an issue with that initrd patch, but it went
> > away when I re-ran the tests so I'm guessing it's something
> > non-deterministic.  I'll try to take a look if it comes back.
> >  
> 
> I got it very frequently on beagleV with the following branch & config.
> https://github.com/esmil/linux/commits/beaglev
> 
> beaglev_defconfig
> 
> Disabling CONFIG_VMAP_STACK avoids the crash.

Hi all,

I think we need to pin the stack before calling get_wchan(), could you please
try below patch?

Thanks

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index ff467b98c3e3..ac7593607fa6 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -132,8 +132,12 @@ unsigned long get_wchan(struct task_struct *task)
 {
 	unsigned long pc = 0;
 
-	if (likely(task && task != current && !task_is_running(task)))
+	if (likely(task && task != current && !task_is_running(task))) {
+		if (!try_get_task_stack(task))
+			return 0;
 		walk_stackframe(task, NULL, save_wchan, &pc);
+		put_task_stack(task);
+	}
 	return pc;
 }
 


> 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
