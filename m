Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE4E9A03B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=px3aW2UfSkmXK4R5kqmy00D8f0B6BpSzKDmDihkjN24=; b=sBqDRQe459q0i0
	trixz+DglZPI1ntbpGLsFJgtcUCeYaNzhqUwCDYENoQ2Ri0kS+0a24s8NNluV68v4YuCMBBTEMGrS
	5LsSU9ni7wGmRPHPAsa28ldPZVYLnGZZp99D/rNmyx4kelKc7+LVquWhpphwcPnfgRyi/CAfTYWzr
	pBDXBD12/VuQyVLY1xfECmAxGYQzhBtdvttEebShr2pHUKI3jZ0ak3N6o6x2/rnaH/oFaUSue8dOm
	fYh6MjjBSnKx2P5a1LUEL8AOXTCT+gAAs482bYCc8csmc3yJS2PA28Tv9Qudduz3BfG5HOm84n8wk
	PONtmx3ktpz7LLwubJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVuH-000000096ij-2YcH;
	Wed, 18 Feb 2026 00:59:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVuF-000000096iL-2JDb
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 00:59:08 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771376342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EZY7Jy8pTotmlxQ3pM2iUcBHpEQWakq+iVDvtxWeULQ=;
	b=jlcIsG16/6y3vBK7BVTvXKtZ/LhQx5ebNgQudK36LamVzMh9NrjCLZwEK5BEtE6R/tSsWa
	QSZuVzA8/BeO3+Ue1+KUp8vYelBMn57paHLjOw5fdv3Vg2eAqD4QNlbMFOIKIQH0RDUgEZ
	2Bi41zfVkgfNzAbClkUMDduH7DQziQC6+DN08GNQuu26eHakXDs3/0ckCcL4uMswVWnvSJ
	BLaRQfAOdVahpO0Os2U7FF7vVZJf8rXMM2w7dQ2fir2RgA+0xPH+009yYcFi8buz6Bxcc8
	D6uFq24wHscPO1mDeBOqybWb0P2slw/YmdK9nxgoqC4NYWPoxpp6cP4sTGdcpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771376342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EZY7Jy8pTotmlxQ3pM2iUcBHpEQWakq+iVDvtxWeULQ=;
	b=Fr39y4AwjG5OWzq2ykoiC7DQTshV2RosypWRF37bRICny1Yy+RPLulfsQrHCr6EEjs/4xh
	ruZLYpowzlIt7zBg==
To: Paul Walmsley <pjw@kernel.org>, Kunwu Chan <kunwu.chan@linux.dev>,
 igor.b@beldev.am
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish
 Patra <atishp@rivosinc.com>, Zong Li <zong.li@sifive.com>, Deepak Gupta
 <debug@rivosinc.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in
 XIP code
In-Reply-To: <609b889a-8bb1-d2b5-8de6-ddeec27cac04@kernel.org>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
 <609b889a-8bb1-d2b5-8de6-ddeec27cac04@kernel.org>
Date: Wed, 18 Feb 2026 07:58:56 +0700
Message-ID: <874ineeujz.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_165907_730182_64503807 
X-CRM114-Status: UNSURE (   8.81  )
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

Paul Walmsley <pjw@kernel.org> writes:
> Thanks for fixing the threading, but, Conor's message:
>
>   https://lore.kernel.org/linux-riscv/20260213-canteen-diffuser-5ecc80f264b4@spud/   
>
> was exactly right.  Folks who care about XIP support for RISC-V first need 
> to send patches to fix it in mainline.  These typo fixes should be rolled 
> in to that series.  Until that happens, I plan to keep the XIP removal 
> patches queued.
>
> I also want to see the XIP folks participating in testing and reviewing 
> upstream patches going forward to confirm that they don't break XIP 
> support.  Otherwise, the burden is just getting pushed to patch submitters 
> and maintainers, most of whom probably don't care much about XIP.  And 
> there's a good chance that we'll just go through this cycle again in 
> another few months.

I would be happy to take that responsibility, if there are users. But
that does not seem to be the case.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
