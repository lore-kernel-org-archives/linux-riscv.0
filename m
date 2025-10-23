Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA80FCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIGqxnvr5AuvPBSZXhrGJzRvibBVhoN46bUgR4uUJSA=; b=xIsriwI2nKrHdE
	C3I56ITHyKVTR0gNB8WpbaeMfeEbrnn5lE+D26n4AHb7FjqiSa7nwpPTphtJ/rNydQo+0XU8ybT0b
	phZpAOaEsK2G2efX7/9+a/Oxu31P6da179B1z8JBTc3rMJN0Enniwt1KBVfnJuU+L/qN8o3Bwj/SZ
	5P7Xzkty9ltHPPUKzZxCf0ctbQNGON9+y2+Fu80mlqnco6INa/ZIPdy1D5s45k3+uf29eRAUydDsq
	oa2wE4rMEgQ5NCBiw6eWuIEfXFautqgxlW4OSkxz5vlUXhOd/aAK82BvgqduPMjpxqeUALWhiz2fB
	5muQ6Ux43k3EKKDv+DFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC10S-00000007N5D-2V4M;
	Thu, 23 Oct 2025 19:29:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC10O-00000007N3p-2tJK
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 19:29:49 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761247784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n28eUmQml243YudcW5Z7MxWo4RAARcO1V+VuS9VUaIc=;
	b=a/aTdmcz8sNmUTNcjCDlGmxhADWNQP5hyr84v5nJBmZdv+WyRysAoOOcZ0zzbSZC1B7QVx
	THCtlGDGBaTvYkk27QSjsUhghP0uGr9VExq6p5KD/uUAsnDwuiCrs/Yt9ofOEX39dTB5K/
	dQW9tXYmqUW+cW/hDSp9BFYPrCWVMA/WaFcVb1I9cWmm51dvmOrkez1/jPEpig0ovXlRTr
	8lUZW0J/LLHkUBMl563LJDD0Ier3iPSrNcasqCTRcL3r22bOzjdal2v2LSSNo6EVu5m348
	zvJru1CBauUGM/LHL75MD6/d97wAKkroRmgljrUV+fmciflub7R99aK9B389ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761247784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n28eUmQml243YudcW5Z7MxWo4RAARcO1V+VuS9VUaIc=;
	b=N2dwpbiXcXeAVHx8XqdAk9adFazCugDVfl6OJqmERfUuRN1V8FWFfaR+nte3ZFdHzbZhNh
	RmXvtBXws3zZu1BA==
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian
 Wang <dramforever@live.com>, Charles Mirabile <cmirabil@redhat.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 0/4] Add UltraRISC DP1000 PLIC support
In-Reply-To: <20251023140057.204439-1-lzampier@redhat.com>
References: <20251023140057.204439-1-lzampier@redhat.com>
Date: Thu, 23 Oct 2025 21:29:44 +0200
Message-ID: <87zf9hwh5j.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_122948_864709_420AB943 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, Oct 23 2025 at 15:00, Lucas Zampieri wrote:
> This series adds support for the PLIC implementation in the UltraRISC
> DP1000 SoC. The UR-CP100 cores used in the DP1000 have a hardware bug in
> their PLIC claim register where reading it while multiple interrupts are
> pending can return the wrong interrupt ID. The workaround temporarily
> disables all interrupts except the first pending one before reading the
> claim register, then restores the previous state.
>
> The driver matches on "ultrarisc,cp100-plic" (CPU core compatible), allowing
> the quirk to apply to all SoCs using UR-CP100 cores (currently DP1000,
> potentially future SoCs).
>
> Charles Mirabile (3):
>   dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
>   irqchip/plic: enable optimization of interrupt enable state

    That one never showed up. Neither in my inbox nor on lore


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
