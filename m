Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70220EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 01:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71Ho8K1ex7m2tCxdCVi+ey2P2SxLc4qgJlFUIj3/xuw=; b=1a6sgbUclEIWFG
	0Vea4ddeAsDAhmt7nj0o4THytJWWJD1IuKhZyDav5LCQI6pJKnoQAgXRvBXPQi3tBrT7zi3eXZSwz
	LRbFtBMpjzz0JrnhKQn3NS1v4YhxBqHNvOAr5217c6UXJIvTB4h9IqFgDSwsxQfCduK7UqXRajtID
	8M4nY7WGuL4tIojPC9mCHd+lCoPRcXIHXGkEhkG3c/N+lOGLvyc+9NUp3t99qm0NdVRVlvSSbITdH
	7SclVbIDe08npMxt54sEPrl56P2uV58/Y/qvwyN288C/fWLc7eOQwa0I+B0aPApNlalzDaeyWsXMD
	6sUqm/oct0huUc8KcSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1KU-00FWnD-0z;
	Sat, 22 Jul 2023 01:22:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1KR-00FWmK-1p
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 01:22:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0344D61DB8;
	Sat, 22 Jul 2023 01:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5AEC433C7;
	Sat, 22 Jul 2023 01:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689988957;
	bh=ymdnVGyJNnGUv2HZI8/M1PK0lCyu640ix4SSxWqfV44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qX6KSrLjUNhNPi02nh+6ca0mclsiX8ngx6MgAoXToVEXfxGVJDqDd+M/xrQSvGPdo
	 HnjJABDZ+OFRbofb+JDvnjIEveDSuko/ikgRmWfqsjkq952i36BAMvINTGaChjawkN
	 B6OgwD+8AJO8pd8z/xs4a/6K9P/a/2QBnvpuWam+MrqHhLdmuXK4SwdOcmYgpxe7vM
	 22q4vDY9qAL+C5nUG3OBKyhHxxOwDvkPnHotsHGxEf6IGBGHRf44LFpW0ECov/5dH/
	 YZurOS/9kOxHoWBIWBcbE7057VWjExGXUHZp3YSqZogBmtq6DHFSz4dzR5vmf0EeHL
	 9OCfZ4ADrf3gQ==
Date: Fri, 21 Jul 2023 18:22:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar
 <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, "Benjamin Herrenschmidt"
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, "Jiri Kosina"
 <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Colin Ian King
 <colin.king@canonical.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 "Nicholas Piggin" <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <live-patching@vger.kernel.org>, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20230721182235.6617a466@kernel.org>
In-Reply-To: <20230721122632.56b4df6c@gandalf.local.home>
References: <20211015110035.14813389@gandalf.local.home>
	<20211015161702.GF174703@worktop.programming.kicks-ass.net>
	<20211015133504.6c0a9fcc@gandalf.local.home>
	<20211015135806.72d1af23@gandalf.local.home>
	<20211015180429.GK174703@worktop.programming.kicks-ass.net>
	<20211015142033.72605b47@gandalf.local.home>
	<20211015142541.4badd8a9@gandalf.local.home>
	<1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
	<20230721120040.6ed2c02a@gandalf.local.home>
	<035cee53-255b-11a3-d7ac-ca46c05b907b@intel.com>
	<20230721122632.56b4df6c@gandalf.local.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_182239_651658_60C4CA6F 
X-CRM114-Status: UNSURE (   8.41  )
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

On Fri, 21 Jul 2023 12:26:32 -0400 Steven Rostedt wrote:
> > if (!(in_hardirq() || irqs_disabled()))
> >   
> 
> Yeah, probably.
> 
> > , nothing more elegant / already existing / ...?  
> 
> It's not a common check. What would you call that?

Looks like Olek started the weekend already so let me answer.
He's trying to check if we can use a fast path cache which takes
a _bh spin lock.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
