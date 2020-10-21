Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC989C388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 14:15:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139F422248
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 14:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5UsBzyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139F422248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bq5Ta93vNEnsGABW+U0zICE+RUSz8CL+4LjUOoaBMOE=; b=k5UsBzyPhC/NndoAJCScRpjQE
	Aid7NecT2c4zLX6nSAWBBBOC/B/076yG3My/T/CwesAFZoEip0mdZl0iRV71ffjf16xiHU1ox7/Vm
	b5ELsHIkhwahvRUTRzRlpR4hOPuPoE9PxMjC2Wh0EISvdExsZsdqyvb+jnNYc8ztjZUSz/wES0CGH
	qJOXLuuSpV3QUAWioPDI+XPKZVfnZUJjeJ0IFmBQKnKFI2bB7JsP2YovGIREzxCXCHMDphXVjMgqC
	WMmdiCLa7JvpDxfilkL0E+AvmYNFgXh1S7C1R1fc/674OgNB2uwHRjsnZu0tVHoEwz8+vHMPSlYSb
	2ocuxTyTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVEtl-0003GC-PG; Wed, 21 Oct 2020 14:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVEtj-0003Fb-4x
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 14:15:27 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06DB722248;
 Wed, 21 Oct 2020 14:15:23 +0000 (UTC)
Date: Wed, 21 Oct 2020 10:15:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
Message-ID: <20201021101522.3d1f3865@gandalf.local.home>
In-Reply-To: <20201021101216.4d840e15@gandalf.local.home>
References: <20201021073839.43935-1-zong.li@sifive.com>
 <20201021101216.4d840e15@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_101527_271148_F3F91551 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: rcu@vger.kernel.org, palmerdabbelt@google.com, paulmck@kernel.org,
 linux-kernel@vger.kernel.org, vincent.whitchurch@axis.com,
 jiangshanlai@gmail.com, josh@joshtriplett.org, linux-riscv@lists.infradead.org,
 colin.king@canonical.com, atishp@atishpatra.org,
 mathieu.desnoyers@efficios.com, mhiramat@kernel.org, paul.walmsley@sifive.com,
 joel@joelfernandes.org, guoren@kernel.org, tglx@linutronix.de,
 greentime.hu@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Oct 2020 10:12:16 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
> > Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
> > multi_cpu_stop()")  
> 
> I really do not like to add "notrace" to core functions because a single
> architecture has issues with it. Why does RISCV have problems with these
> functions but no other architecture does?
> 
> NACK from me until it is shown that these are issues for a broader set of
> architectures.

After looking at the two above fixes, I take back my NACK ;-)

One of them duplicates an already notraced function, so that looks fine.
The other makes a static function global, which could cause issues as well.

After further review:

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
