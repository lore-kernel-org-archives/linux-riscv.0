Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D222E81BAF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRS7BrCYkqKlr+v90b/bGVEvpSpeREQVoPY7pLWbE24=; b=DQGXhGkJ9iCqde
	XSyO7pvahPJCPH+DfG/wxR5v0wO5xAxqP/9WUg18Z7Lxd7IkjJvHIg/3EtQQogrvDMcHBGguWOmOT
	dvR6GQ9xplCMz1dlAbVts0VMRdpZ6JaVG6QzQSWZses++wch9jY55cvaut7glDWEcL5sSbWcoE4jn
	Ze8sZ8QC8LLs1KOLvReiY2yN4uJeCswizs2kfTSFyvEqUkYoSPOmPzpgGhi0ov5PNL30fuaH7dax9
	uSagdG3k90EEOuTjOGA6qn7T6PA/iXt2ccZaD5jnRha88kNhqQ/jRIgI+n3v/LZSmK8i+qetWkb0G
	ttjLR9Vu3e53xFVLsVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQVY-0000000FMq5-4Aun;
	Mon, 09 Feb 2026 12:36:52 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQVU-0000000FMoE-3hh0
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 12:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770640597; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=j2mQMotxAbyONBNpxzE2wutnL2uBY8ZDUN3PiY3/Dug=;
	b=AWPCBqgLdP68nO+jRlyeSPq8tPGZJ1sFdbI1Owy9vdLbOstvZt7dLr0sVvYrhQVAqR1ejv1RcCzVaN3wzxqBSo503K//+Kx9NI4WW9OVGQ3oA3eb6Cv9jW/IAcisEtzWKuX9CjsxlK6/+mRY2dTfdAlacMpM1s/r2AP81StAUwo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WysCTD4_1770640589 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 20:36:34 +0800
From: cp0613@linux.alibaba.com
To: atish.patra@linux.dev
Cc: anup@brainfault.org,
	alex@ghiti.fr,
	pjw@kernel.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
Date: Mon,  9 Feb 2026 20:36:28 +0800
Message-ID: <20260209123628.1866-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
References: <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_043649_673377_5F83122F 
X-CRM114-Status: GOOD (  27.60  )
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

On Wed, 4 Feb 2026 01:17:25 -0800, atish.patra@linux.dev wrote:

> > The RISC-V SBI PMU driver disables all PMU counters during initialization
> > via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
> > unnecessary for the following two reasons:
> >
> > 1. Some kernel driver code may directly read CYCLE and INSTRET to perform
> >     simple performance analysis.
> 
> Is this for some debugging purpose to read the instret/cycle count at 
> boot time or real use case for driver performance analysis ?
> 
> If it is the latter, that will be problematic for various reasons such 
> as context switching will lead to inaccurate numbers.

Hi Atish,

Thanks for the reminder, but I might not be able to provide specific scenarios
due to our niche usage. Therefore, let's just discuss the legacy usage of
sysctl_perf_user_access.

> > 2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
> >     /proc/sys/kernel/perf_user_access)
> >
> > Therefore, We keep counting CYCLE, TIME and INSTRET.
> >
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > ---
> >   drivers/perf/riscv_pmu_sbi.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 7dd282da67ce..93aaab324443 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> >   
> >   static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
> >   {
> > + /* We keep counting CYCLE, TIME and INSTRET. */
> > + pmu->cmask &= ~0x7;
> > +
> 
> This is incorrect. The cmask should be set based on the perf_user_access 
> value. We should not continue counting the CYCLE/INSTRET when legacy 
> mode is not set. if (sysctl_perf_user_access == SYSCTL_LEGACY) 
> csr_write(CSR_SCOUNTEREN, 0x7); else csr_write(CSR_SCOUNTEREN, 0x2);

I have a slightly different understanding here. Regarding perf_user_access, I think
it is only used to control user mode access permissions to CYCLE, TIME, and INSTRET
(via SCOUNTEREN), but whether the counters themselves are in a counting state is
another issue (via MCOUNTINHIBIT). I think the cmask in pmu_sbi_stop_all should
represent a counter to stop the counting, rather than a permission configuration.

The problem we are currently encountering is that even when switching to LEGACY mode,
CYCLE and INSTRET are not counting, so we want to change this default behavior so
that these three fixed counters are always in counting.

Sorry for the late reply. I've reviewed some previous related discussions, and it
seems that using time is more reasonable between cycle and time. However, for some
small code snippets, there is a need to use cycle and instant (at least instant),
so keeping them constantly counting doesn't seem to have any downsides.

Thanks,
Pei

> >    /*
> >     * No need to check the error because we are disabling all the counters
> >     * which may include counters that are not enabled yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
