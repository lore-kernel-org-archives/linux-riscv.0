Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA43FEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRigeLmgUC3C2e/DLQNzBGAa232AvD0WPxAT8mstmFk=; b=aN9JY1RHQ2pmKF
	3JjCluKlEQaVBX7YkHYd5gm32MHpCmMkD1eNQJCv4GJ5F89DDU83gdD4TgGhqNHft1q44q63uHuhP
	TS+YMkv2LMo7VldDxxOxJ0aRCt5Xe7DB/kzNBBnsKqbvo5aUKiNHaYihI+U/QGna06q0rAJa1wwvh
	QgpB4CReuanl4qMG+1I6cP6u8ewaUA+YQ8LL8gI57SWpI0qdl1nUHoGqj2mLwax13B3z3asnO5QB/
	v/QNDFc3BA2kY632KVDBiBHbKhRuyIEiZaW2Frp2UIChfFNlECVpo88hZQerR0kzNGDRF8WSlUJiW
	riZWC3JLO/UUhlV9erEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB4NT-007B9I-1g;
	Mon, 19 Jun 2023 02:12:23 +0000
Received: from out-56.mta1.migadu.com ([95.215.58.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB4NQ-007B6e-0H
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 02:12:21 +0000
Date: Sun, 18 Jun 2023 22:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687140734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r76UCXNSYK7hKAPox1fty7/njlbL/lomotiDbXrHJ0c=;
	b=TBWCnt8zcFJ5nKRG4NITLMc0ih7Ljc1nAilqoS2S6VpJEHCfC/iKrXm4DqvCBteAIE0x7N
	KKt8TEEvrj/SIu68Wj5oBDWU01USU5SRaXmsywsmSDitWFep2jlqsfvvNpzkBQyjcAlBQy
	vbP17KRUSXvKHyjAh6Si2ussqbVjvZw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230619021205.vfbolcklckdpbm4k@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx>
 <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
 <87h6r4qo1d.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6r4qo1d.ffs@tglx>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_191220_295097_166227FE 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jun 19, 2023 at 02:43:58AM +0200, Thomas Gleixner wrote:
> Kent!

Hi Thomas :)

> No. I am not.

Ok.

> Whether that's an internal function or not does not make any difference
> at all.

Well, at the risk of this discussion going completely off the rails, I
have to disagree with you there. External interfaces and high level
semantics are more important to get right from the outset, internal
implementation details can be cleaned up later, within reason.

And the discussion on this patchset has been more focused on those
external interfaces, which seems like the right approach to me.

> > ... I made the same mistake reviewing Song's patchset...
> 
> Songs series had rough edges, but was way more data structure driven
> and palatable than this hackery.

I liked that aspect of Song's patchset too, and I'm actually inclined to
agree with you that this patchset might get a bit cleaner with more of
that, but really, this semes like just quibbling over calling convention
for an internal helper function.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
