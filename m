Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D155EC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDC621D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 15:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eaZR52Ny";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w8ec6R2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EDC621D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKm9pA8t1rum7HpK7E5kKzcyfx2EvIncLSyl+IPWxy4=; b=eaZR52NyA23LexNe8yM1TIityk
	m9+w7CkUKnqFfN2fjGBdknCEHvpMySjISbyTpPb3lh7gWIRTwMcjJqI008Sh2WGhPjUlw82KDmUcu
	pXBTAUNn0Id9EF/H1XnfOxw5HlC/2ePIaFKUb76vj/kDZ+v82ODVC00IAocq/gxiuUkpGrNEzFEuB
	W2BV5KRX5eVy15KqeOPBbTf8gg9WFSyuL1JuFqNIIus3vesOKCe2LRDm1RsxFu2ORDdJjJ2p1aKIR
	gH04NEWlgKGMhK39rSXh1K6NoZh48f2n8dmp3XffEQPYaFMI45NGZYJZG5pIh2444EL0qZYuzk3Rr
	AYkLiAsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGIO-0007Yt-Qw; Wed, 21 Oct 2020 15:45:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGIM-0007Y8-Kn
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 15:44:59 +0000
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net
 [50.39.104.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDA262177B;
 Wed, 21 Oct 2020 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603295096;
 bh=sX00NmwGKUkl2c3BWbnzn7oThe8HOgZFYccGHfGfiuc=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=w8ec6R2QZsWzSsOAYPohChg6UJU6+FF6mNR/3wAr5ukO+OX8RhIWc0CtSvoIEZ7eV
 m1M3Hr9v+p2FxveVo3SSMlTD9VxNUtFRmjpU1yR/uK9zV6aFKOV7EGZfCWYBFwmKqy
 9GOCpCj3pLK7oTM8E/ObrMjYfnJAQkZvnn+n1ZGI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 76594352287B; Wed, 21 Oct 2020 08:44:56 -0700 (PDT)
Date: Wed, 21 Oct 2020 08:44:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
Message-ID: <20201021154456.GM3249@paulmck-ThinkPad-P72>
References: <20201021073839.43935-1-zong.li@sifive.com>
 <20201021101216.4d840e15@gandalf.local.home>
 <20201021101522.3d1f3865@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021101522.3d1f3865@gandalf.local.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_114458_749632_4CBA49F9 
X-CRM114-Status: GOOD (  18.70  )
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
Reply-To: paulmck@kernel.org
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

On Wed, Oct 21, 2020 at 10:15:22AM -0400, Steven Rostedt wrote:
> On Wed, 21 Oct 2020 10:12:16 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > > Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
> > > Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
> > > multi_cpu_stop()")  
> > 
> > I really do not like to add "notrace" to core functions because a single
> > architecture has issues with it. Why does RISCV have problems with these
> > functions but no other architecture does?
> > 
> > NACK from me until it is shown that these are issues for a broader set of
> > architectures.
> 
> After looking at the two above fixes, I take back my NACK ;-)
> 
> One of them duplicates an already notraced function, so that looks fine.
> The other makes a static function global, which could cause issues as well.
> 
> After further review:
> 
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

If someone else would like to take this:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

Or let me know if you would like me to take it, target v5.11.

							Thanx, Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
