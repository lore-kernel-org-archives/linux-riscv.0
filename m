Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9FCC19F28
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ct58SskO62nmsA0s7m5/9osWBxnHq4wCeemQTYgzLaM=; b=kRh5PPztu3fbLu
	TSxfb46aI4QOWrVUhCNdshKcOPzZofCA7P/YJkcUzoObzw6Moa574DSWoLCOLFBDHScLoBgatHtJK
	Hha6NZ/tu6jyvpi+AwwHdXrUm3PMXxWRmlWXBptXIh48TRdegsEoSo6+vRzfXK74YUsMDQve71xJC
	lgKwtfbNFnwcGb7T93XQr54fFjWGhXnhI5sIfoYPkwKfV393bjLewc7Wa2ANNkUORW5PLmsP0wslp
	AgXCjSgoeHSpPCyow2VXxTsjbw73V2GIY9PYMI+4Mv07hWQsLvBd6FtRXKB65A1rqbo4OMlgptUuf
	Bg8p4rFR5v0yXH5RRvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJEm6-006UIi-5D; Wed, 03 Aug 2022 13:51:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHr10-003BfY-LW; Sat, 30 Jul 2022 18:16:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4276E60EEB;
	Sat, 30 Jul 2022 18:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DEFC433D7;
	Sat, 30 Jul 2022 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659204999;
	bh=YJXP6A7d+KZPrg8HQv8x+gqLEMy1sjVdzXnl/qX62uw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gJSpKVSsAKz8pom4RuAB5Je2VfXHGMhI5S8QuPgLw6sbq0QnDrcsB984Q3KCjMEP4
	 SYUjeqdnSm23czJoxrwT8/cSChg2wZ3j8oXxKHXQSMFJwdsOWYkZ8L3yHTrxHHHv/B
	 PCAYHs9Jnrby4wbTToGryEY6Ex3TIpS7AHVXuUJU6nS/OoMCgZLC69/yQVKdeU26z2
	 g1F1UjpLlSrDEHmQXbwyZ9oeANnc2U7/KwPArewe4hoBbjnHbzgEqXp6HAhF3f96Ro
	 rfGOh77ykaTrG15ZCImyvdTTA95ZiEUj+F32tOHQ6Prrb5v2smeceYH3zHnZYF0uH1
	 p/j3tMujFTrgw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3BA285C0266; Sat, 30 Jul 2022 11:16:39 -0700 (PDT)
Date: Sat, 30 Jul 2022 11:16:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michel Lespinasse <michel@lespinasse.org>
Cc: Peter Zijlstra <peterz@infradead.org>, rth@twiddle.net,
	ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
	linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@HansenPartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	frederic@kernel.org, quic_neeraju@quicinc.com,
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com, joel@joelfernandes.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
	rcu@vger.kernel.org, rh0@fb.com
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220730181639.GS2860372@paulmck-ThinkPad-P17-Gen-1>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
 <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
 <20220729102458.GA1695@lespinasse.org>
 <20220729152622.GM2860372@paulmck-ThinkPad-P17-Gen-1>
 <20220730094032.GA1587@lespinasse.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220730094032.GA1587@lespinasse.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_111642_821605_F022B96E 
X-CRM114-Status: GOOD (  15.51  )
X-Mailman-Approved-At: Wed, 03 Aug 2022 06:50:55 -0700
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 30, 2022 at 02:40:32AM -0700, Michel Lespinasse wrote:
> On Fri, Jul 29, 2022 at 08:26:22AM -0700, Paul E. McKenney wrote:> Would you be willing to try another shot in the dark, but untested
> > this time?  I freely admit that this is getting strange.
> > 
> > 							Thanx, Paul
> 
> Yes, adding this second change got rid of the boot time warning for me.

OK, I will make a real patch.  May I have your Tested-by?

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
> > index e374c0c923dae..279f557bf60bb 100644
> > --- a/kernel/sched/clock.c
> > +++ b/kernel/sched/clock.c
> > @@ -394,7 +394,7 @@ notrace void sched_clock_tick(void)
> >  	if (!static_branch_likely(&sched_clock_running))
> >  		return;
> >  
> > -	lockdep_assert_irqs_disabled();
> > +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
> >  
> >  	scd = this_scd();
> >  	__scd_stamp(scd);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
