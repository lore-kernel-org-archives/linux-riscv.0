Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7C9C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 19:39:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C2D6199A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 19:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C2D6199A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7YZMmdXjyRnR8D1puFzte/BbR0s7wyuHy+hQUGuHJQM=; b=pZPaQf7RDUe8Eov6tDP8mMCq8
	WGAO92IyK3ZUQL4o8Z5J6gLAu3HaT5SEKyrqmkfhvc84U0XbIhzJFHVNTtDw5LOJm8itEB1NL4Tli
	LCB8lldcntRHxSodMBC0sKcXd4TDYH7J1pGg/6/VgRk3DHe7NvAk1wmLnOUO6r6xI24vs81avc7HE
	7b2GmB465yi957YPHykeKL1yShsfugPROjAA3i1U1hCpLgegk2u/zSAuKjDF08B4WUp2ia2Zk6DU2
	QhFNYxvbnByLchYWRBsmtWK45+DKuQ8Iz1qrLEUx3ol2wkZV1HxXqFIJx/wNwETxf1+zvH8xGoN4i
	7G6NBY7gg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRKDI-004iwE-6l; Tue, 30 Mar 2021 19:39:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRKD5-004isw-Hh
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 19:39:39 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50A836199A;
 Tue, 30 Mar 2021 19:39:24 +0000 (UTC)
Date: Tue, 30 Mar 2021 15:39:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu
 <mhiramat@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kprobes/ftrace: Add recursion protection to the
 ftrace callback
Message-ID: <20210330153922.29f33262@gandalf.local.home>
In-Reply-To: <20210330021440.44280b7f@xhacker>
References: <20210330021440.44280b7f@xhacker>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_203937_244108_1A6942B7 
X-CRM114-Status: GOOD (  10.68  )
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

On Tue, 30 Mar 2021 02:14:40 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Currently, the riscv's kprobes(powerred by ftrace) handler is
> preemptible. Futher check indicates we miss something similar as the
> commit c536aa1c5b17 ("kprobes/ftrace: Add recursion protection to the
> ftrace callback"), so do similar modifications as the commit does.
> 
> Fixes: 829adda597fe ("riscv: Add KPROBES_ON_FTRACE supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks fine to me.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
