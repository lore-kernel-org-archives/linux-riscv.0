Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9A1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 21:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A2726113E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 21:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A2726113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCsnemcFU0F1qXCoY1w85PtqDiyarjwE84mKDZlMSNE=; b=sjhGejkguTjh51
	LG3UoLxE8TFNPSPsTX+jojPRVzNHcYNMgBxzlv9/9TrtpAzcLm9VRrrqhOON3n2PawCe3+xk99LOw
	ESv+gN+pdni0uIHucCOfBoW7UWH4oUdMdSDjWGJMaii357Dv33GCI4pnBJL+UeFwHsCwt5cZp0uRB
	4G0sp9LgWhfnLNEH7kRAxx7KKIxfa1Yh/JUSY+6wsUyOFqBJEhjxVW+z+gk2sobetFEkHKpryARhx
	15UsfaiEkkPfibb+OL75AslenVTy00i2/jkqGVdZKodi974DnwTd7KKaQLAu8juO2XhHWl1tTClSB
	Rm+28YZiTa9uKrK/6uXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcabK-00HM7g-4o; Mon, 18 Oct 2021 21:55:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcabH-00HM6Y-Hq
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 21:55:21 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E68B610A1;
 Mon, 18 Oct 2021 21:55:16 +0000 (UTC)
Date: Mon, 18 Oct 2021 17:55:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Guo Ren
 <guoren@kernel.org>
Subject: Re: [PATCH v2] tracing: Have all levels of checks prevent recursion
Message-ID: <20211018175505.3e19155a@gandalf.local.home>
In-Reply-To: <20211018154412.09fcad3c@gandalf.local.home>
References: <20211018154412.09fcad3c@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_145519_651656_5DB57A03 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, 18 Oct 2021 15:44:12 -0400
Steven Rostedt <rostedt@goodmis.org> (by way of Steven Rostedt
<rostedt@goodmis.org>) wrote:

> [
>    Linus,
>      I have patches that clean this up that are not marked for stable, but
>      will depend on this patch. As I already have commits in my next queue,
>      I can do one of the following:
> 
>     1. Cherry pick this from my urgent tree, and build everything on top.
>     2. Add this on top of the mainline tag my next branch is based on and
>        merge it.
>     3. Add this to my next branch, and have it go in at the next merge
>        window.

Hmm, I take this back. Although the clean up affects the same code block,
the updates don't actually conflict. (Although, if I do update the comment
that Petr asked, that will conflict. But nothing you can't handle ;-)

I'll start running this change through my tests and post it separately.

-- Steve



> ]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
