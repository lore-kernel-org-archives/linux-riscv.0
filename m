Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB9BC5DF9D
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:55:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0BA21D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ybRsdUJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0BA21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eP7fuz3+BJtmwndwpmycnUnJUJQG44gAhYhZvHh0DXI=; b=ybRsdUJUg+3QX1yyOtXi+eK84
	/4knx7fWO5y/8ATxp+9uPjtRRRp9Yt3/7GmdgjrAQbgSIzLTooycB2GUJlH2Ms3yOy/f2T6ZNktLE
	wIyENc9shVtix6BTWyPgN67d+zJ0RFTCEmyvAX65hqCRbcwZRaOF7bAhx6ksgNrA00soDKR0JxTD6
	yhA7CnhvLqCbBL6cIkkojZ4Yic8QmGW+XvHXGuZQDi93qbrzhFfaGCqZAPG/3mYBplAFac8M1Uc7E
	5vR4PwrD+IMPLZKgeysdEJqPLGaPB9D07KT3Ri5QOrBxwrh3jOozUKuzBC+t1TeC+hj9mK9MHsWgd
	VmgFyc0ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGS3-0000MU-Iz; Wed, 21 Oct 2020 15:54:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGS1-0000Lx-A3
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 15:54:58 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 269C32177B;
 Wed, 21 Oct 2020 15:54:54 +0000 (UTC)
Date: Wed, 21 Oct 2020 11:54:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
Message-ID: <20201021115451.44424566@gandalf.local.home>
In-Reply-To: <20201021154456.GM3249@paulmck-ThinkPad-P72>
References: <20201021073839.43935-1-zong.li@sifive.com>
 <20201021101216.4d840e15@gandalf.local.home>
 <20201021101522.3d1f3865@gandalf.local.home>
 <20201021154456.GM3249@paulmck-ThinkPad-P72>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_115457_424839_54E1ECD8 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: palmerdabbelt@google.com, atishp@atishpatra.org,
 linux-kernel@vger.kernel.org, vincent.whitchurch@axis.com,
 jiangshanlai@gmail.com, josh@joshtriplett.org, linux-riscv@lists.infradead.org,
 colin.king@canonical.com, rcu@vger.kernel.org, mathieu.desnoyers@efficios.com,
 mhiramat@kernel.org, Zong Li <zong.li@sifive.com>, paul.walmsley@sifive.com,
 joel@joelfernandes.org, guoren@kernel.org, tglx@linutronix.de,
 greentime.hu@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Oct 2020 08:44:56 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:


> Or let me know if you would like me to take it, target v5.11.

I'm not sure if these can wait, as I believe they are fixing a regression
with RISCV function tracing.

Probably best to have them go through the RISCV tree.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
