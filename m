Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B77DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FD660EDF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5FD660EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnLWgX1sJFNfmkcjy1/l9jvjdZmuA1M/tnHz9tuB/kc=; b=Y7+VuYM/Kk4CuJ
	8v73jkEUhtH9jf+U+dbVN4XmgM62pKJqPzSakNIvfFJ1ApS2Swjo9nRkMkrbhQbU4KMTew1iyUUHm
	h3TKKYjUjynQTi7xazzeOVWSEmjhKFxOYPttY63chwZuSwj4XKuMnEbQDUAzDWXLO4tWJjnQXEwEm
	ukdR8jOnxPQdReRlGlj+ld8CnpOe3TxAFD7xb83hzOhk6xKpoUzr2B6SZH6bpSM5+zWB6yRv9XK/5
	ljxXUNg609jrdXTBwdvwTubtitE1fMX51VVM4L6vqz4FJrO+91gjpr27Mf0pP52H56k963X+czdvM
	VX2lBsV5NU/aHim97bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mabF2-00FvEh-Rr; Wed, 13 Oct 2021 10:12:08 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZa2-00FYpZ-G6
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 08:25:44 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EAFE122293;
 Wed, 13 Oct 2021 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634113540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gtfMhdTCLZEryLgjqIY9aS8OXYQtmP7j21hE/U/0byU=;
 b=XuZS1UsK+pfyAdOjBepbUpW8kD9Wf+FpL5NRUCIiFXRNt+KflFTVQ2adE8t1vhhNnd+ZFX
 y7b55Uu04L7SStRKxz1Tl1kX7YvnJ5hKwm6Tg8+Z5msjQfyaaHzbBuTIG+AmINlEmd+ObI
 CDgbPtcvrmua8hGgAe8Td9n54vleRBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634113540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gtfMhdTCLZEryLgjqIY9aS8OXYQtmP7j21hE/U/0byU=;
 b=f5Y5fFwlmKK9upr3244TYcrXdUE5DgxW2RHInIuAqU0gultFbVn42x1Sg/1NorKEDGSOVR
 3Pp6eeu/JPTFI6Bw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 74849A3B84;
 Wed, 13 Oct 2021 08:25:39 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:25:39 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: =?ISO-2022-JP?Q?=1B$B2&lV=1B=28J?= <yun.wang@linux.alibaba.com>
cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
 Colin Ian King <colin.king@canonical.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
In-Reply-To: <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
Message-ID: <alpine.LSU.2.21.2110131022590.5647@pobox.suse.cz>
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
 <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
 <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_012542_727144_F7F20FCA 
X-CRM114-Status: GOOD (  10.34  )
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

> > Side note... the comment will eventually conflict with peterz's 
> > https://lore.kernel.org/all/20210929152429.125997206@infradead.org/.
> 
> Steven, would you like to share your opinion on this patch?
> 
> If klp_synchronize_transition() will be removed anyway, the comments
> will be meaningless and we can just drop it :-P

The comment will still be needed in some form. We will handle it depending 
on what gets merged first. peterz's patches are not ready yet.

Miroslav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
