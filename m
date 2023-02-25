Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C15C64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtypXE/gEcH6zisen2HD+HenIdNDpU8PIUdjfhQ6Hks=; b=TMpMwKePpWjbFc
	+jEuuQyAYio5kasMpCwRkQf8TAbkeV/kNajYyIfYGJjQjOhPRgjqb0BOTzhxoaPP7bQsl+2C8+Lk6
	jy/aAwG5qdmrGL4oOgoYxlSMve4WNBdXE48KiDbw74grWjyGIl9Tjz7HEyl5FXFJudY0oDKIkWFkr
	1l732JyJicaWyhvjbQa0FGmZ+WNUNcxOus+WZ7hFznOO78rxDCAi8vrALwa+ZUUAu2w855pvCLBHJ
	/lTM695SyMBrEJDgRQCuiUlS3gLKrWixq/nuObgstS4Yu5T6GgTlVr88uXin+4UANSMxU1MHY8dSg
	pHo//uL/PcmZmg0QgqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxdb-00628m-Ei; Sat, 25 Feb 2023 16:43:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxdZ-00626s-Ky
	for linux-riscv@bombadil.infradead.org; Sat, 25 Feb 2023 16:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pM83uqbXqTHLmOlK/mY3HQLkQc9Qi4g0v5iw3hpj/zc=; b=o86srJca1jHtuxhY168Jnhqesx
	8H3fkrBmKYRCu11Yu87tVmiuxZ2T4hdTNsXMxwcFlLycWYObBT1vgVrdaMrim3pJFNPJpFW+ut5uR
	ntAlv/XXKZf9GTbybMlGmwQyRFH4ECGh5nwjlYSYfgOwA53TazTbARxW6/b80lqKe55gTh7jVi2WA
	2KpKAR7wNHuJMq6D7kqUmOmQ3KOG5TmEKdkIU71tF2EmTmabExsT5l5MBlfVOSbugWZvjid9KQxby
	4oux0HwsXmVC8Hf7rH6+rYoJgcEmEph88feT9+8Z4KOMa0XXQKxoPM41txm2RpK+/HNQuo37x0a9Y
	qnF8hvSg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxdU-00GEwG-Kd; Sat, 25 Feb 2023 16:43:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9E41C300033;
	Sat, 25 Feb 2023 17:42:59 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5A216209F7545; Sat, 25 Feb 2023 17:42:59 +0100 (CET)
Date: Sat, 25 Feb 2023 17:42:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Beeman Strong <beeman@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-perf-users@vger.kernel.org,
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Perf event to counter mapping question
Message-ID: <Y/o6k6RMjEKyb1Nb@hirez.programming.kicks-ass.net>
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
 <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
 <CAP55G9A=z2cM1TEDJ1prAsqfpa0xqvB21RP3omd3aBZ47ixceg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP55G9A=z2cM1TEDJ1prAsqfpa0xqvB21RP3omd3aBZ47ixceg@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 09:48:35AM -0800, Beeman Strong wrote:
> Hi Peter, thanks for the feedback.  Can you say more about AMD's
> overlapping constraints?

bc1738f6ee83 ("perf, x86: Fix event scheduler for constraints with overlapping counters")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
