Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWudsqwODwRe/2WjkJAy9N0g6us2FiMO8oJpAre3mZw=; b=kGcxnjhy8mMz77
	ycCx9NleKHuuLYSFABUDmhE/rgPWv1psLA3Q3P8unvjH3bidA085175Y5gVwbQlYKngKdWmue3pWk
	xlbCibeKyigMfoHs218rX+bXQfdTiDmUbKJQso9I2LYQzbKdPRdo1iaSpnTMIdhOINdd9N3BUW0X6
	Di2afE1uGoI8AyiHWOoyBMmqGNo5FJ3jfJ57jBRm02MSDIdZcToFVdc1jUEel19A8QeQIyGZIXtJ7
	P7bA8cqtXMAVjkqn7Htp4PEwBGOa7bluPAfXK48T4fkHDp0Wd3PjoJjkt1YGrrOoZyavdh/3jteGs
	Z4dBb0aUvK08GBCq1kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqA8-005TjJ-0q;
	Tue, 31 Oct 2023 14:56:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqA5-005TiS-1d
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C188C60F33;
	Tue, 31 Oct 2023 14:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBB3C433C8;
	Tue, 31 Oct 2023 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698764168;
	bh=O+lk/MXMtV5u3UvRYzKW2LTcMBsvBkcGlPzOqhO3RYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=folYaGn1VPqbgvmsSCJ/z0B5fzNxc/RZtLJVgs0p6qLsQ5xp9n5bsqegbXwNvg9fW
	 Q064aRd5fPOcOx6zWjMW8zjB0s7mCP4U+aC3qSTTptqGt6pR1TQEusQumAfvzaQreg
	 PgoLP5jFoqJqPDHFoHTNaKMIKjc/k8dUeQvArt2dVNz13/vrHWXK+v/jOgFzX208RQ
	 H9ZbZPLkSK4A8WiDl72tCGL+n1X5+/kZO1OsNV3+Ou5w/5Z8IUoJKAWMyZp+BDH+Ls
	 qic8sk0OYVsyf4YDhLWXK5Jh4qTTLor36JEMxMcBq0bJQS3RCItt77UXJoNhPmMTZp
	 rbxsqT2t81tTA==
Date: Tue, 31 Oct 2023 22:43:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Message-ID: <ZUESqBTSS/s47qM/@xhacker>
References: <20230510162406.1955-1-jszhang@kernel.org>
 <a37fc706-78cd-4721-9af3-aabb610f49b1@siemens.com>
 <ZTah9NOMbZkf6dfL@xhacker>
 <20231024061852.7BzoCFwW@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024061852.7BzoCFwW@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_075609_587408_CB621C4F 
X-CRM114-Status: GOOD (  14.72  )
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

On Tue, Oct 24, 2023 at 08:18:52AM +0200, Sebastian Andrzej Siewior wrote:
> On 2023-10-24 00:40:20 [+0800], Jisheng Zhang wrote:
> > Hi Thomas, Sebastian
> > 
> > could you please review? Any comments are appreciated. or do you want a
> > rebase on linux-6.5.y-rt?
> 
> Please resend on top of latest v6.6-RT. Lazy preempt is gone so only
> PREEMPT_RT config switch remains from your three patch series. If you
> have generic-entry then you could use the new PREEMPT_AUTO.

Hi Sebastian,

Thank you so much for pointing out PREEMPT_AUTO, I read the discussions
last weekend, glad to know PREEMPT_AUTO. And riscv has switched to
generic entry, so it's easy to support PREEMPT_AUTO for riscv. V2 was
sent out a few mintues ago. Could you please review?

> 
> Are there any reports of this booting without warnings with LOCKDEP and
> CONFIG_DEBUG_ATOMIC_SLEEP enabled? I remember there was something
> earlier.

IIRC, Conor reported the warning and stack trace is ext4 related. But
I didn't reproduce the warning. And Schaffner also tried the series
but it seems he didn't see the warning either. So I'm asking for Conor's
help to retry v2.

Thanks
> 
> > Thanks
> 
> Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
