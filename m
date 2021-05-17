Return-Path: <SRS0=ZUll=KM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1B9C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 12:46:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7476101B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 12:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7476101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KbJCP5eV+LJkalfFv9fcTnnAt0lsxLjY3MispjzbNoU=; b=GXMhjt3J3M1aD+qsx08GU95wi
	Opw0ejoYLnbO2faZ0AIVNQhkKGoqsEHaqZrBNB5kT11x7oQbv5bjOm7lUVnPtHXAcaKTR954OV1jk
	v/XlRqvlK9b0wwBP9vpRyNmMyyb73jwM/tRzXmYxbTf3XEdt/HD/tJXpSYM32mMPfXcw0DIsZTdqf
	ZInWpHrUAuV/iysrv2qCZCaV6Ed/rUaMs47UhpQEJ/1VMos/x/Y04+XmUkaC24flmcYMYM3sVjlrd
	0IvtkYmTD7XjFbA8mRmaitMqtmY8f9dW1EGhGyFakJ4AL7c3Aq03VY6AIDt2ivwRuvl3a608rt/NO
	aaK8hWoIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1licdn-00EyEk-C8; Mon, 17 May 2021 12:46:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1licdl-00EyEW-PU
 for linux-riscv@desiato.infradead.org; Mon, 17 May 2021 12:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=US7LpJWCwtTmFe0Y8kLTeXtbSfCIEwq3UZFrYiM9u4c=; b=aLvfFyXS/LEAGiOBuOEYbEmZyP
 vmM2ZuPhs8me9EmfNcmjqUkMFAEqnz8Uj7Vfl7hz+2ylf+6M1ko1kuExZu8g14+0TFN0L0MVC35Hf
 qDzoxQjrbIBwmm9CGa+y2zXCV2hMr3LIB2e3gqQYR2YkKVfOko7ubcfst/Iy5Qe5yZ2CpsmxAgi6t
 qa4VdRAgasM3vmtReEqxDIvga0WGAWfcPtOGiyzbx2JoVxJfn0Dodyz6Mv2ssi16OGYYfwhnczEP7
 rnsF1z8Cug+o1knJrlC0vtPWCzZ9u/0lX/oYslvJ7uIW7ide8q+y2B+0pfKaJYqn6S1HPbvoHK6Ce
 3gLoVbkQ==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1licdg-00Dlpq-8w
 for linux-riscv@lists.infradead.org; Mon, 17 May 2021 12:46:32 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id c13so1798413qvx.5
 for <linux-riscv@lists.infradead.org>; Mon, 17 May 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=US7LpJWCwtTmFe0Y8kLTeXtbSfCIEwq3UZFrYiM9u4c=;
 b=SxM/7RVHpba+L5Xt5BhFbsOC3V88HhUnMKoyePQGE6WaILJzZDs+jWlR7fhVDQ5XoR
 B9cWducwqElS89loGL8jnaLV88WhUg1mcik87unj2Zk1abJFRr1v70rv5senetfLqJjW
 MJIYokWCm/v8sQldUk0uExPs8VQHs2hi53wxXAedDRZ/yDaosI96UTWsk7CZHeWRdYz8
 OeuEO0EGu5TJSKVG+IO8bhzp6ZMi6N5CJI1BjV/JKHo8OZlDGJFi7abdDlbLfb3HfKLY
 8rGTLw+ZYed+2hcAJTTBVwkCmUgOcPumTd8uJOF7CMXLqfNZQT3YufAAedU6ctJ0kB/v
 wE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=US7LpJWCwtTmFe0Y8kLTeXtbSfCIEwq3UZFrYiM9u4c=;
 b=OXRofwNomCsUQr36pQw7NLJFINWl+H56rW9Xrek9aDYCBsK0y5UiKyrKXej1YyVzwW
 cZtTkShD+qGuTyBrxoN/wHpZhOXbDoqx1xjluk/Or1qwnWQkH03EMj6e2D2+tUgdwk1u
 9EvS4N1cxDp5/A6GRbb3NXzD9XXS92850M3e9Sh4cvasOsEPelWuHHsvIv5RuTLvoTYD
 fuxNDhfxxD10j/chQ1I1Wf1S/uNrAGB7AURZUGlpSlt4Oc43eUVt5UH4mv3nA2kZ397W
 Cdcf1a8kDtaM2Japr9ZXGQYA3uGDFm/sWDn6aVhfhS1vnlkfKoYqhbJpDd4W7CLYud1v
 okQw==
X-Gm-Message-State: AOAM531mWxlWSwh9q2IYytCMYpxXKtp5LKUGQx61MWfGugbzS2roab+d
 c5HbYm6+Lo/EOaBNigJAxuij5GEE5TnGFY3x9Rrjkw==
X-Google-Smtp-Source: ABdhPJytLMaCWze97hp4sqs2640skpJNc9pqDB3xaTeoD8HOdx//AFSEpd4TYu6tRlbapl/3Thh/UDKpTCU/BJkFYVw=
X-Received: by 2002:a05:6214:1705:: with SMTP id
 db5mr19714811qvb.13.1621255584959; 
 Mon, 17 May 2021 05:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b3d89a05c284718f@google.com>
 <YKJTNcpqVN6gNIHV@hirez.programming.kicks-ass.net>
In-Reply-To: <YKJTNcpqVN6gNIHV@hirez.programming.kicks-ass.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 May 2021 14:46:13 +0200
Message-ID: <CACT4Y+bucS5_6=rcEEpe+t8p_m3PQVzU5U+u+++ZSVG8E9zzmg@mail.gmail.com>
Subject: Re: [syzbot] WARNING in __perf_install_in_context
To: Peter Zijlstra <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: syzbot <syzbot+0fb24f56fa707081e4f2@syzkaller.appspotmail.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, andrii@kernel.org, 
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Jiri Olsa <jolsa@redhat.com>, Martin KaFai Lau <kafai@fb.com>,
 kpsingh@kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 netdev <netdev@vger.kernel.org>, Song Liu <songliubraving@fb.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_054628_334726_A319E08A 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, May 17, 2021 at 1:28 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 17, 2021 at 03:56:22AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    18a3c5f7 Merge tag 'for_linus' of git://git.kernel.org/pub..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1662c153d00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b8ac1fe5995f69d7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0fb24f56fa707081e4f2
> > userspace arch: riscv64
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+0fb24f56fa707081e4f2@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > WARNING: CPU: 1 PID: 8643 at kernel/events/core.c:2781 __perf_install_in_context+0x1c0/0x47c kernel/events/core.c:2781
> > Modules linked in:
> > CPU: 1 PID: 8643 Comm: syz-executor.0 Not tainted 5.12.0-rc8-syzkaller-00011-g18a3c5f7abfd #0
> > Hardware name: riscv-virtio,qemu (DT)
>
> How serious should I take this thing? ARM64 and x86_64 don't show these
> errors.

+riscv mainters for this question
Is perf on riscv considered stable?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
