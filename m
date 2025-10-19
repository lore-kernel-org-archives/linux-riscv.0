Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AECCCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC1V1GENx1Fu7FZ+fU2ZoXm0J2FB3+0yTHk3wElFfNQ=; b=ZattnHMhIazKjZ
	SrKWdvdjMUs5TKAqz038cKSZBVb6qpqcgHMBEN18hhmD2Z7KT6OIXuadtUow/D6PgFWKP7aQ6ff14
	8h+X12M+SI4KlchERPx0e51auTWRkPpPuynMi/egDcQgs8lX3+VIJJM8HnS83efIBASy90hyX6qOC
	8P5rHg97wCaMSNCw0hQ/odxlosMDfH0346JPlLNQ+lvRjDKxtIyLd1eznpt+riobxZYDyQWWyq8b2
	q/0IaqZa+peMkkrEHSw9Rj882y/Hep7bFQUeOWAorDTg2e5WmSKoJAhU6oIaDip2mD0UMhtsPXS5T
	iz8rv1gYkBB9A50eWrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAU4M-0000000B3VR-3ObM;
	Sun, 19 Oct 2025 14:07:34 +0000
Received: from mail-108-mta82.mxroute.com ([136.175.108.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAU4J-0000000B3Ue-26Om
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 14:07:33 +0000
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta82.mxroute.com (ZoneMTA) with ESMTPSA id 199fccbd41f000c217.005
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 19 Oct 2025 14:07:20 +0000
X-Zone-Loop: 87b350792e71e503dc1da7267bc91a62473d2a00fd15
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=I5RRsJW7XpZuyNBeXBTBqrOkEelaownoQQBDEYaX6f4=; b=E9CGrU
	Lu0NY226G8P7NHYpq/fZRxuKhXJsooFPsw+Iqc96Aw3hdVyCROh3OYOXKpskEMHrK6p1cuOcni05Y
	b88S0jj6OL1eRvSQddJ1PCIMc9Az36U00MWSl8FdDQm5N6Vt4C4Zr9mhfxTiSJYsn+Fxp/IV38pV5
	8r7O2ZjHSWrUzonOQ/JDSc0gIgbxpCq7P/XClC5VHdLCKWnHusRpqggGKQt9gwApn9V+gzPUF+ZUx
	pLB9QrB65dRu+hnICBw3QxW4vyIXfz0Nb8j8bp6hoAgU6hpBC7b0+Be6BNBwshIOf2wdtGo3pyX1/
	OgmC+bJ6BU5Hj1iz3b7rBD2u0Irg==;
From: Josephine Pfeiffer <hi@josie.lol>
To: pjw@kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Sun, 19 Oct 2025 16:07:11 +0200
Message-ID: <20251019140711.63664-1-hi@josie.lol>
In-Reply-To: <2eaeaa69-b2cf-3a3a-0239-2aefcaa836aa@kernel.org>
References: <2eaeaa69-b2cf-3a3a-0239-2aefcaa836aa@kernel.org>
MIME-Version: 1.0
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_070731_634941_C6D9CE63 
X-CRM114-Status: GOOD (  14.13  )
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

On Sat, 18 Oct 2025, Paul Walmsley wrote:

> Hard to accept that it's a performance issue.  But I think you're right
> that generating a newline should be done with seq_puts().

Fair point. I'll drop that from the commit message.

> A better fix would seem to be to just get rid of pt_dump_seq_puts().  It's
> only used once in arch/riscv.
>
> Taking a broader view, both pt_dump_seq_puts() and pt_dump_seq_printf()
> look completely pointless.  Is there any argument for keeping them?

Good question. I investigated the git history and current usage:

The macros were introduced in commit ae5d1cf358a5 ("arm64: dump: Make the
page table dumping seq_file optional") to support passing NULL for the
seq_file parameter. This is used by ptdump_check_wx() for CONFIG_DEBUG_WX,
where the kernel walks page tables to check for writable+executable pages
without outputting anything to userspace.

All four architectures use this pattern in ptdump_check_wx():

  arch/arm64/mm/ptdump.c:341:         .seq = NULL,
  arch/arm/mm/dump.c:456:             .seq = NULL,
  arch/riscv/mm/ptdump.c:378:         .seq = NULL,
  arch/s390/mm/dump_pagetables.c:197: .seq = NULL,

However, you're right that the utility of these macros varies:

Usage of pt_dump_seq_puts():
- arm64: 1 use
- ARM: 0 uses
- riscv: 1 use
- s390: 3 uses

Note: ARM defines pt_dump_seq_puts() but never uses it - that macro
could be removed entirely.

Usage of pt_dump_seq_printf():
- arm64: 6 uses
- ARM: 7 uses
- riscv: 6 uses
- s390: 5 uses

For RISC-V specifically, I agree the single use of pt_dump_seq_puts()
could be replaced with an inline conditional. For pt_dump_seq_printf(),
the macro does save some repetition (6 uses vs 1 macro definition).

pt_dump_seq_printf() could also be questioned - removing it means 20+
inline conditionals across all architectures. I focused on the minimal
fix, but happy to tackle the larger refactor if preferred.

Would you prefer:

Option A) Remove pt_dump_seq_puts() entirely from riscv and replace the
single use with:
  if (st->seq)
    seq_puts(st->seq, "\n");

Option B) Keep the macro for consistency with other architectures, but
fix the bug

I'm happy to send a v2 with either approach. If Option A, I could also
propose similar cleanups for arm64 (1 use) as a follow-up.

Thanks for the review!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
