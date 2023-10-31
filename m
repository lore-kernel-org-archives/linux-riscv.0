Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D04C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGc7NoSE+LBdue3j75UkAD87DWOf8wVdwUl3nnquG7g=; b=mebona3Fcujw7X
	jwG+I46wfFHFoEbTSrDf9MqB9uIQdTk0fAW5N+oxUSQ0dEsWcq+hyOhv9w7IXJCK4A/OyjzSpzj4r
	SocQy4gyX2NN9GSiqTzCYgFsKSEKEEa18UXd+K+MRt4RPKd8wj8IVpjm9iGH5p6cmHrWYPK3oBpAe
	zX48l5tS/SKgZqnX5AwPDTJzPWYh2QiWh0czCoCfWzTZ70GNxhks7jN+HU1avsqfJjJ3kVyLpJC1E
	TitNKGUioX4qnC2Anri6NUxFIGtu2owTXy5H+lSYs3TpDthWMl/IK+QfEp7BhMetWORhZ7csbDKbk
	sIc3EP8ah/yymawkIGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqlE-005XKL-1f;
	Tue, 31 Oct 2023 15:34:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqlB-005XJB-2m
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 15:34:31 +0000
Date: Tue, 31 Oct 2023 16:34:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698766468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJDz1UY+faR8aNgW5FPh3ep7TyJU8rHswb3s8K85yec=;
	b=cBwLmZ7lA/S63vM3k8+zJ5pET19wh+Bl+iwgV8tZ2+sBuh+fwsCy+u59WJQ+cTe+Oo1JP0
	QiPUBYhXSqU9MVSvzgM+gdL2qKj3heGdBwQPHbeRaG0sMHJ0mcxsUjycCcFP2T0zG1wGXH
	jB1tlC7OpiBRBLXagXIjhng4C6CdGAt0u8s6HBFfBUsO5F/xbH1HJWN+ktRD1dtw1OULDf
	4OxsLcJHXwtMRBH1LP5WdI/qzuf5obPtO4q/mK39zrMAXm0MU/o2WklKV+7oyraKPYZxQW
	+zbH+XrWhhSuNz/NymmQp/eBlyHFT3sD7enivufOJ3eAv8Q1XhuyVx1/XdUzDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698766468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJDz1UY+faR8aNgW5FPh3ep7TyJU8rHswb3s8K85yec=;
	b=uH+4gOFp27CsyIhM7FJh9npqVvAytZ0l/Vt+qstOBB2Vbc7R61mi26JzygpU1IBPbAuzmV
	fe1NqXJyVYMyssBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "Schaffner, Tobias" <tobias.schaffner@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"minda.chen@starfivetech.com" <minda.chen@starfivetech.com>
Subject: Re: [PATCH RT 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231031153427.goCGGJRm@linutronix.de>
References: <20230510162406.1955-1-jszhang@kernel.org>
 <a37fc706-78cd-4721-9af3-aabb610f49b1@siemens.com>
 <ZTah9NOMbZkf6dfL@xhacker>
 <20231024061852.7BzoCFwW@linutronix.de>
 <ZUESqBTSS/s47qM/@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUESqBTSS/s47qM/@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_083430_043851_F459E9E2 
X-CRM114-Status: GOOD (  12.11  )
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

On 2023-10-31 22:43:52 [+0800], Jisheng Zhang wrote:
> Hi Sebastian,
Hi Jisheng,

> Thank you so much for pointing out PREEMPT_AUTO, I read the discussions
> last weekend, glad to know PREEMPT_AUTO. And riscv has switched to
> generic entry, so it's easy to support PREEMPT_AUTO for riscv. V2 was
> sent out a few mintues ago. Could you please review?

Sure. I have no idea what the upstream status about PREEMPT_AUTO but I
think we want this.

> > Are there any reports of this booting without warnings with LOCKDEP and
> > CONFIG_DEBUG_ATOMIC_SLEEP enabled? I remember there was something
> > earlier.
> 
> IIRC, Conor reported the warning and stack trace is ext4 related. But
> I didn't reproduce the warning. And Schaffner also tried the series
> but it seems he didn't see the warning either. So I'm asking for Conor's
> help to retry v2.

oki.

> Thanks

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
