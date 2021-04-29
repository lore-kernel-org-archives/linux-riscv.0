Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34548C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:31:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFCF6140C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 16:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFCF6140C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eYb+5O1wAj0s2AWb6w8yGaqZm6Yd8AW/gd07qQANzj4=; b=eAJOd4T+wAQ/SV8pS+61UvKxg
	LFfZOSrQ72XE65q3wqEc7sayN312tW3q0lfddZXdOIVxzonNLJuU6sloGGUdVnWPKDzRGOoG2CMHr
	O/5tg1wvXvOQARR40jnACZHHFKNQTxTNho3Q3WuF2KHrVJdoS1ksSCHOGEh538IRC1yxVtZLe5nXj
	Et0kchcIJ0ZXi2Y2+r0QX5OphxeysX0Z8VtgjPPbMUPBs2455V494xDHv5DTu6kB/xXcTgZno6tbJ
	Bg/v1tiwr4xEzUV7Wxmiur4ULOtwzDQKVAFMvSftTwshijT0UqrAFoUFt3frcQ+VH8upLakmS6CWi
	Sfe2n8IRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9ZZ-0063Ya-32; Thu, 29 Apr 2021 16:31:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9YN-0063O1-Mu
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 16:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=pxNL48C8NJtjPjaOAPEd1rglpkan6UYHNC42+w9pH0g=; b=NZx+om+B080UcgzEleofiojNoO
 8LF7CYQonUmlrWXz2yG43P1NUsYDa6tUDjSBtvYHG7pmeV2IpWdgY2QW4vSpkH2Q0IknnCBDCCUQD
 Jjh+qpalSqBdhxiec7k9WtfWbb49cjI2mG5c8C4VASgeyzrCW4oBLRtS/7Gu3q4fZuWewroskU4aV
 Jy9CEZNA4FxpGAEz6QpeaYcUvo0fx5/B+4CA3ZaT+RJXiuUGFA/LdhL1HdVZOvtIEeHj4ziQzDcKX
 kVP2TZhNWXNZ+l8ON6fBs+QaipqUAh3LdEJbGbytMf06fTB6gNwj64tPqIMssrKYM1lWzwk262x4z
 iSJcg6cA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9YK-000laT-Ul
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 16:30:14 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C8961407;
 Thu, 29 Apr 2021 16:30:09 +0000 (UTC)
Date: Thu, 29 Apr 2021 12:30:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, peterz@infradead.org,
 jpoimboe@redhat.com, jbaron@akamai.com, ardb@kernel.org, Atish Patra
 <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 akpm@linux-foundation.org, rppt@kernel.org, mhiramat@kernel.org,
 zong.li@sifive.com, guoren@linux.alibaba.com, wangkefeng.wang@huawei.com,
 0x7f454c46@gmail.com, chenhuang5@huawei.com, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Message-ID: <20210429123007.5144fc0d@gandalf.local.home>
In-Reply-To: <20210429061713.783628-1-palmer@dabbelt.com>
References: <20210429061713.783628-1-palmer@dabbelt.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_093013_054419_C295954B 
X-CRM114-Status: GOOD (  18.99  )
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

On Wed, 28 Apr 2021 23:17:13 -0700
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We currently use text_mutex to protect the fixmap sections from
> concurrent callers.  This is convienent for kprobes as the generic code
> already holds text_mutex, but ftrace doesn't which triggers a lockdep
> assertion.  We could take text_mutex for ftrace, but the jump label
> implementation (which is currently taking text_mutex) isn't explicitly
> listed as being sleepable and it's called from enough places it seems
> safer to just avoid sleeping.
> 
> arm64 and parisc, the other two TEXT_POKE-style patching
> implemnetations, already use raw spinlocks.  abffa6f3b157 ("arm64:
> convert patch_lock to raw lock") lays out the case for a raw spinlock as
> opposed to a regular spinlock, and while I don't know of anyone using rt
> on RISC-V I'm sure it'll eventually show up and I don't see any reason
> to wait.

On x86 we use text_mutex for jump label and ftrace. I don't understand the
issue here. The arm64 update was already using spin locks in the
insn_write() function itself. riscv just makes sure that text_mutex is held.

It also looks like ftrace on riscv should also have text_mutex held
whenever it modifies the code. Because I see this in
arch/riscv/kernel/ftrace.c:


int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
{
        mutex_lock(&text_mutex);
        return 0;
}

int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
{
        mutex_unlock(&text_mutex);
        return 0;
}

Which should be getting called before and after respectively from when
ftrace does its updates.

Can you show me the back trace of that lockdep splat?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
