Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42F5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 13:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6687A61360
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 13:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6687A61360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hB/tcTCxfbPfF2MC4P67tQE0uSCmkvCr1rWPfihkvA=; b=EGh+1gZy2gSoCM
	ekZzRNgsQI1NBupQQ7NdDOcGuiWEVtMhISMqE/jnosLKnxUtiJ30194CazjB9P9cpUG2Rl0oRE3LF
	3zhQRJvc0MsawUcg5if5hvgXtud8KYfPEzlctk/RYQut72jOvtVv0BSeZGfWnnW4yDX/iJiDyYSJ+
	W95aDfQlZzMUF/r8RBrPGvKYOCKPBGe5eRuZPUjewxsZIHct8ykngZjuAcnJ8y3su5c2uvGDd0HVZ
	F/Tpl1V/0jEmqxyHXlUcrBZ6+BiY/1dMvIWZILcNiB3oGss5d9mAG6leNeBMo5aJUCjO55GAIyg65
	Nlt2KwqE+cpfmN+uueUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcoiz-001Kz4-1a; Tue, 19 Oct 2021 13:00:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcoir-001KwD-SO
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 13:00:11 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF87360FC2;
 Tue, 19 Oct 2021 13:00:02 +0000 (UTC)
Date: Tue, 19 Oct 2021 09:00:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Colin Ian King
 <colin.king@canonical.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211019090001.0df8d678@gandalf.local.home>
In-Reply-To: <YW5ok3CfNoRMfVQ5@alley>
References: <20211015110035.14813389@gandalf.local.home>
 <YW1KKCFallDG+E01@alley>
 <20211018220203.064a42ed@gandalf.local.home>
 <YW5ok3CfNoRMfVQ5@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_060005_976730_CF3262D4 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, 19 Oct 2021 08:41:23 +0200
Petr Mladek <pmladek@suse.com> wrote:

> Feel free to postpone this change. I do not want to complicate
> upstreaming the fix for stable. I am sorry if I already
> complicated it.
> 

No problem. It's not that complicated of a merge fix. I'm sure Linus can
handle it ;-)

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
