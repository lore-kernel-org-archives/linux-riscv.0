Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE5C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjEglL8B42eRWb1KRipyTaPjcfInDrbp37dMGSmUqIw=; b=CD8+5nP2GkaoE1
	1eW5JIkubYH6iOvdgrkLd/RUJtdtfuSP3DR3pwh9TFfAf2t+dGNQnB2iAKecWXBtBgZNUKr9xmhAe
	FYTljoVN+3kKH8jVT6dKsFL0NaA1ojVxDdi5XPB8rixYwS/N5p8AT7tpx+knSR6wfVtGS9gNNtoNA
	4t3DA61soZngZmknUHgilyLFvGIsQ/tkUx9UwDyozK0joQCZfr8DzBJ74XbpfYMEdgo41pbfvi5cW
	2Fgy2uUp3+vxT5OglquSpRe9YtPkPDr29nJMa0TPW8Unhuh3pEvsuUiR9Wwo9rtFDRtD+mYzYSEIZ
	2SorJ7oBTls0kYDraynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIUq-00CKkk-9X; Mon, 19 Sep 2022 15:15:44 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFMA-00BbDA-Kd
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 11:54:37 +0000
Received: by mail-il1-x12a.google.com with SMTP id m16so1296176iln.9
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gUsv6szv6dsUeM9asVJnwaGmSGG17UchvxqwxLA3h8g=;
        b=6l84clV/ev4Ho0Nth4fVfA2YCUlnkvOSgxbqusFUXjXpfQuFFf0cscM9H6JstjQMUy
         xw7M8POcVaD8G3v3xGng54KrmjSgvwQL7sqhL179TVnFSdqvL9DEfhAXmZU08DpaVB+z
         zSiunmo3VbmTof1vxAp/v47yQ2WgOGXeXG6GB3Gf7pE1ScGjC0bqV7TAtd/m+fpfq3CI
         YOLPMuA/GgjNIfHOrOGhD0cM6H3P5LBBOn3aCDWtNVZfJPWoGE1cWKKtEz9Dpfs/6i2d
         YxcNqnYUQtbiNuONYqqIai1SFElgvUv464Vcz0iTXK3yncl0+rss3soTmcg3IhW6Gf/K
         H/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gUsv6szv6dsUeM9asVJnwaGmSGG17UchvxqwxLA3h8g=;
        b=BDkaH1gZb6sBXfVSK4ulJiqnVI6ugVK8v7KAHFWnU7iLYJLpfw4ELT8NU4tMDFUbSL
         MK1iEh6FwtuOpiBCF83u24KGr/Uo5tIC2VG9CiHrXMi3d1rGEYZs2g55/B/m1HzZ+UQb
         RajGCExoGrScFaBOw0B/+phnjDJkNPfFmJKaxX2oTtbEYWr7bXgbe6RRNDkhd5JzJ56G
         m9Lb3ci6XBzRyEBnvMvBDsqCmTUtZqIS7S25a6Lk+A2G0/q9guM09uvE82OE5iyPJ46t
         381bk8R1JF/WmnYDPXgke1BDohHgIh+1x9vhUcAmSl8lwUycP0R9qb/vqijTGi1BCKe9
         5ZRA==
X-Gm-Message-State: ACrzQf0+U7OUBRhdCaso7SAaauTdpRfkmXcBhPvCJl6kjIr1AqY9RfNs
	vsr0JTwQgMYtBXroMJZPjLPsWng36bAZ4y8IEOIb1A==
X-Google-Smtp-Source: AMsMyM5SaQPoV1xlIMZRfmPqKRzR7kAhfhGoUGwZ5KM3JobcN8dh6yNRCyMvHHbKVsfAJAruxygcE1W13IXNCB18i9o=
X-Received: by 2002:a92:c04d:0:b0:2f5:1175:c7a3 with SMTP id
 o13-20020a92c04d000000b002f51175c7a3mr5681407ilf.165.1663588472670; Mon, 19
 Sep 2022 04:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101520.669962810@infradead.org>
In-Reply-To: <20220919101520.669962810@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 Sep 2022 17:24:19 +0530
Message-ID: <CAAhSdy004HaNUNYRD8tcn24LZWdTmOVkF1QN14uLmSw1UXuXqA@mail.gmail.com>
Subject: Re: [PATCH v2 05/44] cpuidle,riscv: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, 
	linus.walleij@linaro.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, 
	bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, 
	davem@davemloft.net, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org, 
	pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org, 
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, 
	konrad.dybcio@somainline.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	jacob.jun.pan@linux.intel.com, atishp@atishpatra.org, 
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux@rasmusvillemoes.dk, dennis@kernel.org, tj@kernel.org, cl@linux.com, 
	rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, 
	john.ogness@linutronix.de, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	bristot@redhat.com, vschneid@redhat.com, fweisbec@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, 
	Andrew Morton <akpm@linux-foundation.org>, jpoimboe@kernel.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_045434_943753_E62BA494 
X-CRM114-Status: GOOD (  15.09  )
X-Mailman-Approved-At: Mon, 19 Sep 2022 08:09:28 -0700
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

On Mon, Sep 19, 2022 at 3:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is daft.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Looks good to me.

For RISC-V cpuidle:
Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -116,12 +116,12 @@ static int __sbi_enter_domain_idle_state
>                 return -1;
>
>         /* Do runtime PM to manage a hierarchical CPU toplogy. */
> -       ct_irq_enter_irqson();
>         if (s2idle)
>                 dev_pm_genpd_suspend(pd_dev);
>         else
>                 pm_runtime_put_sync_suspend(pd_dev);
> -       ct_irq_exit_irqson();
> +
> +       ct_idle_enter();
>
>         if (sbi_is_domain_state_available())
>                 state = sbi_get_domain_state();
> @@ -130,12 +130,12 @@ static int __sbi_enter_domain_idle_state
>
>         ret = sbi_suspend(state) ? -1 : idx;
>
> -       ct_irq_enter_irqson();
> +       ct_idle_exit();
> +
>         if (s2idle)
>                 dev_pm_genpd_resume(pd_dev);
>         else
>                 pm_runtime_get_sync(pd_dev);
> -       ct_irq_exit_irqson();
>
>         cpu_pm_exit();
>
> @@ -246,6 +246,7 @@ static int sbi_dt_cpu_init_topology(stru
>          * of a shared state for the domain, assumes the domain states are all
>          * deeper states.
>          */
> +       drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[state_count - 1].enter = sbi_enter_domain_idle_state;
>         drv->states[state_count - 1].enter_s2idle =
>                                         sbi_enter_s2idle_domain_idle_state;
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
