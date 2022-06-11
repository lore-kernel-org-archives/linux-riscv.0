Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E259CCA47B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHkM/L2Hp/+qe/leu/A/bKdht6gSB97xPGbBnRZVZ80=; b=KKI2CL+hT/ogOm
	Omgp5Y2fHD864uir4MnNv/birvgEtLRuaFrwnNn50SnhsjLCA4UEM/Rheg4nralBv96zkRSFtTRub
	olOBJuROh8pjhMnoiuY2bSNDdTuYdWYaVqCp6DhsT5nFwG27oaKJIoZ95SnsCOSEIEChBdR6jUnBv
	nd7X33JX41ZnmDE4FkZamERhBAQK2dxpzytHnfmgsJx15QqW6OwRjkP6M0TbFoaa4mKwFqBUzh3Na
	GDG8j+U5QUZbwDB3ENtG5TByaO5JmeM7/svLLrue7EmndvfDdRM6nCaaMhF9PFu2DX9wLczmZoi9P
	kqvH7zz1ky7o40TBVtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0uG5-006QWm-Sr; Tue, 14 Jun 2022 00:18:13 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqmS-00Azvr-MF
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 02:23:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id h19so1066869edj.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 19:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvaEucNyttJ72r4dgkt1sbWCJsvBPyIh5zMt0LNXalY=;
        b=D62jI1p8sOcmW+dGG367yCKI6736qfwlRYdRbtg+pQI3VQ/mZvhMkSh4muEy4yFzXi
         1pifN6keFBPADAFAutLs2f+vKDRy3jOy1SmannYfmHY7tjbpoLbP8600CMqIboz22zit
         FmdCeKC+IDyY3i3YwKCGDz5In1oYgHbIW3q58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvaEucNyttJ72r4dgkt1sbWCJsvBPyIh5zMt0LNXalY=;
        b=0k99u7sbL7IUdSOa1XUnlscMbMLuZ0qLQjkyD2ReskE4hYArZGLH/OojYXEP3HBNYy
         cEmPIjx/aXgBHVVbUsaE22UNjX6uxcWRqD7nl0X1VhN9npPJSVsDWYZiWWJJgks/XWfH
         MO8dgfFPKvxSPVlqsveAbUKNOFlC1aQ4lmBnBPiYEOSow9hM7WUhsMMVKs1+faGzwlEe
         n98q/QClyMgcojgYcf8eM9iRLMKhvLZ0bT6pxyW+NRQKVO6Ibo/x9l58103B5totQ92R
         GinHqzTbN4i5PHDFt9rb/AQcdG9RuZ9ccLROtHrCum36RwgEsZjDoAmsCz8kkspA8zR3
         FCdA==
X-Gm-Message-State: AOAM533FHPRFuJv//Qi3TkldQIuTHYzbVr0zEYThNvUtq/7mHkPv7eIn
	xocCdLSTS9JesBZTLncLneYOlBL57UIzaumYKX+9cg==
X-Google-Smtp-Source: ABdhPJz16+9kQdS9QDTB0tjL4FsLbUEsFaIS0ykQfnx5qpyFYyBQCn1i8W4mcCkA/y3viUzYkXAgYYv9JpSOTwgMdpQ=
X-Received: by 2002:a50:eb91:0:b0:42d:c1d8:616a with SMTP id
 y17-20020a50eb91000000b0042dc1d8616amr54940771edr.219.1654914192936; Fri, 10
 Jun 2022 19:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net> <YqHwOFg/WlMqe8/Z@alley>
In-Reply-To: <YqHwOFg/WlMqe8/Z@alley>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Sat, 11 Jun 2022 11:23:02 +0900
Message-ID: <CA+_sPaq_47C2PWnGU7WfGXMc03E1Nz+1=F-wZe0B2+ymqdm3Fg@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Petr Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
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
	benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com, 
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
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, 
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
	rostedt@goodmis.org, john.ogness@linutronix.de, paulmck@kernel.org, 
	frederic@kernel.org, quic_neeraju@quicinc.com, josh@joshtriplett.org, 
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	joel@joelfernandes.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_192316_793337_E2923E56 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 13 Jun 2022 17:18:13 -0700
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

On Thu, Jun 9, 2022 at 10:06 PM Petr Mladek <pmladek@suse.com> wrote:
>
> Makes sense. Feel free to use for this patch:
>
> Acked-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
