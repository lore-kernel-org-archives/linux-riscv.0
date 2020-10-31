Return-Path: <SRS0=buhn=EG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3607C388F7
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2020 07:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8918420709
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2020 07:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8Oa/+LR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrWrz0Qa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8918420709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/gDrdXypenF+Ow2uhQdUnuzMjeefGuHMOHk/XhcdI9w=; b=d8Oa/+LRs5nWq5DEJOXl/aGu/
	SVEs1V9lZ6xcpyurrdFY8eIRXuIec2eM/tmqJQ3U8+h+DhQ4ld2j2nFUUKXoiDEBYi6BkQWwMZ8un
	I0Tw7Z9pdSpMxOwgApfJbsDpCLS3xwzbpwy+nSo0PLE5zMVLTATu52Y4wJGC0QmoZENFGjKlr/PPV
	bRy4uHoZLUzhziq6Qijh8cVesXAPk4CNdmnHvShClCBtfuCptfTxlQ+Mroujwy+nz4TFIV4cYsCao
	5Ui0powsIQLc/XPBv23e2jcXpWFvpSJWBTdSbISa04C8r/U9tBdGnlpEU2hBHbGk3xV+0uH/mlDOe
	k9wKOkb3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYlXO-0006SB-EO; Sat, 31 Oct 2020 07:42:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYlXB-0006LW-BH
 for linux-riscv@lists.infradead.org; Sat, 31 Oct 2020 07:42:55 +0000
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCF6A20709
 for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2020 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604130162;
 bh=oi5Erw8ptiShmFnsFP95vlnIhS9KpblRKlS7+BrH0hM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LrWrz0Qa8oElMhI8dyu2VN1FEgaPk/ZbZ6ymB1aaDktS+tZh7cXHdaYQF7WeLfGwM
 yqMeKe3C7i6pWMyxBZVMOOV7vLv/V4dKBKZRVRfbvAwFFAqu+DcFbXKfbR1fC/2NoN
 M1T/BwiwtpF9lN7Aq58nh4Js8SYqsbb9nrsoT1vw=
Received: by mail-lf1-f44.google.com with SMTP id h6so10784707lfj.3
 for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2020 00:42:41 -0700 (PDT)
X-Gm-Message-State: AOAM530/uQSrt2d1Y4TF1LQZFu1MydSsWEpj3xA4t4bnvjkANe4LXxi+
 6W7/rRfdrB2OYR6iIIku7ZUD3IK1CuxFrKW3dH0=
X-Google-Smtp-Source: ABdhPJzX8AI5qWnKvtMzn7QT46/Zv5KpxetvK2uNBsN76JSnc7tXgXt73ZVLx/5jzD1UGV1QJqAznSCvylGchOrXDRA=
X-Received: by 2002:a19:6b10:: with SMTP id d16mr2205633lfa.121.1604130160109; 
 Sat, 31 Oct 2020 00:42:40 -0700 (PDT)
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
In-Reply-To: <20201030202818.72070cbd@oasis.local.home>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 31 Oct 2020 15:42:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSaSzvo2G7prqqtEOueGhERcrcM7VDjK=WeqtePhhZ+dg@mail.gmail.com>
Message-ID: <CAJF2gTSaSzvo2G7prqqtEOueGhERcrcM7VDjK=WeqtePhhZ+dg@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_034245_630071_F666A413 
X-CRM114-Status: GOOD (  15.75  )
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
 Paul Walmsley <paul.walmsley@sifive.com>, rcu@vger.kernel.org,
 Colin Ian King <colin.king@canonical.com>, mathieu.desnoyers@efficios.com,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, joel@joelfernandes.org,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 8:28 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 30 Oct 2020 14:47:56 -0700
> Atish Patra <atishp@atishpatra.org> wrote:
>
> > > Look at arm64, they __kprobes flag and I guess it would also prevent
> > > ftrace call site.
> > >
> >
> > Are you sure about that ? __kprobes puts the code in .kprobes.text section
> > which is under whitelist sections in recordmcount.pl & recordmcount.c.
>
> Correct, ftrace can trace functions marked with __kprobes. That said,
I guess wrong, thx for correct me.

> the instruction you are looking at here, is in a file that is
> blacklisted from recordmcount.
>
>   CFLAGS_REMOVE_insn.o = $(CC_FLAGS_FTRACE)
>
> All ftrace flags are removed from the compiling of insn.c, and every
> function in that file will not be traced.
Yes, arm64 prevents the whole file from ftrace. My patch just use
notrace flag setting on some functions.

@Atish How do think:
CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_sbi.o = $(CC_FLAGS_FTRACE)

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
