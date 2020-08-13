Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0756AC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 15:38:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 918F320829
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 15:38:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxRPjlLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 918F320829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BEjtJWQfHchBFhX11+tJiTxgJwD7wGaDomuEn4nVWQU=; b=VxRPjlLUYq/g/4FMLMvOKiXsW
	WBg6jYcZOw96oZJOA5isnrTZj0yP7s2pXV5GxlcCDZ19/sukSqkSePd8ow1SW9cR2jt2z1yZ2nx9I
	3XrG8fiS0Isl5QQAm69kbWDIkfQIyCurNPt9icBDy9v8n4EMECa2QZFOtoDXgzm+ZA5wV3VI9KjAO
	AE/Mw0Fr3yWQ/IsykN5m4x3AsDWEaBLk51QTzqbkrGG4BVO2phrazcezgatXC6Cu3ADOvHVFWmpfW
	sVd+M7l9mrs3C/Sz3i+8vS7GsMJyw/4GOwJn3BVG/9C+Vhhu/gBF2ikRS1zpenZs9pS0KK4pbh0ef
	UJSm6gI8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6FIb-0000Ck-La; Thu, 13 Aug 2020 15:37:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6FIZ-0000CM-3T
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 15:37:48 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36A4E20781;
 Thu, 13 Aug 2020 15:37:45 +0000 (UTC)
Date: Thu, 13 Aug 2020 11:37:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
Message-ID: <20200813113743.001b6c31@oasis.local.home>
In-Reply-To: <mhng-609449f5-6f1e-4669-8cb0-f06493d58cf2@palmerdabbelt-glaptop1>
References: <CAJF2gTQjYyNnhg8KhFEm6MwOCb=c0hNsSq=HOeuSCrOzR9Qf0Q@mail.gmail.com>
 <mhng-609449f5-6f1e-4669-8cb0-f06493d58cf2@palmerdabbelt-glaptop1>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_113747_341196_B9FC25BC 
X-CRM114-Status: GOOD (  26.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, mingo@redhat.com, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Aug 2020 22:13:19 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> Sorry, I'm not really sure what's going on here.  I'm not really seeing code
> that matches this in our port right now, so maybe this is aginst some other
> tree?  If it's the RISC-V kprobes patch set then I was hoping to take a look at
> that tomorrow (or I guess a bit earlier this week, but I had some surprise work
> stuff to do).  IIRC there were a handful of races in the last patch set I saw,
> but it's been a while so I don't remember for sure.
> 
> That said, I certainly wouldn't be surprised if there's a locking bug in our
> ftrace stuff.  It'd be way easier for me to figure out what's going on if you
> have a concrete suggestion as to how to fix the issues -- even if it's just a
> workaround.

The issue is actually quite basic.

ftrace_init_nop() is called quite early in boot up and never called
again. It's called before SMP is set up, so it's on a single CPU, and
no worries about synchronization with other CPUs is needed.

On x86, it is called before text_poke() is initialized (which is used
to synchronize code updates across CPUs), and thus can't be called.
There's a "text_poke_early()" that is used instead, which is basically
just a memcpy().

Now, if ftrace_init_nop() is not defined by the architecture, it is a
simple call to ftrace_make_nop(), which is also used to disable ftrace
callbacks.

The issue is that we have the following path on riscv:

 ftrace_init_nop()
   ftrace_make_nop()
     __ftrace_modify_call()
       patch_text_nosync()
         patch_insn_write()
           lockdep_assert_held(&text_mutex);

Boom! text_mutex is not held, and lockdep complains.


The difference between ftrace_make_nop() being called by
ftrace_init_nop() and being called later to disable function tracing is
that the latter will have:


	ftrace_arch_code_modify_prepare();
	[..]
	ftrace_make_nop();
	[..]
	ftrace_arch_code_modify_post_process();

and the former will not have those called.

On x86, we handle the two different cases with:


static int ftrace_poke_late = 0;

int ftrace_arch_code_modify_prepare(void)
{
	mutex_lock(&text_mutex);
	ftrace_poke_late = 1;
	return 0;
}

int ftrace_arch_code_modify_post_process(void)
{
	text_poke_finish();
	ftrace_poke_late = 0;
	mutex_unlock(&text_mutex);
}

Although, the post_process() probably doesn't even need to set
ftrace_poke_late back to zero.

Then in ftrace_make_nop(), we have:

  ftrace_make_nop()
    ftrace_modify_code_direct()
      if (ftrace_poke_late)
        text_poke_queue(...); // this checks if text_mutex is held
      else
        text_poke_early(...); // is basically just memcpy, no test on text_mutex.

The two solutions for riscv, is either to implement the same thing as
above, or you can create your own ftrace_init_nop() to take the
text_mutex before calling ftrace_make_nop(), and that should work too.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
