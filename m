Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57988C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 22:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDA861358
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 22:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDA861358
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9wmb7Rrn2L5S9+W5XL8vDhjHITmu5qkMCEh4LBWQ3o=; b=hT/tPCyd/hbigS
	k2WP9y5h3wrGP7MHo510tcpT3Nxvx82QB8UcS90cmwS2iSquosy6YvQ3zhYOBpTvgH5AEtQcR2LGN
	7rzxlvX5g9sqDD8puQeTOp9a/WIIqQvviKSQRMrz8VcVBnst79+99mrGKqv6Fy4oSSQQojOe3Rsij
	g5YJu/Y0HNBITolxP+MXJqkvSvoeCTEuKwHdjkIC9X1lwPIADmrL7CXxL7fppjUselQfh/HEG1D5W
	FSW/hpHHK2IJ/efjwsYknBkOcxWQaEi9WGkRwUfQtCXVeGv+OJPDd25U6ycvp1mNLa/pmlPs+Cj6x
	g0pD/cWXC1LkhhoHqXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmkqr-001SuQ-AK; Fri, 28 May 2021 22:21:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmkqo-001Sso-8N
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 22:21:07 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B27E761358;
 Fri, 28 May 2021 22:21:04 +0000 (UTC)
Date: Fri, 28 May 2021 18:21:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, mingo@redhat.com, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 zong.li@sifive.com, guoren@linux.alibaba.com, Atish Patra
 <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 kernel-team@android.com, changbin.du@gmail.com
Subject: Re: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20210528182102.19319b1b@gandalf.local.home>
In-Reply-To: <mhng-edd9e8bd-e585-4b6b-8e40-797215bfdf75@palmerdabbelt-glaptop>
References: <20210506092550.6c2206b3@gandalf.local.home>
 <mhng-edd9e8bd-e585-4b6b-8e40-797215bfdf75@palmerdabbelt-glaptop>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_152106_357108_EE318A1D 
X-CRM114-Status: GOOD (  16.54  )
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

On Sat, 22 May 2021 12:32:05 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> we can then IPI to all the harts in order to get them on the same page 
> about that trap, which we can then skip over.  We'll need some way to 
> differentiate this from accidental executions of unimp, but we can just 
> build up a table somewhere (it wasn't immediately clear how x86 does 

It currently uses the same code as the text_poke does, which does a
"batching" and keeps track of the locations that were modified. But before
that change (768ae4406a x86/ftrace: Use text_poke()), it had:

int ftrace_int3_handler(struct pt_regs *regs)
{
        unsigned long ip;

        if (WARN_ON_ONCE(!regs))
                return 0;

        ip = regs->ip - INT3_INSN_SIZE;

        if (ftrace_location(ip)) {
                int3_emulate_call(regs, (unsigned long)ftrace_regs_caller);
                return 1;
        } else if (is_ftrace_caller(ip)) {
                if (!ftrace_update_func_call) {
                        int3_emulate_jmp(regs, ip + CALL_INSN_SIZE);
                        return 1;
                }
                int3_emulate_call(regs, ftrace_update_func_call);
                return 1;
        }

        return 0;
}

That "ftrace_location()" is the table you are looking for. It will return
true if the location is registered with ftrace or not (i.e. the mcount
call).

The "int3_emulate_jmp()" is needed to handle the case that we switch from
one trampoline to another trampoline. But that's also an architecture
specific feature, and RISC-V may not have that yet.


-- Steve


> this).  Then we have no ordering restrictions on converting the rest of 
> the stub into what's necessary to trace a function, which should look 
> the same as what we have now


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
