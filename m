Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD7C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCd8c5iShevrLywRL0m/WC2QUC5dUd6cUGUci1PV5oQ=; b=kmYbv61ReAOMqR
	/RSBuloJmpjIgQOUqLPeuvNSYxMRsc4QgenNkW4+6oXgQ/JZlCwklSOKwU1PRX0Uld0YiRq/LJv70
	+RiD2Cj6d/oJ2SmdL6JL6VrR/OVRSQMsXw2wFvsqMCEe2l/x/VlokrFD1JZ8v69f66woelp9MAMiL
	yP1/U8sbGTle1TMkQMkIuB+p7GI02X7bhY+KfPvbqcvY4nM0r7EEGrooAyWzBGNPDgOBpf0eJEql5
	lK34K39WLroO9RY4hRzdPne/5jw1izricXei5Pyc2ilbVKHm/FTGztd8xfR4ATeBWSJlbWHTVj71Q
	cB6kOw5Cl/sCtajq7X4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU63w-0000000E6rL-3BTZ;
	Wed, 17 Jul 2024 14:55:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU63v-0000000E6rD-26zy
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 Jul 2024 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3B+4D6g/cI0IkxVVHLAuVdIDzczjDpPmDtucTRBCNeg=; b=OqXRuaVQeMZlfBQow0apkh/XxW
	gds0KMcouoGh/WuezZRmot4ydRvIIqecxRuKv9IIF48rkIIkOayipPuCli7S+A5YTiFgzGxI/f0xN
	86xxXtxg871Rfe7/swetflLrpmU29GRJr0U/o1STMUoK7bDZ01OAlnTitBvicgQx/RsmNnsnOC0nZ
	M6ZWt2OtXcUEEQLFqEfMeF5B6cI97daXe7T5yVelZZkQRhjC054erjuaE2VL50G9KE+WLPCSPn2vy
	VNRQQzhjN6mKek4sL2BzCZFT3W1Iw8POidWNwecoFjBvB0fx2O8kAB5RgAmdZWvcF/bj5tLAfhlpm
	UY9QSSTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU63r-00000000xAm-1hh4;
	Wed, 17 Jul 2024 14:55:19 +0000
Date: Wed, 17 Jul 2024 15:55:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: add tracepoints for page fault
Message-ID: <ZpfbVzwT5flLqatZ@casper.infradead.org>
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
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

On Wed, Jul 17, 2024 at 08:27:19AM +0000, Zhu Hengbo wrote:
> +	TP_STRUCT__entry(
> +		__field(unsigned long, address)
> +		__field(unsigned long, epc)
> +		__field(unsigned long, cause)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->address	= regs->badaddr;
> +		__entry->epc		= regs->epc;
> +		__entry->cause		= regs->cause;
> +	),
> +
> +	TP_printk("user page fault, address=%ps epc=%ps cause=0x%lx",
> +			(void *)__entry->address, (void *)__entry->epc,
> +			__entry->cause)

What is "epc"?  You've made this gratuitously different from x86.
Never do that.  Always copy what somebody else has done unless you have
a good reason to be different.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
