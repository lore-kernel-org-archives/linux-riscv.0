Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580D3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:40:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDDB20756
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcm5tDn3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iVpnDUGA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFDDB20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tvRM608R4bGQnLTKPK23C9FdTj8NZsxkZ0xPJEAqdEc=; b=rcm5tDn3Tqutw9T5G4p5hLoI5
	B/kRj1gHR7IEPfwLGI+2Uit4g9BFxWgBK6ued9l1PHfj+IbmnKvt/d/ej2wjDmXtC+7zzeIiDaoUA
	hCfVmBVk0cGFa4FXwASqMRiFN/Bvm3+JJuRCldlyuq0N7H+w98EcoC0Cvxvi/p1WaelSCuLltNqXy
	3Bzod0nCCap1aOZqIs3O434tFqq91Dt0l/gOQbXReEzS7aVfyh2f72zPHp1pgKbj2yKbWT62Ees6j
	AchlYoIhZc7gVUfMszIYE6Sl/n2FJqFCDCG7JIgo2ITfjIlrZd4jBqjj/7gbVVxD9v66Z9SPwNAiZ
	JbeAGCTdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZyPT-0000Ox-FI; Tue, 03 Nov 2020 15:39:47 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyJj-0003Rc-Nz
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 15:33:55 +0000
Received: by mail-io1-xd41.google.com with SMTP id r9so18846682ioo.7
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 07:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vOkFShIvcUzC6IIWe+nbZVspE2Bn0Jpu0DWyaTr22tE=;
 b=iVpnDUGADTtM5z9B1Q4fm0j2KOKhtLqzlicMhnj6QMjWubr0WU6JCZKmwrUuLHkL+L
 ms6mmflECGT5Sh2YFs5yRkunpFjFnlD2q2/dVjPa+O871RG3vL9vcdq+6LIV95O5emvQ
 l0Sp7tRysizsxqLa3vWHxhkewEeIoLiJO1k9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vOkFShIvcUzC6IIWe+nbZVspE2Bn0Jpu0DWyaTr22tE=;
 b=A4mmG9jDqhkXhncGYBfLi/pqMeOK/URiwcQxVS72iF69dTrUS00KH1gPTfKe+u4ntM
 4xQm9DUNbnB3UfHQ+ogroH+xG5rph+D5BHX8ikHp8Jpxll4FxTe9sCdFdSR//KHYom0z
 nU/WmV/9mwnRsiBeAyv9vKuYP8UiLHQcg5BMz/m0wyBIGL382vhkNz3rM4dIvLg/FJxx
 CW4DrymEuia8VJ7pbw9H1OL9c97VckPGRLI8h1j5IuaTacda7kdGb+egrJVrNN3apMcI
 DFiQZE5z/iRVh6lJnqER02sUM9moFtafzUsohQASIPvF9CIZH5PK7AFeoonoqIe8s8sK
 T0uw==
X-Gm-Message-State: AOAM530Gho7KpMdaSkej3ML6gYbjKs5ytbVSJzSAzJGY1c1Ht4oTtu/e
 Ybvq+QcsbjKlcMORvDeDHzZEJVcGe8lV8ruRPapk
X-Google-Smtp-Source: ABdhPJzRmQhr0W08TEvz9zLHYNIwDDs0PqgRXP+6iIcUUlWfmG1vtmHHCo/h4UxS6vvXcVw7inl5opNTgawpWgnoH6I=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr14701308ios.113.1604417629220; 
 Tue, 03 Nov 2020 07:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20201021073839.43935-1-zong.li@sifive.com>
 <CAJF2gTTnGSYAc3AZKCPvhNJsPm_TchPjPrtqc_WzaK7K5eNt+w@mail.gmail.com>
 <CAOnJCULN8h0Jk3H-vskgbaXhgBTgTTAT5Dji0qHi6yHoXGePvg@mail.gmail.com>
 <CANXhq0q_fOg7vsniVMtNd8VezW1yymf55FYRc61WMkXMOtZpgA@mail.gmail.com>
 <CAJF2gTR-_=_vDLsST9BVxRFC0OTR4_TYV-2=nH_Gux_zWDOk3Q@mail.gmail.com>
 <CAOnJCU+d5YQzKW2qs0NURJt1_5zrM6YXrkP4FzB_=zgbb-5DuA@mail.gmail.com>
 <CAJF2gTT9gZZftoUD4eMT0Th=oYOpsdYbrFdr=5kO2-N+ki51NA@mail.gmail.com>
 <CAOnJCULO7TuRhBcx6KUVr6t_jqouN-0rao9QXC1RgrU5ehutkw@mail.gmail.com>
 <20201030202818.72070cbd@oasis.local.home>
 <CAJF2gTSaSzvo2G7prqqtEOueGhERcrcM7VDjK=WeqtePhhZ+dg@mail.gmail.com>
In-Reply-To: <CAJF2gTSaSzvo2G7prqqtEOueGhERcrcM7VDjK=WeqtePhhZ+dg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 07:33:37 -0800
Message-ID: <CAOnJCU+kMJCrwJ5MD2pYRoub1TpVGgpfX=6nNG2uFB6PNJLEiA@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_103352_209004_25988743 
X-CRM114-Status: GOOD (  18.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul McKenney <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 vincent.whitchurch@axis.com, jiangshanlai@gmail.com, josh@joshtriplett.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Colin Ian King <colin.king@canonical.com>, rcu@vger.kernel.org,
 mathieu.desnoyers@efficios.com, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 joel@joelfernandes.org, Greentime Hu <greentime.hu@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 12:42 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sat, Oct 31, 2020 at 8:28 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Fri, 30 Oct 2020 14:47:56 -0700
> > Atish Patra <atishp@atishpatra.org> wrote:
> >
> > > > Look at arm64, they __kprobes flag and I guess it would also prevent
> > > > ftrace call site.
> > > >
> > >
> > > Are you sure about that ? __kprobes puts the code in .kprobes.text section
> > > which is under whitelist sections in recordmcount.pl & recordmcount.c.
> >
> > Correct, ftrace can trace functions marked with __kprobes. That said,
> I guess wrong, thx for correct me.
>
> > the instruction you are looking at here, is in a file that is
> > blacklisted from recordmcount.
> >
> >   CFLAGS_REMOVE_insn.o = $(CC_FLAGS_FTRACE)
> >
> > All ftrace flags are removed from the compiling of insn.c, and every
> > function in that file will not be traced.
> Yes, arm64 prevents the whole file from ftrace. My patch just use
> notrace flag setting on some functions.
>
> @Atish How do think:
> CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
> CFLAGS_REMOVE_sbi.o = $(CC_FLAGS_FTRACE)
>

Looks good to me. What should be done for copy_to_kernel_nofault ?
That is also in the calling path.

> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
