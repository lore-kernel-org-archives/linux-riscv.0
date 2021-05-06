Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57DEC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:26:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFEC613DA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DFEC613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BwVFgwfgvaq3iQsPtjJnJClWpNSl5+DJfID74llVW/U=; b=ZBaUO+8cluJJTgKpO9TlEkHvd
	OtUU0ZQkDUuD9EnIjOU6fnz/ItPmA+nCY4nO15QJ+oPJF0xcADcSwWknj2SDBMJZkUvq4xFxA4r3W
	tNLy8360YYYYx2kozvGqOlzTSp6QYuckxWkq1vpJw4OODARUHh/2NwqpfNpeOvrdpyQVV7AR2tgD3
	L6OlehkKqu9TjNH4RGUhWyoCb8mTev/hAiX9es7Q9+Xop3xyqPUmAeBK8g15QF84+yEkICogukboe
	zdPbBVfI0bOMKrxwshBB+VbNkCxWmaW0K/8hQmZw7ZFByc4i2J6u9k+X2dTj2fw/LfR8020NlbxWB
	CRsBYFpVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lee0t-004JfR-Kz; Thu, 06 May 2021 13:25:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lee0q-004Jet-9K
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 13:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=XsbvUeq56iLKjirEd2ZUeL1jMt3HS52bfxVaqVoIZe4=; b=uyFBK7gsnGxVK1Yzs1v96ZIDzt
 v2DB4lCZs4c8XVdXfzhZKkdZIgwzdST2pX5p1ErrMm3wofLgGaPeioIOWpe2S5yBdzn8xrfgI0yht
 CLFsmqhUSBuMPJ1yLvuP8icqZeX02SZYa05/tY4f24vinAPnfNDGwDvXXRIsG9RTCep2zW15TNngA
 pavqfCN9S7n+N5hUz5B/C8IFKG56UBZWVR5yhpna0Jm44l8eAIwllLjlYdtHtwyq3t1MPlRHii+c7
 RGy1oPp7+mAJoEH7rzviJqtk1TWVOU6BFptIwid6NgE/UQ+6aNrNxynJah/CSA/aaCLA0pXEoiVjE
 8KlDRDgg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lee0n-0063bG-Pu
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 13:25:55 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3735613DA;
 Thu,  6 May 2021 13:25:51 +0000 (UTC)
Date: Thu, 6 May 2021 09:25:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, mingo@redhat.com, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 zong.li@sifive.com, guoren@linux.alibaba.com, Atish Patra
 <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20210506092550.6c2206b3@gandalf.local.home>
In-Reply-To: <20210506071041.417854-1-palmer@dabbelt.com>
References: <20210506071041.417854-1-palmer@dabbelt.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_062553_908510_93475AC0 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu,  6 May 2021 00:10:41 -0700
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> ---
> In theory we should be able to avoid using stop_machine() with some
> clever code sequences, but that's too big of a change to be considered a
> fix.  I also can't find the text I thought was in the ISA manual about
> the allowed behaviors for concurrent modification of the instruction
> stream, so I might have just mis-remembered that.
> ---

I wonder if you could at least use break points, as some other archs do,
and what x86 does.

If you have this make believe machine code:

	00 00 00 00		nop

And you want to turn it into a call.

	aa 12 34 56		bl ftrace_caller

And if your architecture has a way to inject a break point on live code.
Let's call this FF for the break point code.

You can inject that first:

	FF 00 00 00

sync all CPUs where now all callers will hit this and jump to the break
point handler, which simply does:

	ip = ip + 4;
	return;

and returns back to the instruction after this nop/call.

Change the rest of the instruction.

	FF 12 34 56

sync all CPUs so that they all see this new instruction, but are still
triggering the break point.

Then finally remove the break point.

	aa 12 34 56

And you just switched from the nop to the call without using stop machine.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
