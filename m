Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE29C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpfqmaGkxbrRgzFsvqRvnireF02SpJRuzojWNcytOQs=; b=Jj+cMevMaF/ies
	1y9CyTHVP7zmUM9DWTAOroSSOLlPv2pC8mVCfjGDfm/t5PnmFSbzOLuAWTJZ98tUrSJ+JpBzAm8Mn
	ybRrmuGFhiwv5UqX7tfltfyZXJC7l8yF9oGGl9MsAKSXKOYWEqRJtHbraiGPSWy2mT1uZ3Afvztag
	qN0uYEQ9MEEpoxHo/K+doLisYb+FeaJX38mTNGK2UXfALTPDxrp/Pcl7iqOiPkNlLOVBlCYqUu5eH
	kcSSPTS3e+D5Yi8vnfjjpLTkA4WyxquMQRT6HJ+ljAL9xEdvRsk/KIomo7fCRH8KjmGKtXdhaJfs7
	2xt9RFdGGJEqp7z7gwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmseW-001tj7-7e; Fri, 06 May 2022 07:45:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmseJ-001tf2-Qz; Fri, 06 May 2022 07:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=76ci9KP4pdEawwj0Wkg2yGeqPx+7uXOp8RwNA7UZyyE=; b=c35fBELWFU6GviCTAqWHXuVy7s
 Z478ICt13U3FdBywT70QE6XOkqnBKZYk7Ja3oO2rmUL2tZFKHatbOHp1Re+YyNwYOZgdtFkDw/c+o
 7z+YS1pFz7NwJHIGo8AcT0OOlmNS798DTLR2FZusC/c0tkNJtWr0rIHbNzFXgKsasN73TslY0HgpB
 Rf3SrunJOuri5yApFRBuAheTesmAItIW8mPawcJAHfWP2H+42xwacpmTLNYT2AMBFvOmjJz9SNyzK
 uV8tGNjNTrRE9AJyGGeR7qWVe8S2gq10PhK1FQ5H3auiy+gwaJtZWRdX4p06nScXx/0uS8VvLKhhy
 dOL+M0Hg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmse9-000jAs-SA; Fri, 06 May 2022 07:45:06 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 697AF980E75; Fri,  6 May 2022 09:45:03 +0200 (CEST)
Date: Fri, 6 May 2022 09:45:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <20220506074503.GG2501@worktop.programming.kicks-ass.net>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
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

On Thu, May 05, 2022 at 06:09:45PM -0700, Josh Poimboeuf wrote:
> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
> 
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
