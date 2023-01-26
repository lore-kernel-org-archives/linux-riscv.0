Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A56CC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp4rVciqRcmBYPUb8k8P/pwYgYTt7jsWEEwJSTvzHFc=; b=VG9NaibJMC52nj
	s5TjYgTIsIZNYOqVbQLUNH405flhP8wycjkdSvb9R4F6Pi8OCNuKiVHswMw3CFMFQpRAIZEQ4RTmw
	EvWMDuCobOKGf2TSnsaA3nmJdtFaCOJFmNLkBL5JZkkMmfAr9Jh89khsogEH+mRxMAhYmUNxuzxTq
	phEVxuxI7TKR2vN/BMmJO5W/L2TwmY5IbHAL164Vruy0GfK+t5/Tg3zWAIHYj8kbRHp7BlgERYLcx
	YpjCkTQdptBrwdygPFV/5qeYN5346BztJqTlrUlKt4p7rP85tyKlIuFI6fXzLLCvQDS6vRuodZ+9z
	0RDMMKmBqkgfQfN13ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3O4-00BEGJ-De; Thu, 26 Jan 2023 14:38:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3O3-00BEFe-BL
	for linux-riscv@bombadil.infradead.org; Thu, 26 Jan 2023 14:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v5lRST3UhBT0bHTWLRn+IKxRT3Fm30qCFhm6PJyxMIA=; b=IhoqLpHc6jxkTvFzdHxeJ+ZYim
	1I7vODMn698IB/zXrwXRkm7oe3KykWcJltyUDuClBppjzwKhcKo6mIH8LWoeiZSgTZkh0g8PuPAF7
	SKBjuWJBTQXLU3Nk1yUPafBTBLWwXUXNBoY0VmzPviNIdHxXME070k779dIeTza7UKSsqvSJGUB+O
	RJQ/rF0/HqknHKnfsMJMBwKPysHHE5vMeYZUxmu2n00HzT5xE8UnnHPpOYmdHtS4x2Mpql3O/Pg8q
	I46BNMEwEK19kWHE9UfWLluLiY+PX+a7mCRvFnuwm1My70xy4B2urvXQoH0De/GEAGI5U0eqGvJlK
	CywF3kGg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3Nv-006oVa-FN; Thu, 26 Jan 2023 14:37:51 +0000
Date: Thu, 26 Jan 2023 14:37:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linux-MM <linux-mm@kvack.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	device-tree <devicetree-discuss@lists.ozlabs.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Message-ID: <Y9KQPxzHBuZGIN4U@casper.infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 12:30:13PM +0000, Lad, Prabhakar wrote:
> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> virtual address falls within this range, the MMU doesn't trigger a
> page fault; it assumes the virtual address is a physical address which
> can cause undesired behaviours.

Wow.  I've never come across such broken behaviour before.

> To avoid this the ILM/DLM memory regions are now added to the root
> domain region of the PMPU with permissions set to 0x0 for S/U modes so
> that any access to these regions gets blocked and for M-mode we grant
> full access (R/W/X). This prevents any users from accessing these
> regions by triggering an unhandled signal 11 in S/U modes.

I have no idea what any of this means.

> This works as expected but for applications say for example when doing
> mmap to this region would still succeed and later down the path when
> doing a read/write to this location would cause unhandled signal 11.
> To handle this case gracefully we might want mmap() itself to fail if
> the addr/offset falls in this local memory region.

No, that's not what you want.  You want mmap to avoid allocating address
space in that virtual address range.  I don't know if we have a good
way to do that at the moment; like I said I've never seen such broken
hardware before.

I'd say the right way to solve this is to add a new special kind of VMA
to the address space that covers this range.  We'd want to make sure
it doesn't appear in /proc/*/maps and also that it can't be overridden
with MAP_FIXED.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
