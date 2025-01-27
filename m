Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F07C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIj1Tk1MXCkfzB+XEiOxYBqH67N9K/365WrcaWLOTnw=; b=gVYon7hMt9uj6Q
	eoKzLPBAACHB1lY+agrmMiqLshrxUpa99mqcbPbklL0zV0svDgqAZc6gmPV72HMyhgBg2L2OdYzdy
	zBz1t/YBiZ89J3drix1ZeO5z2jj0L0fiV+Xmh7/hWU6XmNhtdOfIg365WbG+A/q6cWLKfgx6Dj4Mj
	dP+z5KpewO0PcQbgMWxnWrjAQ3OV68g8QQsRWyix8LQF0XnzgwkZ5iRSoMPgI1NNcUuVUjBSCMQhc
	KltjJpduiXf4d93qhTySVM3r2muRqD32Gl+xRl/ehunZkDPVCZpjbwgOgp5Huje9cCW7oC7dd3tUx
	EVuRaf2j77umc3a82STQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMRQ-000000028iW-1dfx;
	Mon, 27 Jan 2025 10:34:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMR2-000000028cP-3A8Z
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 10:33:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737974019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kz09BdGMPdqQP6LKhOKJr4faf/0LLBwoYDmVc+SBRyE=;
	b=AhFbn6lvifGljtiLo2IXEk5UIWHLLp3Ev7laKcHpnmSo3NRqn15gf2NeWdMODuNqj+RZW0
	LuL7/PQl/YLIDZin1pm43feceGSQR1rP/D/5Oz113P+mjcr/mBlmTVq4D+z3jq1B3+D3i+
	4UjNea5nkbu2cs8ZCnzNc3zeeNUKf5c6OL3I07rQYnaDRxTGmKKNsbZe+VyUlIbE894rkC
	lIYpfk/Jt6RxTFMeu+IeSc2hh3Otr7eWyFOG4kbsG/fegwLCMFWUfZEUcFIwSERnJTmxym
	E6JLDU16r8+J0f4aekuio1FY+4WFx1pAJsKOMtEzkHW2HOzKvmS3yTbpRFtR0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737974019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kz09BdGMPdqQP6LKhOKJr4faf/0LLBwoYDmVc+SBRyE=;
	b=lCFGDASC/19nNForuhwI3jqWqkguIBX8vw8ClCmdkKxRw5HTRo+XehRPgK8oBe6WlJSQjt
	ITHhyT/VTBDNx6Aw==
To: Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 charlie@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xu Lu
 <luxu.kernel@bytedance.com>
Subject: Re: [PATCH RESEND] irqchip: riscv: Order normal writes and IPI writes
In-Reply-To: <20250127093846.98625-1-luxu.kernel@bytedance.com>
References: <20250127093846.98625-1-luxu.kernel@bytedance.com>
Date: Mon, 27 Jan 2025 11:33:39 +0100
Message-ID: <87plk88s1o.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_023340_931357_62693A66 
X-CRM114-Status: GOOD (  13.29  )
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

On Mon, Jan 27 2025 at 17:38, Xu Lu wrote:

This is not a RESEND. The change log has been modified, no?

The prefix is incorrect. See

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

> RISC-V distinguishes between normal memory accesses and device I/O and

What is a normal memory write? Are there abnormal memory writes too?

> uses FENCE instruction to order them as viewed by othe RISC-V harts and
> external devices or coprocessors. The FENCE instruction can order any
> combination of device input(I), device output(O), memory reads(R) and
> memory writes(W). For example, 'fence w, o' can be used to ensure all

Can be? It _is_ used, no?

> memory writes from instructions preceding the FENCE instruction appear
> earlier in the global memory order than device output writes from
> instructions after the FENCE instruction.
>
> RISC-V issues IPI by writing certain value to IMSIC/ACLINT MMIO
> registers, which is regarded as device output operation. However, the
> existing implementation of IMSIC/ACLINT driver issues IPI via
> writel_relaxed(), which does not guarantee the order of device output
> operation and preceding memory writes. Then the hart receiving IPI may
> not have seen the latest data yet.
>
> This commit fixes this by replacing writel_relaxed() with writel()
> when

'This commit' is equally wrong as 'This patch'. See Documentation/process/

> issuing IPI, which will use 'fence w, o' to ensure all previous writes
> made by current hart are visible to other harts before they receive
> the IPI.

I've fixed it up for you.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
