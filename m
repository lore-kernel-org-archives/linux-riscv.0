Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAF4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 13:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A9756109F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 13:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A9756109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSSkNMnvjdsGD4DX0FZUfHySQteGkHnp+wAaHDYeqls=; b=Wef3ifYUTKesLn
	Emp/8G023Ge138ga7UW2ykICyQgC8gJKvDnaoppJA61hFllTLKQeUK3nX8Oxqa5wff+yAXIY/uCKI
	G+J/7u56z9cS5nMS8Uk2gxoqwOXztT7vVm+xvg1rPEs6xJZNAv9l/7wTIGWIW3mOFaTiHAA+3n57o
	bdB/vEZ4A2rCD2tT9QO4TyZLuedlpYUZcPh0rwQ1KcDY0uPgx0NhTecjXvSCXIYQchardjrS0clUd
	x8aWtccxzrfp0qna7T9mwApCSnieucuaJIn+WNf8crJC+EGb16cqJEhfK/EK1eLRuQLenAAaSRsT2
	qExM1EQ1Jqaes7VFAlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb0n6-003F7n-M4; Thu, 14 Oct 2021 13:29:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb0n1-003F5c-FJ
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 13:28:58 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D6B460E8B;
 Thu, 14 Oct 2021 13:28:52 +0000 (UTC)
Date: Thu, 14 Oct 2021 09:28:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Guo Ren
 <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <20211014092850.101ceaee@gandalf.local.home>
In-Reply-To: <alpine.LSU.2.21.2110141108150.23710@pobox.suse.cz>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <alpine.LSU.2.21.2110141108150.23710@pobox.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_062855_611539_B04AC992 
X-CRM114-Status: GOOD (  14.97  )
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

On Thu, 14 Oct 2021 11:13:13 +0200 (CEST)
Miroslav Benes <mbenes@suse.cz> wrote:

> for the livepatch part of the patch.
> 
> I would also ask you not to submit new versions so often, so that the 
> other reviewers have time to actually review the patch set.
> 
> Quoting from Documentation/process/submitting-patches.rst:
> 
> "Wait for a minimum of one week before resubmitting or pinging reviewers - 
> possibly longer during busy times like merge windows."

Although, for updates on a small patch set, I would say just a couple of
days, instead of a week. It's annoying when you have a 15 patch set series,
that gets updated on a daily basis. But for something with only 2 patches,
wait just two days. At least, that's how I feel.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
