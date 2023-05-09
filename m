Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E0C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GMB+/eNkXfoTR46lGQcj8HnL6QSKRN8LCdZ3TelO2Q=; b=4ljmNwUO6HlJml
	IbJmX+j8/Blk1uxnvgpEsMmxN4WJYIlbUKVnKOcukHJVW9xLXM/afIipYYUowO+gZV+gIO84P5fDd
	50g21KWd9mnAkNiHG5+am9+1sSB+gZFdQznAQh5zU6ezMEsORtsuuqk3N4ug3+NINBwXPzW9H1CGa
	SMjErRz1mgWCtTOWDoDg0PcdHovqFxW/qQIJywZMsjV9OcmCblxdl3bqCUK92zJMLG2uxVGeTO7Y7
	7lliFaAzmPqzNpCHMBMxb/jFLPh/TaoAnAjjnpFjNHj2u1Fe5OEvyHdk6Qp3OMNwq+arRwFQKPqC7
	NFvlySZindNjbBepJshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNgr-003Rqi-0E;
	Tue, 09 May 2023 13:47:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNgo-003Rpk-1j;
	Tue, 09 May 2023 13:47:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683640056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EiOLX/A8rFePD0DrbaikIW8S9TmO2h3FaFar7PON5hU=;
	b=IDDtornM7g68QBrYy4uAnmWXjYq0L0EFNdR49PbDsHqDTgeml6v7RJL2t0m5sUXtVghPxN
	Y9xm+Z8m/e3hKUrE5pyar8/KK0qEKQPlYka0/Tb3iMx+mgfeyMNL/O25jjjjRzlsdTv+0Z
	8shI/utWzvYwqBv97NrrZDv7w4aKvhnGNE6KrmZ++Tu6qGaUft6vGLNO3kbS/OKo+Q0Re5
	6QCYNHWmtfZwiB9EeOwWBrdDOurFiMNsscJ4jOZMujRqBwDip8CpD7bfEN2VdQMrgNJt2m
	19jTmwkZ2nc1PLZHDKShrWj69L1Yd8FKDMqN/Q3H65LVSvPfuBkvDkQSP/O+tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683640056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EiOLX/A8rFePD0DrbaikIW8S9TmO2h3FaFar7PON5hU=;
	b=Qut7XwyPl0DgMnjgEWltV14QsYg9li7QYZrUkmEwn/8iVTGLbJy2fiNLjt0flPIbrA0rho
	MvlgsTmYsK7KiKDA==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 34/36] x86/smpboot: Implement a bit spinlock to
 protect the realmode stack
In-Reply-To: <20230509131340.GA83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185219.123719053@linutronix.de>
 <20230509131340.GA83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 15:47:36 +0200
Message-ID: <87v8h1zkef.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_064738_716121_3F44F90B 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue, May 09 2023 at 15:13, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:44:22PM +0200, Thomas Gleixner wrote:
>
> Do we really care about performance here; or should we pick the simpler
> form? Also, 'lock' is a prefix, not an instruction.

Right. KISS is the way to go.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
