Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF16AC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 16:16:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5903D2177B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 16:16:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wyt+tOWA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT7ZgELO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5903D2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+byysZOijbd2o6KyiIASdZ4Y9BFakguTwdcJX71jQx0=; b=wyt+tOWAsW2zYEvazyyNKLQJwC
	TAfu8CFHuBcI192fP/dE0F+SsaGO38WlntAafQNdl2PwIJFMNVCaq+6DzczkuaDojKDFh+unJ6K4N
	7bQyQqf7NY6cxE4eaMqwjXva6WSjqD1cLVaHGE+HpLcQvwJ+C8wT/KTJ7368OXViKxjAdHHmKdIcB
	vI9hmP8bAy7o350QeSiidSpRug5sGhQD/79jHpjWoSEpZBxtHR1wyfMW35XmoXAVbBmrpLc/W0aVU
	6Wpq8O28tvpU2DsX1C5Eqpbrxhp+2jjeQHlsxDlWqnq9JKyIg1vi23u1xM/jdd6GDOSOP46aSFj/M
	rIihFcnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGmZ-0002zH-VN; Wed, 21 Oct 2020 16:16:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGmU-0002yN-3g
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 16:16:10 +0000
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net
 [50.39.104.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 166152087D;
 Wed, 21 Oct 2020 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603296965;
 bh=R3htHAUwTw2drbNzQ1tbMbw6mnrT0mqJBt46dxSNaEY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=RT7ZgELOw7eMhqDeQtFTjzqiw0zuhkvzLqZoTqj+QasAdbFk+JDwVaZDAPQnie92L
 Vliz67QD5LqJ5cU8UdeIRXEArkbeqP5ylqFDmFWd7LFEOpdZcmBRWZ8yG3BTvg7pv+
 gppuCZY1eC5kQ8ed2WGy5gbw3SNEBp8Bgz2wYOiI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id AA796352287B; Wed, 21 Oct 2020 09:16:04 -0700 (PDT)
Date: Wed, 21 Oct 2020 09:16:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
Message-ID: <20201021161604.GN3249@paulmck-ThinkPad-P72>
References: <20201021073839.43935-1-zong.li@sifive.com>
 <20201021101216.4d840e15@gandalf.local.home>
 <20201021101522.3d1f3865@gandalf.local.home>
 <20201021154456.GM3249@paulmck-ThinkPad-P72>
 <20201021115451.44424566@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021115451.44424566@gandalf.local.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_121606_237356_A094C44A 
X-CRM114-Status: GOOD (  12.02  )
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

On Wed, Oct 21, 2020 at 11:54:51AM -0400, Steven Rostedt wrote:
> On Wed, 21 Oct 2020 08:44:56 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > Or let me know if you would like me to take it, target v5.11.
> 
> I'm not sure if these can wait, as I believe they are fixing a regression
> with RISCV function tracing.
> 
> Probably best to have them go through the RISCV tree.

Works for me!

							Thanx, Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
