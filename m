Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58320C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+E8loGAdajMcy8hZh8LwVRxD6A6pEgQ4wjPifi5SpE=; b=zXGa4w9cQTgxSw
	2ykh67+KXCoEvjZKPo9CyGR9x4V4WfFdN90glLwkXPZvTkgriixOJv3VfjNT9+IFRPZrmtOVbdAW4
	hBBnsHHikQe4DaR+zTBc20t32hVCr64Rf1TsiG7wBW/tWpij3Pn21Ze/qqP7r+TOadIkSEgx8p/ia
	HJ1BKF7aun8so8UWB4O+lstIG7h4idmafXGsJ8drwzZ0kK+bKplzHrTZepw64HoXbdtuNhaTiQ0Ku
	BX99YkulmEGXNhgcGQ3y5nXCoOjP/CtFFbcQTQ2H3Rf8vU/lIwelD83cxi1w47vJPFLuaSxKaLtbD
	EKCgOqvV9IBl/6NLa0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDRD-005DIh-OU; Wed, 15 Feb 2023 08:46:51 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDRA-005DGS-KI
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 08:46:50 +0000
Received: by mail-lj1-x229.google.com with SMTP id z37so11187025ljq.8
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d0NQp4OeQIj5XifqZfgHq0jDdROVEComQ2rxYyKysmk=;
        b=ISSZKB3WvKx76JDE//0Ys7Nv0uTUECeLpNx1dgu3yU0aaO3BMkmkSWIVYUdxvCunPg
         Awu5Z/LWXYspJyqyx8QYUD20lrnUVXOqEd4SR9cimGPruGPUlndvSuJmENPpsAw6kId0
         h1g6ru7FPJNN7w7u3czDcgEEJas5k4AKcz4sjEME6ogpTmIa8PcWF0zWrn6hPtyTbo6R
         S6pJ7Cq+VYmHQmbU9KqogAfM2Djxq8bmtY3DSAoIbhhqueYSPuHr3nlqoOzi2ymQ/VEx
         zto1CZm6XPXc4hGlpG5oWksSneusR/QLe6XXG/vhjAr/lUUzu5kaC0D7KyuJeTIZ86JO
         J5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0NQp4OeQIj5XifqZfgHq0jDdROVEComQ2rxYyKysmk=;
        b=1wbBQk6V0CTYGl+hSPtgTlcSFA8x3upBYLpsOWkJt1TNkxT/5TlJ7zFeamwe9bfCYW
         otxvCdDA7SlsHE7b+IsnASxfYZuwcavsJQXUMqo+tKMYRzo2SxZjTi0fVNvPLlmzGN9n
         9nQG/zwtShCF4Q9HNvZApamwjsZVgfEYCT6rcwYy12fnamH34mfdhAYDnzk36Kp0Flvz
         6Q2CXzyqykAccW3gGsV6gDDlvn8fH00O96E2j7HPV4Rk1ZI1woV+d6fMWfrvmktyGLCX
         /pC4WpfXYm7/gTCZqXJNf6sBKr+mGOS4uNDUJBg+I4Q8EyIZ+RgZUXCHJrvZer2wkYx7
         BSaw==
X-Gm-Message-State: AO0yUKXYGF/ANkQw1MexBHx5SIhyivpUEQV0GSDTa9HG9dU4W7P9HuB8
	F9EfVXEOk/sy6ce0o1jfts9IRPNIMtFptSnfyTR/TA==
X-Google-Smtp-Source: AK7set+zAaq0R+h4suQYhgRgqk6hp+Y00FM/JX+gQBlUJH+0qaoAfYJNRMpvJDJLcqk3/XeUT5uF+bDh7lFBg+eQtoA=
X-Received: by 2002:a2e:a365:0:b0:293:261e:74ce with SMTP id
 i5-20020a2ea365000000b00293261e74cemr312503ljn.4.1676450801070; Wed, 15 Feb
 2023 00:46:41 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006bc5be05f4b21b7b@google.com>
In-Reply-To: <0000000000006bc5be05f4b21b7b@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 15 Feb 2023 09:46:28 +0100
Message-ID: <CACT4Y+Yv7nuPkoQtAqu05K30hiq45ZYjPy-q5PAUHjJutydKig@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: INFO: rcu detected stall in corrupted
To: syzbot <syzbot+42670398d6ddb118138f@syzkaller.appspotmail.com>
Cc: aou@eecs.berkeley.edu, brauner@kernel.org, bristot@redhat.com, 
	bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mgorman@suse.de, mingo@redhat.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com, vincent.guittot@linaro.org, 
	vschneid@redhat.com, Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_004648_709313_05CBC7B5 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

On Wed, 15 Feb 2023 at 01:24, syzbot
<syzbot+42670398d6ddb118138f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    950b879b7f02 riscv: Fixup race condition on PG_dcache_clea..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> console output: https://syzkaller.appspot.com/x/log.txt?x=137aaec0c80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b3cd714c8e9a6e01
> dashboard link: https://syzkaller.appspot.com/bug?extid=42670398d6ddb118138f
> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: riscv64
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+42670398d6ddb118138f@syzkaller.appspotmail.com
>
> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> rcu:    0-...0: (1 GPs behind) idle=36ec/1/0x4000000000000000 softirq=6589/6590 fqs=9960
>         (detected by 1, t=30504 jiffies, g=14713, q=4 ncpus=2)
> Task dump for CPU 0:
> task:cmp             state:R  running task     stack:0     pid:2746  ppid:2744   flags:0x00000008
> Call Trace:
> [<ffffffff834348b8>] context_switch kernel/sched/core.c:5244 [inline]
> [<ffffffff834348b8>] __schedule+0x624/0x1254 kernel/sched/core.c:6555
> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> rcu:    0-...0: (1 GPs behind) idle=36ec/1/0x4000000000000000 softirq=6589/6590 fqs=28261
>         (detected by 1, t=122009 jiffies, g=14713, q=4 ncpus=2)
> Task dump for CPU 0:
> task:cmp             state:R  running task     stack:0     pid:2746  ppid:2744   flags:0x00000008
> Call Trace:
> [<ffffffff834348b8>] context_switch kernel/sched/core.c:5244 [inline]
> [<ffffffff834348b8>] __schedule+0x624/0x1254 kernel/sched/core.c:6555

Humm... initially I thought this may be related to the riscv issue
with too short command line (commit "riscv: Bump COMMAND_LINE_SIZE
value to 1024").

But it seems this actually fired after 300 seconds, right? (300
seconds is the intended timeout on syzbot):

>         (detected by 1, t=30504 jiffies, g=14713, q=4 ncpus=2)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
