Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B661AECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEMjNuGYriXC/o01cqUVEraKn/LHxpgOuNH7C/TEC0Q=; b=fk7BKAcl20zJLp
	so4Yn8SNNcbLRLvFilV1cEx2YxP6GQ8YBMX1PvaODwMgLc2NrUdlPxrj3BUYJ7t0JGwElXbB87PiZ
	nfBkS3hHlG6ufIWitRobU2oEQFSQdGul09+cAiqZfl4BQ8qihBnLXDLe68a8ZnV6/OgwSNatttvN/
	3oxNrRF+4HOcNEJJ5twWq/yuhfSENZpbj+drjwFd3ss7Jlr5WiZYjO1YYVTE9VeuzReyjlAFY20Zk
	Vg1US2fz++TQz+zSZPXMcEZs5XKQshcQOn/TFv2BbMJQaHrx44GE1Xm7OSijYvd3J6+JyJGVCXEJ+
	zaAj7fYvo72ppANHRz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oady8-004N70-Lt; Tue, 20 Sep 2022 14:11:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaast-00370R-VS; Tue, 20 Sep 2022 10:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9876B81C6D;
	Tue, 20 Sep 2022 10:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB41C433D6;
	Tue, 20 Sep 2022 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663671224;
	bh=1uzaYeWYbymD/f+i/QytZhu6oKO9BM7m7uKIAm7/1aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwUuVl6qzzyQ8/M60E4GBJaDSvCCIGZsWXd6EWoe6ETg4UPGRSPJSpODGC89bVoml
	 D8yMcp2L8SqglVlcwPjBx0kwWsmuhxSt4A6MHMYEdl8sw5Zt0+i8CPGg6TTK40x4my
	 mHRIDutJuMJ3kECm4eorV/KO7XWDkJoFt5Xcko5DBOFQuad34F85DOuPGJQOkcR3nN
	 x3i3rl+wBIvgbXn74nt/EudGishy0lWfyQwIhjZzzOrS/gzl1GIHezRYRweYZnMwZB
	 mX8bZPz/2M6J4eYsqVrIj88f6cgWd9NcoOu5bfu6upfEe+DnQeaKeleng7SJXqBrye
	 EQG2xv/JeiBzw==
Date: Tue, 20 Sep 2022 12:53:41 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
	ulli.kroll@googlemail.com, linus.walleij@linaro.org,
	shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, guoren@kernel.org, bcain@quicinc.com,
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
	sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
	dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	James.Bottomley@HansenPartnership.com, deller@gmx.de,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	konrad.dybcio@somainline.org, anup@brainfault.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, atishp@atishpatra.org,
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, rostedt@goodmis.org,
	pmladek@suse.com, senozhatsky@chromium.org,
	john.ogness@linutronix.de, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
	vschneid@redhat.com, fweisbec@gmail.com, ryabinin.a.a@gmail.com,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com,
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
	linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 11/44] cpuidle,omap4: Push RCU-idle into driver
Message-ID: <20220920105341.GB72346@lothringen>
References: <20220919095939.761690562@infradead.org>
 <20220919101521.072508494@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919101521.072508494@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_035349_639095_176B8BFC 
X-CRM114-Status: GOOD (  10.00  )
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:11:01 -0700
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

On Mon, Sep 19, 2022 at 11:59:50AM +0200, Peter Zijlstra wrote:
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, some *four* times, before going idle is daft.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
