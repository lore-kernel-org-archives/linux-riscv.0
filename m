Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE79C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXSDFjHFv925xfBMDxaV9yol2bO+fRj1nm3EPA0QTe8=; b=bx5MV/RYfKIxPY
	3sI6NTaVGtJq4aEvVge3DkDQhJfpVUJXp/NGwU0CfXCZVWbC5D0xkvPU83Aw9pTpoU3xKq0z+oIUb
	PGEi0o3yeDRA/MNeOb915TQgEo1ij9KAAX70s/mh9hAocCJHWtBNu/NlRWqdf2ss9GFopUtzZwpdL
	KKi2/HhLyZj9KUT/5FAI7PLGzbB4wsigE9vLJiHrO4NtMgQZ6+zS98VETKl//+aM4/CcK9i5EmCDE
	V+XfuLqxnvVUhpHox+yqJ780ERIDMSKBDfxcoHEU7zoXU7DPbkCf1W88pozAOTmDG6w9ANo0emL4E
	8ZXjq6zCfjJQoIOElGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSJlf-00D6Mx-GU; Thu, 10 Mar 2022 14:27:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSJlc-00D6KQ-1p
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 14:27:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7C3DB82615;
 Thu, 10 Mar 2022 14:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C99C340EB;
 Thu, 10 Mar 2022 14:27:43 +0000 (UTC)
Date: Thu, 10 Mar 2022 09:27:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Ingo Molnar
 <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: no need to acquire text_mutex when
 executed in stop_machine
Message-ID: <20220310092742.4fcc7131@gandalf.local.home>
In-Reply-To: <20220310045454.672097-1-changbin.du@gmail.com>
References: <20220310045454.672097-1-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_062748_293978_BAE4E389 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, 10 Mar 2022 12:54:54 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> It's safe to patch text segment in stop_machine. No race is possible here.
> Besides, there is a false positive for the lock assertion in
> patch_insn_write() since the lock is not held by cpu migration thread.
> 
> So we actually don't need our ftrace_arch_code_modify_prepare/post(). And
> the lock assertion in patch_insn_write() should be removed to avoid
> producing lots of false positive warnings.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Ideally, RISC-V should try to get off of the stop_machine approach, and
move to the breakpoint modification.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
