Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F92C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGun4t6W7EBQS6l+SIpXh3CfdzPP9RdpS3Ak5fl1LZk=; b=PknP6g2VSBeebZ
	bpzJVC4HACORWKu+F95sY82jJa3pJP4J7GKMDiq5/23R8L33O+1nWSTTOYhRi448PtHuQgsKkwP0K
	QemGT8pRJArF0e+0wVCzkomHuaR99nilKq+AnRzApewyExeEUPLStu8tFeQcc1r1B2UUMonuSBhlO
	9/gc298kG5IJ+kY36eUPCqWDwHDZAvRY4tie3DUC7GWY0qELj/9id0wxEvJ5bd7NU0V+/d50NeJ5x
	10Bv7G7aYEsgu6gnNQ7tfUoDuuyyZF/25Bp7AoObqcmpdbbc1b7NDzi+OaCS7ht4CreBeAMhELdoA
	dqdw6ECEAnZcgDDexnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mFr-001pp4-V4; Tue, 05 Jul 2022 17:22:31 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mFq-001poH-IZ; Tue, 05 Jul 2022 17:22:30 +0000
Date: Tue, 5 Jul 2022 10:22:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 0/4] Proof of concept for rv32 svpbmt support
Message-ID: <YsRzVoWOdGqSOZ+q@infradead.org>
References: <20220705100523.1204595-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705100523.1204595-1-guoren@kernel.org>
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

On Tue, Jul 05, 2022 at 06:05:19AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Make rv32 support svpbmt & napot by reducing the PPN witdth (sv32p34 ->
> sv32p31).

Yeah, the lack of rv32 in svpbmt was a very odd choice, given that
non-coherent DMA is most common in crappy low end devices.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
