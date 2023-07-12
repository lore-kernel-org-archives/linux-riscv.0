Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B63EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmCbtBvQKrWUdsEID7sxq5a6x9UUHQNjUM9nqnX0Mmo=; b=jAtsPtlXqhB561
	u5eQZ8uqwMsz4yGWPoXBVxG/v9O6heEPql80wTtOf5qQnrNFPpIdLartdt1MDeA70qlkcp3YrCabA
	p+z4PQEjV2CtidV3wR9rvn4OFeMYRqXGhzeaO6Ug3fAL/q7lL9xatxfzub+mt9V4xldNWPeIAtJPJ
	gmPGs/PiqQhVtHmQB7k1itZEujPaRocHnSgYXonmYA4G6HiCYggWSBrHiOpegmSvA9QREtOwxIwNN
	UFiRQSWyJMLR4Mdj9U205iuUWK7dgyH3fBl9i7xqugKp2afICvMLpKuy5ofp51PREw+IJ2BBWLoBd
	E51KSoPXJZZnWOm2pZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUqV-00GrOv-2s;
	Wed, 12 Jul 2023 08:05:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUqU-00GrOh-0j
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Jul 2023 08:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5TWVCjFGRExPcN05bVzne/2B6BKN45D6agRtviLb2cw=; b=ifUBNQvneXGD6J7waajKoLIn5D
	pG2U4BC29xw3bvWK+iSa+gOc5fps12nyXisO8GUjZ8wBkPcELGpNAi8PTuiQj86VL0sCdJPtz7/SJ
	xDuH43rN8cRQBY3ejlqYEvDoSWs/I9KWpHX7l4ReCDlLbCJaKIVUiQ9cJY3maD4eCUpWtv19dQc9v
	4jLvvZZcrFyGbrozGDxTtRXwc6xqFTZdD2LdxXi8stUAEqMLCPZuf/VMl13F1s0oHfVPzh5xGfpnq
	2A2xfm09toEHq4IIK/6YuxkSg15wVtz4ZkfBoKGkw+JRBLJPojBFi0ryZN9ICESH+dDlfa0WzYGH0
	ztv3GCvQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJUqQ-00GTmW-3M; Wed, 12 Jul 2023 08:05:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BABA33001E7;
	Wed, 12 Jul 2023 10:05:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1024243A2F82; Wed, 12 Jul 2023 10:05:04 +0200 (CEST)
Date: Wed, 12 Jul 2023 10:05:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
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

On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:

> I wonder whether the right thing to do here is somehow scaling the threshold
> according to the relative processing power. It's difficult to come up with a
> threshold which works well across the latest & fastest and really tiny CPUs.
> I'll think about it some more but if you have some ideas, please feel free
> to suggest.

We could scale by BogoMIPS I suppose, it's a bogus measurement, as per
the name, but it does have some relation to how fast the machine is.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
