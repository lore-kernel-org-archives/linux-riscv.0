Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18D0CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfT5JEfczbZyJMd6sB9JJvUmeWAi1snZR+kkpMOmZIY=; b=F+QpYXEgkIdP/s
	BrZK2u6NxxLaEJpFW9kJRLCTP9YEqis8X5vcX40BXiSyMPQ+lHjC9EeGdgASDTfZFKZYLEXVUDnmX
	E9ygvPin+0mbjRh05OplBz0e0aRAXkuGDtALWCaT0+DkTRCnZRqs8rgYflvZY//Jd9JRbFK5Gk5yR
	WfrGN+XNG5ohFU5RsulW1M0vNgWaxseoydxsC1v1iom8JfCa/zx8NMmeA6pm7nDIuXRTvF/rANzBG
	bBn616DGsgr1uSCAY/UVA/ULg/lh8oOfaQKgy8Y209DAbHpOxizH4GE3LWhvWtBRoaewzAwImIyGM
	h9Bb14As/Wv0a/wl5vUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1YU-0000000Dl0I-0zEj;
	Mon, 15 Jun 2026 07:16:22 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1YQ-0000000DkzU-3L80
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 07:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1781507751;
	bh=Rl+ZSdOniMSyh82VzHmUiRVvvJR52OxzsBllOm+XbfY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=tKy3gtpIjx6nxWH1u+QO9D/dLbhlD1LmBOhOmFbpfEhnyPtp1kPjvYmCPEEHpMA50
	 RVFAGH1G3Fh9NzQvu+dsm1arReoOmXMO5eY/nlsspRsvjJFFUqvTMtBFrkcIWJuOPT
	 y194RquLe2Jr4udwxmdDalQ07gxZM1YxuizUBIiI=
X-QQ-mid: esmtpsz17t1781507743t9aefb8c6
X-QQ-Originating-IP: KTItmJz4aezgBawcldJnwoLV+hCx1XKUKIOMrGlx7OE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Jun 2026 15:15:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12401090553256602982
EX-QQ-RecipientCnt: 9
Mime-Version: 1.0
Date: Mon, 15 Jun 2026 15:15:40 +0800
Message-Id: <DJ9FSDGD51UL.19AY499L4RI3K@linux.spacemit.com>
Cc: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Guodong Xu" <guodong@riscstar.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
In-Reply-To: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Oa8H3HVvYs2abSlmz1mtvuX+yKs/TntbMuZUhzGM6SnOulCjS2fld6QS
	dnpMpJk0iSHPI1ZO81X2GpBHNWX9uS6aBv1bGMXhUQFiRYq8anKqRXUHNLcReG31aSlqrWb
	/IUZK28Hw+8qNQ0ZNY91Qd8t5RG15mKR8g7wkNdTacAwdvYpgGLZmRA/VKL8TfAInLCMika
	9HmDohTFAypzqsy2zYbJJl1M1ZbeNy6ME2i/hz3BX0eGrkNiQ3cgxtLj2AFBWJqjqic6FKU
	R9SwwakUjZ2lN6Wl23IruL09tpehztWa/cpWvC4Z8QVYXVQ+knpqDV8SbkW0M5Dnp4bQ4Xd
	DzLljIR6oGgZr0Ypuu1hCdhX5PkrbO3USDhj2DdduxgQLh2thbMYwKJRpuUlOh9fjCznlBk
	DuYTY+CCGUZKPy4t/T7/dUfjVQNLYG8czq0CdO+B4RmIpBA992DnNf53CEOokRoAQVdn/O1
	jku9U0z83xIkB9TtCvzIqol7exBShaBAa+O3+WUXqudOePgT1xb96cEmuJp2Mzv+sf3TMaR
	OS1u74KMEMwi1F0gsZPB20ebJJf7nx5RPgG5t8TB/2y9rPqvrg+liMJGU7wtm2b3YO4jSF0
	JDHCO57pXaMGXcZTNWIG6EU8aS3qdTJHewRWCsvz+Nz7PUlcDXOJAVaAY3/e2DPUkwuchAZ
	V4VF945uZIa4p+V7bsyG0Jmuw/v83oyTaZf/k00zBkRH9nE7ivf99WfAj7imLQeDqYcVLm2
	Tvy0QUuhIX/TuTyQFlMQkesYelbJX1bGkGb/CuSt5XBZzyoHKsQVLXD/qd08W+xcGTHgqPL
	daXlUp8nR8NPKsGdK6j3rPJastrLsGK4I/6mkMIFZrIMa0YNx/fN5kapHUyPHa63hfNsrpm
	oN7YxP/WaC5ietB+90dHQiqExEJcXUU4/q4cKZF22i9CIAhh88/cnqBhaFqAUAgJhoZP78r
	l4otON7luaLHVKQb9fCssucdi1KuCyJ1+/qGAA4nYKg7IXLY5LJ+P+BwypGrufkx+/3XJSy
	by2UhgkA7YaTIsDvlZq4iu7rXG5h/2tgG017moYN7I0XWcH6C2
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001619_695670_C219A105 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
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

On Mon Jun 15, 2026 at 10:53 AM CST, Troy Mitchell wrote:
> K3 PDMA shares the same DRCMR layout as K1, where the extended DRCMR
> base address is 0x1100. Commit 6587b8661a0b ("dmaengine: mmp_pdma: add
> SpacemiT K3 support") incorrectly defined DRCMR_EXT_BASE_K3 as 0x1000,
> causing all DRCMR accesses for channels >= 64 to be off by 0x100.
>
> Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse DRCMR_EXT_BASE_DEFAULT
> for the K3 ops.
>
> Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
To clarify: the previous version was not untested; it simply hadn't been
tested with SPI DMA specifically. This issue only affects DMA for SPI
devices, rather than all DMA-capable peripherals

                                          - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
