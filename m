Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA9C9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TihHqO7KKcyufGGCvPL6m1tdHHJKqHrvhrM4MERZYhs=; b=2eYfjo0GEwjiwT
	tujq8UqtDpM44+01YD8oVHahka4gN6leW3azhZfVOJ6t++/yADfRFdkZeRiAsHCsb7HZC0g9evUPu
	pi4paYQ35hNYujK29U5COeIXJ1F8nGUekPPFMwCh0dlSgS+Qws5m6hRejmawBkutJu1d5NY0a0R6V
	AsQGaYOJnwiJ5lSvJk9u5ubo+Uz4/PTTUuHdCZs8VCYORDmO4yvz00zT5A8vOey4OQdCSShyZjwz6
	MLrmFou9ss2LwoT2lleCagOwdRrbR7iwBNtpoXLrqV1kqGfsyfC9q7ghK+KiBq2o+wqCDmHLScceA
	txjW7M7UYi8AWgQStf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB74k-0000000098m-2IO9;
	Mon, 28 Sep 2026 08:51:06 +0000
Received: from out-247.mta1.migadu.com ([2001:41d0:203:375::f7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB74h-0000000097m-0GYc
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 08:51:05 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=09WBzyqcOHBSt5hLHqAwbTciP1G0S+c8iry/IFi/HlI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790585459; v=1; x=1791190259;
 b=hlJSyJb4zyvL5tTc5B+UKJvJCZdxkTMJPLEWB4nUbp/tleH04SocnIPGb4w8yi3m5ovXyx/z
 NSXt9VR0s+2Xg/Os5fYU54qClXCgayhYrJKbIYjmLqn2jdYk36jdndIr87ji4R0cYdAR0U+78QB
 B7kA8WSWg0tewIstOzALdJoI=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dcca5a333ecbdbdc;
	Mon, 28 Sep 2026 08:50:58 +0000
X-Mizu-Trace-ID: dcca5a333ecbdbdc
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Mon, 28 Sep 2026 08:50:55 +0000
Message-Id: <DLQTKIGNXKLS.1E0Y9RS93S82N@linux.dev>
From: "Florent Revest" <florent.revest@linux.dev>
To: <bot+bpf-ci@kernel.org>, <bpf@vger.kernel.org>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
Cc: <martin.lau@linux.dev>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <kpsingh@kernel.org>, <john.fastabend@gmail.com>, <leon.hwang@linux.dev>,
 <zirajs7@gmail.com>, <rhkrqnwk98@gmail.com>, <puranjay@kernel.org>,
 <xukuohai@huaweicloud.com>, <iii@linux.ibm.com>, <hbathini@linux.ibm.com>,
 <chleroy@kernel.org>, <naveen@kernel.org>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <yangtiezhu@loongson.cn>, <hengqi.chen@gmail.com>,
 <linux-kernel@vger.kernel.org>, <aou@eecs.berkeley.edu>,
 <agordeev@linux.ibm.com>, <alex@ghiti.fr>, <bp@alien8.de>,
 <catalin.marinas@arm.com>, <borntraeger@linux.ibm.com>,
 <dave.hansen@linux.intel.com>, <emil@etsalapatis.com>, <hca@linux.ibm.com>,
 <hpa@zytor.com>, <chenhuacai@kernel.org>, <ihor.solodrai@linux.dev>,
 <mingo@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <loongarch@lists.linux.dev>, <maddy@linux.ibm.com>, <mark.rutland@arm.com>,
 <mpe@ellerman.id.au>, <npiggin@g>
Subject: Re: [PATCH bpf v5 1/3] bpf: Wait for an RCU tasks grace period
 before freeing trampoline progs
X-Mailer: aerc 0.17.0
References: <20260926135605.1217928-2-florent.revest@linux.dev>
 <9d932a22ca908da9378ea281633ddb749453911ac6ae7a27a09e376f9ad02ff7@mail.kernel.org>
In-Reply-To: <9d932a22ca908da9378ea281633ddb749453911ac6ae7a27a09e376f9ad02ff7@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_015103_239626_91191036 
X-CRM114-Status: GOOD (  21.68  )
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

On Sun Sep 27, 2026 at 8:41 PM UTC,  wrote:
> > bpf: Wait for an RCU tasks grace period before freeing trampoline progs
> >
> > When a prog is detached from a trampoline, it is freed after an RCU
> > grace period, or an RCU tasks trace one if it is sleepable. This covers
> > the tasks that are running the prog, since the prog's enter helper takes
> > the matching read lock before the prog is called. On a preemptible
> > kernel, it doesn't cover a task that was preempted in the trampoline
> > just before the enter helper. That task holds no lock yet, and it calls
> > the prog after it was freed:
> >
> >   BUG: KASAN: vmalloc-out-of-bounds in __bpf_prog_enter_recur+0x3a5/0x3f0
> >   Read of size 8 at addr ffffc90000055040 by task candidate/110
> >   CPU: 1 UID: 0 PID: 110 Comm: candidate Not tainted 7.3.0-rc2-00014-g15071f2a1263-dirty #2 PREEMPT(full)
> >   Call Trace:
> >    <TASK>
> >    __bpf_prog_enter_recur+0x3a5/0x3f0
> >    bpf_trampoline_6442509193+0x37/0xf1
> >    __x64_sys_futex+0x9/0x410
> >    do_syscall_64+0xb0/0x530
> >    ...
> >
> > Wait for an RCU tasks grace period before the existing one when freeing
> > a prog that was linked to a trampoline. An RCU tasks grace period only
> > ends once the tasks that were preempted have run again, and
> > bpf_tramp_image_put() already relies on it to free the image. It doesn't
> > wait for tasks that sleep in the trampoline, the next commit takes care
> > of those.
> >
> > Only progs that were linked to a trampoline can be called this way, so
> > bpf_trampoline_add_prog() marks them and other progs are still freed as
> > before.
> >
> > Fixes: e21aa341785c ("bpf: Fix fexit trampoline.")
>
> Is this the right Fixes: target?
>
> The race being closed here (a task preempted inside the trampoline image
> before __bpf_prog_enter*() takes its RCU read lock, while the prog is freed
> after only a regular RCU or RCU tasks trace grace period) appears to predate
> e21aa341785c.
>
> In fec56f5890d9 ("bpf: Introduce BPF trampoline") bpf_trampoline_update()
> switched images with no tasks RCU wait, and __bpf_prog_put_noref() freed the
> prog with a plain call_rcu(&prog->aux->rcu, __bpf_prog_put_rcu).
>
> Just before e21aa341785c, the synchronize_rcu_mult(call_rcu_tasks,
> call_rcu_tasks_trace) in bpf_trampoline_update() ran before
> arch_prepare_bpf_trampoline() rather than after the new image was installed,
> and the total == 0 unregister_fentry() path had no wait at all, so a task
> preempted in the old image could already reach a freed prog.
>
> Would Fixes: fec56f5890d9 ("bpf: Introduce BPF trampoline") be more
> accurate, so that stable trees without e21aa341785c also pick this up? The
> follow-up 49ca60187380 in this series uses the same tag.

Yeah, that seems right. It shouldn't make much of a difference for stable
because both have been introduced in the same 5.10.y. I can either switch this
if there's a v6 or a maintainer can change when applying.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
