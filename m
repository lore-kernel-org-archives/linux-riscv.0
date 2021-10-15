Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DEFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57D461037
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B57D461037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8ZP0CAxifCZFpFSLuJ9o1qZQYtIvl1rYlPA8yC8jS4=; b=kN9pWmF1E316pp
	PcZd1Jas1j2cNSPCsJfvE1TgEDdG+kNG6Rgwf/eGXd6n5tzOGVAJbLHSQhwOS7WyAnQ96GJFN95WX
	nc9S4io2r+xH2YeE/Ya8U3zqeK+WlIoEugafmn7G7k/3PPED5Fg1hmxeXzWj0c52tAMEtNMULTB8Z
	q+G8JH//RnDPnSIDr6ld8IvL1Sne0C56V5+f2BJNxWsf6MMyktZf/4/xB5gMxxNTJM7CFTVqsl1oq
	LYN/ueIri/A4BNA2lVbmKpqYyVaz9ijZl+eRWC5TjcDwaE86TrZ0Rq0u7IedhkyHcM2CeLlIMtq5e
	4ewOBBzpaOXbjTLo/6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRZM-008OFd-CX; Fri, 15 Oct 2021 18:04:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRZL-008OFG-9H
 for linux-riscv@bombadil.infradead.org; Fri, 15 Oct 2021 18:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iWFwLZtUtGK6QLeN9kwkzrG0DnPld05nUJlKzTSNq1M=; b=TKkIy9uEfgJwhj+gTY4uzfwmax
 0baqH8O8KrNb7Doua0roTYth1ckXfoqjJX8Hv3nGZY1RCjvoWMPFgBJ34IchV6bUKqVwvl6mZ37xR
 KPcdgndusraTnnK1v5Rfu6CofOx2h1PE0cxZ76Hd9WMDzAjpt32VjEZ2sSVF0URwEL0NThy7DPrlx
 EykTH3PUtC5GXcI4Hz32VKVum7ZMTccNVuPV95N0AMVWs+C5ILIINZVLzx+Em8f5rR4g0d4WKFsdq
 YD7XzC33MY60aXEZ1XypRY552W2gWeIrYFpp362bmOro2661TWvpH2L081WYfpvK81qTIbzl1CX8U
 aGpOAyTg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRZF-00A2dk-VJ; Fri, 15 Oct 2021 18:04:30 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8542C9857C7; Fri, 15 Oct 2021 20:04:29 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:04:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015180429.GK174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015135806.72d1af23@gandalf.local.home>
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

On Fri, Oct 15, 2021 at 01:58:06PM -0400, Steven Rostedt wrote:
> Something like this:

I think having one copy of that in a header is better than having 3
copies. But yes, something along them lines.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
