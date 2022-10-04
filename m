Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED616C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvN8o/J96/4+1mUEzXWXtLlVpv3/jrLLgGZx5PMEDLA=; b=aUiJYuW/2t5OKP
	bC50S7pvUtNlh8AInolLuKqeZmfo+26+m5McOW+dLoDhf7Xr1XgMOaDOeyTfsbhrrbOQR7gqpEq+s
	NaDBLvjnJiyRRcT0r83Z+oVKA1jQy3v5VR0S0jBatZ7qbEHWuLk8DroeXh3hOk/Qgh0afZU9x6E/q
	qYP7uylxpT9s3EbUu5IDKLxOFPGpo7jfYx+JIoqAf66BX9LzLgFAtQnhNLjzYb0+P1vsyKmuI3lBx
	DjDNwoBgr7Edwo36Ndw/falr+9oNnCFBQKqfIXooLd6qwjIBpfdhun+x54u3eVrgvHHqU2g0Xngs3
	rpgje2cn544cwmh5vLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofozZ-00BAho-Nv; Tue, 04 Oct 2022 20:58:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offk1-009SDv-QW
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 11:05:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id i7-20020a17090a65c700b0020ad9666a86so1518113pjs.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8dOAtcXqtbDTbOtGHdeMRx2lSxGZ/p81xoeulWg88O8=;
        b=ALPYtY9NECpkdz09jpHMZbs0aH+hKiq7zCwXfK1hWKvM2elz9mNR/JJb0byGfir59h
         CWc9izoQX0glvUd9bdjzB+GxZIKg7cZ1wWKnb5xSlDD9fDdUtUduD7qTiOAX8rgJzNMY
         16i4fnybYgh61uFsRfFa0jFHaMm217pAorBQUItONSq5D0pjQfmpgEbFEG0ovD83XmiY
         JRBnUwctQs5MU4QsxdCrYJ2mV5ubOvxFCDZOs+xf+eBgsrQVN1CIV6SHGqFX6RFQbzq7
         D2ARCpgG/orA8SpRSFPIMnoc2IRLOYljdFwc8QX3tXFa2vpA/P7Kkd/ZsaWnXMh+ArFb
         1Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8dOAtcXqtbDTbOtGHdeMRx2lSxGZ/p81xoeulWg88O8=;
        b=LmHqGvbMS9tOg5mo9LB/O+tKIU5SKSTqJCWup6bgoFeg2bbgC8Ubk0zPw0xZdaFlWA
         VTZqW0HHBm3uPrBIOj0iN1udPWcPO/WNyqgyeY1IZje7Jdb1of/CIGHAUMldajwaSc0E
         eNMU6zlRKZUi4Rdy0r1sIeEM+tMICB1/v0sYLPY+Te5RLsBJoBw/Wfvf7YqXXOBGVAgF
         VzDX1b2erm7qgNc4ez8p5hlLxgXgNkRH0Rq4aMB543wFz9n1Lv+3fA+M/EBRHTp9nMwt
         3BAaLWoghm4YdtfsPcVSPQ8fL4OfT3J5wH0BIkWzeDw8a7V54ivwt1krijzuYJLDnCcM
         z4vg==
X-Gm-Message-State: ACrzQf1675ydX5C2EV7gj6YFC/uOL36EX4KL+ne+l0Ro94NwQaZ8o+Uo
	cGinGTuwKkbsY1GZCGwG/9zYosRc8NeKrgzByiiGxA==
X-Google-Smtp-Source: AMsMyM4crcx6LouSmUkordoRMp2FZSPTtuc3An5Wuzy+BH6M/IICg47GwaPPyycgbJ/QSQxkTeG6xy+CkgFRgaEAD/g=
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr17203785pjb.164.1664881533975; Tue, 04
 Oct 2022 04:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101521.274051658@infradead.org>
In-Reply-To: <20220919101521.274051658@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:04:57 +0200
Message-ID: <CAPDyKFquBVkYmKsriPD+BfVrrz62ih7oCxb7HwOML+Zzs-5U_Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/44] cpuidle,cpu_pm: Remove RCU fiddling from cpu_pm_{enter,exit}()
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
	konrad.dybcio@somainline.org, anup@brainfault.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, jacob.jun.pan@linux.intel.com, atishp@atishpatra.org, 
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
X-CRM114-CacheID: sfid-20221004_040537_886693_CDD5EB7A 
X-CRM114-Status: GOOD (  12.08  )
X-Mailman-Approved-At: Tue, 04 Oct 2022 13:58:15 -0700
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

On Mon, 19 Sept 2022 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> All callers should still have RCU enabled.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  kernel/cpu_pm.c |    9 ---------
>  1 file changed, 9 deletions(-)
>
> --- a/kernel/cpu_pm.c
> +++ b/kernel/cpu_pm.c
> @@ -30,16 +30,9 @@ static int cpu_pm_notify(enum cpu_pm_eve
>  {
>         int ret;
>
> -       /*
> -        * This introduces a RCU read critical section, which could be
> -        * disfunctional in cpu idle. Copy RCU_NONIDLE code to let RCU know
> -        * this.
> -        */
> -       ct_irq_enter_irqson();
>         rcu_read_lock();
>         ret = raw_notifier_call_chain(&cpu_pm_notifier.chain, event, NULL);
>         rcu_read_unlock();
> -       ct_irq_exit_irqson();
>
>         return notifier_to_errno(ret);
>  }
> @@ -49,11 +42,9 @@ static int cpu_pm_notify_robust(enum cpu
>         unsigned long flags;
>         int ret;
>
> -       ct_irq_enter_irqson();
>         raw_spin_lock_irqsave(&cpu_pm_notifier.lock, flags);
>         ret = raw_notifier_call_chain_robust(&cpu_pm_notifier.chain, event_up, event_down, NULL);
>         raw_spin_unlock_irqrestore(&cpu_pm_notifier.lock, flags);
> -       ct_irq_exit_irqson();
>
>         return notifier_to_errno(ret);
>  }
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
