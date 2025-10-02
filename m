Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44560CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aK89lbFYjCImyCR5Y6c3rZJZX9esxt3V2mRNkFDe1g=; b=xVm/Yk6weg/5RM
	OYqsL7d9VRtxOLtZBW5ILCVuQ1kLT53EBIQvJPQyIv+R57YMjtsnCjWk24TeIZ0worr9yPFKMhTrk
	8W8oPshroAZ0mwC5zBY/nydp4+3bqZ00kh2JfYxktvstu8HVMn4Hlf64mFWH8KfphXC+tP/pDXjwI
	USZ2hvkFrpFSV92X00+6/yCkTynzME3N3IPZPkprhS+/5a6Zx05uuXmvwCa2BbVDBD2lUibtlA1WY
	3QcwiAXeXZksHjVNTlVsTJgxe2HwsFLGUp0J+3PDYN1ROATEdwDsgCzFDXhuulonP+GioCJuwoejT
	JNiDa3K6UF/29glhdNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47vQ-00000009OOY-35qF;
	Thu, 02 Oct 2025 01:16:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47vO-00000009ONj-31QK
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 01:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D008E43AB5;
	Thu,  2 Oct 2025 01:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C730BC4CEF1;
	Thu,  2 Oct 2025 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367761;
	bh=N+IBo+cFLuUB2dPL/xezIvU81xhMiJVOYHb+D0G1mBo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CVHLQJt6/U8JVWBmh/0TqGImN2GEOkvWc3wmV6zZHdNnG5hJhRHZN1Iy9Pb6CpUuy
	 fcvQSFWM7XIi3+nbl3B+C+UPrCBw2mnJNzLdv78a31essSprgiAKwx/zwzh+bbyBGL
	 BfcSOuKeZyp7fkWQyyi/kp1WFSjGqik/1n6AYcOIU40n+qN18rjvq+rClZ1dZSHBV2
	 vWqk1ieXvlaLS2mt+xkKEh4Cb9X+IdQkyiezlMXKIukQesTo7zzRw2TjwRGGhE+CAb
	 z9tNmwjsCWzJ+o5OqAcnhL4r7pehD1hbjIynLpZDdRIzg+rHmdSsETbf4UVnolxBEH
	 XzIijTzu+n2AQ==
Date: Wed, 1 Oct 2025 19:15:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, 
    linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
In-Reply-To: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
Message-ID: <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_181602_777871_998EA770 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:

> The RISC-V platform management interface (RPMI) is only available on
> RISC-V platforms.  Hence add a dependency on RISCV, to prevent asking
> the user about this driver when configuring a kernel for a different
> architecture.
> 
> Fixes: 5ba9f520f41a33c9 ("clk: Add clock driver for the RISC-V RPMI clock service group")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert for catching this.

This patch is against unmerged patches in -next.  So I'll plan to add this 
to the PR that I plan to send to Linus tomorrow -- unless any of the 
drivers/clk maintainers would prefer that I not.

> And perhaps the "default RISCV" should be dropped, too?

Probably.  I guess we should just add this to the arch/riscv defconfig 
instead.  Let's wait on this one for a few days to see if anyone has any 
comments, and consider that change for v6.18-rc fixes.


thanks again,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
